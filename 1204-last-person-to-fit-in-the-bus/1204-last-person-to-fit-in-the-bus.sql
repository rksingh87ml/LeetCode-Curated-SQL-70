with CTE as (
        select 
            person_id,
            person_name,
            weight ,
            sum(weight) over (order by turn asc) as running_totalweight
        from Queue)

select person_name 
from (
select 
* , row_number() over ( order by running_totalweight desc) as rnk
from CTE 
where running_totalweight <=1000) temp
where rnk = 1
