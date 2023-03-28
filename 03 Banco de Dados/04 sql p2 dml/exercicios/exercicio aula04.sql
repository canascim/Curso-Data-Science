-- EXERCÍCIOS AULA04 P2

--Q1 Selecione os id's únicos de territórios da tabela employee_territories e ordene em ordem decrescente.

select distinct employee_id from employee_territories;

--Q2 Selecione da tabela empolyees (não esqueça de nomear as colunas criadas):

-- O nome completo dos empregados em ordem alfabética; 
--sELECT first_name ,last_name   FROM employees
SELECT first_name || ' ' || last_name   nomes FROM employees
order by first_name ;

-- O nome completo dos empregados com o respectivo titulo em ordem decrescente;
select * from employees;
SELECT first_name || ' ' || last_name as Nome, title   Título FROM employees
order by first_name ;

-- Os sobrenomes distintos dos empregrados;
select distinct last_name as sobrenome_distintos from employees ;

-- O ano de nascimento dos empregados usando funções de tempo;
SELECT first_name || ' ' || last_name as Nome, date_part('year', birth_date) ano_nascimento FROM employees
order by first_name ;


-- O ano de nascimento dos empregados usando funções de string;
SELECT first_name || ' ' || last_name as Nome, left(birth_date::char(10),4) ano_nascimento FROM employees
order by first_name ;

-- A idade atual dos empregados em ordem decrescente;

SELECT first_name || ' ' || last_name as Nome, birth_date, AGE(birth_date) as idade FROM employees
order by idade desc ;

-- A idade que os empregados tinham quando foram contratados em ordem crescente;
SELECT birth_date, hire_date, ((hire_date - birth_date) / 365.25)::integer as idade_na_contratacao FROM employees
order by idade_na_contratacao asc;

-- Quem é e qual a idade do empregado mais velho?
SELECT first_name || ' ' || last_name as Nome, birth_date, AGE(birth_date) as idade FROM employees
order by idade desc 
limit 1 ;

-- Qual a pessoa mais jovem que foi contratada?
-- essa solução entende que a pergunta quer saber qual é a pessoa mais jovem na data da contratação
-- que já foi contratada pela empresa.
SELECT birth_date, hire_date, ((hire_date - birth_date) / 365.25)::integer as idade_na_contratacao FROM employees
order by idade_na_contratacao asc
limit 1;

-- essa solução entende que a pergunta quer saber qual é a pessoa mais jovem atualmente.
SELECT birth_date, hire_date, ((current_date - birth_date) / 365.25)::integer as idade_atual FROM employees
order by idade_atual asc
limit 1;

-- Crie uma coluna que mapeie os cargos dos empregados com a posição hierárquica na lista, sendo 1 o mais alto.


-- O tempo de empresa dos respectivos empegados;
SELECT first_name || ' ' || last_name as Nome, ((current_date - hire_date) / 365.25)::integer as tempo_de_empresa FROM employees


-- Q3 Selecione da tabela products:
select * from products;

-- Os três produtos mais caros com seus respectivos preços;
select product_name, unit_price from products
order by unit_price desc
limit 3;

-- Os 10 produtos com estoque mais baixo (diferentes de 0) com suas respectivas quantidades;
select product_name, units_in_stock from products
where units_in_stock != 0
order by units_in_stock asc
limit 10;

-- Os 5 produtos com maior valor agregado atualmente em estoque;
select product_name, (units_in_stock * unit_price) as valor_agregado from products
order by valor_agregado desc
limit 5;




-- Produtos com mais de 100 unidades no estoque ou valor unitário inferior 15;
-- professor, esse enunciado está confuso.
-- Por isso, eu fiz 3 selects para ter a maior cobertura posssível na solução.

-- produtos em estoque com mais de 100 unidades
select product_name, units_in_stock from products
where units_in_stock >100;

-- produtos em estoque com valor unitário inferior 15
select product_name, unit_price from products
where unit_price < 15;

-- Produtos com mais de 100 unidades no estoque ou valor unitário inferior 15;
select product_name, units_in_stock from products
where units_in_stock >100 or unit_price < 15


-- Q4 Selecione da tabels orders:
select * from orders;

-- O primeiro nome do destinatário da entrega (ship_name);
									  

-- O tempo (em dias) entre a compra e a entrega;
select order_date, shipped_date,  (shipped_date - order_date)::integer as tempo_entrega
from orders;

-- Os cinco fretes mais caros e com maior tempo de entrega (sem dados nulos);
-- Professor, Dividi o select em dois pois não tem sentido um select com o do enunciado.
-- Os 5 fretes mais caros
select order_id, freight from orders
order by freight desc
limit 5;

-- Os 5 fretes com maiores tempo de entrega
select order_date, shipped_date,  (shipped_date - order_date)::integer as tempo_entrega
from orders
where shipped_date IS NOT NULL
order by tempo_entrega desc
limit 5;


-- Os cinco fretes com maior tempo de entrega e mais caros (sem dados nulos); (sim, é diferente do anterior)


-- Os 3 fretes mais baratos do Brasil.
select order_id, freight , ship_country from orders
where ship_country = 'Brazil'
order by freight asc
limit 3;

-- Uma tabela com as três primeiras letras do nome do pais, o tempo de entrega e o frete ordenados em ordem crescente.
select substring(ship_country, 1,3) , (shipped_date - order_date)::integer as tempo_entrega, freight from orders
order by freight asc;






































