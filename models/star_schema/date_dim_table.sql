-- models/date_dim_table.sql

{{ config(
    materialized = 'table') }}

SELECT
    CONCAT(VendorID, tpep_pickup_datetime) AS uniq_id,
    date_part('year', tpep_pickup_datetime) AS year,
    date_part('month', tpep_pickup_datetime) AS month,
    date_part('day', tpep_pickup_datetime) AS day
FROM {{ ref('yellow_trip_entire_table') }}