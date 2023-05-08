with 
    get_declined_transactions AS (
        select 
            country,
            sum(amount) as declined_amount
        from 
              {{ ref('fct_globepay__acceptance_report') }}
        where 
            transaction_status = 'DECLINED'
        group by 
            country 
    )
    select * from get_declined_transactions