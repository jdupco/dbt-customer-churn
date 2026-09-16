select
    d.customer_id,
    l.location_id,
    d.gender,
    d.age,
    (d.under_30 = 'Yes') as is_under_30,
    (d.senior_citizen = 'Yes') as is_senior_citizen,
    (d.married = 'Yes') as is_married,
    (d.dependents = 'Yes') as has_dependents,
    d.number_of_dependents,
    l.country,
    l.state,
    l.city,
    l.zip_code,
    p.population,
    l.lat_long,
    l.latitude,
    l.longitude
from {{ ref('stg_demographics') }} as d
left join {{ ref('stg_location') }} as l
    on d.customer_id = l.customer_id
left join {{ ref('stg_population') }} as p
    on l.zip_code = p.zip_code
