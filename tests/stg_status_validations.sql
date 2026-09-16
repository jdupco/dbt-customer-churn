SELECT
    quarter,
    satisfaction_score,
    churn_score
FROM {{ ref('stg_status') }}
WHERE (quarter NOT IN ('Q1', 'Q2', 'Q3', 'Q4'))
    OR (satisfaction_score NOT BETWEEN 1 AND 5)
    OR (churn_score NOT BETWEEN 0 AND 100)