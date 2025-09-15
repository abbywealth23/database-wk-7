-- Question 1
-- Create a new normalized table
CREATE TABLE ProductDetail_1NF (
  OrderID INT,
  CustomerName VARCHAR(100),
  Product VARCHAR(100)
);

-- Insert normalized rows (one product per row)
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES
  (101, 'John Doe', 'Laptop'),
  (101, 'John Doe', 'Mouse'),
  (102, 'Jane Smith', 'Tablet'),
  (102, 'Jane Smith', 'Keyboard'),
  (102, 'Jane Smith', 'Mouse'),
  (103, 'Emily Clark', 'Phone');

-- Question 2
-- Create a Customers table (OrderID → CustomerName)
CREATE TABLE Customers (
  OrderID INT PRIMARY KEY,
  CustomerName VARCHAR(100)
);

-- Insert unique customer info
INSERT INTO Customers (OrderID, CustomerName)
VALUES
  (101, 'John Doe'),
  (102, 'Jane Smith'),
  (103, 'Emily Clark');

-- Create a new OrderDetails table (OrderID + Product → Quantity)
CREATE TABLE OrderDetails_2NF (
  OrderID INT,
  Product VARCHAR(100),
  Quantity INT,
  PRIMARY KEY (OrderID, Product),
  FOREIGN KEY (OrderID) REFERENCES Customers(OrderID)
);

-- Insert normalized order details
INSERT INTO OrderDetails_2NF (OrderID, Product, Quantity)
VALUES
  (101, 'Laptop', 2),
  (101, 'Mouse', 1),
  (102, 'Tablet', 3),
  (102, 'Keyboard', 1),
  (102, 'Mouse', 2),
  (103, 'Phone', 1);
