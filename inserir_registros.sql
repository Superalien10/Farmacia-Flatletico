--Inserts


insert into Proprietario values ('PT001', 'Clara Saldanha', 'sal.clara@gmail.com', '557e0f406gggh2', 15217899213);
insert into Proprietario values ( 'PT002', 'Francisco Pessanha', 'sp.producoes@gmail.com','e66651005sdxwsdxz', 90406512462);
insert into Proprietario values ('PT003', 'Beatriz dos Santos', 'se_liga_na_giinga@gmail.com', 'gatinho1236', 32620472935);

insert into Proprietario_TelefoneProprietario values ('15247856930', 'PT001');
insert into Proprietario_TelefoneProprietario values ('00963258541', 'PT002');
insert into Proprietario_TelefoneProprietario values ('35241475525', 'PT003');

insert into Gerente values ('GE001', 'Guilherme Souza', 'souzadasaguas@gmail.com', 'parati06068-92', 67915741212, 3200.00, 'PT001');

insert into Gerente_TelefoneGerente values ('95847215032', 'GE001');
insert into Gerente_TelefoneGerente values ('15745863251', 'GE001');

insert into Funcionario values ('FU001', 'Hernán Vegas', 'hernancortez@gmail.com', 'farma00126', 73124275124, 1980.00, 'GE001');
insert into Funcionario values ('FU002', 'Bruno Vianna', 'bruno.vianna@gmail.com', 'f@z0LLL13', 95647113207, 1980.00, 'GE001');
insert into Funcionario values ('FU003', 'Karen Dutra', 'dutrak@gmail.com', 'vi4dutRA', 15594501231, 1980.00, 'GE001');
insert into Funcionario values ('FU004', 'Alyssom Ibei', 'ibei.a.i@hotmail.com', 'soudoguinho', 11111121111, 1980.00, 'GE001');
insert into Funcionario values ('FU005', 'Julius Caesar', 'julius.caesar44ac@gmail.com', 'pompeuR0m@', 41534312283, 1980.00, 'GE001');
insert into Funcionario values ('FU006', 'Manuel Saravia', 'manesa@hotmail.com', 'FlaGarrincha', 70045896012, 1980.00, 'GE001');

insert into Funcionario_TelefoneFuncionario values ('98132342097', 'FU001');
insert into Funcionario_TelefoneFuncionario values ('15943985674', 'FU002');
insert into Funcionario_TelefoneFuncionario values ('56941524398', 'FU002');
insert into Funcionario_TelefoneFuncionario values ('53948274591', 'FU003');
insert into Funcionario_TelefoneFuncionario values ('21998345671', 'FU004');
insert into Funcionario_TelefoneFuncionario values ('22981554432', 'FU005');
insert into Funcionario_TelefoneFuncionario values ('53944556677', 'FU006');

insert into Atendente values ('AT001', 'FU001');
insert into Atendente values ('AT002', 'FU002');
insert into Entregador values ('EN001', 'FU003');
insert into Entregador values ('EN002', 'FU006');
insert into Caixa values ('CA001', 'FU004');
insert into Caixa values ('CA002', 'FU005');

insert into Cliente values ('CL001', 'Romiro Silva', 'rosil.narniano@gmail.com', 'rui234kdsw98', '73419054210', '1993-01-22', 'Rua São Januário', 'Pavuna', 'Lunieta', 'Nárnia');
insert into Cliente values ('CL002', 'Letisgo Gomes', 'lets.go@gmail.com', '893yuefbcn89', '37829550246', '1980-03-31', 'Rua Figueiras', 'Menescal', 'Lunieta', 'Nárnia');
insert into Cliente values ('CL003', 'Helena Bugres', 'bugres.hel@outlook.com', 'c237y9h23', '54687235148', '2003-12-03', 'Rua Nilton Santos', 'Menescal', 'Lunieta', 'Nárnia');
insert into Cliente values ('CL004', 'José Carioca', 'zeh@gmail.com', '985r4je82', '49806543129', '2000-08-19', 'Rua Barracão ao Lado', 'Logínquo', 'Tenesina', 'Nárnia');
insert into Cliente values ('CL005', 'Carlos Almeidão', 'carlos.al@gmail.com', '29387hfcbn3r', '29485701298', '1960-12-08', 'Rua 1° de Abril', 'Pavuna', 'Lunieta', 'Nárnia');

