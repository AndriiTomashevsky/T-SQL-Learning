use productsdb

--ordering by column ProductName

SELECT *
FROM Products
ORDER BY ProductName

--ordering by alas column TotalSum
SELECT ProductName, ProductCount * Price AS TotalSum
FROM Products
ORDER BY TotalSum

--descending ordering
SELECT ProductName
FROM Products
ORDER BY ProductName DESC

--ordering by multiple columns
SELECT ProductName, Price, Manufacturer
FROM Products
ORDER BY Manufacturer, ProductName

SELECT ProductName, Price, ProductCount
FROM Products
ORDER BY ProductCount * Price
