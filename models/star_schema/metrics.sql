--facts/metrics table
{{config(materialized = "table")}}
SELECT CONCAT(VendorID, tpep_pickup_datetime) AS uniq_id, passenger_count,trip_distance,fare_amount, extra,mta_tax,tip_amount,tolls_amount,improvement_surcharge,total_amount,congestion_surcharge,Airport_fee,cbd_congestion_fee
from {{ref('yellow_trip_entire_table')}}