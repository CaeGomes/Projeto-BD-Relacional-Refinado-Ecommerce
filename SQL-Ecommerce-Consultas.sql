use ecommerce;

-- Consultas básicas
select * from cliente;
select * from pj;
select * from pf;

select * from pagamento;
select * from boleto;
select * from cartaoCredito;
select * from pix;

select * from estoque;
select * from produto;

select * from pedido;
select * from entrega;

select * from fornecedor;
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
-- select fCNPJ
	-- from fornecedor
	-- where fCNPJ=


-- CONSULTAS ALEATÓRIAS
select idPFCliente, CPF from PF;
select idCliente, Email, tipoCliente from cliente where tipoCliente='PF';








