with 
    acceptance as (select * from {{ ref('fct_globepay__acceptance_report') }}),
    chargeback as (select * from {{ ref('dim_globepay__chargeback') }}),
  

    create_star_schema as ( 
        select 
            {{dbt_utils.star(from= ref('fct_globepay__acceptance_report'), relation_alias= 'acceptance' )}},
            {{dbt_utils.star(from= ref('dim_globepay__chargeback'), relation_alias= 'chargeback', except= ['external_ref','status'] )}},        
           
        from 
            acceptance
        left  join  
            chargeback on acceptance.external_ref = chargeback.external_ref
        
    )
    select * from create_star_schema