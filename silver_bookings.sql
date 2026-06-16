
--for upsert
{{ config(materialized='incremental', unique_key='booking_id') }}

select booking_id,
        listing_id,
        booking_date,
        {{ multiply('nights_booked', 'booking_amount',2) }} + cleaning_fee + service_fee AS Total_amount,
        booking_status,
        created_at
from {{ ref("bronze_bookings") }}