insert into Cliente_TelefoneCliente values ('84561342097', 'CL001');
insert into Cliente_TelefoneCliente values ('97134208456', 'CL001');
insert into Cliente_TelefoneCliente values ('41563416545', 'CL002');
insert into Cliente_TelefoneCliente values ('09236509325', 'CL003');
insert into Cliente_TelefoneCliente values ('02934388456', 'CL004');
insert into Cliente_TelefoneCliente values ('13424358456', 'CL004');

insert into Cliente_ModoPagamentoCliente values ('Visa débito', 'CL001');
insert into Cliente_ModoPagamentoCliente values ('Visa crédito', 'CL001');
insert into Cliente_ModoPagamentoCliente values ('Boleto', 'CL002');
insert into Cliente_ModoPagamentoCliente values ('PIX', 'CL003');
insert into Cliente_ModoPagamentoCliente values ('Dinheiro', 'CL003');
insert into Cliente_ModoPagamentoCliente values ('Visa débito', 'CL004');

insert into Categoria values ('CT001', 'Anti-inflamatórios não esteróides', 'AT001');
insert into Categoria values ('CT002', 'Anticoagulantes', 'AT001');
insert into Categoria values ('CT003', 'Antidepressivos', 'AT001');
insert into Categoria values ('CT004', 'Inibidores da monoamina oxidase (IMAOs)', 'AT001');
insert into Categoria values ('CT005', 'Antibióticos', 'AT001');
insert into Categoria values ('CT006', 'Anticoncepcionais orais', 'AT001');
insert into Categoria values ('CT007', 'Ansiolíticos', 'AT001');
insert into Categoria values ('CT008', 'Anti-hipertensivos', 'AT001');
insert into Categoria values ('CT009', 'Diuréticos', 'AT001');
insert into Categoria values ('CT010', 'Antiácidos', 'AT001');
insert into Categoria values ('CT011', 'Estatinas', 'AT001');
insert into Categoria values ('CT012', 'Antifúngicos', 'AT001');
insert into Categoria values ('CT013', 'Beta-bloqueadores', 'AT001');
insert into Categoria values ('CT014', 'Broncodilatadores', 'AT001');
insert into Categoria values ('CT015', 'Antiarrítmicos', 'AT001');
insert into Categoria values ('CT016', 'Antidiabéticos', 'AT001');
insert into Categoria values ('CT017', 'Corticoides', 'AT001');
insert into Categoria values ('CT018', 'Opioides', 'AT001');
insert into Categoria values ('CT019', 'Ortopedicos', 'AT001');
insert into Categoria values ('CT020', 'Higiene Oral', 'AT001');
insert into Categoria values ('CT021', 'Bebidas', 'AT001');
insert into Categoria values ('CT022', 'Maquiagem', 'AT001');
insert into Categoria values ('CT023', 'Depilação', 'AT001');

