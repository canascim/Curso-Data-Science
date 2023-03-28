-- exercicio dmlp3
-- questao 3, item 3. Produto mais vendido

select * from order_details;

select product_id, sum(quantity) 
from order_details
group by product_id;
	
	 
select product_id, sum(quantity) as total 
from order_details
group by product_id
order by total desc;
	 
	 
select product_id, sum(quantity) as total 
from order_details
group by product_id
order by total desc
limit 1;

select product_id, quantity
from  order_details
where product_id = 74;

select max(quantity)
from order_details;

/*
comando abaixo dá erro, ver comentário
with somatoria as(
	select product_id, sum(quantity) as total
	from order_details
	group by product_id
	order by total desc
) 
select somatoria.product_id, MAX(somatoria.total);

comentário
ERROR:  missing FROM-clause entry for table "somatoria"
LINE 7: select somatoria.product_id, MAX(somatoria. total);
               ^
SQL state: 42P01
Character: 135
*/

-- o comando abaixo dá erro, ver comentário
/*
with somatoria as(
	select product_id, sum(quantity) as total
	from order_details
	group by product_id
	order by total desc
) 
select somatoria.product_id, MAX(somatoria.total)
group by somatoria.product_id;

comentário de erro
ERROR:  syntax error at or near "group"
LINE 9: group by somatoria.product_id;
        ^
SQL state: 42601
Character: 224

*/

--agora sem erro
with somatoria as(
	select product_id, sum(quantity) as total
	from order_details
	group by product_id
	order by total desc
) 
select somatoria.product_id, MAX(somatoria.total)
from somatoria
group by somatoria.product_id;

-- o comando abaixo dá erro
/*
select product_id, sum(quantity) as total
from order_details
group by product_id
having sum(quantity) = max(sum(quantity))
order by total desc;

ERROR:  aggregate function calls cannot be nested
LINE 4: having sum(quantity) = max(sum(quantity))
                                   ^
SQL state: 42803
Character: 109
*/


/* o comando abaixo dá erro

select max(sum(quantity)) as total
from order_details
group by product_id;


ERROR:  aggregate function calls cannot be nested
LINE 1: select max(sum(quantity)) as total
                   ^
SQL state: 42803
Character: 12


with somatoria as(
	select product_id, sum(quantity) as total
	from order_details
	group by product_id
	order by total desc
)
select max(somatoria.total)
from somatoria;


with somatoria as(
	select product_id, sum(quantity) as total
	from order_details
	group by product_id
	order by total desc
)
select somatoria.product_id, max(somatoria.total)
from somatoria
group by somatoria.product_id;
--to


	 
	 
