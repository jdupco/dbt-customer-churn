SELECT
    customer_id,
    is_churned AS target
FROM {{ ref('obt_customer') }}