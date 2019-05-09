#standardSQL
SELECT
TIMESTAMP_SECONDS(CAST(UNIX_DATETIME as INT64)+1556409605) as timestamp
, round(predicted_raw_soil_value,2) as predicted_raw_soil_value
FROM
  ML.PREDICT(MODEL plant_sensor.linear_model,
    (
     select 
     shift_value,
     UNIX_SECONDS( TIMESTAMP(FORMAT_TIMESTAMP('%F %T', shift_value, "America/New_York")))-1556409605  as UNIX_DATETIME
     from plant_sensor.date_time_table
      WHERE 1=1
     and shift_value >='2019-05-01 00:00:00'
     and shift_value <'2019-05-15 00:00:00'
     GROUP BY shift_value
     ORDER BY shift_value ASC
     )
  )
where predicted_raw_soil_value >=2900  
and predicted_raw_soil_value <= 3100
