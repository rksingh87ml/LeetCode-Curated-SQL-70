# Write your MySQL query statement below
SELECT ROUND((100.0 * COUNT(CASE WHEN order_date = customer_pref_delivery_date THEN 1 END)) / COUNT(*), 2) AS immediate_percentage
FROM Delivery;



select 
    round(coalesce(count(delivery_id)*100 / temp.total_delievery,0),2) as immediate_percentage
from Delivery join 
      (select count(delivery_id) as total_delievery  from Delivery) as temp
where order_date = customer_pref_delivery_date

