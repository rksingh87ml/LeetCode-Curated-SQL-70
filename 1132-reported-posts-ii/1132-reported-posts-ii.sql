# Write your MySQL query statement below
# 1) removed -- spam  (where )
# 2) count(distinct R.post_id)/count(distinct A.post_id)*100 => group daily
# 3) Avg(dail_percentage)

With DailyPerc_CTE AS 
                (
                    select 
                      action_date ,
                      (count(distinct RM.post_id) / count(distinct AC.post_id)) as daily_rate
                    from Actions AC
                    left join Removals RM 
                    on RM.post_id = AC.post_id
                    where AC.extra = 'spam'
                    group by action_date
                )
select 
    round(avg(daily_rate)*100,2) as average_daily_percent
from DailyPerc_CTE
