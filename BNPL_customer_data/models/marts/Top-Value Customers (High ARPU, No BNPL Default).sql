select 
  user_id,
  avg(avg_monthly_revenue) as avg_arpu,
  sum(bnpl_default) as total_defaults,
  max(bnpl_repeat_count) as total_bnpl_uses
from {{ ref('stg_BNPL_customer') }}
group by user_id
having avg_arpu > 100000 and total_defaults = 0
order by avg_arpu desc