insert into Produto values ('PR001', 'Diclofenato', 16.35, 58, '2025-11-25', 'Bomfim SA', 'CT001', 'AT001');
insert into Produto values ('PR002', 'Ibuprofeno', 12.88, 80,  '2025-11-25', 'Mercur', 'CT001', 'AT001');
insert into Produto values ('PR003', 'Heparina', 373.88, 37,  '2025-11-26',  'Mercur', 'CT002', 'AT002');
insert into Produto values ('PR004', 'Argatroban', 12.88, 56,  '2025-11-27', 'Bomfim SA', 'CT002', 'AT001');
insert into Produto values ('PR005', 'Amitriptilina', 20.29, 60,  '2025-11-27', 'Medlay', 'CT003', 'AT001');
insert into Produto values ('PR006', 'Clomipramina', 18.25, 21,  '2025-11-28', 'Mercur', 'CT003', 'AT002');
insert into Produto values ('PR007', 'Isocarboxazida', 65.23, 34,  '2025-11-28', 'Medlay', 'CT004', 'AT001');
insert into Produto values ('PR008', 'Moclobemida', 90.95, 12,  '2025-11-28', 'Bomfim SA', 'CT004', 'AT002');
insert into Produto values ('PR009', 'Amoxicilina', 28.49, 83,  '2025-11-28', 'Medlay', 'CT005', 'AT001');
insert into Produto values ('PR010', 'Ampicilina', 31.03, 31,   '2025-12-01', 'Mercur', 'CT005', 'AT002');
insert into Produto values ('PR011', 'Diminut Femiane', 40.54, 15,  '2025-12-01', 'Bomfim SA', 'CT006', 'AT001');
insert into Produto values ('PR012', 'Femina Primera', 30.79, 29,   '2025-12-01', 'Bomfim SA', 'CT006', 'AT002');
insert into Produto values ('PR013', 'Alprazolam', 18.14, 56,  '2026-01-04', 'Medlay', 'CT007', 'AT002');
insert into Produto values ('PR014', 'Bromazepam', 13.19, 73, '2026-01-05', 'Mercur', 'CT007', 'AT001');
insert into Produto values ('PR015', 'Benazepril', 55.78, 48,  '2026-01-05', 'Mercur', 'CT008', 'AT002');
insert into Produto values ('PR016', 'Captopril', 4.22, 102,  '2026-01-06', 'Bomfim SA', 'CT008', 'AT002');
insert into Produto values ('PR017', 'Furosemidal', 8.71, 86,  '2026-01-06', 'Medlay', 'CT009', 'AT002');
insert into Produto values ('PR018', 'Hidroclorotiazida', 4.22, 12,  '2026-01-08', 'Bomfim SA', 'CT009', 'AT002');
insert into Produto values ('PR019', 'Sal de fruta Enol', 21.90, 35, '2026-02-04',  'Mercur', 'CT010', 'AT002');
insert into Produto values ('PR020', 'Estomazil', 21.90, 25, '2026-02-04',  'Mercur', 'CT010', 'AT002');
insert into Produto values ('PR021', 'Lovastatina', 86.29, 17, '2026-02-04',  'Mercur', 'CT011', 'AT001');
insert into Produto values ('PR022', 'Pravastatina', 55.79, 26,  '2026-02-05',  'Medlay', 'CT011', 'AT001');
insert into Produto values ('PR023', 'Bifonazol', 42.9, 48,  '2026-02-06', 'Bomfim SA', 'CT012', 'AT002');
insert into Produto values ('PR024', 'Ciclopirox Olamina', 17.39, 18,  '2026-02-14', 'Mercur', 'CT012', 'AT002');
insert into Produto values ('PR025', 'Acebutolol', 43.7, 67,  '2026-02-15', 'Mercur', 'CT013', 'AT002');
insert into Produto values ('PR026', 'Atenolol', 6.23, 51,  '2026-02-18', 'Mercur', 'CT013', 'AT001');
insert into Produto values ('PR027', 'Aerodini', 31.25, 34,  '2026-03-02', 'Mercur', 'CT014', 'AT001');
insert into Produto values ('PR028', 'Aerolin', 26.42, 23,  '2026-03-02', 'Mercur', 'CT014', 'AT002');
insert into Produto values ('PR029', 'Andenosina', 18.68, 67,  '2026-03-05', 'Mercur', 'CT015', 'AT001');
insert into Produto values ('PR030', 'Amiodarona', 22.29, 12, '2026-03-07', 'Mercur', 'CT015', 'AT002');
insert into Produto values ('PR031', 'Acetoexamida', 138.87, 43,  '2026-03-08', 'Mercur', 'CT016', 'AT001');
insert into Produto values ('PR032', 'Clorpropamida', 154.32, 38,  '2026-03-08', 'Mercur', 'CT016', 'AT002');
insert into Produto values ('PR033', 'Prednisona', 16.77, 49, '2026-03-09', 'Mercur', 'CT017', 'AT002');
insert into Produto values ('PR034', 'Dexametasona', 8.76, 27,  '2026-03-10', 'Mercur', 'CT017', 'AT001');
insert into Produto values ('PR035', 'Tramadol', 17.73, 31,  '2026-04-02', 'Mercur', 'CT0018', 'AT002');
insert into Produto values ('PR036', 'Hidromorfona', 423.02, 13,  '2026-04-04', 'Mercur', 'CT018', 'AT001');
insert into Produto values ('PR037', 'Creme Dental', 12.99, 100,  '2025-01-01', 'Colgate', 'CT020', 'AT001');
insert into Produto values ('PR038', 'Fio Dental', 17.99, 146,  '2027-06-09', 'Oral-B', 'CT020', 'AT001');
insert into Produto values ('PR039', 'Escova Dental', 14.99, 145,  '2026-04-01', 'Colgate', 'CT020', 'AT001');
insert into Produto values ('PR040', 'Isotônico', 7.99, 133,  '2024-03-01', 'Gatorade', 'CT021', 'AT001');
insert into Produto values ('PR041', 'Corretivo Líquido', 82.99, 67,  '2023-11-05', 'Maybelline', 'CT022', 'AT001');
insert into Produto values ('PR042', 'Aparelho de Depilar', 15.99, 56,  NULL, 'Gillette', 'CT023', 'AT001');
insert into Produto values ('PR043', 'Tornozeleira', 22.56, 73,  NULL, 'Speedo', 'CT019', 'AT001');


