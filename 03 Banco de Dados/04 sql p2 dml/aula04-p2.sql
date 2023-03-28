select * from customers;

select * ,
case when contact_title = 'Owner' then 'priority1'
end as prioridade
from customers;


SELECT contact_title, 
CASE 
WHEN contact_title = 'Owner' THEN 'Priority 1' 
WHEN contact_title = 'Sales Manager' then 'Priority 2'
WHEN contact_title = 'Marketing Manager' then 'Priority 3'
ELSE 'Priority 4'
END as prioridade
FROM customers;


SELECT contact_title, 
CASE 
WHEN contact_title LIKE '%Owner%' THEN 'Priority 1' 
WHEN contact_title Like '%Manager%' then 'Priority 2'


SELECT 'GaBriel', LOWER('GaBriel'), UPPER('GaBriel');


SELECT first_name, LOWER(first_name), UPPER(first_name) from employees;
WHEN contact_title like '%Sales%' then 'Priority 3'
ELSE 'Priority 4'
END as prioridade
FROM customers;

SELECT CURRENT_DATE;


select current_time;


select now();

select * from employees;


SELECT first_name, birth_date, date_part('day', birth_date) FROM employees;

SELECT first_name, birth_date, EXTRACT(day from birth_date) FROM employees;

SELECT first_name, birth_date, DATE_TRUNC('day', birth_date) FROM employees;


SELECT birth_date, AGE(birth_date) FROM employees;

SELECT concat('Leopoldo', ' Vasconcelos');
sELECT 'Rubisneide' || ' Antonieta';


SELECT first_name || ' ' || last_name FROM employees;

select first_name, last_name from employees;

     SELECT 
     '           teste              ' original, 
     TRIM('           teste              ') trim_total,
     RTRIM('           teste              ') as trim_direita,
     LTRIM('           teste              ') trim_esquerda;
     
     -- trim não remove espaço entre palavras
     Select trim('   abc   def   ')


SELECT SUBSTRING('E ai turma 767!', 3,4);

SELECT Position('lhe' in 'Guilherme');

SELECT replace('André Picolé', 'ré', 'e...');


SELECT replace('André Picolé', 'é', 'e...');

SELECT title, replace(title, 'Sales', 'Vendas') FROM employees;


select * from employees;