drop table dim_date;

CREATE TABLE dim_date (
    date_key int,
    date DATE,
    year int,
    month int,
    day int,
    quarter int,
	day_name VARCHAR(50),
    month_name VARCHAR(50),
);


BULK INSERT dbo.dim_date
from 'C:\Users\Mukhammad\Downloads\bank_project\SQL_FILE\dim_date.csv'
WITH (
	FORMAT = 'CSV',
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n',
	TABLOCK
)

SELECT TOP 10 * FROM dim_date



