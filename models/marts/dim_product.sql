with base as (

    select distinct
        product_id,
        category,
        sub_category,
        product_name
    from {{ ref('stg_superstore_sales') }}

)

select
    row_number() over (order by product_id) as product_key,
    product_id,
    category,
    sub_category,
    product_name
from base
