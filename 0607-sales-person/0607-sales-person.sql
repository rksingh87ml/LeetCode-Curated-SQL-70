# Write your MySQL query statement below
with ord_cte as (
        select 
            ord.order_id , ord.com_id , ord.sales_id , comp.name 
        from Orders ord  join 
        Company comp on comp.com_id = ord.com_id 
        and comp.name = 'RED')
select 
    SP.name
from SalesPerson SP
left join ord_cte ord1
on ord1.sales_id = SP.sales_id 
where ord1.name is null
