## Calculate Total Revenue
```sql
SELECT SUM(Revenue) AS TotalRevenue FROM Sales2;
```
## Calculate Total Sales by Product
```sql
SELECT ProductID, SUM(Quantity) AS TotalQuantity, SUM(Revenue) AS TotalRevenue
FROM Sales2
GROUP BY ProductID;
```

## Find Top Customers by Revenue
```sql
SELECT CustomerID, SUM(Revenue) AS TotalRevenue
FROM Sales2
GROUP BY CustomerID
ORDER BY TotalRevenue DESC
LIMIT 5;
```