-- Exercícios aula04-p3
--Q1 Da tabela territories:
select * from territories;

--Quantos territórios temos ao todo?
select count(distinct territory_id) from territories;

--Quantos territórios por região?
select region_id, count(distinct territory_id) qtde_territorios from territories
group by region_ID;

--Q2 Selecione da tabela empolyees:
select * from employees;

-- Quantos empregados reportam para cada chefe?
SELECT reports_to,   count(employee_id) qtde_empregados FROM employees
group by reports_to;

-- Quantos empregados em cada cidade?
SELECT city,   count(employee_id) qtde_empregados FROM employees
group by city;



-- Q3 Selecione da tabela order_details:
select * from order_details;

-- Quantas unidades forem vendidas por ordem?
select order_id, count(unit_price) as qtde_unidades from order_details
group by order_id;


-- Qual o valor total de cada ordem?
select order_id, (unit_price * quantity) as total from order_details;

-- Qual o produto mais vendido?
select product_id, sum(quantity) as total from order_details
group by product_id
order by total desc
limit 1;

-- Selecione ordens que tenham menos de três produtos.
select order_id, count(product_id) as qtde_produtos from order_details
group by order_id;

select order_id, count(product_id) as total from order_details
group by order_id
having count(product_id) < 3


-- Q4 Selecione da tabels orders:
select * from orders;

--1. Qual cliente realizou mais ordens?
select customer_id , count(order_id) qtde_pedidos from orders
group by customer_id
order by qtde_pedidos desc
limit 1;

--1. Qual cliente realizou menos ordens?
select customer_id , count(order_id) qtde_pedidos from orders
group by customer_id
order by qtde_pedidos asc
limit 1;
--1. Quantas ordems foram feitas por mês?
select date_part('year',order_date) ano_pedido, date_part('month',order_date) mes_pedido , count(order_id) qtde_pedidos from orders
group by order_date;

--1. Qual o tempo de envio por cliente?
select * from orders;

select customer_id,  (shipped_date - order_date)::integer as tempo_entrega
from orders;

--1. Faça uma lista ordenada dos países que receberam mais ordens.

select ship_country, count(order_id) qtde_pedidos from orders
group by ship_country
order by qtde_pedidos;

--1. Qual o tempo máximo de envio por cidade?
select ship_city, max(shipped_date - order_date)::integer as tempo_entrega_maximo
from orders
group by ship_city;

--1. Quanto cada cliente gastou em frete?
select customer_id, sum(freight) as total_frete 
from orders
group by customer_id
order by sum(freight);

--1. Qual o custo total de cada tipo de frete?
-- só existe uma coluna de freta na tabela. Vamos calcular a somatório de todos os fretes.
select sum(freight)  soma_fretes from  orders;

--1. Quanto cada cliente gastou em casa tipo de frete?
-- só tem um tipo de frete na tabela. 


