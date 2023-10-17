## Average Selling Price
```sql
SELECT
    ProductName,
    AVG(SellingPrice) AS AverageSellingPrice
FROM
    Sales
GROUP BY
    ProductName;
```

**explaination**:

 The AVG function computes the sum of all selling prices for a specific product and divides this total by the number of sales, resulting in the average selling price. To provide a clear column name in the output, we used the “AS AverageSellingPrice” alias. By grouping the results using the GROUP BY clause based on the ProductName column