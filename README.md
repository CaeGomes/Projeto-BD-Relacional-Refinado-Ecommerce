#Projeto Conceitual de BD Relacional (EM ELABORAÇÃO)

Este modelo de Banco de Dados (BD) foi elaborado considerando o contexto de um **e-commerce**.

Para a construção do modelo e entendimento do contexto, foi considerado o cenário de realização do primeiro contato com o cliente, onde é feito o **levantamento de informações** que contribui para a elaboração do primeiro **draft**.

Após o contato com o cliente, o contexto a ser considerado é de uma aplicação que utilizará informações de um BD para a venda de produtos de um e-commerce.

Neste primeiro momento, percebemos a relevância das seguintes entidades: 

- cliente;
- pedido;
- produto;
- estoque;
- fornecedor

O cliente faz um pedido; dentro do pedido temos um produto que pode ou não estar em estoque; esse produto está associado a um fornecedor.

No levantamento de requisitos, obtemos as seguintes **narrativas**:

**Cliente**:

- o cliente pode se cadastrar no site com seu CPF ou CNPJ;
- o endereço do cliente irá determinar o valor do frete;
- um cliente pode realizar mais de um pedido. Existe um prazo de carência para a devolução do produto.

**Pedido**:

- são criados, realizados pelos clientes e possuem informações sobre a compra, endereço e status de entrega;
- um ou mais produtos compõem o pedido;
- o pedido pode ser cancelado.

**Produto**:

- os produtos são vendidos em uma única plataforma on-line e podem ser vendidos por terceiros;
- cada produto possui um fornecedor;
- um ou mais produtos podem compor um pedido.

Em reuniões com o cliente, são apresentados os draft's, onde o cliente realiza considerações, o modelo passa por aprimoramentos até sua conclusão. As entidades irão receber atributos, serão estabelecidos relacionamentos entre elas e outras tratativas. Em meio a esses aprimoramentos, partimos de algo simples, para algo mais elaborado, ou seja, um modelo de BD que irá atender ao contexto.

Chegamos ao mapeamento de Entidade de Relacionamento **(ER)**, e dele, partimos para o **Modelo Relacional**.

A ferramenta utilizada é o MySQL Workbench.

Após a conclusão, o arquivo é gerado em formato **png**.



###Resumo:###

O **cliente** realiza os cadastro como Pessoa Física ou Pessoa Jurídica.

Em **pedido**, são disponibilizados ao cliente os produtos disponíveis em **estoque** e oferecidos por **vendedores terceiros**, para que possa escolhê-los.

Os **fornecedores** abastecem o estoque do **e-commerce**, enquanto os vendedores terceiros realizam a venda direta e entrega, seguindo as diretrizes do e-commerce.

Após a finalização do pedido, o cliente recebe o valor total da compra, incluindo o frete, que varia de acordo com o endereço informado.

O **pagamento** pode ser realizado com cartão de crédito, boleto ou pix.

Após a confirmação do pagamento, o pedido é separado e a **entrega** é realizada. O produto pode ser devolvido em até 7 dias.



**Banco de Dados SQL**:

Com base no Modelo Relacional, implementamos o banco de dados no SGBD MySQL.

Foram elaboradas algumas consultas para análise.
