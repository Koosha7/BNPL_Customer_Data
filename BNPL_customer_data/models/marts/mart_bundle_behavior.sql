select
  user_id,
  avg(bundle_purchase_count) as avg_bundle_purchases,
  avg(recent_recharge_freq) as avg_recharges,
  avg(avg_monthly_revenue) as avg_arpu,
  case 
    when avg(bundle_purchase_count) > 2 then 'Frequent'
    when avg(bundle_purchase_count) between 1 and 2 then 'Moderate'
    else 'Low'
  end as bundle_segment
from stg_BNPL_customer
group by user_id
