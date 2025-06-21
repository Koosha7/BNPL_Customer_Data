SELECT *
FROM stg_BNPL_customer
WHERE (bnpl_default=0 AND repayment_days_delay>0) OR (bnpl_default=1 AND repayment_days_delay=0)