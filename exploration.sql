
--Variable
{% set nights_booked=3 %}

select * from {{ ref('bronze_bookings') }}
where nights_booked > {{nights_booked}}

--If else

{% set flag=1 %}
select * from {{ ref('bronze_bookings') }}
{% if flag == 1 %}
    where nights_booked=1
{% else %}
    where nights_booked=2
{% endif %}


--for loop
{% set cols = ['booking_id', 'Booking_amount', 'nights_booked'] %}
select
{% for col in cols %}
    {{col}}
        {% if not loop.last %} , {% endif %}
{% endfor %}
from {{ ref('bronze_bookings') }}


select * from {{ ref("obt")}}

select * from {{ ref("bronze_listings")}}

select * from {{ ref("bronze_hosts")}}