{% set configs = [
    {
        "table" : "airbnb.gold.obt",
        "columns" : "gold_obt.booking_id,gold_obt.listing_id, gold_obt.host_id, gold_obt.total_amount,gold_obt.created_at",
        "alias" : "gold_obt"
    }
]
 %}


select 
        {{configs[0]['columns']}}
from
    {% for config in configs %}
        {% if loop.first %}
            {{config['table']}} AS {{config['alias']}}
        {%else%}
            left join {{config['table']}} as {{config['alias']}}
            on {{config['join_condition']}}
        {%endif%}
    {%endfor%}
