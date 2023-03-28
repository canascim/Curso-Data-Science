select * from alunos;


create table alunos_bkp as
select * from alunos;


/*
Não executar pois na aula criou inconsistências.
drop table alunos cascade; - deleta as  referencias

*/

select * from alunos;

--Usado para inserir um registro numa tabela existente.

---Insira os dados de uma agência na tabela.


INSERT INTO turma_aluno(id_turma_aluno, id_turma, id_aluno)
VALUES (10, 4, 1);

select * from  turmas;
select * from turma_aluno;