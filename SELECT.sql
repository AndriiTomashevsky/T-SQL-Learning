--select all columns and rows from table Products
use productsdb
select * from Products

--select two specific columns Productname and Price from table Products
select productname, price from Products

--select with arithmetic operations
select productname +' ('+ manufacturer+')',Price,Price*ProductCount
from Products