SELECT DISTINCT s1.buyer_id
FROM Sales s1
JOIN Product p1 ON s1.product_id = p1.product_id
WHERE p1.product_name = 'S8'
AND s1.buyer_id NOT IN (
    SELECT DISTINCT s2.buyer_id
    FROM Sales s2
    JOIN Product p2 ON s2.product_id = p2.product_id
    WHERE p2.product_name = 'iPhone'
);


select 
    sal.buyer_id
from Product prd join
Sales sal on sal.product_id = prd.product_id
group by sal.buyer_id
having sum(case when prd.product_name = 'S8' then 1 else 0 end) > 0
and sum(case when prd.product_name = 'iphone' then 1 else 0 end) = 0
