SELECT
    zip_code,
    lat_long,
    latitude,
    longitude
FROM {{ ref('stg_location') }}
WHERE (zip_code NOT BETWEEN 90000 AND 97000)
    -- OR (lat_long != latitude||', '||longitude)
    OR (latitude NOT BETWEEN 32 AND 42)
    OR (longitude NOT BETWEEN -125 AND -114)
