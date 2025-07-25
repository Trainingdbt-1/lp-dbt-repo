WITH all_hosts AS (
    SELECT
        *
    FROM
       {{ source('AIRBNB', 'hosts') }}
)
SELECT
    id AS host_id,
    NAME AS host_name,
    is_superhost,
    created_at,
    updated_at
FROM
    all_hosts
