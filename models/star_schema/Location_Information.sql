--Trip Information
{{config(materialized = "table")}}

select 
    CONCAT(VendorID,tpep_pickup_datetime) AS uniq_id,
    payment_type, 
    PULocationID AS Pickup_Taxi_zone,
    DOLocationID AS Dropoff_Taxi_zone,
    CAST(RatecodeID as string) AS RatecodeID,
    CASE WHEN RatecodeID =='1' THEN 'Standard Rate'
    WHEN RatecodeID =='2' THEN 'JFK'
    WHEN RatecodeID =='3' THEN 'Newark'
    WHEN RatecodeID =='4' THEN 'Nassau'
    WHEN RatecodeID =='5' THEN 'Negotiated Fare'
    WHEN RatecodeID =='6' THEN 'Group Ride'
    ELSE 'Unknown' END AS Region_Trip_Ended
    FROM {{ref('yellow_trip_entire_table')}}
