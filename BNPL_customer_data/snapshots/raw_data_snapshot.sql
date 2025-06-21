{% snapshot raw_data_snapshot %}
{{
  config(
    target_schema='snapshots',
    unique_key='user_id',
    strategy='check',
    check_cols=['user_id', 'month_id']
  )
}}

SELECT * FROM raw_data

{% endsnapshot %}
