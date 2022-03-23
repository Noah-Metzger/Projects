WITH RFM_raw as(

-- RFM Table (without scores)
SELECT  
    CustomerKey as CustomerID,
    DATEDIFF(dd, MAX(OrderDate), getdate()) /100 AS Recency,
    COUNT(CustomerKey) AS Frequency,
    SUM(SalesAmount) AS Monetary
FROM dbo.FactInternetSales
GROUP BY CustomerKey
),
-- Recency Score
calc_r AS (
SELECT 
  CustomerID,
  Recency,
  NTILE(3) OVER (ORDER BY Recency ASC) as R_Score
FROM RFM_raw
),

-- Frequency Score
calc_f AS (
SELECT CustomerID,
	Frequency,
	NTILE(3) OVER (ORDER BY Frequency DESC) F_Score
FROM RFM_raw),

-- Monetary Score
calc_m AS (
SELECT CustomerID,
	Monetary,
	NTILE(3) OVER (ORDER BY Monetary DESC) M_Score
FROM RFM_raw)

-- Final RFM Table With RFM Scores
SELECT
	calc_r.CustomerID,
	Recency,
	R_Score,
	Frequency,
	F_Score,
	Monetary,
	M_Score
FROM calc_r
LEFT JOIN calc_f
ON calc_r.CustomerID = calc_f.CustomerID
LEFT JOIN calc_m
ON calc_r.CustomerID = calc_m.CustomerID
WHERE M_Score < 8; -- Don't need to account for really small purchases for this analysis
