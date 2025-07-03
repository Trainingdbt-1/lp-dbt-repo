{{ config(
    materialized='incremental',
    unique_key='id',
    incremental_strategy='append'
) }}

SELECT *

FROM AIRBNB.RAW.RAW_TEMP  -- Using source for direct table reference

{% if is_incremental() %}
  -- Only select new or updated rows since the last run
  WHERE updated_time > (SELECT MAX(updated_time) FROM {{ this }})
{% endif %}
