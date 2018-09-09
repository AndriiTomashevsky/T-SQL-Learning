USE productsdb

--select into new table called ProductSummary wich created automatic (see SQL Object Explorer)
SELECT ProductName + ' (' + Manufacturer + ')' AS ModelName, Price
INTO ProductSummary
FROM Products
 
SELECT * FROM ProductSummary