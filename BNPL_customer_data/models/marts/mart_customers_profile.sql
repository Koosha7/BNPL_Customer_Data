select
    user_id, age,
    sum(avg_monthly_revenue) as revenue,
    sum(bnpl_amount) as bnpl_amount,
    sum(bnpl_default) as number_of_defaults,
    avg(repayment_days_delay) as avg_repayment_days_delay,
    sum(bnpl_repeat_count) as sum_bnpl_repeat_count,
    avg(direct_channel_usage_share) as avg_direct_channel_usage,
    sum(recent_recharge_freq) as sum_recent_recharge_freq,
    sum(bundle_purchase_count) as sum_bundle_purchase_count,
    sum(case when bnpl_amount > 0 then 1 else 0 end) as bnpl_users,
from stg_BNPL_customer
group by user_id, age