insert into Medicamento values ('ME001', 'PR001');
insert into Medicamento values ('ME002', 'PR002');
insert into Medicamento values ('ME003', 'PR003');
insert into Medicamento values ('ME004', 'PR004');
insert into Medicamento values ('ME005', 'PR005');
insert into Medicamento values ('ME006', 'PR006');
insert into Medicamento values ('ME007', 'PR007');
insert into Medicamento values ('ME008', 'PR008');
insert into Medicamento values ('ME009', 'PR009');
insert into Medicamento values ('ME010', 'PR010');
insert into Medicamento values ('ME011', 'PR011');
insert into Medicamento values ('ME012', 'PR012');
insert into Medicamento values ('ME013', 'PR013');
insert into Medicamento values ('ME014', 'PR014');
insert into Medicamento values ('ME015', 'PR015');
insert into Medicamento values ('ME016', 'PR016');
insert into Medicamento values ('ME017', 'PR017');
insert into Medicamento values ('ME018', 'PR018');
insert into Medicamento values ('ME019', 'PR019');
insert into Medicamento values ('ME020', 'PR020');
insert into Medicamento values ('ME021', 'PR021');
insert into Medicamento values ('ME022', 'PR022');
insert into Medicamento values ('ME023', 'PR023');
insert into Medicamento values ('ME024', 'PR024');
insert into Medicamento values ('ME025', 'PR025');
insert into Medicamento values ('ME026', 'PR026');
insert into Medicamento values ('ME027', 'PR027');
insert into Medicamento values ('ME028', 'PR028');
insert into Medicamento values ('ME029', 'PR029');
insert into Medicamento values ('ME030', 'PR030');
insert into Medicamento values ('ME031', 'PR031');
insert into Medicamento values ('ME032', 'PR032');
insert into Medicamento values ('ME033', 'PR033');
insert into Medicamento values ('ME034', 'PR034');
insert into Medicamento values ('ME035', 'PR035');
insert into Medicamento values ('ME036', 'PR036');


insert into OutrosItens values ('OI001', 'PR037');
insert into OutrosItens values ('OI002', 'PR038');
insert into OutrosItens values ('OI003', 'PR039');
insert into OutrosItens values ('OI004', 'PR040');
insert into OutrosItens values ('OI005', 'PR041');
insert into OutrosItens values ('OI006', 'PR042');
insert into OutrosItens values ('OI007', 'PR043');

insert into Vacina values ('VA001', 'Anti-tetânica', '2025-10-02', 'Butantan', 'PF3681', 'AT002');
insert into Vacina values ('VA002', 'Influenza', '2024-04-13', 'Butantan', '224001', 'AT002');
insert into Vacina values ('VA003', 'CoronaVac', '2023-10-30', 'Butantan', '202201030', 'AT002');
insert into Vacina values ('VA004', 'Hepatite B', '2025-07-09', 'Butantan', '170017', 'AT002');
insert into Vacina values ('VA005', 'Febre Amarela', '2026-12-31', 'Bio-Manguinhos - Fiocruz', '22J0142', 'AT002');

insert into Doenca values ('DO001', 'Escorbuto', 'AT002');
insert into Doenca values ('DO002', 'Hepatite B', 'AT002');
insert into Doenca values ('DO003', 'Poliomielite', 'AT002');
insert into Doenca values ('DO004', 'Pneumonia', 'AT002');
insert into Doenca values ('DO005', 'Ataque cardíaco', 'AT002');

