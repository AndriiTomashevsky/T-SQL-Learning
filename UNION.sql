USE usersdb;
 
CREATE TABLE Customers
(
    Id INT IDENTITY PRIMARY KEY,
    FirstName NVARCHAR(20) NOT NULL,
    LastName NVARCHAR(20) NOT NULL,
    AccountSum MONEY
);
CREATE TABLE Employees
(
    Id INT IDENTITY PRIMARY KEY,
    FirstName NVARCHAR(20) NOT NULL,
    LastName NVARCHAR(20) NOT NULL,
);
INSERT INTO Customers VALUES
('Tom', 'Smith', 2000),
('Sam', 'Brown', 3000),
('Mark', 'Adams', 2500),
('Paul', 'Ins', 4200),
('John', 'Smith', 2800),
('Tim', 'Cook', 2800)
INSERT INTO Employees VALUES
('Homer', 'Simpson'),
('Tom', 'Smith'),
('Mark', 'Adams'),
('Nick', 'Svensson')

--Оператор UNION позволяет соединить два однотипных набора в один.

--Выбираем значения, которые есть в обеих таблицах без дубликатов 
SELECT FirstName, LastName
FROM Customers UNION SELECT FirstName, LastName FROM Employees

--Выбираем значения, которые есть в обеих таблицах c дубликатами 
SELECT FirstName, LastName
FROM Customers UNION ALL SELECT FirstName, LastName FROM Employees


--При этом названия столбцов объединенной выборки будут совпадать с названия столбцов 
--первой выборки. И если мы захотим при этом еще произвести сортировку, то в выражениях 
--ORDER BY необходимо ориентироваться именно на названия столбцов первой выборки:
SELECT FirstName + ' ' +LastName AS FullName
FROM Customers
UNION SELECT FirstName + ' ' + LastName AS EmployeeName 
FROM Employees
ORDER BY FullName DESC

--Объединять выборки можно и из одной и той же таблицы. Например, в зависимости от суммы 
--на счете клиента нам надо начислять ему определенные проценты:
SELECT FirstName, LastName, AccountSum + AccountSum * 0.1 AS TotalSum 
FROM Customers WHERE AccountSum < 3000
UNION SELECT FirstName, LastName, AccountSum + AccountSum * 0.3 AS TotalSum 
FROM Customers WHERE AccountSum >= 3000