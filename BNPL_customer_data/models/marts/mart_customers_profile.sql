Select user_id, age, sum(avg_monthly_revenue) as revenue, sum(bnpl_amount) as bnpl_amount, sum(bnpl_default) as number_of_defaults,
        avg(repayment_days_delay) as avg_repayment_days_delay, sum(bnpl_repeat_count) as sum_bnpl_repeat_count
from stg_BNPL_customer
group by user_id, age