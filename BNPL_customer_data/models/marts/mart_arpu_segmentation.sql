select
    user_id,
    month_id,
    avg_monthly_revenue,
    case 
        when avg_monthly_revenue < 100000 then 'Low ARPU'
        when avg_monthly_revenue between 100000 and 200000 then 'Mid ARPU'
        else 'High ARPU'
    end as arpu_segment,
    app_version,
    direct_channel_usage_share,
    recent_recharge_freq
from stg_BNPL_customer