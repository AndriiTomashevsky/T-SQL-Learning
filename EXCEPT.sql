USE usersdb;

--Оператор EXCEPT позволяет найти те строки которые есть в первой выборке, но которых нет во второй.
 
SELECT FirstName, LastName
FROM Customers
EXCEPT SELECT FirstName, LastName 
FROM Employees
