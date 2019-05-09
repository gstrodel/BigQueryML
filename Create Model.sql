#standardSQL
CREATE OR REPLACE MODEL plant_sensor.linear_model
OPTIONS(model_type='linear_reg',input_label_cols=['raw_soil_value']
) AS
SELECT
UNIX_SECONDS( TIMESTAMP(FORMAT_TIMESTAMP('%F %T', human_readable_date, "America/New_York")))-1556409605  as UNIX_DATETIME
,avg(soil) as raw_soil_value
FROM `smartplant31.plant_sensor.raw_sensor_data` 
WHERE
 human_readable_date >='2019-04-28 00:00:00-4'
 and  human_readable_date <'2019-05-01 00:00:00-4'
 and soil is not null
GROUP BY  human_readable_date
 ORDER BY human_readable_date ASC

 
