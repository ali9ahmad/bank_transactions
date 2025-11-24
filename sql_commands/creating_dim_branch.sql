CREATE TABLE dim_branch(
	branch_key varchar(10),
	branch_name varchar(50)
);

WITH distinct_branch_names_CTE as (
	SELECT DISTINCT branch_name
	FROM [dbo].[stg_branch_logs]
)

INSERT INTO dim_branch (branch_key, branch_name)
SELECT
	'B' + CAST(ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS VARCHAR(10)) AS branch_key,
	branch_name
FROM distinct_branch_names_CTE



SELECT * FROM [dbo].[stg_branch_logs]
SELECT * FROM dim_branch

