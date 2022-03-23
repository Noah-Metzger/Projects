/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [SalesTerritoryKey]
--      ,[SalesTerritoryAlternateKey]
       ,[SalesTerritoryRegion] AS [Sales Territory Region]
--       ,[SalesTerritoryCountry]
--       ,[SalesTerritoryGroup]
--       ,[SalesTerritoryImage]
  FROM [AdventureWorksDW2019].[dbo].[DimSalesTerritory]