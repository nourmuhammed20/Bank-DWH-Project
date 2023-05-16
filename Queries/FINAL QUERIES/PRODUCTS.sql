/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [account_id]
      ,[product_id]
      ,[date_id2]
      ,[amount]
  FROM [DW_Bank].[dbo].[FACT_Treasury_PRODUCT]

  SELECT [product_id], SUM([amount]) AS total_amount
FROM [DW_Bank].[dbo].[FACT_Treasury_PRODUCT]
GROUP BY [product_id]
ORDER BY total_amount DESC;
