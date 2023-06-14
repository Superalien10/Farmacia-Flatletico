truncate table [DWFlatlético_CFB_CHA].[dbo].[Vacina];
delete from [DWFlatlético_CFB_CHA].[dbo].[Funcionario];

INSERT INTO [DWFlatlético_CFB_CHA].[dbo].[Funcionario]
select 
	newid(),
	f.IDFuncionario,
	f.NomeFuncionario
from
	Funcionario as f;
	
	
	
select * from [DWFlatlético_CFB_CHA].[dbo].Calendario;
-- carregar apenas as datas novas
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
	
	


select * from DWFlatlético_CFB_CHA.dbo.Vacina;

select
	v.[IDVacina],
	v.[NomeVacina],
	v.[FornecedorVacina],
	v.[LoteVacina],
	dwf.ChaveFuncionario,
	dwc.ChaveCliente,
	dwcal.ChaveCalendario as ChaveCalendario
from
	Vacina v inner join Cadastrar c on v.[IDVacina]=c.[IDVacina]
	inner join Cliente cl on c.[IDCliente]=cl.[IDCliente]
	inner join Atendente a on v.[IDAtendente]=a.[IDAtendente]
	inner join Funcionario f on a.[IDFuncionario]=f.[IDFuncionario]
	inner join DWFlatlético_CFB_CHA.dbo.Funcionario dwf on dwf.IDFuncionario=f.[IDFuncionario]
	inner join DWFlatlético_CFB_CHA.dbo.Cliente dwc on dwc.IDCliente=cl.[IDCliente]
	inner join DWFlatlético_CFB_CHA.[dbo].Calendario dwcal on dwcal.DataCompleta=cast(v.DataVacina as date)
EXCEPT
SELECT [IDVacina]
      ,[NomeVacina]
      ,[FornecedorVacina]
      ,[LoteVacina]
      ,[ChaveFuncionario]
      ,[ChaveCliente]
      ,[ChaveCalendario]
  FROM [DWFlatlético_CFB_CHA].[dbo].[Vacina]
GO

