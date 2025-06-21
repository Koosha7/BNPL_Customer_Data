select 
  user_id,
  avg(avg_monthly_revenue) as avg_arpu,
  avg(direct_channel_usage_share) as avg_digital_share
from {{ ref('stg_BNPL_customer') }}
group by user_id
having avg_digital_share > 70 and avg_arpu between 50000 and 100000
