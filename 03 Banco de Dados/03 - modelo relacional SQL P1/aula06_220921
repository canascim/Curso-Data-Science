select * from alunos;

select * from turma_aluno;

select id_aluno from turma_aluno
union
select id_aluno from alunos;

select id_aluno from turma_aluno
union all
select id_aluno from alunos;

--qtos alunos estão em mais do que uma turma?
select * from turma_aluno;

--quantas turmas por aluno?
select id_aluno, count(*) as qtde_turmas
from turma_aluno
group by id_aluno
order by qtde_turmas desc;

select id_aluno
from turma_aluno
group by id_aluno


select id_aluno, count(*) as qtde_turmas
from turma_aluno
group by id_aluno
having count(*) > 1 --mostra alunos que estão em mais de ua turma
order by qtde_turmas desc;



select id_aluno, count(*) as qtde_turmas
from turma_aluno
group by id_aluno
having count(*) > 2 --mostra alunos que estão em mais de duas turmas
order by qtde_turmas desc;

select id_aluno, count(*) as qtde_turmas
from turma_aluno
group by id_aluno
having count(*) > 2
order by qtde_turmas desc;

select id_aluno
from turma_aluno
where id_turma !=2;


select id_aluno, count(*) as qtde_turmas
from turma_aluno
where id_turma !=2
group by id_aluno
-------having count(*) > 1
order by qtde_turmas desc;


select id_aluno, count(*) as qtde_turmas
from turma_aluno
where id_turma !=2
group by id_aluno
having count(*) > 1  --agora com o having count



select id_aluno, count(*) as qtde_turmas
from turma_aluno
group by id_aluno
having count(*) > 1 --mostra alunos que estão em mais de ua turma
order by qtde_turmas desc;

-- a saída do comando acima mostra 3 alunos  em mais de uma turma.
--agora queremos retornar apenas a contagem, não queremos mais 
-- ver os alunos
select count(*)     -- para isso usamo um select de outro select(SELECT ANINHADO)
from ( select id_aluno, count(*) as qtde_turmas
       from turma_aluno
       group by id_aluno
       having count(*) > 1  )
as temp_table;     -- Essa linha é necessária senão dá erro


select id_aluno, count(*) as qtde_turmas
from turma_aluno
group by id_aluno
having count(*) > 1  
order by qtde_turmas desc;

select 1, id_aluno, count(*) as qtde_turmas  -- select 1 cria uma coluna com apenas 1.
from turma_aluno
group by id_aluno
having count(*) > 1  


-- abaixo vamos utilizar o select sum(b) para somar os 1s do select anterior
-- Desta maneira conseguimos ter o mesmo resultado que tivemos quando usamos o count
-- só que agora utilizando o sum
-- instrução do professor é usar o count

select sum(b)
from (select 1 as b, id_aluno, count(*) as qtde_turmas
	from turma_aluno
	group by id_aluno
	having count(*) >1) as temp_table;
	

-- segundo professor a consulta abaixa não tem nenhum sentido

SELECT id_aluno, count(*)
from turma_aluno
group by id_aluno  -- agrupo pelo do aluno, ou seja, vemos em quantos turmas o aluno está
having 2*count(*) in (SELECT id_turma from turmas );

----SELECT id_turma from turmas	-- retorna os ids das turmas
--- o SELECT id_turma from turmas retorna  os ids das turmas: 1,2,3,4
--- o select do código que antecede (SELECT id_turma from turmas ) faz o seguinte:
--- pega o retorno da primeira parte que é 2,3,2 e aplica o 2* count(*) que 
--- vira 4,6,4
--- having 2*count(*) in (SELECT id_turma from turmas ) faz com que 4,6,4 seja
-- confrontado com a lista dos ids das turmas(1,2,3,4) para ver o que está nesta lista.
-- o resultado deste confronto é numero 4
-- então resultato é que os alunos (id_aluno) 1 e quatro tem count 2, que 
-- ao ser multiplicado por 2(having count(*)) retorna quatro. 
-- logo esses são os alunos que aparecerão no retorno do código

--abaixo o mesmo código só que adicionando uma colunoa para o resultado do 2*count
SELECT id_aluno, count(*), count(*) *2
from turma_aluno
group by id_aluno  -- agrupo pelo do aluno, ou seja, vemos em quantos turmas o aluno está
having 2*count(*) in (SELECT id_turma from turmas );


select count(*)     -- para isso usamos um select de outro select(SELECT ANINHADO)
from ( select id_aluno, count(*) as qtde_turmas
       from turma_aluno
       group by id_aluno
       having count(*) > 1  )
as temp_table;     -- Essa linha é necessária senão dá erro

with temp_table as (
	select 1 as b, id_aluno, count(*) as qtde_turmas
	from turma_aluno
	group by id_aluno
	having count(*) >1
) select count(*) from temp_table


with temp_table as (
	select id_aluno, count(*) as qtde_turmas
	from turma_aluno
	group by id_aluno
	having count(*) >1
) select count(*) from temp_table

select * from alunos;

select * from turmas;

-- cross join
SELECT * FROM alunos CROSS JOIN turmas;
SELECT * FROM turmas CROSS JOIN alunos;
-- os 3 comandos abaixo retornam o mesmo resultado.
SELECT count(*)  FROM alunos CROSS JOIN turmas;
select count(*) from alunos, turmas;
select count(*) from turmas cross join alunos;


SELECT * 
FROM turma_aluno
INNER JOIN alunos ON alunos.id_aluno = turma_aluno.id_aluno;


select id_aluno, nome
from alunos
where id_aluno = 1;


select * from turma_aluno;
select * from alunos;

select *
from turma_aluno as ta inner join alunos as al on ta.id_aluno = al.id_aluno;

-- comando que retorna em quantas turmas cada aluno está buscando pelo id
select al.id_aluno, count(ta.id_turma)
from turma_aluno as ta inner join alunos as al on ta.id_aluno = al.id_aluno
group by al.id_aluno;

-- mesma coisa que o de cima mas buscando pelo nome
select al.nome, count(ta.id_turma)
from turma_aluno as ta inner join alunos as al on ta.id_aluno = al.id_aluno
group by al.id_aluno;

select al.nome, count(ta.id_turma) as n_turmas
from turma_aluno as ta inner join alunos as al on ta.id_aluno = al.id_aluno
group by al.id_aluno;

select al.nome, count(ta.id_turma) as n_turmas
from turma_aluno as ta , alunos as al  
where ta.id_aluno = ta.id_aluno
group by al.id_aluno;




SELECT * 
FROM alunos
LEFT JOIN turma_aluno on alunos.id_aluno = turma_aluno.id_aluno;

SELECT * 
FROM alunos
right JOIN turma_aluno on alunos.id_aluno = turma_aluno.id_aluno;


SELECT * 
FROM turma_aluno
FULL JOIN turmas on turmas.id_turma = turma_aluno.id_turma;

--- o comando abaixo dá igual ao de cima
SELECT * 
FROM turma_aluno
FULL JOIN turmas on turma_aluno.id_turma =turmas.id_turma;

SELECT * 
FROM turmas
FULL JOIN turma_aluno on turmas.id_turma = turma_aluno.id_turma;




