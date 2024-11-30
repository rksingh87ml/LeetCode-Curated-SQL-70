# Write your MySQL query statement below
select 
      customer_number
from (
            select 
                customer_number ,
                count(order_number) as total_order,
                dense_rank() over ( order by count(order_number) desc) as rnk
            from Orders 
            group by customer_number) temp
where rnk = 1
