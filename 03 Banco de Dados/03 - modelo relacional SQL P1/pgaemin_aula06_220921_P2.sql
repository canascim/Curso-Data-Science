--Na base de dados northwind, faça um relatório que retorne o nome do funcionário e o nome do gerente 
--no formato colaborador | gestor.

select * 
from employees;

select * 
from employees as emp inner join employees as sup on  emp.reports_to = sup.employee_id;

-- mostra direto a relação empregado-> gestor
select emp.first_name as colaborador, sup.first_name as gestor
from employees as emp inner join employees as sup on  emp.reports_to = sup.employee_id;

Query:

SELECT em1.first_name as colaborador, em1.reports_to, em2.employee_id, em2.first_name 
FROM employees em1 LEFT JOIN employees em2 on em2.employee_id = em1.reports_to;

SELECT em1.first_name as colaborador, em2.first_name gestor
FROM employees em1 LEFT JOIN employees em2 on em2.employee_id = em1.reports_to;