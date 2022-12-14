-- Criação do BD para o cenário de E-Commerce
-- create database ecommerce;
use ecommerce;


-- Tabela cliente
create table cliente(
	idCliente int auto_increment primary key,
    tipoCLiente enum('PF','PJ') not null,
    CEP char(8) not null,
    Rua varchar(15),
    Complemento varchar(15),
    Bairro varchar(15),
    Cidade varchar(15) not null,
    Estado char(2) not null,
    Email varchar(40) not null,
    Cel char(11) not null
);

-- show tables;
-- desc cliente;

-- Cliente Pessoa Jurídica
create table pj(
	idPJ int auto_increment primary key,
    idCliente int,
    RazaoSocial varchar(40),
    NomeFantasia varchar(40),
    CNPJ char(14),
    constraint fk_pj_cliente foreign key(idCliente) references cliente(idCliente),
    constraint unico_cnpj_cliente unique(CNPJ)
);

-- show tables;
desc pj;
-- select * from information_schema.table_constraints where constraint_schema = 'ecommerce';


-- Cliente Pessoa Física
create table pf(
	idPF int auto_increment primary key,
    idPFCliente int,
    Pnome varchar(15),
    Mnome_letra varchar(3),
    Unome varchar(15),
    CPF char(11),
    constraint fk_pf_cliente foreign key(idPFCliente) references cliente(idCliente),
    constraint unico_cpf_cliente unique(CPF)
);

-- show tables;
-- desc pf;
-- select * from information_schema.table_constraints where constraint_schema = 'ecommerce';


-- Pedido
create table pedido(
	idPedido int auto_increment primary key,
    idPedCliente int,
    idPedPagamento int,
    PedQuantidade int default 1,
    Situação enum('Confirmado','Em processamento','Saiu para entrega','Entregue','Cancelado') default 'Confirmado',
	Frete float not null,
    constraint fk_pedido_cliente foreign key(idPedCliente) references cliente(idCliente),
    constraint fk_pedido_pagamento foreign key(idPedPagamento) references pagamento(idPagamento)
);

-- show tables;
-- desc pedido;
-- select * from information_schema.table_constraints where constraint_schema = 'ecommerce';

-- Pagamento
create table pagamento(
	idPagamento int auto_increment primary key,
    FormaPagamento enum('Boleto','CCrédito','Pix'),
    Confirmado bool default false not null
);
-- show tables;
-- desc pagamento;
-- select * from information_schema.table_constraints where constraint_schema = 'ecommerce';
    
    
-- Boleto
create table boleto(
	idBoleto int auto_increment primary key,
    Bnúmero char(10) unique not null,
    idBPagamento int,
    constraint fk_boleto_pagamento foreign key(idBPagamento) references pagamento(idPagamento)	
);

-- show tables;
-- desc boleto;
-- select * from information_schema.table_constraints where constraint_schema = 'ecommerce';

-- Pix
create table pix(
	idPix int auto_increment primary key,
    Pcnpj char(14) not null,
	constraint unico_cnpj_pix unique(Pcnpj),
    idPPagamento int,
    constraint fk_pix_pagamento foreign key(idPPagamento) references pagamento(idPagamento)
);

-- show tables;
-- desc pix;
-- select * from information_schema.table_constraints where constraint_schema = 'ecommerce';

drop table cartaoCredito;
-- Cartão de Crédito
create table cartaoCredito(
	idCartaoCredito int auto_increment primary key,
    CCnúmero char(16) unique not null,
    Nometitular varchar(45) not null,
    VencimentoCartao date not null,
    CodigoVerificador char(3) not null,
    idCCPagamento int,
    constraint fk_ccredito_pagamento foreign key(idCCPagamento) references pagamento(idPagamento)
);
-- show tables;
desc cartaoCredito;
-- select * from information_schema.table_constraints where constraint_schema = 'ecommerce';

-- Entrega
create table entrega(
	idEntrega int auto_increment primary key,
    Esituação bool default false,
    CodigoRastreio char(10) unique not null,
    ProdutoDevolvido bool default false
);



-- show tables;
-- desc boleto;
-- select * from information_schema.table_constraints where constraint_schema = 'ecommerce';

-- Produto
create table produto(
	idProduto int auto_increment primary key,
    Categoria enum('Eletronico','Decoração','Vestuário','Brinquedos','Papelaria') not null,
    Classificação_infantil bool,
    Especificações varchar(255),
    Valor float not null,
    Avaliação int default 0
);

-- show tables;
-- desc boleto;
-- select * from information_schema.table_constraints where constraint_schema = 'ecommerce';

-- Estoque
create table estoque(
	idEstoque int auto_increment primary key
);

