## SQL Query for determining the average bikeride length,
## and number of trips by day of the week.

## By David Cohn

WITH february_bikeshare_data AS (
    SELECT 
      *,
      EXTRACT (DAYOFWEEK FROM started_at) AS day_of_week,
      DATETIME_DIFF(ended_at, started_at, MINUTE) AS ride_length_minutes
    FROM 
       ``  
)

SELECT
    day_of_week,
    ROUND(AVG(ride_length_minutes), 2) AS average_ride_length,
    COUNT(*) AS number_of_trips
FROM
    february_bikeshare_data
GROUP BY 
    day_of_week
ORDER BY 
    number_of_trips DESC;