select 
    month_id,
    age,
    app_version,
    count(*) as total_users,
    sum(case when bnpl_amount > 0 then 1 else 0 end) as bnpl_users,
    sum(bnpl_default) as defaulted,
    round(100.0 * sum(bnpl_default) / nullif(sum(case when bnpl_amount > 0 then 1 else 0 end), 0), 2) as default_rate_pct
from {{ ref('stg_BNPL_customer') }}
group by 1, 2, 3