-- show tables;
-- desc estoque;
-- select * from information_schema.table_constraints where constraint_schema = 'ecommerce';


-- Fornecedor
create table fornecedor(
	idFornecedor int auto_increment primary key,
    fRazaoSocial varchar(40) not null,
    fNomeFantasia varchar(40),
    fCNPJ char(14) not null,
    constraint unico_cnpj_fornecedor unique(fCNPJ),
    fCEP char(8) not null,
    fRua varchar(15),
    fComplemento varchar(15),
    fBairro varchar(15),
    fCidade varchar(15) not null,
    fEstado char(2) not null,
    fEmail varchar(40) not null,
    fTelContato char(11) not null
);

-- show tables;
-- desc fornecedor;
-- select * from information_schema.table_constraints where constraint_schema = 'ecommerce';


-- Terceiro vendedor
create table terceiroVendedor(
	idTerceiroVendedor int auto_increment primary key,
    tRazaoSocial varchar(40) not null,
    tNomeFantasia varchar(40),
    tCNPJ char(14) not null,
    constraint unico_cnpj_terceiro unique(tCNPJ),
    tCEP char(8) not null,
    tRua varchar(15),
    tComplemento varchar(15),
    tBairro varchar(15),
    tCidade varchar(15) not null,
    tEstado char(2) not null,
    tEmail varchar(40) not null,
    tTelContato char(11) not null
);
	
-- show tables;
-- desc terceiroVendedor;
-- select * from information_schema.table_constraints where constraint_schema = 'ecommerce';
    
    
-- RELACIONAMENTOS

    
-- Relação de produto/pedido
create table produtoPedido(
	idPPPedido int,
    constraint fk_prodPed_pedido foreign key(idPPPedido) references pedido(idPedido),
    idPPProduto int,
    constraint fk_prodPed_produto foreign key(idPPProduto) references produto(idProduto),
    primary key(idPPPedido,idPPProduto)
);

-- show tables;
-- desc produtoPedido;
-- select * from information_schema.table_constraints where constraint_schema = 'ecommerce';

-- Produto/fornecedor
create table produtoFornecedor(
	idProdFornFornecedor int,
    idProdFornProduto int,
    constraint fk_prodForn_fornecedor foreign key(idProdFornFornecedor) references fornecedor(idFornecedor),
    constraint fk_prodForn_produto foreign key(idProdFornProduto) references produto(idProduto),
    -- primary key(idProdFornFornecedor,idProdFornProduto),
    fornQuantidade int
);

-- show tables;
desc produtoFornecedor;
-- select * from information_schema.table_constraints where constraint_schema = 'ecommerce';
drop table produtoVendedor;
-- Produto/vendedor (terceiros)
create table produtoVendedor(
	idProdVTercVendedor int,
    constraint fk_prodVen_terceiro foreign key(idProdVTercVendedor) references terceiroVendedor(idTerceiroVendedor),
    idProdVProduto int,
    constraint fk_prodVen_produto foreign key(idProdVProduto) references produto(idProduto),
    -- primary key(idProdVTercVendedor,idProdVProduto),
    vendTerQuantidade int
);

-- show tables;
desc produtoVendedor;
-- select * from information_schema.table_constraints where constraint_schema = 'ecommerce';

-- Estoque/produto
create table estoqueProduto(
	idEPEstoque int,
    constraint fk_prodEst_estoque foreign key(idEPEstoque) references estoque(idEstoque),
    idEPProduto int,
    constraint fk_prodEst_produto foreign key(idEPProduto) references produto(idProduto),
    primary key(idEPEstoque,idEPProduto),
    epQuantidade int
);

-- show tables;
desc estoqueProduto;
-- select * from information_schema.table_constraints where constraint_schema = 'ecommerce';

-- exclusão de tabela
-- drop table estoqueProduto;

-- exclusão de atributo
-- alter table pedido drop Situação; 

-- inclusão de atributo
-- alter table pedido add Situação enum('Confirmado','Em processamento','Saiu para entrega','Entregue','Cancelado') default 'Confirmado';

-- exclusão de constraint fk(foreign key)
-- alter table fornecedor drop foreign key fk_forn_estoque;

-- exclui atributo
-- alter table pf drop constraint idPFCliente;

-- altera nome de atributo
-- alter table pf add idPFCliente int;

-- inclui constraint
-- alter table pf 
	-- add constraint fk_pf_cliente foreign key(idPFCliente) references cliente(idCliente)
    -- on update cascade;


-- exclui constraint
-- alter table pj drop constraint fk_pj_cliente;

-- exclui atributo
-- alter table pj drop idCliente;

-- add atributo FK
-- alter table pj add idPJCliente int;

