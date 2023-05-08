with source as (
    select 
        external_ref,
        ref, 
        amount, 
        currency,
        country,
        state as transaction_status,
        cvv_provided as is_cvv_provided,
        rates, 
        date_time as transaction_happened_at
    from 
        {{ source('deel', 'globepay_acceptance_report') }} 
)
select * from source 