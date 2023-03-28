create table employees3
as
select last_name, first_name
from employees;




-- adicionar coluna com valor default 20
alter table employees3
add column idade int default 20;


--deletendo tabela
--DROP TABLE agencias;
-- DROP TABLE IF EXISTS agencias;  -- DROP TABLE [IF EXISTS] table_name; --> Entre colchetes: opcional!

drop table employees3;


