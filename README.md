# Automated Retail Analytics ETL & Data Warehouse Pipeline

## Overview

This project implements an end-to-end retail analytics pipeline that extracts, transforms, and loads (ETL) retail sales data into a PostgreSQL-based dimensional data warehouse. The pipeline is fully containerized using Docker and supports business intelligence reporting through Power BI dashboards.

The project was initially developed as a traditional retail business intelligence dashboard project, then progressively evolved into a more production-oriented data engineering pipeline through the introduction of automated ETL workflows, dimensional warehouse modeling, containerized infrastructure, and reproducible execution environments.

The project demonstrates practical data engineering and analytics engineering concepts including ETL automation, star-schema warehouse design, SQL warehousing, Docker-based infrastructure orchestration, and business intelligence visualization.

---

# Project Evolution

The project evolved incrementally through several stages:

### Phase 1 — Data Cleaning & Analytics

* Performed exploratory data analysis and preprocessing using Python and Pandas
* Cleaned retail sales data and generated transformed datasets for downstream analytics

### Phase 2 — PostgreSQL Data Warehouse

* Designed and implemented a dimensional star-schema warehouse
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

# Features

## Automated ETL Pipeline

* Extracts retail sales data from source CSV datasets
* Performs automated data cleaning and preprocessing
* Transforms raw data into analytics-ready formats
* Loads transformed data into PostgreSQL staging tables
* Executes warehouse population workflows automatically

## Dimensional Data Warehouse

* Implements a star-schema warehouse architecture
* Separates transactional and analytical workloads
* Includes fact and dimension tables for scalable querying
* Supports business intelligence and KPI reporting

## SQL-Based Warehouse Population

* Uses dedicated SQL scripts for schema creation and warehouse loading
* Automates dimension and fact table population
* Handles date dimension generation and relationship mapping
* Supports repeatable warehouse refresh workflows

## Containerized Data Engineering Infrastructure

* Uses Docker for isolated and portable execution
* Uses Docker Compose for multi-service orchestration
* Simplifies deployment and environment consistency
* Enables reproducible local pipeline execution

## Business Intelligence & Reporting

* Interactive Power BI dashboards
* KPI reporting and analytical insights
* Regional, product, customer, and operational analytics
* Time-series sales and profitability analysis
* DAX-based calculations and measures

## Modular Pipeline Architecture

* Separation of extraction, transformation, loading, and warehouse logic
* Reusable ETL modules for maintainability
* Structured project organization for scalability and extensibility

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

# Project Structure

```text id="2s8f0t"
cloud_retail_de_bi_platform/
│
├── data/
│   ├── raw_data/
│   └── processed_data/
│
├── etl/
│   ├── extract.py
│   ├── transform.py
│   ├── load.py
│   └── run_pipeline.py
│
├── sql/
│   ├── schema.sql
│   └── tables.sql
│
├── dashboards/
│
├── docker-compose.yml
├── Dockerfile
├── requirements.txt
└── README.md
```

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

* Sales performance trends
* Profitability analysis
* Product and category performance
* Customer segmentation
* Regional sales distribution
* Shipping and operational metrics
* Time-based sales analysis
* Discount versus profitability relationships
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
git clone <repository-url>
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
