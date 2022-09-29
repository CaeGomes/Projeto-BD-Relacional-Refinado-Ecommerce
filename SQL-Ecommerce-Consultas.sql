use ecommerce;

-- CONSULTAS BÁSICAS
-- Lista de clientes
select * from cliente;
-- Lista de clientes PJ
select * from pj;
-- Lista de clientes PF
select * from pf;

-- Relação de transações com status sobre pagamento
select * from pagamento;
-- Relação de boleto emitido para pagamento
select * from boleto;
-- Relação de cartões registrados como forma de pagamento
select * from cartaoCredito;
-- Relação de pagamentos via Pix
select * from pix;

-- Quantidade de estoques gerados
select * from estoque;
-- Relação de produtos
select * from produto;

-- Relação de pedidos realizados
select * from pedido;
-- Relação de entregas com situação (0-não realizada, 1-realizada)
select * from entrega;

-- Relação de fornecedores
select * from fornecedor;
-- Relação de vendedoes terceiros
select * from terceiroVendedor;


-- OUTRAS CONSULTAS
-- Nome e sobrenome de clientes Pessoa Física
select concat(Pnome,' ',Unome) as Nome_e_sobrenome 
	from pf as f;

-- Consulta PF por ordem alfabética: nome, CPF e e-mail
select distinct pf.Pnome, pf.CPF, cliente.Email
	from pf join cliente
    on cliente.idCliente = pf.idPFCliente
    order by Pnome;

-- Consulta de pedidos em ordem crescente com produto e preço por clientes
select distinct idPedido  Número_pedido, idPedCliente Código_cliente, concat(Pnome,' ',Unome) as Nome_e_sobrenome, 
	idProduto Cód_produto, Especificações, Valor
	from produtoPedido, pedido, pf, cliente, produto
    where idPedCliente=idCliente and idPFCliente=idPedCliente and idPPPedido=idPedido and idPPProduto=idProduto
    order by idPedido;

-- Pedidos feitos por clientes
select distinct idPedido Núm_pedido, concat(Pnome,' ',Unome) as Cliente, Especificações, pedQuantidade Quantidade
	from pedido, produto, produtoPedido, pf
    where idPedido=idPPPedido and idPFCliente=idPedCliente and idProduto=idPPProduto
    order by idPedido;

-- Algum vendedor terceiro é também fornecedor?
select fCNPJ CNPJ_Fornecedor, tCNPJ CNPJ_VendedorTerc
	from fornecedor, terceiroVendedor
	where fCNPJ=tCNPJ;

-- Relação de produtos por fornecedor  
select p.Categoria, p.Especificações, fRazaoSocial Nome_Fornecedor, fornQuantidade Qtde
	from produto as p, produtoFornecedor join fornecedor
    where idProdFornProduto=p.idProduto and idProdFornFornecedor=idFornecedor; 

-- Relação de produtos por vendedor terceiro
select p.Categoria, p.Especificações, tRazaoSocial Nome_Vendedor, vendTerQuantidade Qtde
	from produto as p, produtoVendedor join terceiroVendedor
    where idProdVProduto=p.idProduto and idProdVTercVendedor=idTerceiroVendedor;

-- Relação de estoque por produto e quantidade
select idEPEstoque Número_Estoque, idEPProduto Código_Produto, Especificações, epQuantidade Quantidade
	from estoqueProduto, produto
    where idEPProduto=idProduto
    order by Especificações;


-- CONSULTAS ALEATÓRIAS
select idPFCliente, CPF from PF;
select idCliente, Email, tipoCliente from cliente where tipoCliente='PF';








