-- Query 1: Sales per City (All Cities)
SELECT 
    City,
    COUNT(*) as TotalTransactions,
    SUM(PurchaseAmount) as TotalRevenue,
    AVG(PurchaseAmount) as AverageTransaction,
    MIN(PurchaseAmount) as MinPurchase,
    MAX(PurchaseAmount) as MaxPurchase
FROM SalesData
GROUP BY City
ORDER BY TotalRevenue DESC;

-- Query 2: Top 5 Cities by Revenue
SELECT 
    City,
    COUNT(*) as TotalTransactions,
    SUM(PurchaseAmount) as TotalRevenue,
    AVG(PurchaseAmount) as AverageTransaction
FROM SalesData
GROUP BY City
ORDER BY TotalRevenue DESC
LIMIT 5;