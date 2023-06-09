--Criação de tabelas no banco de dados

--Entidades

CREATE TABLE Cliente
(
  IDCliente VARCHAR(10) NOT NULL,
  NomeCliente VARCHAR(30) NOT NULL,
  EmailCliente VARCHAR(40) NOT NULL,
  SenhaCliente VARCHAR(30) NOT NULL,
  CPFCliente VARCHAR(11) NOT NULL,
  DataNascimentoCliente DATE NOT NULL,
  Logradouro VARCHAR(30) NOT NULL,
  Bairro VARCHAR(30) NOT NULL,
  Municipio VARCHAR(30) NOT NULL,
  Estado VARCHAR(30) NOT NULL,
  PRIMARY KEY (IDCliente),
  UNIQUE (EmailCliente),
  UNIQUE (CPFCliente)
);

CREATE TABLE Proprietario
(
  IDProprietario VARCHAR(10) NOT NULL,
  NomeProprietario VARCHAR(30) NOT NULL,
  EmailProprietario VARCHAR(40) NOT NULL,
  SenhaProprietario VARCHAR(30) NOT NULL,
  CPFProprietario VARCHAR(11) NOT NULL,
  PRIMARY KEY (IDProprietario),
  UNIQUE (CPFProprietario),
  UNIQUE (EmailProprietario)
);

CREATE TABLE Gerente
(
  IDGerente VARCHAR(10) NOT NULL,
  NomeGerente VARCHAR(30) NOT NULL,
  EmailGerente VARCHAR(40) NOT NULL,
  SenhaGerente VARCHAR(30) NOT NULL,
  CPFGerente VARCHAR(11) NOT NULL,
  SalarioGerente INT NOT NULL,
  IDProprietario VARCHAR(10) NOT NULL,
  PRIMARY KEY (IDGerente),
  FOREIGN KEY (IDProprietario) REFERENCES Proprietario(IDProprietario),
  UNIQUE (CPFGerente),
  UNIQUE (EmailGerente)
);


CREATE TABLE Funcionario
(
  IDFuncionario VARCHAR(10) NOT NULL,
  NomeFuncionario VARCHAR(30) NOT NULL,
  SenhaFuncionario VARCHAR(30) NOT NULL,
  EmailFuncionario VARCHAR(40) NOT NULL,
  CPFFuncionario VARCHAR(11) NOT NULL,
  SalarioFuncionario INT NOT NULL,
  IDGerente VARCHAR(10) NOT NULL,
  PRIMARY KEY (IDFuncionario),
  FOREIGN KEY (IDGerente) REFERENCES Gerente(IDGerente),
  UNIQUE (CPFFuncionario),
  UNIQUE (EmailFuncionario)
);

CREATE TABLE Caixa
(
  IDCaixa VARCHAR(10) NOT NULL,
  IDFuncionario VARCHAR(10) NOT NULL,
  PRIMARY KEY (IDCaixa),
  FOREIGN KEY (IDFuncionario) REFERENCES Funcionario(IDFuncionario),
);

CREATE TABLE Entregador
(
  IDEntregador VARCHAR(10) NOT NULL,
  IDFuncionario VARCHAR(10) NOT NULL,
  PRIMARY KEY (IDEntregador),
  FOREIGN KEY (IDFuncionario) REFERENCES Funcionario(IDFuncionario),
);



CREATE TABLE Atendente
(
  IDAtendente VARCHAR(10) NOT NULL,
  IDFuncionario VARCHAR(10) NOT NULL,
  PRIMARY KEY (IDAtendente),
  FOREIGN KEY (IDFuncionario) REFERENCES Funcionario(IDFuncionario),
);

CREATE TABLE Categoria
(
  IDCategoria VARCHAR(10) NOT NULL,
  NomeCategoria VARCHAR(50) NOT NULL,
  IDAtendente VARCHAR(10) NOT NULL,
  PRIMARY KEY (IDCategoria),
  UNIQUE (NomeCategoria),
  FOREIGN KEY (IDAtendente) REFERENCES Atendente(IDAtendente)
);

CREATE TABLE Vacina
(
  IDVacina VARCHAR(10) NOT NULL,
  NomeVacina VARCHAR(30) NOT NULL,
  DataVacina DATE NOT NULL,
  FornecedorVacina VARCHAR(30) NOT NULL,
  LoteVacina VARCHAR(30) NOT NULL,
  IDAtendente VARCHAR(10) NOT NULL,
  PRIMARY KEY (IDVacina),
  FOREIGN KEY (IDAtendente) REFERENCES Atendente(IDAtendente)
);

CREATE TABLE Carrinho
(
  IDCarrinho VARCHAR(10) NOT NULL,
  IDCliente VARCHAR(10) NOT NULL,
  PRIMARY KEY (IDCarrinho),
  FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente)
);

CREATE TABLE Doenca
(
  IDDoenca VARCHAR(10) NOT NULL,
  NomeDoenca VARCHAR(30) NOT NULL,
  IDAtendente VARCHAR(10) NOT NULL,
  PRIMARY KEY (IDDoenca),
  FOREIGN KEY (IDAtendente) REFERENCES Atendente(IDAtendente)
);

CREATE TABLE Cliente_TelefoneCliente
(
  TelefoneCliente VARCHAR(11) NOT NULL,
  IDCliente VARCHAR(10) NOT NULL,
  PRIMARY KEY (TelefoneCliente, IDCliente),
  FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente)
);

