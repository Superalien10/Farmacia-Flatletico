--Criar view do fato Receita

create view FatoReceita as
select 
	r.TID, r.Hora, r.ReaisVendidos, r.UnidadesVendidas, p.NomeProduto as Produto, p.PrecoProduto as Preço, p.CategoriaProduto as Categoria, p.GrupoProduto as Grupo, c.NomeCliente as Cliente, c.DataNascimentoCliente, c.Logradouro, c.Bairro, c.Municipio, c.Estado, ca.DataCompleta, ca.DiaDaSemana, ca.DiaDoMes, ca.Mes, ca.Trimestre, ca.Ano
from
	[Receita] r inner join Calendario ca on r.ChaveCalendario=ca.ChaveCalendario
	inner join Cliente c on c.ChaveCliente = r.ChaveCliente
	inner join Produto p on p.ChaveProduto = r.ChaveProduto
go
