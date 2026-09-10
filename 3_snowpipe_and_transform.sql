USE SCHEMA WEATHER_DATA_HUB.RAW;

-- 1. Create Raw Landing Table
CREATE FILE FORMAT raw_json_format TYPE = 'JSON' STRIP_OUTER_ARRAY = TRUE;

CREATE TABLE raw_weather_json (
  json_data VARIANT, 
  ingested_at TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
);

-- 2. Initialize Snowpipe (Event-Driven Automation)
CREATE PIPE snowpipe_aws_ingest AUTO_INGEST = TRUE AS 
  COPY INTO raw_weather_json 
  FROM @weather_stage_aws 
  FILE_FORMAT = (FORMAT_NAME = raw_json_format);

-- 3. ELT Transformation to Structured Format
USE SCHEMA WEATHER_DATA_HUB.TRANSFORMED;

CREATE TABLE daily_weather_fact (
  station_id STRING, 
  city STRING, 
  temperature_c FLOAT, 
  humidity_pct FLOAT
);

INSERT INTO daily_weather_fact (station_id, city, temperature_c, humidity_pct)
SELECT 
  json_data:station_id::STRING, 
  json_data:location:city::STRING, 
  json_data:measurements:temperature_c::FLOAT,
  json_data:measurements:humidity_pct::FLOAT
FROM WEATHER_DATA_HUB.RAW.raw_weather_json;
