select 
    CONCAT(VendorID,tpep_pickup_datetime) AS uniq_id,
    payment_type, 
    CASE WHEN payment_type == '0' THEN 'Flex Fare Trip'
    WHEN payment_type =='1' THEN 'Credit Card'
    WHEN payment_type =='2' THEN 'Cash'
    WHEN payment_type =='3' THEN 'No Charge'
    WHEN payment_type =='4' THEN 'Dispute'
    WHEN payment_type =='5' THEN 'Unknown'
    WHEN payment_type =='6' THEN 'Voided Trip'
    ELSE 'Other' END AS payment_type_detail,
    CASE WHEN RatecodeID =='1' THEN 'Standard Rate'
    WHEN RatecodeID =='2' THEN 'JFK'
    WHEN RatecodeID =='3' THEN 'Newark'
    WHEN RatecodeID =='4' THEN 'Nassau'
    WHEN RatecodeID =='5' THEN 'Negotiated Fare'
    WHEN RatecodeID =='6' THEN 'Group Ride'
    ELSE 'Unknown' END AS Fare_Type
    FROM {{ref('yellow_trip_entire_table')}}
