{{ config(enabled = var('tuva_chronic_conditions_enabled',var('tuva_packages_enabled',True)) ) }}

select distinct 
    condition_family
    ,condition
from {{ref('chronic_conditions_hierarchy')}}
order by 
    condition_family
    ,condition