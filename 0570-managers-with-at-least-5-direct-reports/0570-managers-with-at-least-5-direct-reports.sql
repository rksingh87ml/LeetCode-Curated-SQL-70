# Write your MySQL query statement below
# manager with at least five direct reports 

select 
emp.name 
from Employee emp join 
(
select 
managerId from Employee
group by managerId
having count(id) >= 5 ) mgr
on mgr. managerId = emp.id 
 

