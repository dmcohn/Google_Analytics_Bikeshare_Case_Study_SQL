## SQL Query for determining the percentage of rides,
## number of rides, and average bikeride length
## by bike station location (provided that the
## bikestation had a minimum of 50 rides in February)

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
    start_station_id,
    ROUND(COUNT(*) / (SELECT DISTINCT COUNT(ride_id)
                      FROM february_bikeshare_data) * 100, 2) AS Percentage_of_Rides,
    COUNT(*) AS Number_of_Rides,
    ROUND(AVG(ride_length_minutes), 2) AS average_ride_length
FROM 
    february_bikeshare_data
WHERE 
    start_station_id IS NOT NULL
GROUP BY 
    start_station_id
HAVING Number_of_Rides > 50
ORDER BY average_ride_length DESC;