select
  user_id,
  max(case when bnpl_amount > 0 then 1 else 0 end) as used_bnpl,
  avg(recent_recharge_freq) as avg_recharge,
  avg(direct_channel_usage_share) as avg_direct_channel,
  avg(bundle_purchase_count) as avg_bundle_count,
  count(*) as total_months
from stg_BNPL_customer
group by user_id