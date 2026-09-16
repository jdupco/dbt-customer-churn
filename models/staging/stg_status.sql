select
    status_id,
    customer_id,
    count,
    quarter,
    satisfaction_score,
    customer_status,
    churn_label,
    churn_value,
    churn_score,
    cltv,
    churn_category,
    churn_reason,
    _source_file as source_file,
    _ingestion_timestamp as ingestion_timestamp
from {{ source('raw_data', 'raw_status') }}