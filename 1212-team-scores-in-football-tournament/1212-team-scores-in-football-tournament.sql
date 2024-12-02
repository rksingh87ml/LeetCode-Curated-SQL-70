with matches_score as (

        select 
            T.team_id, T.team_name , 
            case when host_goals > guest_goals then 3 
                when host_goals = guest_goals then 1
                when host_goals < guest_goals then 0 
            end as num_points 

        from Teams  T
        left join Matches M on M.host_team = T.team_id 
        union all 
        select 
            T.team_id, T.team_name , 
            case when host_goals > guest_goals then 0
                when host_goals = guest_goals then 1
                when host_goals < guest_goals then 3
            end as num_points 

        from Teams  T
        left join Matches M on M.guest_team = T.team_id )

    
    select 
       team_id, team_name, sum(coalesce(num_points,0)) as num_points
    from matches_score
    group by team_id, team_name
    order by num_points desc , team_id
