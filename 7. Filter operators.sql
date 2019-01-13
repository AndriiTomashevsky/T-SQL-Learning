SELECT * FROM Products
WHERE Manufacturer IN ('Samsung', 'Xiaomi', 'Huawei')

SELECT * FROM Products
WHERE Manufacturer = 'Samsung' OR Manufacturer = 'Xiaomi' OR Manufacturer = 'Huawei'

SELECT * FROM Products
WHERE Manufacturer NOT IN ('Samsung', 'Xiaomi', 'Huawei')

SELECT * FROM Products
WHERE Price BETWEEN 20000 AND 40000

SELECT * FROM Products
WHERE Price NOT BETWEEN 20000 AND 40000

SELECT * FROM Products
WHERE Price * ProductCount BETWEEN 100000 AND 200000

SELECT * FROM Products
WHERE ProductName LIKE 'iPhone [6-8]%'

