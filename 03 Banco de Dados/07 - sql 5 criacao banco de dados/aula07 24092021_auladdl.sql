/*
Vamos criar juntos uma base de dados para o banco com duas tabelas agencias e clientes. Essas tabelas devem estar relacionadas.

Considere que um cliente pode ter conta em várias agências e uma agência deve ter muitos clientes.

A tabela agências deve conter código, nome, endereço e telefone da agência.
A tabela clientes deve conter um código do cliente, nome, data de nascimento, agência e conta.
*/

CREATE TABLE agencias(
    agencia_id SERIAL PRIMARY KEY,  -- o serial estabelece que um contador que o próprio banco vai controlar.
    nome varchar(255) NOT NULL, -- null =  restricao de campo não nulo
    endreco varchar(255), 
    telefne varchar(10)    
);

select * from agencias;

-- cliente(M) -> possui contas -> (N) agencias

CREATE TABLE clientes(
    codigo_id SERIAL PRIMARY KEY,
	conta INT NOT NULL,
    nome VARCHAR(255), 
    data_nasc DATE, 
    agencia_id INT REFERENCES agencias(agencia_id) --chave estrangeira
);  


-- os comandos abaixo devem ser executados no banco nortwind
--create table employees3
--as
---select last_name, first_name
---from employees;

--Exemplo: Altere o nome da tabela cliebtes para clientes.
ALTER TABLE clientes RENAME TO  cliebtes;

ALTER TABLE cliebtes RENAME TO clientes;

--Altere o nome da tabela clientes para cliente.
ALTER TABLE clientes RENAME TO  cliente;

-- Altere o tipo da coluna nome na table clientes para TEXT.
ALTER TABLE cliente
ALTER COLUMN nome TYPE TEXT;



--Arrume o nome da coluna endereço na tabela agencias.
ALTER TABLE agencias
RENAME COLUMN endreco to endereco;



--Adicione a coluna bom pagador à tabela cliente.
ALTER TABLE cliente
ADD COLUMN pagador BOOLEAN;

select * from cliente;

ALTER TABLE cliente
ADD COLUMN pagador2 boolean default true;


select * from cliente;


/*
rodar na northwind
alter table employees4
add column idade int default 20;
*/

--Usado para apagar bancos de dados, tabelas e outros objetos.
--- Delete a tabela customers.





