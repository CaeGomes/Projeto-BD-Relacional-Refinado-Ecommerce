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

-- Consulta clientes em ordem alfabética    
select * from pf order by Pnome;






