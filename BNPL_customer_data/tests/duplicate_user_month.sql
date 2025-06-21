SELECT *
FROM (SELECT row_number() over (partition by user_id||month_id order by 1 desc) as rnk
        FROM stg_BNPL_customer)
WHERE rnk>1