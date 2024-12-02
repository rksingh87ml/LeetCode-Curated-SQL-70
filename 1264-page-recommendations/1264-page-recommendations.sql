# Write your MySQL query statement below

with CTE as (
        select 
         user2_id as friend_id 
        from Friendship
        where user1_id = 1 
        union 
        select 
         user1_id as friend_id 
        from Friendship
        where user2_id = 1)

select 
distinct LK.page_id as recommended_page
from CTE join Likes LK
on LK.user_id = CTE.friend_id
where LK.page_id not in ( select  page_id from Likes where user_id = 1)
