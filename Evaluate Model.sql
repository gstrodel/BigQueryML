 #standardSQL
SELECT
  *
FROM
  ML.EVALUATE(MODEL plant_sensor.linear_model_timestamp, (
SELECT
UNIX_SECONDS( TIMESTAMP(FORMAT_TIMESTAMP('%F %T', human_readable_date, "America/New_York")))  as UNIX_DATETIME
,avg(soil) as raw_soil_value
FROM `smartplant31.plant_sensor.raw_sensor_data` 
WHERE
 FORMAT_TIMESTAMP('%F %T', human_readable_date, "America/New_York") >='2019-04-28 00:00:00'
 and  FORMAT_TIMESTAMP('%F %T', human_readable_date, "America/New_York") <'2019-05-01 00:00:00'
 and soil is not null
GROUP BY  human_readable_date
ORDER BY human_readable_date DESC
))
