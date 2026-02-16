<<<<<<< HEAD
Retail Analytics Warehouse
📌 Business Context

This project simulates a global retail company centralizing transactional sales data into a dimensional data warehouse to support business intelligence and strategic decision-making.
The dataset represents four years of retail operations including orders, customers, products, shipping information, and geographic attributes.

🎯 Objective

Design and implement a dimensional data model optimized for analytical workloads and BI consumption using a layered transformation architecture with data quality validation.

📊 Fact Table Grain

The grain of the fact table is defined as:

- One row represents a single product item within a specific order.

This ensures accurate revenue aggregation and enables product-level, customer-level, geographic, and time-based analysis without ambiguity.

📦 Fact Table
fact_sales

Contains transactional sales records at the defined grain.

📐 Dimensions

dim_customer (SCD Type 1)
dim_product (SCD Type 1)
dim_date
dim_location
dim_ship_mode

🔄 Slowly Changing Dimensions Strategy

All dimensions are implemented as SCD Type 1, meaning attribute changes overwrite previous values.
This simplifies the initial implementation while preserving dimensional modeling principles and analytical consistency.

🧠 Modeling Decisions

-Surrogate keys implemented for all dimensions
-Star schema optimized for analytical queries
-Fact table designed at product-level grain
-Referential integrity enforced using dbt relationship tests
-Data quality validation applied at both source and mart layers

🧪 Data Quality & Testing

-Data quality is enforced using dbt tests:
-not_null tests on surrogate keys
-unique tests on dimension primary keys
-relationships tests to guarantee referential integrity
-Source-level validation on raw data

This ensures consistency between fact and dimension tables and prevents broken analytical models.

🏗️ Architecture

The project follows a layered architecture inspired by the Medallion pattern:

-Raw layer – source ingestion
-Staging layer – data cleaning and standardization
-Marts layer – dimensional star schema

The final dimensional model is consumed by Power BI using Import Mode.

🛠️ Tech Stack

-PostgreSQL (Data Warehouse)
-dbt (Data Transformation & Testing)
-DBeaver (Database Management)
-Power BI (Data Visualization)
-Git & GitHub (Version Control)

📁 Project Structure
models/
│
├── staging/
│   └── stg_superstore_sales.sql
│
├── marts/
│   ├── dim_customer.sql
│   ├── dim_product.sql
│   ├── dim_date.sql
│   ├── dim_location.sql
│   ├── dim_ship_mode.sql
│   └── fact_sales.sql

📌 Future Improvements

Implement SCD Type 2 using dbt snapshots
Introduce incremental models
Add performance benchmarking
Deploy orchestration workflow
=======
Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
>>>>>>> 5c35c2691063a8953fd76943efdb77b746f8f453
