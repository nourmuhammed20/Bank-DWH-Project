/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [payment_id]
      ,[branch_id]
      ,[date_id2]
      ,[amount]
  FROM [DW_Bank].[dbo].[Payment_fact]

SELECT [date_id2], [branch_id], SUM([amount]) AS total_amount
FROM [DW_Bank].[dbo].[Payment_fact]
WHERE [date_id2] BETWEEN '2012-01-01' AND '2015-12-31'
GROUP BY [date_id2], [branch_id]
HAVING COUNT(*) > 0
ORDER BY total_amount DESC;

