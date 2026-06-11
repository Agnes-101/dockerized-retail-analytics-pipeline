# Automated Retail Analytics ETL & Data Warehouse Pipeline

## Overview

This project implements an end-to-end retail analytics pipeline that extracts, transforms, and loads (ETL) retail sales data into a PostgreSQL-based dimensional data warehouse. The pipeline is fully containerized using Docker and supports business intelligence reporting through Power BI dashboards.

The project was initially developed as a traditional retail business intelligence dashboard project, then progressively evolved into a more production-oriented data engineering pipeline through the introduction of automated ETL workflows, dimensional warehouse modeling, containerized infrastructure, and reproducible execution environments.

The project demonstrates practical data engineering and analytics engineering concepts including ETL automation, star-schema warehouse design, SQL warehousing, Docker-based infrastructure orchestration, and business intelligence visualization.

---

# Project Evolution

The project evolved incrementally through several stages:

### Phase 1 — Data Ingestion, Cleaning & Analytics

* Imports data from a Kaggle Superstore retail CSV dataset
* Performed exploratory data analysis and preprocessing using Python and Pandas
* Cleaned retail sales data and generated transformed datasets for downstream analytics

### Phase 2 — PostgreSQL Data Warehouse

* Designed and implemented a dimensional star-schema warehouse
* Loaded the data from the transformed dataset into a staging area
* Created fact and dimension tables for customer, product, geography, and date analytics
* Developed SQL scripts for automated warehouse population and KPI querying

### Phase 3 — ETL Pipeline Automation

* Built modular ETL scripts for extraction, transformation, and staging
* Automated warehouse loading through Python orchestration and SQL execution
* Introduced reusable pipeline architecture for repeatable execution

### Phase 4 — Dockerized Infrastructure

* Containerized PostgreSQL and ETL services using Docker and Docker Compose
* Implemented environment-based configuration management
* Enabled reproducible deployment and isolated execution environments

### Phase 5 — Business Intelligence Layer

* Integrated the warehouse with Power BI
* Developed interactive dashboards for sales, profitability, customer, product, and operational analytics
* Added DAX measures, filtering, drilldowns, and KPI visualizations

### Planned Future Enhancements

* Apache Airflow workflow orchestration
* AWS S3 cloud storage integration
* API-based data ingestion
* Cloud deployment and CI/CD automation

---

# Tech Stack

* Python
* PostgreSQL
* SQLAlchemy
* Pandas
* Docker & Docker Compose
* Power BI
* psycopg2

---
# Data Warehouse Schema

## Fact Table

* `fact_sales`

## Dimension Tables

* `dim_customer`
* `dim_product`
* `dim_dates`
* `dim_geography`

---
# ETL Pipeline Workflow

```text id="cncq6m"
Retail Dataset
      ↓
Extract
      ↓
Transform
      ↓
Load to PostgreSQL Staging Table
      ↓
Populate Star Schema Warehouse
      ↓
Power BI Dashboards
```

---

# Power BI Analytics

The dashboards provide analytical insights into:

* Overall Summary - Sales performance trends, Profitability analysis
* Product Performance - Product and category performance, Discount versus profitability relationships
* Customer Analysis - Customer segmentation, Regional sales distribution
* Operational Analysis - Shipping and operational metrics, Time-based sales analysis
  
## Dashboard Overview

![Dashboard Overview](screenshots/dashboard_overview.png)
---

# Dockerized Infrastructure

The project uses Docker Compose to orchestrate:

* PostgreSQL database container
* Python ETL container

This enables reproducible and portable pipeline execution across environments while simplifying local deployment and setup.

---

# How to Run the Project

## 1. Clone the Repository

```bash id="8nhukn"
git clone https://github.com/Agnes-101/dockerized-retail-analytics-pipeline.git
cd cloud_retail_de_bi_platform
```

---

## 2. Configure Environment Variables

Create a `.env` file:

```env id="gf7phn"
DB_USER=your_username
DB_PASSWORD=your_password
DB_HOST=postgres
DB_PORT=5432
DB_NAME=retail_warehouse
```

---

## 3. Build and Start Containers

```bash id="6fuk0k"
docker compose up --build
```

---

## 4. Access PostgreSQL

```bash id="0r0q2d"
docker exec -it retail_postgres psql -U your_username -d retail_warehouse
```

---

# Future Improvements

* Apache Airflow orchestration
* AWS S3 integration
* API-based ingestion pipelines
* Automated scheduling and monitoring
* CI/CD automation
* Cloud deployment on AWS

---

# Author

Agnes
