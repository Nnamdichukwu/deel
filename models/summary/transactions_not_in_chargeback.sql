with
    get_transactions_not_in_chargeback as (
        select 
            *
        from 
            {{ ref('fct_globepay__acceptance_report') }}
        where 
            external_ref not in ( 
                select 
                    external_ref 
                from 
                    {{ ref('dim_globepay__chargeback') }}
            )
    )
    select * from get_transactions_not_in_chargeback