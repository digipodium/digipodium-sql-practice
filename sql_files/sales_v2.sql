CREATE TABLE Sales2 (
    CustomerID INT,
    ProductID CHAR(1),
    PurchaseDate DATE,
    Quantity INT,
    Revenue DECIMAL(10, 2)
);

INSERT INTO Sales (CustomerID, ProductID, PurchaseDate, Quantity, Revenue)
VALUES
    (1, 'A', '2023-01-01', 5, 100),
    (2, 'B', '2023-01-02', 3, 50),
    (3, 'A', '2023-01-03', 2, 30),
    (4, 'C', '2023-01-03', 1, 20),
    (1, 'B', '2023-01-04', 4, 80);