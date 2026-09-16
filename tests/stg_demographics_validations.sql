SELECT
    age,
    number_of_dependents
FROM {{ ref('stg_demographics') }}
WHERE (age NOT BETWEEN 18 AND 100)
    OR (number_of_dependents NOT BETWEEN 0 AND 100)