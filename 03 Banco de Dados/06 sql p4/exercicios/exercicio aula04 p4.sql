-- Exercicios aula04 p4

--Q1 Faça um relatório que traga o número de cidades por estado (nome por extenso) e ordene:
select * from tb_cidades
select * from tb_estados

--Ordem alfabética por nome do estado;
select tb_estados.nome, tb_cidades.nome , count(tb_cidades.nome) from tb_cidades
left join tb_estados on tb_cidades.uf = tb_estados.uf
group by tb_cidades.nome


--Do maior para o menor número de municípios.
select uf, count(nome) qtde_cidades from tb_cidades
group by uf
order by count(nome) asc;


--Q2 Faça um relatório que gere uma lista com todas as cidades (nome por extenso) com nomes repetidos.

select nome, count(nome) qtde_cidades from tb_cidades
group by nome
having count(nome) >1 ;



select emp.first_name  as colaborador, sup.first_name as gestor
from  employees as emp  inner join employees as sup on emp.reports_to = sup.employee_id


select tb_estados.nome, tb_cidades.nome  from tb_cidades
left join tb_estados on tb_cidades.uf = tb_estados.uf