WITH shifts AS (  
 SELECT
   [STRUCT(" 00:00:00 UTC" as hrs, GENERATE_DATE_ARRAY('2019-01-01','2020-12-31', INTERVAL 1 DAY) as dt_range),
    STRUCT(" 01:00:00 UTC" as hrs, GENERATE_DATE_ARRAY('2019-01-01','2020-12-31', INTERVAL 1 DAY) as dt_range),
    STRUCT(" 02:00:00 UTC" as hrs, GENERATE_DATE_ARRAY('2019-01-01','2020-12-31', INTERVAL 1 DAY) as dt_range),
    STRUCT(" 03:00:00 UTC" as hrs, GENERATE_DATE_ARRAY('2019-01-01','2020-12-31', INTERVAL 1 DAY) as dt_range),
    STRUCT(" 04:00:00 UTC" as hrs, GENERATE_DATE_ARRAY('2019-01-01','2020-12-31', INTERVAL 1 DAY) as dt_range),
    STRUCT(" 05:00:00 UTC" as hrs, GENERATE_DATE_ARRAY('2019-01-01','2020-12-31', INTERVAL 1 DAY) as dt_range),
    STRUCT(" 06:00:00 UTC" as hrs, GENERATE_DATE_ARRAY('2019-01-01','2020-12-31', INTERVAL 1 DAY) as dt_range),
    STRUCT(" 07:00:00 UTC" as hrs, GENERATE_DATE_ARRAY('2019-01-01','2020-12-31', INTERVAL 1 DAY) as dt_range),
    STRUCT(" 08:00:00 UTC" as hrs, GENERATE_DATE_ARRAY('2019-01-01','2020-12-31', INTERVAL 1 DAY) as dt_range),
    STRUCT(" 09:00:00 UTC" as hrs, GENERATE_DATE_ARRAY('2019-01-01','2020-12-31', INTERVAL 1 DAY) as dt_range),
    STRUCT(" 10:00:00 UTC" as hrs, GENERATE_DATE_ARRAY('2019-01-01','2020-12-31', INTERVAL 1 DAY) as dt_range),
    STRUCT(" 11:00:00 UTC" as hrs, GENERATE_DATE_ARRAY('2019-01-01','2020-12-31', INTERVAL 1 DAY) as dt_range),
    STRUCT(" 12:00:00 UTC" as hrs, GENERATE_DATE_ARRAY('2019-01-01','2020-12-31', INTERVAL 1 DAY) as dt_range),
    STRUCT(" 13:00:00 UTC" as hrs, GENERATE_DATE_ARRAY('2019-01-01','2020-12-31', INTERVAL 1 DAY) as dt_range),
    STRUCT(" 14:00:00 UTC" as hrs, GENERATE_DATE_ARRAY('2019-01-01','2020-12-31', INTERVAL 1 DAY) as dt_range),
    STRUCT(" 15:00:00 UTC" as hrs, GENERATE_DATE_ARRAY('2019-01-01','2020-12-31', INTERVAL 1 DAY) as dt_range),
    STRUCT(" 16:00:00 UTC" as hrs, GENERATE_DATE_ARRAY('2019-01-01','2020-12-31', INTERVAL 1 DAY) as dt_range),
    STRUCT(" 17:00:00 UTC" as hrs, GENERATE_DATE_ARRAY('2019-01-01','2020-12-31', INTERVAL 1 DAY) as dt_range),
    STRUCT(" 18:00:00 UTC" as hrs, GENERATE_DATE_ARRAY('2019-01-01','2020-12-31', INTERVAL 1 DAY) as dt_range),
    STRUCT(" 19:00:00 UTC" as hrs, GENERATE_DATE_ARRAY('2019-01-01','2020-12-31', INTERVAL 1 DAY) as dt_range),
    STRUCT(" 20:00:00 UTC" as hrs, GENERATE_DATE_ARRAY('2019-01-01','2020-12-31', INTERVAL 1 DAY) as dt_range),
    STRUCT(" 21:00:00 UTC" as hrs, GENERATE_DATE_ARRAY('2019-01-01','2020-12-31', INTERVAL 1 DAY) as dt_range),
    STRUCT(" 22:00:00 UTC" as hrs, GENERATE_DATE_ARRAY('2019-01-01','2020-12-31', INTERVAL 1 DAY) as dt_range),
    STRUCT(" 23:00:00 UTC" as hrs, GENERATE_DATE_ARRAY('2019-01-01','2020-12-31', INTERVAL 1 DAY) as dt_range)]
    AS full_timestamps
  )
  SELECT
    dt AS dates,
    hrs,
    CAST(CONCAT( CAST(dt as STRING), CAST(hrs as STRING)) as TIMESTAMP) as shift_value
    FROM shifts, shifts.full_timestamps
  LEFT JOIN full_timestamps.dt_range as dt
  ORDER BY shift_value ASC
  LIMIT 100
  ;