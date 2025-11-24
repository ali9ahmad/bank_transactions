--use bank_2025_transactions

-- first we get our first look of the file
select COUNT(*) from 
[dbo].[bank_customers];

select *
FROM [dbo].[bank_customers];

-- after checking if all is on place we start workign with file.
-- first we check if we have any 0 AMOUNT cells/rows
DELETE
from [dbo].[bank_customers]
where income = 0;

--NOW WE CHECK IF THE AGE COLUMND HAS RIGHT DATA
--IT SHOULD NOT BE LOWER THAN 18

DELETE
FROM  [dbo].[bank_customers]
WHERE age < 18

--NOW WE CHECK IF THE AGE BIGGER THAN 70
DELETE
FROM  [dbo].[bank_customers]
WHERE age > 70

--NOW WE CHECK FOR IF THERE IS ANY NEGATIVE BALANCE IN INCOME COLUMN
DELETE
FROM [dbo].[bank_customers]
WHERE income <= 0;

--THE SAME PROCESS FOR BALANCE
DELETE
FROM [dbo].[bank_customers]
WHERE account_balance <= 0;

--NOW WE CHECK FOR NULL VALUE OR EMPTY CELLS
DELETE
FROM [dbo].[bank_customers]
WHERE name IS NULL 
   OR name = '';
   --OR income = ''
   --OR account_balance = ''
   --OR age = '';
