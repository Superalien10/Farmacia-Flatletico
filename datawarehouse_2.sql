--Criar tabelas do Datawarehouse

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Funcionario](
	[ChaveFuncionario] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[IDFuncionario] [varchar](10) NOT NULL,
	[NomeFuncionario] [varchar](30) NOT NULL,
 CONSTRAINT [Funcionario_pk] PRIMARY KEY CLUSTERED 
(
	[ChaveFuncionario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vacina](
	[IDVacina] [varchar](10) NOT NULL,
	[NomeVacina] [varchar](30) NOT NULL,
	[FornecedorVacina] [varchar](30) NOT NULL,
	[LoteVacina] [varchar](30) NOT NULL,
	[ChaveFuncionario] [uniqueidentifier] NOT NULL,
	[ChaveCliente] [uniqueidentifier] NOT NULL,
	[ChaveCalendario] [uniqueidentifier] NOT NULL,
 CONSTRAINT [Vacina_pk] PRIMARY KEY CLUSTERED 
(
	[IDVacina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Vacina]  WITH CHECK ADD  CONSTRAINT [FK_3] FOREIGN KEY([ChaveCliente])
REFERENCES [dbo].[Cliente] ([ChaveCliente])
GO
ALTER TABLE [dbo].[Vacina] CHECK CONSTRAINT [FK_3]
GO
ALTER TABLE [dbo].[Vacina]  WITH CHECK ADD  CONSTRAINT [FK_4] FOREIGN KEY([ChaveCalendario])
REFERENCES [dbo].[Calendario] ([ChaveCalendario])
GO
ALTER TABLE [dbo].[Vacina] CHECK CONSTRAINT [FK_4]
GO
ALTER TABLE [dbo].[Vacina]  WITH CHECK ADD  CONSTRAINT [FK_5] FOREIGN KEY([ChaveFuncionario])
REFERENCES [dbo].[Funcionario] ([ChaveFuncionario])
GO
ALTER TABLE [dbo].[Vacina] CHECK CONSTRAINT [FK_5]
GO

ALTER TABLE [dbo].[Vacina]  
DROP CONSTRAINT FK_5;  
GO  


