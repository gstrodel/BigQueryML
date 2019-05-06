#standardSQL
select 
--MIN(predicted_timestamp) MIN_ETA_for_soil_dryness 
--MAX(predicted_timestamp) ETA_for_soil_dryness
MAX(TIMESTAMP(FORMAT_TIMESTAMP('%F %T', predicted_timestamp, "America/New_York"))) as ETA_for_soil_dryness
FROM (
SELECT
CAST(predicted_UNIX_DATETIME as INT64) as predicted_UNIX_DATETIME
, TIMESTAMP_SECONDS(CAST(predicted_UNIX_DATETIME as INT64)) as predicted_timestamp
, UNIX_DATETIME
, raw_soil_value
FROM
  ML.PREDICT(MODEL plant_sensor.linear_model_timestamp,
    (
      SELECT
      UNIX_SECONDS( TIMESTAMP(FORMAT_TIMESTAMP('%F %T', human_readable_date, "America/New_York")))  as UNIX_DATETIME
      ,avg(soil) as raw_soil_value
      FROM `smartplant31.plant_sensor.raw_sensor_data` 
      WHERE 1=1
       --and FORMAT_TIMESTAMP('%F %T', human_readable_date, "America/New_York") >='2019-05-01 00:00:00'
       and soil >= 2900
      GROUP BY  human_readable_date
      ORDER BY human_readable_date DESC
     )
  )
)
