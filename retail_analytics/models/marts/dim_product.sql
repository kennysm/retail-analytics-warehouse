with base as (

    select distinct
        product_id,
        category,
        sub_category,
        product_name,
        case 
            when category = 'Furniture' then 'https://i.imgur.com/crpEyvv.png'
            when category = 'Office Supplies' then 'https://i.imgur.com/r27P4z8.png'
            when category = 'Technology' then 'https://i.imgur.com/Su2CWkp.png'
            else 'https://i.imgur.com/Su2CWkp.png'
        end as category_image_url
    from {{ ref('stg_superstore_sales') }}

)

select
    row_number() over (order by product_id) as product_key,
    product_id,
    category,
    sub_category,
    product_name,
    category_image_url 
from base