
/*****

PARTE INCREMENTAL

****/

select is_cdc_enabled,* from sys.databases where name in ('DBFlatlético_CFB_CHA');
--- agora habilitar por tabela
EXEC sys.sp_cdc_enable_table  
@source_schema = N'dbo',  
@source_name   = N'Vacina',
@role_name     = NULL,
@supports_net_changes = 1
go

exec sys.sp_cdc_help_change_data_capture

SELECT capture_instance FROM cdc.change_tables;
SELECT * FROM cdc.change_tables;

--- criando uma tabela de staging para incluido em
SELECT * into DWFlatlético_CFB_CHA.dbo.staging_dbo_Vacina FROM [dbo].[Vacina];

/*****

Atualizar calendário

******/

insert into [DWFlatlético_CFB_CHA].[dbo].Calendario
select
	newid(),
	a.datacompleta,
	a.diasemana,
	a.dia,
	a.mes,
	a.trimestre,
	a.ano
from (
select distinct
	cast(v.DataVacina as date) as datacompleta,
	datename(weekday,v.DataVacina) as diasemana,
	datepart(day,v.DataVacina) as dia,
	datepart(month,v.DataVacina) as mes,
	datepart(quarter,v.DataVacina) as trimestre,
	datepart(year,v.DataVacina) as ano
from 
	Vacina v 
where cast(v.DataVacina as date) not in (select [DataCompleta] from [DWFlatlético_CFB_CHA].[dbo].Calendario)
	) as a;


-- atualização de acordo com o CDC

select * from DWFlatlético_CFB_CHA.dbo.Vacina;

-- só funciona se inserir nas duas tabelas, includes e salestransaction

insert into DWFlatlético_CFB_CHA.dbo.Vacina
INSERT INTO DWFlatlético_CFB_CHA.dbo.staging_dbo_Vacina
SELECT
	v.[IDVacina],
	v.[NomeVacina],
	v.[FornecedorVacina],
	v.[LoteVacina],
	dwf.ChaveFuncionario,
	dwc.ChaveCliente,
	dwcal.ChaveCalendario
FROM
	Vacina v
	LEFT JOIN DWFlatlético_CFB_CHA.dbo.staging_dbo_Vacina vv ON vv.IDVacina = v.IDVacina
	INNER JOIN Cadastrar c ON v.[IDVacina] = c.[IDVacina]
	INNER JOIN Cliente cl ON c.[IDCliente] = cl.[IDCliente]
	INNER JOIN Atendente a ON v.[IDAtendente] = a.[IDAtendente]
	INNER JOIN Funcionario f ON a.[IDFuncionario] = f.[IDFuncionario]
	INNER JOIN DWFlatlético_CFB_CHA.dbo.Funcionario dwf ON dwf.IDFuncionario = f.[IDFuncionario]
	INNER JOIN DWFlatlético_CFB_CHA.dbo.Cliente dwc ON dwc.IDCliente = cl.[IDCliente]
	INNER JOIN DWFlatlético_CFB_CHA.[dbo].Calendario dwcal ON dwcal.DataCompleta = CAST(v.DataVacina AS date)
WHERE
	vv.IDVacina IS NULL; -- Verifica se não há correspondência na tabela "staging_dbo_Vacina"

/****

se não vier nada, conferir se as tabelas de staging correspondem ao conteúdo incremental.

*****/


-- agora que já carreguei, desabilitar e re-habilitar o CDC
SELECT * FROM cdc.change_tables;

EXEC sys.sp_cdc_disable_table  
@source_schema = N'dbo',  
@source_name   = N'Vacina',
@capture_instance = N'dbo_Vacina'
go

EXEC sys.sp_cdc_enable_table  
@source_schema = N'dbo',  
@source_name   = N'Vacina',
@role_name     = NULL,
@supports_net_changes = 1
go

/****

conferir que agora a lista de mudanças está zerada!

*****/

SELECT * FROM [cdc].[dbo_Vacina_CT];


--- montar uma consulta para o fato vendas
use DWFlatlético_CFB_CHA
go

create view FatoVacina as
select *
from
	[DWFlatlético_CFB_CHA].[dbo].[Vendas] v inner join [DWFlatlético_CFB_CHA].[dbo].Calendario c on v.ChaveCalendario=c.ChaveCalendario
	inner join [DWFlatlético_CFB_CHA].[dbo].Cliente cli on cli.ChaveCliente = v.ChaveCliente
	inner join [DWFlatlético_CFB_CHA].[dbo].Produto p on p.ChaveProduto = v.ChaveProduto
	inner join [DWFlatlético_CFB_CHA].[dbo].Loja l on l.ChaveLoja = v.ChaveLoja
go



select * from DWFlatlético_CFB_CHA.dbo.FatoVacina;

/******

Partir para a parte de dashboard no excel

******/