CREATE TABLE Cliente_ModoPagamentoCliente
(
  ModoPagamentoCliente VARCHAR(30) NOT NULL,
  IDCliente VARCHAR(10) NOT NULL,
  PRIMARY KEY (ModoPagamentoCliente, IDCliente),
  FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente)
);


CREATE TABLE Proprietario_TelefoneProprietario
(
  TelefoneProprietario VARCHAR(11) NOT NULL,
  IDProprietario VARCHAR(10) NOT NULL,
  PRIMARY KEY (TelefoneProprietario, IDProprietario),
  FOREIGN KEY (IDProprietario) REFERENCES Proprietario(IDProprietario)
);





CREATE TABLE Produto
(
  IDProduto VARCHAR(10) NOT NULL,
  NomeProduto VARCHAR(30) NOT NULL,
  PrecoProduto FLOAT NOT NULL,
  QuantidadeEstoqueProduto INT NOT NULL,
  ValidadeProduto DATE,
  FornecedorProduto VARCHAR(30) NOT NULL,
  IDCategoria VARCHAR(10) NOT NULL,
  IDAtendente VARCHAR(10) NOT NULL,
  PRIMARY KEY (IDProduto),
  FOREIGN KEY (IDCategoria) REFERENCES Categoria(IDCategoria),
  FOREIGN KEY (IDAtendente) REFERENCES Atendente(IDAtendente)
);

CREATE TABLE Medicamento
(
  IDMedicamento VARCHAR(10) NOT NULL,
  IDProduto VARCHAR(10) NOT NULL,
  PRIMARY KEY (IDMedicamento),
  FOREIGN KEY (IDProduto) REFERENCES Produto(IDProduto),
);


CREATE TABLE OutrosItens
(
  IDOutrosItens VARCHAR(10) NOT NULL,
  IDProduto VARCHAR(10) NOT NULL,
  PRIMARY KEY (IDOutrosItens),
  FOREIGN KEY (IDProduto) REFERENCES Produto(IDProduto),
);

CREATE TABLE Compra
(
  IDCompra VARCHAR(10) NOT NULL,
  DataCompra DATETIME NOT NULL,
  IDCarrinho VARCHAR(10) NOT NULL,
  IDCaixa VARCHAR(10) NOT NULL,
  PRIMARY KEY (IDCompra),
  FOREIGN KEY (IDCarrinho) REFERENCES Carrinho(IDCarrinho),
  FOREIGN KEY (IDCaixa) REFERENCES Caixa(IDCaixa)
);

CREATE TABLE Entrega
(
  HoraEntrega DATETIME NOT NULL,
  IDCompra VARCHAR(10) NOT NULL,
  IDEntregador VARCHAR(10) NOT NULL,
  IDCaixa VARCHAR(10) NOT NULL,
  PRIMARY KEY (IDCompra, IDEntregador),
  FOREIGN KEY (IDCompra) REFERENCES Compra(IDCompra),
  FOREIGN KEY (IDEntregador) REFERENCES Entregador(IDEntregador),
  FOREIGN KEY (IDCaixa) REFERENCES Caixa(IDCaixa)
);


CREATE TABLE Gerente_TelefoneGerente
(
  TelefoneGerente VARCHAR(11) NOT NULL,
  IDGerente VARCHAR(10) NOT NULL,
  PRIMARY KEY (TelefoneGerente, IDGerente),
  FOREIGN KEY (IDGerente) REFERENCES Gerente(IDGerente)
);

CREATE TABLE Funcionario_TelefoneFuncionario
(
  TelefoneFuncionario VARCHAR(11) NOT NULL,
  IDFuncionario VARCHAR(10) NOT NULL,
  PRIMARY KEY (TelefoneFuncionario, IDFuncionario),
  FOREIGN KEY (IDFuncionario) REFERENCES Funcionario(IDFuncionario)
);


--Relacionamentos

CREATE TABLE Conflitar
(
 IDMedicamentoAfetado VARCHAR(10) NOT NULL,
 IDMedicamentoAfeta VARCHAR(10) NOT NULL,
 FOREIGN KEY (IDMedicamentoAfetado) REFERENCES Medicamento(IDMedicamento),
 FOREIGN KEY (IDMedicamentoAfeta) REFERENCES Medicamento(IDMedicamento)
);

CREATE TABLE Agendar
(
  IDVacina VARCHAR(10) NOT NULL,
  IDCliente VARCHAR(10) NOT NULL,
  PRIMARY KEY (IDVacina, IDCliente),
  FOREIGN KEY (IDVacina) REFERENCES Vacina(IDVacina),
  FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente)
);

CREATE TABLE Cadastrar
(
  IDVacina VARCHAR(10) NOT NULL,
  IDCliente VARCHAR(10) NOT NULL,
  PRIMARY KEY (IDVacina, IDCliente),
  FOREIGN KEY (IDVacina) REFERENCES Vacina(IDVacina),
  FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente)
);

CREATE TABLE CadastrarDoenca
(
  IDDoenca VARCHAR(10) NOT NULL,
  IDCliente VARCHAR(10) NOT NULL,
  FOREIGN KEY (IDDoenca) REFERENCES Doenca(IDDoenca),
  FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente)
);

CREATE TABLE Adicionar
(
  IDProduto VARCHAR(10) NOT NULL,
  IDCarrinho VARCHAR(10) NOT NULL,
  QuantidadeProduto INT NOT NULL,
  PRIMARY KEY (IDProduto, IDCarrinho),
  FOREIGN KEY (IDProduto) REFERENCES Produto(IDProduto),
  FOREIGN KEY (IDCarrinho) REFERENCES Carrinho(IDCarrinho)
);
