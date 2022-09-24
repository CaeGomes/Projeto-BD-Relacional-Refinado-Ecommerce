use ecommerce;

-- Cliente
-- tipoCliente, CEP, Rua, Complemento, Bairro, Cidade, Estado, Email, Cel
insert into cliente(tipoCLiente,CEP,Rua,Complemento,Bairro,Cidade,Estado,Email,Cel)
			values('PF',71000000,'Rua 1','Casa 1','Bairro 1','Cidade 1','DF','cliente@1.com.br',61912345678),
				  ('PF',71000000,'Rua 2','Casa 2','Bairro 2','Cidade 2','DF','cliente@2.com.br',61922345678),
				  ('PF',71000000,'Rua 3','Casa 3','Bairro 3','Cidade 3','DF','cliente@3.com.br',61932345678),
                  ('PF',71000000,'Rua 4','Casa 4','Bairro 4','Cidade 4','DF','cliente@4.com.br',61942345678),
                  ('PJ',71000000,'Rua A','Casa A','Bairro A','Cidade A','GO','cliente@A.com.br',61952345678),
                  ('PJ',71000000,'Rua B','Casa B','Bairro B','Cidade B','GO','cliente@B.com.br',61962345678),
                  ('PJ',71000000,'Rua C','Casa C','Bairro C','Cidade C','GO','cliente@C.com.br',61972345678),
                  ('PJ',71000000,'Rua D','Casa D','Bairro D','Cidade D','GO','cliente@D.com.br',61982345678);
-- select * from cliente;

-- Cliente PJ
-- idCliente, RazaoSocial, NomeFantasia, CNPJ
insert into pj(idCliente, RazaoSocial, NomeFantasia, CNPJ)
		Values(5,'Cliente Empresa5','Cliente Empresa5',51111111000111),
			  (6,'Cliente Empresa6','Cliente Empresa6',61111111000111),
              (7,'Cliente Empresa7','Cliente Empresa7',71111111000111),
              ('8','Cliente Empresa8','Cliente Empresa8',81111111000111);
-- select * from pj;              

-- CLiente PF
insert into pf(idCliente, Pnome, Mnome_letra, Unome, CPF)
		values(1,'João','G','Alcantara',11111111119),
			  (2,'Maria','S','Salles',21111111119),
              (3,'José','M','Salazar',31111111119),
              (4,'Antonia','F','Gonçalves',41111111119);
-- select * from pf;              

-- Estoque
insert into estoque(Quantidade)
			  values(10);
-- select * from estoque;	

-- Fornecedores 	
insert into fornecedor(fRazaoSocial, fNomeFantasia, fCNPJ, fCEP, fRua, fComplemento, fBairro, fCidade, fEstado, fEmail, fTelContato)
				values('Fornecedor Eletrônico','Fornecedor Eletrônico',9111111000111,71000000,'Rua E','Lote E','Bairro E','Cidade E','MG','cliente@E.com.br',61992345678),
					  ('Fornecedor Decoração','Fornecedor Decoração',1011111000111,71000000,'Rua F','Lote F','Bairro F','Cidade F','MG','cliente@F.com.br',61910345678),
                      ('Fornecedor Vestuário','Fornecedor Vestuário',1111111000111,71000000,'Rua G','Lote G','Bairro G','Cidade G','MG','cliente@G.com.br',61911345678),
                      ('Fornecedor Brinquedos','Fornecedor Brinquedos',1211111000111,71000000,'Rua H','Lote H','Bairro H','Cidade H','MG','cliente@H.com.br',61912345678),
                      ('Fornecedor Papelaria','Fornecedor Papelaria',1311111000111,71000000,'Rua I','Lote I','Bairro I','Cidade I','MG','cliente@I.com.br',61913345678);
-- select * from fornecedor;                      


-- vendedor-terceiro
insert into terceiroVendedor(tRazaoSocial, tNomeFantasia, tCNPJ, tCEP, tRua, tComplemento, tBairro, tCidade, tEstado, tEmail, tTelContato)
			          values('Fornecedor Terceiro Eletrônico','Fornecedor Terceiro Eletrônico',2011111000111,71000000,'Rua A1','Lote A1','Bairro A1','Cidade A1','RS','cliente@A1.com.br',61930345678),
							('Fornecedor Terceiro Decoração','Fornecedor Terceiro Decoração',2111111000111,71000000,'Rua A2','Lote A2','Bairro A2','Cidade A2','RS','cliente@A2.com.br',61931345678),
							('Fornecedor Terceiro Vestuário','Fornecedor Terceiro Vestuário',2211111000111,71000000,'Rua A3','Lote A3','Bairro A3','Cidade A3','RS','cliente@A3.com.br',61932345678),
							('Fornecedor Terceiro Brinquedos','Fornecedor Terceiro Brinquedos',2311111000111,71000000,'Rua A4','Lote A4','Bairro A4','Cidade A4','RS','cliente@A4.com.br',61933345678),
							('Fornecedor Terceiro Papelaria','Fornecedor Terceiro Papelaria',2411111000111,71000000,'Rua A5','Lote A5','Bairro A5','Cidade A5','RS','cliente@A5.com.br',61934345678);
-- select * from terceiroVendedor;
                            
-- Produto
insert into produto(Categoria, Classificação_infantil, Especificações, Valor, Avaliação)
			 Values('Eletronico',0, 'Fone de ouvido bluethoot Xiaomi',150,4),
				   ('Eletronico',0, 'Notebook Positivo i5 10ªG 6GB Ram HD 1Tera',3999.99,3),
                   ('Eletronico',0, 'Smart TV Samsung 50"',2550.50,5),
                   ('Decoração',0, 'Quadro Violino Stradivarius',1000,4),
                   ('Vestuário',0, 'Camiseta básica branca M',50,3),
                   ('Brinquedos',1, 'Lego Guarda Costeira',500,3),
                   ('Papelaria',0, 'Caneta Crow azul ponta média',120,3);
-- select * from produto;                   

-- pagamento
insert into pagamento values(4,1),
							(5,1);
-- select * from pagamento;

-- pagamento tipo boleto
insert into boleto(Bnúmero)
			Values(0000000001);
-- select * from boleto;    

-- pagamento tipo cartão de crédito
insert into cartaoCredito(CCnúmero, Nometitular, VencimentoCartao, CodigoVerificador)
				   Values(1111222233334444,'JOSE M SALAZAR',20280901, 001);
-- SELECT * FROM cartaoCredito;

-- pagamento tipo pix
insert into pix(Pcnpj)
		 Values(25258147000136);
-- select * from pix;

-- update pedido set idPedido=5 where idPedido=10;
-- Pedido
insert into pedido(idPedCliente, idPedPagamento, PedQuantidade, Situação, Frete, ConfirmaçãoPagamento)
			values(1,1,10,'Confirmado',10.50,0),
				  (2,2,20,'Em processamento',0,1),
                  (2,3,30,'Confirmado',0,0),
                  (3,4,20,'Em processamento',20,1),
                  (3,5,30,'Saiu para entrega',0,1);

-- select * from pedido;

-- entrega
insert into entrega(Esituação, CodigoRastreio, ProdutoDevolvido)
			 Values(0,2022000001,0),
				   (0,2022000002,0),
                   (0,2022000003,0),
                   (0,2022000004,0),
                   (0,2022000005,0);
-- select * from entrega;                   

-- atualiza, altera campo de instância                
-- update fornecedor set idFEstoque=5 where idFornecedor=5;                
                
                