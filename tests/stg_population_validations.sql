SELECT
    zip_code,
    population
FROM {{ ref('stg_population') }}
WHERE (zip_code NOT BETWEEN 90000 AND 97000)
    OR (population NOT BETWEEN 1 AND 10000000)
