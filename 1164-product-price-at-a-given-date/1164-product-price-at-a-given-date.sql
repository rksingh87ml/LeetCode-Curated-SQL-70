# Write your MySQL query statement below
SELECT product_id, new_price AS price
FROM Products
WHERE (product_id, change_date) IN (
    SELECT product_id, MAX(change_date)
    FROM Products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
)

UNION

SELECT DISTINCT product_id, 10
FROM Products
GROUP BY product_id
HAVING MIN(change_date) > '2019-08-16';



with Products_CTE as (
            select 
            product_id,
            new_price,
            dense_rank() over ( partition by product_id order by change_date desc) as latest_price 
            from Products
            where change_date <= '2019-08-16')

select 
distinct PC1.product_id , coalesce(PC2.new_price,10) as price
from Products PC1
left join ( select * from Products_CTE where latest_price = 1) PC2
on PC2.product_id = PC1.product_id

