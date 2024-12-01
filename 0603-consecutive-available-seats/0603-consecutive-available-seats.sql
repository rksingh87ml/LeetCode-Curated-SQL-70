# Write your MySQL query statement below
# 1) report all the consecutive available seats in the cinema, so pick only free = 1
# 2)  ordered by seat_id in ascending order.
# 3) The test cases are generated so that more than two seats are consecutively available.

# need to check prev and next seat using lag and lead functions
with available_seat as 
                    (
                        select * from Cinema
                        where free = 1

                    ),
    Cinema_CTE as (
            select 
            seat_id ,
            seat_id - lag(seat_id,1) over ( order by seat_id asc ) as prev_seat,
            seat_id - lead(seat_id,1) over (order by seat_id asc) as next_seat
            from available_seat 
            )
select seat_id
 from Cinema_CTE
where prev_seat = 1 or next_seat = -1
order by seat_id
