--ETL



use DBFlatlético_CFB_CHA
go
truncate table [DWFlatlético_CFB_CHA].[dbo].[Receita];
delete from [DWFlatlético_CFB_CHA].[dbo].[Calendario];
delete from [DWFlatlético_CFB_CHA].[dbo].[Cliente];
delete from [DWFlatlético_CFB_CHA].[dbo].[Produto];



INSERT INTO [DWFlatlético_CFB_CHA].[dbo].[Cliente]
select 
	newid(),
	c.IDCliente,
	c.NomeCliente,
	c.DataNascimentoCliente,
	c.Logradouro,
	c.Bairro,
	c.Municipio,
	c.Estado
from
	Cliente as c;


-- Produto

INSERT INTO [DWFlatlético_CFB_CHA].[dbo].Produto
select
	newid(),
	p.IDProduto,
	p.NomeProduto,
	p.PrecoProduto,
	cat.NomeCategoria,
	'Medicamentos'
from
	Produto p left outer join Categoria cat on cat.IDCategoria=p.IDCategoria 
	inner join Medicamento m on m.IDProduto=p.IDProduto;

INSERT INTO [DWFlatlético_CFB_CHA].[dbo].Produto
select
	newid(),
	p.IDProduto,
	p.NomeProduto,
	p.PrecoProduto,
	cat.NomeCategoria,
	'Outros Itens'
from
	Produto p left outer join Categoria cat on cat.IDCategoria=p.IDCategoria
	inner join OutrosItens o on o.IDProduto=p.IDProduto;


insert into [DWFlatlético_CFB_CHA].[dbo].Calendario
select
	newid(),
	a.DataCompleta,
	a.DiaDaSemana,
	a.DiaDoMes,
	a.Mes,
	a.Trimestre,
	a.Ano
from (
select distinct
	cast(co.DataCompra as datetime) as DataCompleta,
	datename(weekday,co.DataCompra) as DiaDaSemana,
	datepart(day,co.DataCompra) as DiaDoMes,
	datepart(month,co.DataCompra) as Mes,
	datepart(quarter,co.DataCompra) as Trimestre,
	datepart(year,co.DataCompra) as Ano
from 
	Compra co 
where cast(co.DataCompra as datetime) not in (select [DataCompleta] from [DWFlatlético_CFB_CHA].[dbo].Calendario)
	) as a;



alter table Compra alter column [DataCompra] datetime;


insert into [DWFlatlético_CFB_CHA].[dbo].Receita
select
	co.[IDCompra],
	datepart(hour,co.DataCompra) as hora,
	(ad.[QuantidadeProduto] * p.[PrecoProduto]) as ReaisVendidos,
	ad.[QuantidadeProduto],
	dwp.ChaveProduto,
	dwc.ChaveCliente,
	dwcal.ChaveCalendario as ChaveCalendario
from
	Compra co inner join Carrinho ca on co.[IDCarrinho]=ca.[IDCarrinho]
	inner join Adicionar ad on ca.[IDCarrinho]=ad.[IDCarrinho]
	inner join Produto p on p.[IDProduto]=ad.[IDProduto]
	inner join Categoria ct on ct.[IDCategoria]=p.[IDCategoria]
	inner join Cliente cli on cli.[IDCliente]=ca.[IDCliente]
	inner join DWFlatlético_CFB_CHA.dbo.Produto dwp on dwp.IDProduto=p.[IDProduto]
	inner join DWFlatlético_CFB_CHA.dbo.Cliente dwc on dwc.IDCliente=cli.[IDCliente]
	inner join [DWFlatlético_CFB_CHA].[dbo].Calendario dwcal on dwcal.DataCompleta=cast(co.DataCompra as datetime)
EXCEPT
SELECT [TID]
      ,[Hora]
      ,[ReaisVendidos]
      ,[UnidadesVendidas]
      ,[ChaveProduto]
      ,[ChaveCliente]
      ,[ChaveCalendario]
  FROM [DWFlatlético_CFB_CHA].[dbo].[Receita]
GO

---- validando ....

select
	co.[IDCompra],
	datepart(hour,co.DataCompra) as hora,
	(ad.[QuantidadeProduto] * p.[PrecoProduto]) as ReaisVendidos,
	ad.[QuantidadeProduto],
	dwp.ChaveProduto,
	dwc.ChaveCliente,
	dwcal.ChaveCalendario as ChaveCalendario
from
	Compra co inner join Carrinho ca on co.[IDCarrinho]=ca.[IDCarrinho]
	inner join Adicionar ad on ca.[IDCarrinho]=ad.[IDCarrinho]
	inner join Produto p on p.[IDProduto]=ad.[IDProduto]
	inner join Categoria ct on ct.[IDCategoria]=p.[IDCategoria]
	inner join Cliente cli on cli.[IDCliente]=ca.[IDCliente]
	inner join DWFlatlético_CFB_CHA.dbo.Produto dwp on dwp.IDProduto=p.[IDProduto]
	inner join DWFlatlético_CFB_CHA.dbo.Cliente dwc on dwc.IDCliente=cli.[IDCliente]
	inner join [DWFlatlético_CFB_CHA].[dbo].Calendario dwcal on dwcal.DataCompleta=co.DataCompra
