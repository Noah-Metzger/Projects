-- Cleaned Date Query
SELECT [DateKey] 
      ,[FullDateAlternateKey] AS Date
      
      ,[EnglishDayNameOfWeek] AS Day
      
      
      ,[EnglishMonthName] AS Month
	  ,LEFT([EnglishMonthName],3) AS [Month (Short)] 
      ,[MonthNumberOfYear] AS [Month Number]

	  -- "IF then statements for Quarter( i.e 1 --> Q1, 2 --> Q2 ...)
	  ,CASE 
		WHEN CalendarQuarter = 1 then 'Q1'
		WHEN CalendarQuarter = 2 then 'Q2'
		WHEN CalendarQuarter = 3 then 'Q3'
		WHEN CalendarQuarter = 4 then 'Q4'
		END AS Quarter
      ,[CalendarYear] AS Year
     
      
  FROM [AdventureWorksDW2019].[dbo].[DimDate]
  WHERE CalendarYear > = 2012; -- Want to look at most recent years of data (2012 - 14)