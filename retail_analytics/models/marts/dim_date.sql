with dates as (
    select distinct order_date as full_date
    from {{ ref('stg_superstore_sales') }}
)

select
    row_number() over (order by full_date) as date_key,
    full_date,
    extract(year from full_date) as year_name,
    extract(month from full_date) as month,
    -- Forçando o nome do mês em Inglês (PostgreSQL/Redshift)
    trim(to_char(full_date, 'Month')) as month_name, 
    -- Para abreviação (Jan, Feb...) use 'Mon'
    trim(to_char(full_date, 'Mon')) as month_name_short,
    concat('Q', extract(quarter from full_date)) as quarter,
    extract(week from full_date) as week,
    -- Forçando o dia da semana em Inglês
    trim(to_char(full_date, 'Day')) as day_of_week
from dates
