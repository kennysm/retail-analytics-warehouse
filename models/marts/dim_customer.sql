with base as (

    select distinct
        customer_id,
        customer_name,
        segment
    from {{ ref('stg_superstore_sales') }}

)

select
    row_number() over (order by customer_id) as customer_key,
    customer_id,
    customer_name,
    segment
from base
