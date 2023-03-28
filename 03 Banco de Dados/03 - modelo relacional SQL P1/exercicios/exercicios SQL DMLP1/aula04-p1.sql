/*
Q1 Selecione os id's únicos de territórios da tabela employee_territories.
*/
select  DISTINCT territory_id from employee_territories;

/*
Q2 Selecione da tabela employees:
*/

--Todos os nomes dos empregados;
select  first_name, last_name from employees;

-- Os sobrenomes distintos dos empregados;
select   DISTINCT last_name from employees;

-- Empregados que nasceram após 1970;

select first_name, last_name, birth_date from employees
where birth_date > '31/12/1970';


-- Empregados que foram contratados em 1993;

select first_name, last_name , hire_date from employees
where hire_date >= '01/01/1993' and hire_date <= '31/12/1993';


-- Empregados que nasceram entre 1980 e 1985 (inclusos);
select first_name, last_name from employees
where birth_date >= '01/01/1980' and birth_date <= '31/12/1985';

-- Empregados que nasceram em 1963 e foram contratados em 1993;
select first_name, last_name, birth_date, hire_date from employees
where birth_date >= '01/01/1963' and birth_date <= '31/12/1963' and hire_date >='01/01/1993' and hire_date <='31/12/1993';

-- Todos os empregrados que reportam o chefe de id 5;
select first_name, last_name, reports_to from employees
where reports_to = 5;

-- Todos os empregados que moram em Seattle ou Kirkland.
select first_name, last_name, city from employees
Where city = 'Seattle'or city = 'Kirkland';


/*
Q3 Selecione da tabela order_details:
*/
select * from order_details;

-- Produtos (product_id) com mais de 50 unidades vendidas;

select product_id, quantity from order_details
where quantity >= 50;


-- Produtos com mais de 0.2 de desconto;
select product_id, discount from order_details
where discount :: numeric(2,2) > 0.2;
-- where discount :: numeric(10,1) > 0.2;



-- Produtos com 0.05 ou menos de desconto;
select product_id, discount from order_details
where discount :: numeric(2,2) <= 0.05;


/* 
Q4¶Selecione da tabels orders:
*/
select * from orders;

-- Ordens realizadas antes Setembro de 1996.
select order_id, order_date from orders
where order_date < '01/09/1996';

-- Ordens enviadas em Setembro de 1996.
select order_id, order_date from orders
where order_date > '31/08/1996' and  order_date < '01/10/1996' ;


-- Ordens que possuam o campo região preenchido.
select order_id, ship_region from orders
where ship_region is not null;

-- As primeiras 5 linhas da tabela, reescrevendo o nome das colunas de data em português.
select *, order_date as data_da_ordem, required_date as data_requirida, shipped_date as data_de_envio from orders
limit 5;


/*
Q5 Selecione da tabela suppliers:
*/
select * from suppliers;

-- Todos os contatos cujo nome comece com a letra M;
select contact_name from suppliers
where contact_name like '%m%';

-- Todos os contatos que tenham a palavra manager no titulo;
select contact_name, contact_title from suppliers
where contact_title like '%Manager%';

-- os contatos que trabalhem com vendas e morem nos países nórdicos.
select contact_name, contact_title, country from suppliers
where contact_title = 'Sales Manager' and  country IN ('Sweden', 'Denmark', 'Finland', 'Norway');





