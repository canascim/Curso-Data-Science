--SELF JOIN
-- NA BASE DE DADOS NORTHWIND,FAÇA UM RELATÓRIO QUE RETORNO O NOME DO FUNCIONÁRIO
-- E O NOME DO GERENTE NO FORMATO COLABORADOR|GESTOR

select *
from employees;

-- buscar informação onde o reports_to = employeeid para descobrir o manager
select *
from  employees as emp  inner join employees as sup on emp.reports_to = sup.employee_id;  -- os alias são necessarios nessa linha

-- mostrando de uma maneira mais organizada pois acima foi exibido tudo.
select emp.first_name  as colaborador, sup.first_name as gestor
from  employees as emp  inner join employees as sup on emp.reports_to = sup.employee_id;  -- os alias são necessarios nessa linha


select *
from  employees as emp  inner join employees as sup on emp.reports_to = sup.employee_id;  -- os alias são necessarios nessa linha

select emp.first_name  as colaborador, sup.first_name as gestor
from  employees as emp  right join employees as sup on emp.reports_to = sup.employee_id;  -- os alias são necessarios nessa linha

select emp.first_name  as colaborador, sup.first_name as gestor
from  employees as emp  left join employees as sup on emp.reports_to = sup.employee_id;  -- os alias são necessarios nessa linha




SELECT em1.first_name as colaborador, em1.reports_to, em2.employee_id, em2.first_name 
FROM employees em1 LEFT JOIN employees em2 on em2.employee_id = em1.reports_to;


