with 
get_monthly_transactions as (select  
    max(transaction_happened_at) as month,
    count(
        case when transaction_status = 'ACCEPTED' then external_ref else null end  
    ) as accepted_transactions,
    count(external_ref) as all_transactions
from
    {{ ref('fct_globepay__acceptance_report') }}

group by extract(month from transaction_happened_at), extract(year from transaction_happened_at)    
),
get_monthly_acceptance_rate as (
    select
        *,
        round(accepted_transactions/all_transactions,2) * 100 as acceptance_rate
    from 
        get_monthly_transactions
)
select * from get_monthly_acceptance_rate