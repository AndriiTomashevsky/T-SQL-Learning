USE usersdb;
 
--Оператор INTERSECT позволяет найти общие строки для двух выборок

SELECT FirstName, LastName
FROM Employees
INTERSECT SELECT FirstName, LastName 
FROM Customers
