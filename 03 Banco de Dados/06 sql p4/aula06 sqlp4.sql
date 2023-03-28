--Select aninhado.

--quantos aunos estão em mais do que uma turma
select * from turma_aluno;

select * from turma_aluno
order by id_aluno;


-- quantas turmas por aluno?
select id_aluno, count(*) as qtde_turmas
from turma_aluno
group by id_aluno
order by qtde_turmas desc;


select id_aluno, count(*) as qtde_turmas
from turma_aluno
group by id_aluno
having count(*) >1 -- mostra qtos alunos estão em mais do que uma turma
having count(*) >2 -- mostra qtos alunos estão em mais do que duas turmas
order by qtde_turmas desc;


select id_aluno, count(*) as qtde_turmas
from turma_aluno
where id_turma!=2 -- exclui a turma 2
group by id_aluno
order by qtde_turmas desc;

select id_aluno, count(*) as qtde_turmas
from turma_aluno
where id_turma!=2 -- exclui a turma 2
group by id_aluno
having count(*) >1 -- mostra qtos alunos estão em mais do que uma turma
order by qtde_turmas desc;

--Select aninhado.
-- Para retornar apenas a resposta (o numero) de qtde de turmas(count)
--  questão em mais de uma turma ao invés de uma tabela
select count(*)
from (select id_aluno, count(*) as qtde_turmas
	from turma_aluno
	group by id_aluno
	having count(*) >1)
as temp_table; -- esse aliás é obrigatório


-- Para usar o sum() ao invés do count no comando acima(gambiarra)
select 1, id_aluno, count(*) as qtde_turmas
	from turma_aluno
	group by id_aluno
	having count(*) >1)


select sum(b)
from (select 1 as b, id_aluno, count(*) as qtde_turmas
	from turma_aluno
	group by id_aluno
	having count(*) >1)
as temp_table; 


SELECT id_aluno, count(*)
from turma_aluno
group by id_aluno
having 2*count(*) in (SELECT id_turma from turmas );
     



-- Comando WITH

    WITH tabela_temp_with as (
        SELECT id_aluno, count(*)
        from turma_aluno
        group by id_aluno
        having count(*) > 1
    )
    SELECT count(*) from tabela_temp_with;
	
WITH tabela_temp_with as (	
	select 1 as b, id_aluno, count(*) as qtde_turmas
	from turma_aluno
	group by id_aluno
	having count(*) >1
) select count(*) from temp_table;

--SQL JOINS

--CROSS JOIN - é o mais custoso de todos

select * from alunos;
select * from turmas;

select * from alunos cross join turmas;

select * from alunos, turmas; --outra forma de fazer o cross join

select * from  turmas cross join  alunos; -- invertendo as posições no comando inverte a posição na exibição.

--INNER JOIN
-- traz A INTERSECÇÃO(ELEMENTOS IGUAIS)

SELECT * 
FROM turma_aluno as ta
INNER JOIN alunos as al  ON alunos.id_aluno = turma_aluno.id_aluno;


SELECT * 
FROM turma_aluno as ta
INNER JOIN alunos as al  ON turma_aluno.id_aluno = alunos.id_aluno;

-- usando os alias para simplicar(mesma coisa que o feitor anteriormente acima)
SELECT * 
FROM turma_aluno as ta
INNER JOIN alunos as al  ON ta.id_aluno = al.id_aluno;


-- usando group by
SELECT  al.nome, count(ta.id_turma) as n_turmas 
FROM turma_aluno as ta
INNER JOIN alunos as al  ON ta.id_aluno = al.id_aluno
group by al.id_aluno;

--outra forma de fazer o inner join(agora sem o comando inner join)
SELECT  al.nome, count(ta.id_turma) as n_turmas 
FROM turma_aluno as ta, alunos as al
where ta.id_aluno = = al.id_aluno
group by al.id_aluno;


--agora sem o AS para indicação Alias(o AS é opcional)
SELECT  al.nome, count(ta.id_turma) as n_turmas 
FROM turma_aluno  ta, alunos al
where ta.id_aluno = = al.id_aluno
group by al.id_aluno;



-- Left Join
-- left é a primeira tabela que eu coloco no from
-- o que vem depois do comando join é o que fica na direita

select * 
from alunos al left join turma_aluno ta on al.id_aluno = ta.id_aluno;
-- ele traz todas as colunas alunos, incluindo as que dão match com turma_aluno.
-- As colunoas de alunos que não tem correspondência em turma_aluno recebem o valor null.


-- right join
-- retorna todas tuplas da tabela da direita, o que dá match e o que não deu match ele retorna nula.


select * 
from alunos al right join turma_aluno ta on al.id_aluno = ta.id_aluno;


select * 
from turma_aluno al right join alunos ta on al.id_aluno = ta.id_aluno;

-- full outer join
-- retorna todos os dados das duas tabelas

SELECT * 
FROM turma_aluno
FULL JOIN turmas on turmas.id_turma = turma_aluno.id_turma;


-- self join - join da tabela com ela mesma










































