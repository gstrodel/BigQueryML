#standardSQL
SELECT

-- To just see the predicted dryness window, uncomment these measures
MIN( TIMESTAMP(FORMAT_TIMESTAMP('%F %T',TIMESTAMP_SECONDS( CAST(UNIX_DATETIME as INT64)+1556409605), "America/New_York")) ) as MIN_ETA_Dryness
,MAX( TIMESTAMP(FORMAT_TIMESTAMP('%F %T',TIMESTAMP_SECONDS( CAST(UNIX_DATETIME as INT64)+1556409605), "America/New_York")) ) as MIN_ETA_Drynessas

-- To see multiple points above the 2900 threshold, uncomment these measures
--TIMESTAMP(FORMAT_TIMESTAMP('%F %T',TIMESTAMP_SECONDS( CAST(UNIX_DATETIME as INT64)+1556409605), "America/New_York")) as date_time
--, round(predicted_raw_soil_value,2) as predicted_raw_soil_value

FROM
  ML.PREDICT(MODEL plant_sensor.linear_model,
    (
     select 
     TIMESTAMP(FORMAT_TIMESTAMP('%F %T', shift_value, "America/New_York")) as shift_Value_est,
     UNIX_SECONDS( TIMESTAMP(FORMAT_TIMESTAMP('%F %T', shift_value, "America/New_York")))-1556409605  as UNIX_DATETIME
     from plant_sensor.date_time_table
      WHERE 1=1
     and TIMESTAMP(FORMAT_TIMESTAMP('%F %T', shift_value, "America/New_York")) >='2019-05-01 00:00:00-4'
     and TIMESTAMP(FORMAT_TIMESTAMP('%F %T', shift_value, "America/New_York")) <'2019-05-15 00:00:00-4'
     GROUP BY shift_value
     ORDER BY shift_value ASC
     )
  )
where predicted_raw_soil_value >=2900  -- Soil is dry to the touch int eh 2900-3000 reading range
and predicted_raw_soil_value <= 3100 --The sensor readings don't go higher than 3100, so results above that should be ignored
--GROUP BY predicted_raw_soil_value
