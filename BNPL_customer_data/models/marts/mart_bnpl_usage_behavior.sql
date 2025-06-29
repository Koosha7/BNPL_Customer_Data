with usage_behavior as (
    select
        month_id, user_id,
        case when bnpl_amount > 0 then 'BNPL' else 'Non-BNPL' end as used_bnpl,
        recent_recharge_freq,
        direct_channel_usage_share,
        bundle_purchase_count
    from stg_BNPL_customer
)

select
    month_id, used_bnpl,
    avg(recent_recharge_freq) as avg_recharge,
    avg(direct_channel_usage_share) as avg_direct_channel,
    avg(bundle_purchase_count) as avg_bundle_count
from usage_behavior
group by month_id, used_bnpl