insert into CadastrarDoenca values ('DO001', 'CL001');
insert into CadastrarDoenca values ('DO005', 'CL001');
insert into CadastrarDoenca values ('DO005', 'CL002');
insert into CadastrarDoenca values ('DO002', 'CL003');
insert into CadastrarDoenca values ('DO003', 'CL003');
insert into CadastrarDoenca values ('DO002', 'CL004');
insert into CadastrarDoenca values ('DO004', 'CL004');
insert into CadastrarDoenca values ('DO005', 'CL004');

insert into Cadastrar values ('VA001', 'CL001');
insert into Cadastrar values ('VA004', 'CL001');
insert into Cadastrar values ('VA005', 'CL002');
insert into Cadastrar values ('VA002', 'CL003');


insert into Agendar values ('VA001', 'CL001');
insert into Agendar values ('VA001', 'CL002');
insert into Agendar values ('VA003', 'CL002');
insert into Agendar values ('VA004', 'CL003');
insert into Agendar values ('VA002', 'CL004');
insert into Agendar values ('VA005', 'CL004');

insert into Conflitar values ('ME009', 'ME019');
insert into Conflitar values ('ME009', 'ME020');
insert into Conflitar values ('ME010', 'ME019');
insert into Conflitar values ('ME010', 'ME020');
insert into Conflitar values ('ME009', 'ME011');
insert into Conflitar values ('ME009', 'ME012');
insert into Conflitar values ('ME010', 'ME011');
insert into Conflitar values ('ME010', 'ME012');
insert into Conflitar values ('ME005', 'ME013');
insert into Conflitar values ('ME005', 'ME014');
insert into Conflitar values ('ME006', 'ME013');
insert into Conflitar values ('ME006', 'ME014');
insert into Conflitar values ('ME005', 'ME029');
insert into Conflitar values ('ME005', 'ME030');
insert into Conflitar values ('ME006', 'ME029');
insert into Conflitar values ('ME006', 'ME030');
insert into Conflitar values ('ME005', 'ME007');
insert into Conflitar values ('ME005', 'ME008');
insert into Conflitar values ('ME006', 'ME007');
insert into Conflitar values ('ME006', 'ME008');
insert into Conflitar values ('ME031', 'ME033');
insert into Conflitar values ('ME031', 'ME034');
insert into Conflitar values ('ME032', 'ME033');
insert into Conflitar values ('ME032', 'ME034');
insert into Conflitar values ('ME001', 'ME003');
insert into Conflitar values ('ME001', 'ME004');
insert into Conflitar values ('ME002', 'ME003');
insert into Conflitar values ('ME002', 'ME004');
insert into Conflitar values ('ME015', 'ME017');
insert into Conflitar values ('ME015', 'ME018');
insert into Conflitar values ('ME016', 'ME017');
insert into Conflitar values ('ME016', 'ME018');
insert into Conflitar values ('ME025', 'ME027');
insert into Conflitar values ('ME025', 'ME028');
insert into Conflitar values ('ME026', 'ME027');
insert into Conflitar values ('ME026', 'ME028');
insert into Conflitar values ('ME021', 'ME023');
insert into Conflitar values ('ME021', 'ME024');
insert into Conflitar values ('ME022', 'ME023');
insert into Conflitar values ('ME022', 'ME024');

/* Código que gera inserts aleatórios para as tabelas Carrinho e Adicionar*/

DECLARE @QuantidadeProduto int
DECLARE @IDCarrinho varchar(10)
DECLARE @IDCliente varchar(10)
DECLARE @IDProduto varchar(10)
declare @Grupo varchar(30)
declare @IDMedicamento varchar(10)

declare @contcarrinho int
declare @contadicionar int
declare @adicionarmax int
declare @contconflito int
declare @quantestoque int

