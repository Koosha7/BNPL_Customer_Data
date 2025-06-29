select
  user_id,
  avg(direct_channel_usage_share) as avg_direct_channel_usage,
  case 
    when avg(direct_channel_usage_share) >= 70 then 'High'
    when avg(direct_channel_usage_share) >= 40 then 'Medium'
    else 'Low'
  end as digital_channel_segment
from stg_BNPL_customer
group by user_id
