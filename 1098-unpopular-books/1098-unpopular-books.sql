# Write your MySQL query statement below
select temp1.book_id, temp1.name
from
(select * 
from Books 
where available_from < date_sub('2019-06-23', INTERVAL 1 month)) temp1
left join 
(
select *
from Orders 
where dispatch_date >= date_sub('2019-06-23', INTERVAL 1 YEAR)) temp2
on temp2.book_id = temp1.book_id 
group by temp1.book_id, temp1.name
having coalesce(sum(quantity),0) < 10 
