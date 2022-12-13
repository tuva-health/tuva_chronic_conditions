{{ config(materialized='table') }}

select distinct 
    condition_family
    ,condition
from {{ref('chronic_conditions_hierarchy')}}
order by 
    condition_family
    ,condition