CREATE TABLE stg_transactions (
    transaction_id VARCHAR(10),
    customer_id VARCHAR(10),
    date DATE,
    amount DECIMAL(18,2),
    type VARCHAR(50)
);


bulk insert dbo.stg_transactions
from 'C:\Users\Mukhammad\Downloads\bank_project\SQL_FILE\transactions.csv'
WITH (
	FORMAT = 'CSV',
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n',
	TABLOCK
)

SELECT TOP 10 * FROM stg_transactions;