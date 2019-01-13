SELECT *
FROM Products
ORDER BY ProductName

SELECT ProductName, ProductCount * Price AS TotalSum
FROM Products
ORDER BY TotalSum

SELECT ProductName
FROM Products
ORDER BY ProductName DESC

SELECT ProductName
FROM Products
ORDER BY ProductName ASC

SELECT ProductName, Price, Manufacturer
FROM Products
ORDER BY Manufacturer, ProductName

SELECT ProductName, Price, Manufacturer
FROM Products
ORDER BY Manufacturer ASC, ProductName DESC

SELECT ProductName, Price, ProductCount
FROM Products
ORDER BY ProductCount * Price