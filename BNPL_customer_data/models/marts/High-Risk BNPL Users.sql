select 
  user_id,
  max(bnpl_repeat_count) as bnpl_usage_count,
  sum(bnpl_default) as total_defaults,
  avg(repayment_days_delay) as avg_delay,
  round(100.0 * sum(bnpl_default) / nullif(count(*), 0), 2) as default_rate_pct
from stg_BNPL_customer
where bnpl_amount > 0
group by user_id
having total_defaults >= 1 and bnpl_usage_count >= 2 and avg_delay > 10
order by default_rate_pct desc
