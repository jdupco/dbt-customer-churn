select
    location_id,
    customer_id,
    count,
    country,
    state,
    city,
    zip_code,
    lat_long,
    latitude,
    longitude,
    _source_file as source_file,
    _ingestion_timestamp as ingestion_timestamp
from {{ source('raw_data', 'raw_location') }}