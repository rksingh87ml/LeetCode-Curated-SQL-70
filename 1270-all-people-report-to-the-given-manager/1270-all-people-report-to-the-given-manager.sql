select 
E.employee_id
from Employees E 
join Employees M on M.employee_id = E.manager_id
join Employees B on B.employee_id = M.manager_id
where B.manager_id=1 and E.employee_id !=1

