## SQL Query for determining the number of rides,
## percentage of rides, and average bikeride length
## by bike type.

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
    rideable_type,
    ROUND(COUNT(*) / (SELECT DISTINCT COUNT(ride_id)
                      FROM february_bikeshare_data) * 100, 2) AS Percentage_of_Rides,
    COUNT(*) AS Number_of_Rides,
    ROUND(AVG(ride_length_minutes), 2) AS average_ride_length
FROM 
    february_bikeshare_data
GROUP BY 
    rideable_type;
