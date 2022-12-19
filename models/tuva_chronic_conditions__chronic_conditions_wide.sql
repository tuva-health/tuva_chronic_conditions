{{ config(enabled = var('tuva_chronic_conditions_enabled',var('tuva_packages_enabled',True)) ) }}

select
    patient_id
    , {{ dbt_utils.pivot(
          column='condition'
        , values=dbt_utils.get_column_values(ref('tuva_chronic_conditions__chronic_conditions_long'), 'condition')
        , agg='max'
        , then_value= 1
        , else_value= 0
      ) }}
from {{ ref('tuva_chronic_conditions__chronic_conditions_long') }}
group by
    patient_id