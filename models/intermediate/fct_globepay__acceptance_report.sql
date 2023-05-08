
with 
    acceptance as (select * from  {{ ref('stg_globepay__acceptance_report') }}),
    fct_acceptance as(
        select 
            {{dbt_utils.generate_surrogate_key(['external_ref', 'ref'])}} as acceptance_sk,
            external_ref,
            ref, 
            amount, 
            currency,
            country,
            is_cvv_provided,
            transaction_status,
            rates, 
            transaction_happened_at
        from 
            acceptance 
    )
    select * from  fct_acceptance