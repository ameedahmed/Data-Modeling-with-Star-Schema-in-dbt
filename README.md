# 🟡 Data Modeling with Star Schema in dbt

When I first started using Power BI, I made a grave mistake.
My filters weren’t working the way they were supposed to — and the data just didn’t look right!

After some head-scratching (and a lot of Googling), I realized the issue wasn’t in Power BI at all — it was in my data model. I had completely forgotten about the data modeling approaches I had studied years ago.

That’s how I re-discovered the widely known and elegant Star Schema.

## 🎯 Project Objective

The goal of this project was to demonstrate the Star Schema approach using a practical, real-world dataset.

I used the NYC Yellow Taxi Dataset and transformed the raw data into multiple dimension tables and one fact table using dbt
 (with the DuckDB adapter).

 ## 🧱 Data Model Overview

The final data model consists of:

1. Three Dimension Tables: Each dimension table provides additional categorical information about the trips. (e.g., vendor details, payment types, and time-based attributes)

2. One Fact Table: Contains key measurable data such as trip fares, distance, passenger count, etc.

Since the original dataset didn’t include a unique key for joining tables, I created a composite key by concatenating the VendorID with the trip’s date/time of initiation.
This composite key serves as the bridge between the dimension and fact tables.

## 🪶 Why Star Schema?

The Star Schema is one of the simplest and most effective data modeling techniques for analytical workloads.
It’s intuitive, easy to query, and optimized for tools like Power BI or Tableau.

By organizing data this way, you can:

Improve query performance

Simplify data relationships

Enable cleaner dashboards and more accurate aggregations
<img width="781" height="501" alt="Star_Schema" src="https://github.com/user-attachments/assets/71b48c5e-166d-441a-a923-10865c830dab" />

