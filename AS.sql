--change or using alas for output column name 
USE productsdb;
select productname +' ('+ manufacturer+')'as ModelName, Price, Price*ProductCount as TotalSum
from Products