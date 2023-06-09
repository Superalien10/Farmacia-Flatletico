--Criar tabelas do Datawarehouse


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calendario](
	[ChaveCalendario] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[DataCompleta] [datetime] NOT NULL,
	[DiaDaSemana] [varchar](20) NOT NULL,
	[DiaDoMes] [int] NOT NULL,
	[Mes] [int] NOT NULL,
	[Trimestre] [int] NOT NULL,
	[Ano] [int] NOT NULL,
 CONSTRAINT [Calendario_pk] PRIMARY KEY CLUSTERED 
(
	[ChaveCalendario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[ChaveCliente] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[IDCliente] [varchar](10) NOT NULL,
	[NomeCliente] [varchar](30) NOT NULL,
	[DataNascimentoCliente] [datetime] NOT NULL,
	[Logradouro] [varchar](30) NOT NULL,
	[Bairro] [varchar](30) NOT NULL,
	[Municipio] [varchar](30) NOT NULL,
	[Estado] [varchar](30) NOT NULL,
 CONSTRAINT [Cliente_pk] PRIMARY KEY CLUSTERED 
(
	[ChaveCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produto](
	[ChaveProduto] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[IDProduto] [varchar](10) NOT NULL,
	[NomeProduto] [varchar](30) NOT NULL,
	[PrecoProduto] [float] NOT NULL,
	[CategoriaProduto] [varchar](50) NOT NULL,
	[GrupoProduto] [varchar](30) NOT NULL,
 CONSTRAINT [Produto_pk] PRIMARY KEY CLUSTERED 
(
	[ChaveProduto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receita](
	[TID] [varchar](10) NOT NULL,
	[Hora] [int] NOT NULL,
	[ReaisVendidos] [float] NOT NULL,
	[UnidadesVendidas] [int] NOT NULL,
	[ChaveProduto] [uniqueidentifier] NOT NULL,
	[ChaveCliente] [uniqueidentifier] NOT NULL,
	[ChaveCalendario] [uniqueidentifier] NOT NULL,
 CONSTRAINT [Receita_pk] PRIMARY KEY CLUSTERED 
(
	[TID] ASC,
	[ChaveProduto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Receita]  WITH CHECK ADD  CONSTRAINT [FK_0] FOREIGN KEY([ChaveProduto])
REFERENCES [dbo].[Produto] ([ChaveProduto])
GO
ALTER TABLE [dbo].[Receita] CHECK CONSTRAINT [FK_0]
GO
ALTER TABLE [dbo].[Receita]  WITH CHECK ADD  CONSTRAINT [FK_1] FOREIGN KEY([ChaveCliente])
REFERENCES [dbo].[Cliente] ([ChaveCliente])
GO
ALTER TABLE [dbo].[Receita] CHECK CONSTRAINT [FK_1]
GO
ALTER TABLE [dbo].[Receita]  WITH CHECK ADD  CONSTRAINT [FK_2] FOREIGN KEY([ChaveCalendario])
REFERENCES [dbo].[Calendario] ([ChaveCalendario])
GO
ALTER TABLE [dbo].[Receita] CHECK CONSTRAINT [FK_2]
GO


