CREATE TABLE Sales (
    ProductID INT,
    ProductName VARCHAR(50),
    SellingPrice DECIMAL(10, 2)
);

INSERT INTO Sales (ProductID, ProductName, SellingPrice)
VALUES (1, 'Product A', 100),
       (2, 'Product B', 150),
       (1, 'Product A', 120),
       (3, 'Product C', 200),
       (2, 'Product B', 180),
       (1, 'Product A', 90),