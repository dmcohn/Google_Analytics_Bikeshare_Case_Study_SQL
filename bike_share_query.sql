## SQL Query for determining the average bikeride length,
## longest bikeride length, and day of the week
## with the most bikerides.

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
    ROUND(AVG(ride_length_minutes), 2) AS average_ride_length,
    MAX(ride_length_minutes) AS longest_ride_length,
    (SELECT 
        day_of_week   
    FROM 
        (SELECT 
            day_of_week,
            COUNT(*) AS day_of_week_num_trips
        FROM 
            february_bikeshare_data
        GROUP BY 
            day_of_week
        ORDER BY 
            day_of_week_num_trips DESC
        LIMIT 
            1)
        ) AS day_of_week_mode
FROM february_bikeshare_data;

