select
    id,
    zip_code,
    replace(population, ',', '')::int as population,
    _source_file as source_file,
    _ingestion_timestamp as ingestion_timestamp
from {{ source('raw_data', 'raw_population') }}