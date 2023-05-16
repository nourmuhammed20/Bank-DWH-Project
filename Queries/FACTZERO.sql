/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) 
      [Full_Date]
      ,[Day_Of_Week]
      ,[Day_Of_Month]
      ,[Day_Of_Year]
      ,[Week_Of_Year]
      ,[Month_Name]
      ,[Month_Number]
      ,[Quarter_Number]
      ,[Year_Number]
  FROM [DW_Bank].[dbo].[Dim_Date]

	INSERT INTO [DW_Bank].[dbo].[Dim_Date] ( [Full_Date], [Day_Of_Week], [Day_Of_Month], [Day_Of_Year], [Week_Of_Year], [Month_Name], [Month_Number], [Quarter_Number], [Year_Number])
	VALUES ( '1900-01-01', '','','','','','','','');
