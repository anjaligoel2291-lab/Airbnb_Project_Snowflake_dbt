CREATE FILE FORMAT IF NOT EXISTS csv_format
TYPE = 'CSV'
FIELD_DELIMITER = ','
SKIP_HEADER =1
ERROR_ON_COLUMN_COUNT_MISMATCH = FALSE;


SHOW FILE FORMATS;

CREATE OR REPLACE STAGE sourcestage
FILE_FORMAT = csv_format
URL = 's3://snowbucketag/source/'
CREDENTIALS=(aws_key_id='AKIATNPW7CVXFKYYHLOR', aws_secret_key='cV0rxILSAwCdBIpyGRF99QcCGxA+wyM1yzS2WATw');

show stages;

LIST @sourcestage;

COPY INTO bookings
FROM @sourcestage
FILES=('bookings.csv');

COPY INTO listings
FROM @sourcestage
FILES=('listings.csv');

COPY INTO hosts
FROM @sourcestage
FILES=('hosts.csv');


select * from bookings;
select * from listings;
select * from hosts;AIRBNB.DBT_SCHEMA.DEMO