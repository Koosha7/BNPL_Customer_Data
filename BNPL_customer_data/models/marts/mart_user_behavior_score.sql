select
  user_id,
  avg(avg_monthly_revenue) as avg_arpu,
  avg(direct_channel_usage_share) as avg_direct_channel,
  avg(recent_recharge_freq) as avg_recharges,
  avg(bundle_purchase_count) as avg_bundles,
  
  -- Composite Score (scale and tune as needed)
  round(
    0.4 * (avg(avg_monthly_revenue) / 100000) +
    0.2 * (avg(direct_channel_usage_share) / 100) +
    0.2 * avg(recent_recharge_freq) / 5 +
    0.2 * avg(bundle_purchase_count) / 5, 2
  ) as behavior_score
from stg_BNPL_customer
group by user_id
