{{ config(materializing="incremental", on_schema_change="fail") }}

with src_rev as (select * from {{ ref("src_reviews") }})
select *
from src_rev
where
    review_text is not null

    {% if is_incremental() %}
        and review_date > (select max(review_date) from {{ this }})
    {% endif %}

