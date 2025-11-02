/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{config(materialized='table')}}

select * from read_parquet('/Users/ameedahmed/Desktop/my_lambda_docker/star_schema_project/star_schema_project_folder/yellow_tripdata_2025-01.parquet')

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null