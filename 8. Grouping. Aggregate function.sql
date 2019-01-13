SELECT * FROM Products

SELECT AVG(Price) AS Average_Price FROM Products

SELECT AVG(Price) FROM Products

SELECT AVG(Price) FROM Products
WHERE Manufacturer='Apple'

SELECT AVG(Price * ProductCount) FROM Products

SELECT COUNT(*) FROM Products

SELECT COUNT(Manufacturer) FROM Products

SELECT * FROM Products

SELECT MIN(Price) FROM Products

SELECT * FROM Products

SELECT MAX(Price) FROM Products

SELECT SUM(ProductCount) FROM Products

SELECT SUM(ProductCount * Price) FROM Products

SELECT * FROM Products

SELECT AVG(DISTINCT ProductCount) AS Average_Price FROM Products

SELECT AVG(ProductCount) AS Average_Price FROM Products

SELECT AVG(ALL ProductCount) AS Average_Price FROM Products

SELECT * FROM Products

SELECT COUNT(*) AS ProdCount,
       SUM(ProductCount) AS TotalCount,
       MIN(Price) AS MinPrice,
       MAX(Price) AS MaxPrice,
       AVG(Price) AS AvgPrice
FROM Products