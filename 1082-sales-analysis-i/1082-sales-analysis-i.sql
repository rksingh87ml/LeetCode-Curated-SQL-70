SELECT 
     seller_id
FROM 
    (SELECT 
        seller_id,
        DENSE_RANK() OVER (order by sum(price) desc ) as price_rank
    FROM Sales
    GROUP BY seller_id) TEMP
WHERE price_rank = 1

