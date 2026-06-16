

{{ config(materialized='incremental') }}

select * from {{ source('staging', 'hosts') }}

{% if is_incremental() %}
 where created_at > (select coalesce(MAX(created_at),'1900-01-01') FROM {{ this }})
{% endif %}