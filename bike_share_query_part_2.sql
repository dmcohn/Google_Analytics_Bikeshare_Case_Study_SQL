## SQL Query for determining the average and median bikeride length
## by member status.

## By David Cohn

WITH february_bikeshare_data AS (
    SELECT 
      *,
      EXTRACT (DAYOFWEEK FROM started_at) AS day_of_week,
      DATETIME_DIFF(ended_at, started_at, MINUTE) AS ride_length_minutes
    FROM 
       ``  
)

SELECT DISTINCT
    member_casual,
    PERCENTILE_CONT(ride_length_minutes, 0.5) OVER(PARTITION BY member_casual) AS median_ride_length,
FROM
    february_bikeshare_data;

WITH february_bikeshare_data AS (
    SELECT 
      *,
      EXTRACT (DAYOFWEEK FROM started_at) AS day_of_week,
      DATETIME_DIFF(ended_at, started_at, MINUTE) AS ride_length_minutes
    FROM 
       ``  
)

SELECT
    member_casual,
    ROUND(AVG(ride_length_minutes), 2) AS average_ride_length
FROM
    february_bikeshare_data
GROUP BY
    member_casual;