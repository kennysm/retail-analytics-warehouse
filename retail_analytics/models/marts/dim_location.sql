with base as (

    select distinct
        country,
        region,
        state,
        city,
        postal_code
    from {{ ref('stg_superstore_sales') }}

)

select
    row_number() over (
        order by country, region, state, city, postal_code
    ) as location_key,
    country,
    region,
    state,
    city,
    postal_code
from base
