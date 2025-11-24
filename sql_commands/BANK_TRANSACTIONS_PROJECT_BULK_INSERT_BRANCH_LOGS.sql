drop table stg_branch_logs;

CREATE TABLE stg_branch_logs (
    account_id VARCHAR(20),
    customer_id VARCHAR(20),
	branch_name VARCHAR(50),
    date DATE,
    transaction_type VARCHAR(50),
    amount DECIMAL(18,2)
);


BULK INSERT dbo.stg_branch_logs
from 'C:\Users\Mukhammad\Downloads\bank_project\SQL_FILE\branch_logs.csv'
WITH (
	FORMAT = 'CSV',
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n',
	TABLOCK
)


UPDATE stg_branch_logs
set branch_name = REPLACE(branch_name, 'Branch', '')

UPDATE stg_branch_logs
SET branch_name = RTRIM(branch_name)

SELECT * FROM stg_branch_logs;