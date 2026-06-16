{{config(materialized='ephemeral')}}

with listings as
(
select listing_id,
        property_type,
        room_type,
        city,
        country,
        Accommodates,
        Bedrooms,
        Bathrooms,
        Price_per_night,
        Price_per_night_tag,
        listing_created_at
from {{ref("obt")}}
)

select * from listings