
/*****

PARTE INCREMENTAL

****/

select is_cdc_enabled,* from sys.databases where name in ('DB197990112');
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
SELECT * into DWFlatl�tico_CFB_CHA.dbo.staging_dbo_Vacina FROM [dbo].[Vacina];

/*****

Atualizar calend�rio

******/

insert into [DWFlatl�tico_CFB_CHA].[dbo].Calendario
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
where cast(v.DataVacina as date) not in (select [DataCompleta] from [DWFlatl�tico_CFB_CHA].[dbo].Calendario)
	) as a;


-- atualiza��o de acordo com o CDC

select * from DWFlatl�tico_CFB_CHA.dbo.Vacina;

-- s� funciona se inserir nas duas tabelas, includes e salestransaction

insert into DWFlatl�tico_CFB_CHA.dbo.Vacina

select
	v.[IDVacina],
	v.[NomeVacina],
	v.[FornecedorVacina],
	v.[LoteVacina],
	dwf.ChaveFuncionario,
	dwc.ChaveCliente,
	dwcal.ChaveCalendario as ChaveCalendario
from
	DWFlatl�tico_CFB_CHA.[dbo].[staging_Vacina] v 
	inner join Cadastrar c on v.[IDVacina]=c.[IDVacina]
	inner join Cliente cl on c.[IDCliente]=cl.[IDCliente]
	inner join Atendente a on v.[IDAtendente]=a.[IDAtendente]
	inner join Funcionario f on a.[IDFuncionario]=f.[IDFuncionario]
	inner join DWFlatl�tico_CFB_CHA.dbo.Funcionario dwf on dwf.IDFuncionario=f.[IDFuncionario]
	inner join DWFlatl�tico_CFB_CHA.dbo.Cliente dwc on dwc.IDCliente=cl.[IDCliente]
	inner join DWFlatl�tico_CFB_CHA.[dbo].Calendario dwcal on dwcal.DataCompleta=cast(v.DataVacina as date)
	
/****

se n�o vier nada, conferir se as tabelas de staging correspondem ao conte�do incremental.

*****/


-- agora que j� carreguei, desabilitar e re-habilitar o CDC
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

conferir que agora a lista de mudan�as est� zerada!

*****/

SELECT * FROM [cdc].[dbo_Vacina_CT];


--- montar uma consulta para o fato vendas
use DWFlatl�tico_CFB_CHA
go

create view FatoVacina as
select *
from
	[DWFlatl�tico_CFB_CHA].[dbo].[Vendas] v inner join [DWFlatl�tico_CFB_CHA].[dbo].Calendario c on v.ChaveCalendario=c.ChaveCalendario
	inner join [DWFlatl�tico_CFB_CHA].[dbo].Cliente cli on cli.ChaveCliente = v.ChaveCliente
	inner join [DWFlatl�tico_CFB_CHA].[dbo].Produto p on p.ChaveProduto = v.ChaveProduto
	inner join [DWFlatl�tico_CFB_CHA].[dbo].Loja l on l.ChaveLoja = v.ChaveLoja
go



select * from DWFlatl�tico_CFB_CHA.dbo.FatoVacina;

/******

Partir para a parte de dashboard no excel

******/