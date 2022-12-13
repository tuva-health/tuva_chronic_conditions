{{ config(materialized='table') }}

select
    patient_id
    , {{ dbt_utils.pivot(
          column='condition'
        , values=dbt_utils.get_column_values(ref('chronic_conditions_long'), 'condition')
        , agg='max'
        , then_value= 1
        , else_value= 0
      ) }}
from {{ ref('chronic_conditions_long') }}
group by
    patient_id