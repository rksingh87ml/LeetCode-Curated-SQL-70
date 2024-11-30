# find the players for consecutive dates from first login 
# get first login and next login 
# total consecutive players / total players 

with Activity_CTE as (
                    select 
                        player_id,
                        event_date,
                        row_number() over ( partition by player_id order by event_date) as first_login,
                        lead(event_date,1) over (partition by player_id order by event_date) as next_login 
                    from Activity)

select
       round(coalesce(count(distinct AC.player_id) / temp.total_player,0) ,2) as fraction 
from Activity_CTE  AC join (select count(distinct player_id) as total_player from Activity) temp
where first_login = 1
and ifnull(datediff(next_login,event_date),0) = 1
