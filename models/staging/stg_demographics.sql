select
    customer_id,
    count,
    gender,
    age,
    under_30,
    senior_citizen,
    married,
    dependents,
    number_of_dependents,
    _source_file as source_file,
    _ingestion_timestamp as ingestion_timestamp
from {{ source('raw_data', 'raw_demographics') }}
