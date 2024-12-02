-- This query calculates the distinct visited dates, total amount for a 7-day rolling window, and average amount per day for each date.

with Customer_CTE as (
        select 
            visited_on, 
            sum(amount) as total_amount
        from Customer 
        group by visited_on
        order by visited_on),
moving_average_CTE as 
(
select 
    visited_on , 
    total_amount,
    sum(total_amount) over( order by visited_on rows between 6 preceding and current row )  as seven_days_amount,
    row_number() over (order by visited_on) as rnk
from Customer_CTE)

select 
    visited_on , 
    seven_days_amount as amount,
    round(seven_days_amount/7 ,2) as average_amount
from moving_average_CTE
where rnk > 6
order by visited_on

