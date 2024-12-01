# Write your MySQL query statement below
SELECT business_id
FROM events AS a
JOIN (
    SELECT event_type, AVG(occurences) AS av
    FROM events
    GROUP BY event_type
) AS b
ON a.event_type = b.event_type
WHERE a.occurences > b.av
GROUP BY business_id
HAVING COUNT(*) > 1;



# average activity : average occurences across all companies that have this event.
# Active Business : more than one event_type
# and occurences is strictly greater than the average activity for that event.

with Events_CTE as (
        select 
            business_id,
            event_type, 
            occurrences,
            avg(occurrences) over ( partition by event_type) as avg_activity
        from Events )
select
     business_id
from Events_CTE
where occurrences > avg_activity
group by business_id
having count(distinct event_type) > 1

