CREATE TABLE Products (
  productID INT PRIMARY KEY,
  productName VARCHAR(50),
  price DECIMAL(10, 2)
);

INSERT INTO Products (productID, productName, price) VALUES
  (1, 'Apple', 2.5),
  (2, 'Banana', 1.5),
  (3, 'Orange', 3.0),
  (4, 'Mango', 2.0);

CREATE TABLE Orders (
  orderID INT PRIMARY KEY,
  productID INT,
  quantity INT,
  sales DECIMAL(10, 2)
);

INSERT INTO Orders (orderID, productID, quantity, sales) VALUES
  (1, 1, 10, 25.0),
  (2, 1, 5, 12.5),
  (3, 2, 8, 12.0),
  (4, 3, 12, 36.0),
  (5, 4, 6, 12.0);