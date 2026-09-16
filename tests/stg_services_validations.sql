SELECT
    quarter,
    number_of_referrals,
    tenure_in_months,
    avg_monthly_long_distance_charges,
    avg_monthly_gb_download,
    monthly_charge,
    total_charges,
    total_refunds,
    total_extra_data_charges,
    total_long_distance_charges,
    total_revenue
FROM {{ ref('stg_services') }}
WHERE (quarter NOT IN ('Q1', 'Q2', 'Q3', 'Q4'))
    OR (number_of_referrals NOT BETWEEN 0 AND 20)
    OR (tenure_in_months NOT BETWEEN 1 AND 100)
    OR (avg_monthly_long_distance_charges NOT BETWEEN 0 AND 100)
    OR (avg_monthly_gb_download NOT BETWEEN 0 AND 1000)
    OR (monthly_charge NOT BETWEEN 0 AND 200)
    OR (total_charges NOT BETWEEN 0 AND 1000000)
    OR (total_refunds NOT BETWEEN 0 AND 1000000)
    OR (total_extra_data_charges NOT BETWEEN 0 AND 1000000)
    OR (total_long_distance_charges NOT BETWEEN 0 AND 1000000)
    OR (total_revenue NOT BETWEEN 0 AND 1000000)
