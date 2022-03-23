-- Cleaned Customer Query
---- Ordered List of Customers

SELECT TOP (1000) [CustomerKey] AS [Customer ID]
--			,[GeographyKey] 
--			,[CustomerAlternateKey]
--			,[Title]
      ,[FirstName] AS [First Name]
--			,[MiddleName]
      ,[LastName] AS [Last Name]
--			,[NameStyle]
--			,[BirthDate]
--			,[MaritalStatus]
--			,[Suffix]
      ,CASE WHEN Gender = 'M' THEN 'Male' WHEN Gender = 'F' THEN 'Female' END AS Gender
--	       ,[EmailAddress]
--	       ,[YearlyIncome]
--	       ,[TotalChildren]
--	       ,[NumberChildrenAtHome]
--	       ,[EnglishEducation]
-- 	       ,[SpanishEducation]
--	       ,[FrenchEducation]
--	       ,[EnglishOccupation]
--	       ,[SpanishOccupation]
--	       ,[FrenchOccupation]
--	       ,[HouseOwnerFlag]
--	       ,[NumberCarsOwned]
--	       ,[AddressLine1]
--	       ,[AddressLine2]
--	       ,[Phone]
--	       ,[DateFirstPurchase]
--	       ,[CommuteDistance]
		,GEO.City AS City
		,GEO.StateProvinceName AS [ State Province Name]
  FROM [AdventureWorksDW2019].[dbo].[DimCustomer] AS Customer
  LEFT JOIN dbo.DimGeography AS GEO ON GEO.GeographyKey = Customer.GeographyKey
  ORDER BY [Customer ID];