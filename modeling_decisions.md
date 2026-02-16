Modeling Decisions – Retail Analytics Warehouse
1️⃣ Grain Definition and Justification

The selected grain for the fact table is:

- One row represents a single product item within a specific order.

This level of granularity was chosen to preserve analytical flexibility and ensure accurate revenue aggregation at multiple levels (product, customer, geography, and time).

Alternative grains were considered:

One row per order → rejected, as it would prevent product-level analysis.
Daily aggregated sales → rejected, as it would reduce drill-down capabilities and limit dimensional flexibility.
By modeling at the order line level, the warehouse supports detailed and scalable analysis.

2️⃣ Fact Table Design Decisions

The fact_sales table contains:
Foreign keys referencing all related dimensions.
A single measure: sales.

Design principles applied:

The fact table does not use a surrogate primary key, as the defined grain guarantees logical uniqueness.
order_id is treated as a degenerate dimension, since it is a transactional identifier without descriptive attributes.
Date fields are represented as integer surrogate keys (order_date_key and ship_date_key) referencing the dim_date table.
No textual or descriptive attributes are stored in the fact table to maintain storage efficiency and performance.
This design follows dimensional modeling best practices optimized for OLAP workloads.

3️⃣ Dimension Modeling Decisions
dim_customer

Contains:

-Surrogate key (customer_key)
-Natural key (customer_id)
-Customer name
-Segment
A surrogate key was introduced to decouple analytical identity from the source system identifier and to support potential future SCD implementations.

dim_product

Contains:

-Surrogate key (product_key)
-Product ID
-Product name
-Category
-Sub-category

Product hierarchy attributes were maintained within the same dimension to simplify filtering and slicing operations.

dim_location

Contains:

-Surrogate key (location_key)
-Country
-Region
-State
-City
-Postal code

Geographic attributes were consolidated into a single dimension to reduce redundancy and simplify geographic filtering.

Postal code was kept within this dimension as it represents a descriptive geographic attribute and does not require separate modeling.

dim_ship_mode

Contains:

-Surrogate key (ship_mode_key)
-Ship mode description

Mode of shipment was modeled as a separate dimension to preserve normalization principles and enable independent filtering.

dim_date

The date dimension was generated separately and includes:

-date_key (integer in YYYYMMDD format)
-Full date
-Year
-Month
-Quarter
-Week
-Day of week

A surrogate incremental key was not used. Instead, an integer date key was chosen for performance optimization and consistency with industry practices.

The date dimension supports role-playing relationships (order date and ship date).

4️⃣ Slowly Changing Dimensions Strategy

All dimensions were implemented using SCD Type 1, meaning attribute updates overwrite previous values.

This decision was made to:

-Simplify initial implementation.
-Focus on dimensional modeling structure.
-Avoid temporal complexity in the first iteration.

In a production environment where historical tracking of customer or product attributes is required, SCD Type 2 would be implemented.

5️⃣ Architectural Considerations

The warehouse follows a layered transformation approach inspired by the Medallion architecture:

-Raw layer (source ingestion)
-Staging layer (data cleaning and standardization)
-Marts layer (dimensional star schema)

The final star schema is optimized for BI consumption and imported into Power BI using Import Mode.

-Integer surrogate keys were used across dimensions to:
-Improve join performance.
-Reduce storage footprint.
-Decouple business logic from source system identifiers.