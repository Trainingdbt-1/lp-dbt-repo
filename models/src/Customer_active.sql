with scd_raw_customer AS (
    SELECT * FROM {{ref('scd_raw_customer')}}
)
SELECT * FROM scd_raw_customer
WHERE DBT_VALID_TO is null