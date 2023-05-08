with source as (
    select 
        external_ref,
        status,
        source, 
        chargeback 
    from 
        {{ source('deel', 'globapay_chargeback') }}
)
select * from source 