set @contcarrinho = 0
set @contadicionar = 0
WHILE ( @contcarrinho < 50 )
BEGIN
SELECT top 1 @IDCliente = IDCliente FROM Cliente ORDER BY NEWID() 
SELECT @IDCarrinho = concat('CR', cast(@contcarrinho+1 as varchar(10))); 
insert into Carrinho values(@IDCarrinho, @IDCliente);
set @adicionarmax = abs(checksum(newid()))%10;
WHILE ( @contadicionar < @adicionarmax )
BEGIN
SELECT top 1 @IDProduto = IDProduto FROM Produto ORDER BY NEWID()
select @QuantidadeProduto = (abs(checksum(newid())) % 10) + 1
select @Grupo = 'Medicamentos' from Medicamento m inner join Produto p on p.IDProduto=m.IDProduto;
select @Grupo = 'Outros Itens' from OutrosItens o inner join Produto p on p.IDProduto=o.IDProduto;
select @IDMedicamento=m.IDMedicamento from Medicamento m where m.IDProduto=@IDProduto;
select @quantestoque = p.QuantidadeEstoqueProduto from Produto p where p.IDProduto=@IDProduto;
 
create table EmConflito (IDProduto varchar(10), IDMedicamentoAfetado varchar(10), IDMedicamentoAfeta varchar(10), primary key (IDProduto));

insert into EmConflito
select
a.IDProduto, c.IDMedicamentoAfetado, c.IDMedicamentoAfeta
from Adicionar a inner join Medicamento m on m.IDProduto=a.IDProduto
inner join Conflitar c on c.IDMedicamentoAfetado=m.IDMedicamento or c.IDMedicamentoAfeta=m.IDMedicamento;
select @contconflito = count(*) from EmConflito where IDMedicamentoAfetado=@IDMedicamento or IDMedicamentoAfeta=@IDMedicamento;

if @contconflito=0 and @quantestoque>0
insert into Adicionar values(@IDProduto, @IDCarrinho, @QuantidadeProduto);
if @contconflito=0 and @quantestoque>0
update Produto set Produto.QuantidadeEstoqueProduto -= 1 where Produto.IDProduto=@IDProduto;
drop table EmConflito;
SET @contadicionar = @contadicionar + 1;
END
set @contadicionar = 0
set @contcarrinho = @contcarrinho + 1;
END


/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
DECLARE @DataCompra datetime
DECLARE @IDCompra varchar(10)
DECLARE @IDCarrinho varchar(10)
DECLARE @IDCaixa varchar(10)
declare @contcompra int
declare @FromDatetime datetime = '2020-05-23 08:00:00'
declare @ToDatetime datetime = '2023-03-31 20:00:00'

set @contcompra = 0
WHILE ( @contcompra < 30 )
BEGIN
SELECT top 1 @IDCarrinho = IDCarrinho FROM Carrinho ORDER BY NEWID() 
SELECT top 1 @IDCaixa = IDCaixa FROM Caixa ORDER BY NEWID() 
if @contcompra < 10 SELECT @IDCompra = concat('CO00', cast(@contcompra+1 as varchar(10)));
else SELECT @IDCompra = concat('CO0', cast(@contcompra+1 as varchar(10))); 
select @DataCompra = dateadd(second, rand(checksum(newid()))*(1+datediff(second, @FromDatetime, @ToDatetime)),@FromDatetime);
insert into Compra values(@IDCompra, @DataCompra, @IDCarrinho, @IDCaixa);
set @contcompra = @contcompra + 1;
END
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
declare @IDCompra varchar(10)
declare @IDEntregador varchar(10)
declare @HoraEntrega datetime
declare @FromDatetime datetime
declare @ToDatetime datetime
declare @contentrega int

set @contentrega = 0
while (@contentrega < 30)
begin
SELECT top 1 @IDEntregador = IDEntregador FROM Entregador ORDER BY NEWID()
if @contentrega < 10 SELECT @IDCompra = IDCompra FROM Compra where IDCompra = concat('CO00', cast(@contentrega+1 as varchar(10))) ORDER BY NEWID();
else SELECT @IDCompra = IDCompra FROM Compra where IDCompra = concat('CO0', cast(@contentrega+1 as varchar(10))) ORDER BY NEWID();
SELECT @FromDatetime = DataCompra FROM Compra where IDCompra = @IDCompra ORDER BY NEWID();
SELECT @FromDatetime = DataCompra FROM Compra where IDCompra = @IDCompra ORDER BY NEWID();
set @ToDatetime = dateadd(day, 7, @FromDatetime);
select @HoraEntrega = dateadd(second, rand(checksum(newid()))*(1+datediff(second, @FromDatetime, @ToDatetime)),@FromDatetime);
insert into Entrega values(@HoraEntrega, @IDCompra, @IDEntregador);
set @contentrega = @contentrega + 1;
end


