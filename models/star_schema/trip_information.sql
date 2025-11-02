--Trip Information
{{config(materialized = "table")}}

select 
    CONCAT(VendorID,tpep_pickup_datetime) AS uniq_id,
    payment_type, 
    PULocationID AS Pickup_Taxi_zone,
    DOLocationID AS Dropoff_Taxi_zone,
    CASE WHEN payment_type == '0' THEN 'Flex Fare Trip'
    WHEN payment_type =='1' THEN 'Credit Card'
    WHEN payment_type =='2' THEN 'Cash'
    WHEN payment_type =='3' THEN 'No Charge'
    WHEN payment_type =='4' THEN 'Dispute'
    WHEN payment_type =='5' THEN 'Unknown'
    WHEN payment_type =='6' THEN 'Voided Trip'
    ELSE 'Other' END AS payment_type_detail,
    CAST(RatecodeID as string) AS RatecodeID,
    CASE WHEN RatecodeID =='1' THEN 'Standard Rate'
    WHEN RatecodeID =='2' THEN 'JFK'
    WHEN RatecodeID =='3' THEN 'Newark'
    WHEN RatecodeID =='4' THEN 'Nassau'
    WHEN RatecodeID =='5' THEN 'Negotiated Fare'
    WHEN RatecodeID =='6' THEN 'Group Ride'
    ELSE 'Unknown' END AS Region_Trip_Ended
    FROM {{ref('yellow_trip_entire_table')}}