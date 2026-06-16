{{config(materialized='incremental', unique_key='host_id')}}

select host_id,
        REPLACE(host_name,' ','_') AS host_name,
        host_since,
        Is_superhost,
        Response_rate,
        case when Response_rate > 95 then 'VERY GOOD'
            when Response_rate > 80 then 'GOOD'
            when Response_rate > 60 then 'FAIR'
            else 'POOR'
        end as Response_rate_quality,
        created_at
from {{ref("bronze_hosts")}}