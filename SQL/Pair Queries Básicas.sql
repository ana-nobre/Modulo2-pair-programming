USE northwind;

SELECT*FROM categories;
SELECT*FROM CustomerCustomerDemo;
SELECT*FROM Customers;
SELECT*FROM Employees;
SELECT*FROM Shippers;

SELECT EmployeeID, LastName, FirstName
FROM Employees;

SELECT ProductName, ProductID, UnitPrice
FROM Products
WHERE UnitPrice <= 5;

SELECT ProductName, ProductID, UnitPrice
FROM Products
WHERE UnitPrice = NULL;

SELECT*FROM products; 

SELECT ProductName, ProductID, UnitPrice
FROM Products
WHERE UnitPrice < 15 AND ProductID < 20;
-- ------------------------------------------- USAR LIMIT

SELECT ProductName, ProductID, UnitPrice
FROM Products
WHERE NOT UnitPrice < 15 AND NOT ProductID < 20;

SELECT*FROM Orders;

SELECT DISTINCT ShipCountry 
FROM Orders;

SELECT ProductName, ProductID, UnitPrice
FROM Products
WHERE ProductID <= 10;

SELECT ProductName, ProductID, UnitPrice
FROM Products
ORDER BY ProductID DESC
LIMIT 10;

SELECT DISTINCT OrderID
FROM orderdetails;

-- BONUS
SELECT*FROM orderdetails;

-- Crea una columna en esta consulta con el alias ImporteTotal:
ALTER TABLE orderdetails
ADD COLUMN ImporteTotal FLOAT;

UPDATE orderdetails
SET ImporteTotal = UnitPrice * Quantity;

SELECT*FROM orderdetails;

SELECT OrderID, ImporteTotal 
FROM orderdetails
ORDER BY ImporteTotal DESC
LIMIT 3;
