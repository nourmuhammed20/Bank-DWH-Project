/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [LOAN_SK]
      ,[loan_id]
      ,[branch_id]
      ,[date_id2]
      ,[loan_type]
      ,[loan_amount]
  FROM [DW_Bank].[dbo].[FACT_LOAN]

SELECT [loan_type], SUM([loan_amount]) AS total_amount
FROM [DW_Bank].[dbo].[FACT_LOAN]
GROUP BY [loan_type]
ORDER BY total_amount DESC;

SELECT  [branch_id], COUNT(*) AS total_loans
FROM [DW_Bank].[dbo].[FACT_LOAN]
WHERE [date_id2] BETWEEN '2010-01-01' AND '2020-12-31'
GROUP BY [branch_id]
ORDER BY total_loans DESC;
