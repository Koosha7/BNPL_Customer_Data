select
    user_id,
    month_id,
    sum(avg_monthly_revenue) over (partition by user_id order by month_id) as cumulative_revenue,
    case when bnpl_amount > 0 then 'BNPL' else 'Non-BNPL' end as user_type
from {{ ref('stg_BNPL_customer') }}