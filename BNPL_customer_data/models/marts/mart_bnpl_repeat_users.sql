select
  user_id,
  max(bnpl_repeat_count) as total_bnpl_uses,
  sum(bnpl_default) as total_defaults,
  round(100.0 * sum(bnpl_default) / nullif(count(*), 0), 2) as default_rate_pct,
  avg(repayment_days_delay) as avg_repayment_delay
from {{ ref('stg_BNPL_customer') }}
where bnpl_amount > 0
group by user_id
