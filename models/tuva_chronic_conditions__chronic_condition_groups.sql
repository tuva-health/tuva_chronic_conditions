{{ config(enabled = var('tuva_chronic_conditions_enabled',var('tuva_packages_enabled',True)) ) }}

select distinct 
    condition_family
    ,condition
from {{ref('tuva_chronic_conditions__chronic_conditions_hierarchy')}}
order by 
    condition_family
    ,condition