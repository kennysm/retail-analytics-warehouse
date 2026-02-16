{{ config(materialized='table') }}

select
    order_id,
    order_date::date as order_date,
    ship_date::date as ship_date,
    ship_mode as ship_mode,
    customer_id,
    customer_name,
    segment,
    product_id,
    category,
    sub_category,
    product_name,
    city,
    state,
    postal_code,
    region,
    country,
    sales::numeric(10,2) as sales
from {{ source('raw', 'superstore_sales') }}

