-- models/staging/stg_BNPL_customer.sql

with source as (
    select *, T.user_id||T.month_id as user_and_month
    from raw_data T
),

cleaned as (
    select *,
    cast(row_number() over (partition by user_and_month order by user_id desc nulls last) as smallint) as row_num
    from source
    where user_id is not null and try_cast(user_id as integer) is not null
),

final as (
    select cast(user_id as integer) as user_id,
        month_id,
        age,
        try_cast(avg_monthly_revenue as double) as avg_monthly_revenue,
        try_cast(bnpl_amount as double) as bnpl_amount,
        bnpl_default,
        repayment_days_delay,
        bnpl_repeat_count,
        direct_channel_usage_share,
        recent_recharge_freq,
        bundle_purchase_count,
        app_version
    from cleaned
    where row_num=1
)


select *
from final

