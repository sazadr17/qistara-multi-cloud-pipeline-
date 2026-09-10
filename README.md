# 🌩️ Project Qistara: Multi-Cloud Snowflake Data Pipeline

**Architected by:** Shaik Sazad Razwi | DevOps & Cloud Infrastructure

## 🎯 Project Overview
This repository contains the infrastructure as code (SQL/ELT) for an enterprise-grade, automated data pipeline. It is designed to autonomously ingest semi-structured JSON weather payloads from both **AWS S3** and **Microsoft Azure Blob Storage** into **Snowflake** using event-driven architecture.

## 🛠️ Tech Stack
* **Data Warehouse:** Snowflake
* **Cloud Storage (Multi-Cloud):** AWS S3 & Microsoft Azure Blob
* **Automation:** Snowflake Snowpipe (Serverless Ingestion)
* **Data Transformation:** Snowflake SQL (ELT)

## 💼 Architecture Highlights
1. **Multi-Cloud Integrations:** Securely bridges AWS and Azure environments using Storage Integrations and IAM/Tenant access policies without hardcoded credentials.
2. **Zero-Maintenance Automation:** Snowpipe is configured to trigger on cloud storage queues, instantly loading data upon arrival.
3. **Advanced Parsing:** Utilizes Snowflake's `VARIANT` data type to parse heavily nested JSON payloads into strict relational schemas for analytical querying.
