select
    status_id,
    customer_id,
    quarter,
    satisfaction_score,
    customer_status,
    (churn_value = 1) as is_churned,
    churn_score,
    cltv,
    churn_category,
    churn_reason
from {{ ref('stg_status') }}