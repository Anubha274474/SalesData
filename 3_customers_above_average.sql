-- Query: Find Customers with Purchase Above Average
SELECT 
    CustomerID,
    Name,
    Age,
    City,
    PurchaseAmount,
    PurchaseDate,
    ROUND(PurchaseAmount - (SELECT AVG(PurchaseAmount) FROM SalesData), 2) as AmountAboveAverage
FROM SalesData
WHERE PurchaseAmount > (SELECT AVG(PurchaseAmount) FROM SalesData)
ORDER BY PurchaseAmount DESC;