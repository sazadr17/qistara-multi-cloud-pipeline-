USE ROLE ACCOUNTADMIN;

-- ==========================================
-- Phase 2A: AWS S3 Integration
-- ==========================================
CREATE STORAGE INTEGRATION aws_s3_weather 
  TYPE = EXTERNAL_STAGE 
  STORAGE_PROVIDER = 'S3' 
  ENABLED = TRUE 
  STORAGE_ALLOWED_LOCATIONS = ('s3://qistara-weather-aws/json_data/') 
  STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::YOUR_AWS_ID:role/snowflake_role';

CREATE STAGE WEATHER_DATA_HUB.RAW.weather_stage_aws 
  URL = 's3://qistara-weather-aws/json_data/' 
  STORAGE_INTEGRATION = aws_s3_weather;

-- ==========================================
-- Phase 2B: Azure Blob Integration
-- ==========================================
CREATE STORAGE INTEGRATION azure_blob_weather 
  TYPE = EXTERNAL_STAGE 
  STORAGE_PROVIDER = 'AZURE' 
  ENABLED = TRUE 
  AZURE_TENANT_ID = 'YOUR_AZURE_TENANT_ID' 
  STORAGE_ALLOWED_LOCATIONS = ('azure://qistara.blob.core.windows.net/weatherdata/');

CREATE STAGE WEATHER_DATA_HUB.RAW.weather_stage_azure 
  URL = 'azure://qistara.blob.core.windows.net/weatherdata/' 
  STORAGE_INTEGRATION = azure_blob_weather;
