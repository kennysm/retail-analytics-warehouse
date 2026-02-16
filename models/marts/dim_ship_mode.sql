select
    row_number() over (order by ship_mode) as ship_mode_key,
    ship_mode
from {{ ref('stg_superstore_sales') }}
group by ship_mode


