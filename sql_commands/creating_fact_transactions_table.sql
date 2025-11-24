select tr.transaction_id, tr.customer_id, db.branch_key, tr.amount, dd.date_key
INTO fact_transactions
from dbo.stg_transactions tr
inner join dbo.stg_branch_logs bl ON tr.customer_id = bl.customer_id AND tr.date = bl.date AND bl.transaction_type = tr.type
inner join dbo.dim_branch db ON db.branch_name = bl.branch_name
inner join dbo.dim_date dd ON tr.date = dd.date;

select * from fact_transactions

