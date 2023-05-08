
with 
    chargeback as (select * from  {{ ref('stg_globepay__chargeback') }}),
    dim_chargeback as(
        select 
            {{dbt_utils.generate_surrogate_key(['external_ref', 'source'])}} as chargeback_sk,
            external_ref,
            source,
            status,
            is_chargeback
            
        from 
            chargeback 
    )
    select * from  dim_chargeback