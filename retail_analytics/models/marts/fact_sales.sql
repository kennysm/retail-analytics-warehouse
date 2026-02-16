select
    s.order_id,
    d.date_key,
    c.customer_key,
    p.product_key,
    l.location_key,
    sm.ship_mode_key,
    s.sales
from {{ ref('stg_superstore_sales') }} s

left join {{ ref('dim_date') }} d
    on s.order_date = d.full_date

left join {{ ref('dim_customer') }} c
    on s.customer_id = c.customer_id

left join {{ ref('dim_product') }} p
    on s.product_id = p.product_id

left join {{ ref('dim_location') }} l
    on s.city = l.city
    and s.state = l.state
    and s.region = l.region

left join {{ ref('dim_ship_mode') }} sm
    on s.ship_mode = sm.ship_mode



