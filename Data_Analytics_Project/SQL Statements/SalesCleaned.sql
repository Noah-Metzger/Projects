-- Cleaned Sales Query
SELECT [ProductKey]
      ,[OrderDateKey]
--	      ,[DueDateKey]
--	      ,[ShipDateKey]
      ,[CustomerKey]
--	      ,[PromotionKey]
--	      ,[CurrencyKey]
      ,[SalesTerritoryKey]
--	      ,[SalesOrderNumber]
--	      ,[SalesOrderLineNumber]
--	      ,[RevisionNumber]
--	      ,[OrderQuantity] AS [Order Quantity]
--	      ,[UnitPrice]
--	      ,[ExtendedAmount]
--	      ,[UnitPriceDiscountPct]
--	      ,[DiscountAmount]
--	      ,[ProductStandardCost]
--	      ,[TotalProductCost]
      ,[SalesAmount] AS [Sales Amount]
--	      ,[TaxAmt]
--	      ,[Freight]
--	      ,[CarrierTrackingNumber]
--	     ,[CustomerPONumber]
      ,[OrderDate] AS [Order Date]
--	      ,[DueDate]
--	      ,[ShipDate]
	  
  FROM [AdventureWorksDW2019].[dbo].[FactInternetSales] AS Sales
  LEFT JOIN dbo.DimDate As D ON Sales.OrderDateKey = D.DateKey
  

  WHERE  D.CalendarYear > = 2012; -- Limits orders to more recent years ( 2012- 2014)