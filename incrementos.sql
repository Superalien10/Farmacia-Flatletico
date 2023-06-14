select is_cdc_enabled,* from sys.databases where name in ('DWFlatlético_CFB_CHA');
--- agora habilitar por tabela
EXEC sys.sp_cdc_enable_table  
@source_schema = N'dbo',  
@source_name   = N'Produto',
@role_name     = NULL,
@supports_net_changes = 1
go

exec sys.sp_cdc_help_change_data_capture

SELECT capture_instance FROM cdc.change_tables;
SELECT * FROM cdc.change_tables;


SELECT * into DWFlatlético_CFB_CHA.dbo.staging_dbo_Produto FROM DWFlatlético_CFB_CHA.[dbo].[Produto];

select * from DWFlatlético_CFB_CHA.dbo.staging_dbo_Produto;
INSERT INTO [DWFlatlético_CFB_CHA].[dbo].Produto
select
	newid(),
	p.IDProduto,
	p.NomeProduto,
	p.PrecoProduto,
	cat.NomeCategoria,
	'Outros Itens'
from
	Produto p
	left join DWFlatlético_CFB_CHA.dbo.staging_dbo_Produto pp on p.IDProduto=pp.IDProduto
	left outer join Categoria cat on cat.IDCategoria=p.IDCategoria
	inner join OutrosItens o on o.IDProduto=p.IDProduto
where
	p.IDProduto is null;
