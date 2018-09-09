USE productsdb;
 
CREATE TABLE Products
(
    Id INT IDENTITY PRIMARY KEY,
    ProductName NVARCHAR(30) NOT NULL,
    Manufacturer NVARCHAR(20) NOT NULL,
    ProductCount INT DEFAULT 0,
    Price MONEY NOT NULL
);
CREATE TABLE Customers
(
    Id INT IDENTITY PRIMARY KEY,
    FirstName NVARCHAR(30) NOT NULL
);
CREATE TABLE Orders
(
    Id INT IDENTITY PRIMARY KEY,
    ProductId INT NOT NULL REFERENCES Products(Id) ON DELETE CASCADE,
    CustomerId INT NOT NULL REFERENCES Customers(Id) ON DELETE CASCADE,
    CreatedAt DATE NOT NULL,
    ProductCount INT DEFAULT 1,
    Price MONEY NOT NULL
);
INSERT INTO Products 
VALUES ('iPhone 6', 'Apple', 2, 36000),
('iPhone 6S', 'Apple', 2, 41000),
('iPhone 7', 'Apple', 5, 52000),
('Galaxy S8', 'Samsung', 2, 46000),
('Galaxy S8 Plus', 'Samsung', 1, 56000),
('Mi 5X', 'Xiaomi', 2, 26000),
('OnePlus 5', 'OnePlus', 6, 38000)
INSERT INTO Customers VALUES ('Tom'), ('Bob'),('Sam')
INSERT INTO Orders 
VALUES
( 
    (SELECT Id FROM Products WHERE ProductName='Galaxy S8'), 
    (SELECT Id FROM Customers WHERE FirstName='Tom'),
    '2017-07-11',  
    2, 
    (SELECT Price FROM Products WHERE ProductName='Galaxy S8')
),
( 
    (SELECT Id FROM Products WHERE ProductName='iPhone 6S'), 
    (SELECT Id FROM Customers WHERE FirstName='Tom'),
    '2017-07-13',  
    1, 
    (SELECT Price FROM Products WHERE ProductName='iPhone 6S')
),
( 
    (SELECT Id FROM Products WHERE ProductName='iPhone 6S'), 
    (SELECT Id FROM Customers WHERE FirstName='Bob'),
    '2017-07-11',  
    1, 
    (SELECT Price FROM Products WHERE ProductName='iPhone 6S')
)

--Для явного соединения данных из двух таблиц применяется оператор JOIN.
--После оператора JOIN идет название второй таблицы, из которой надо добавить данные в выборку.
--Выберем все заказы и добавим к ним информацию о товарах
--Поскольку таблицы могут содержать столбцы с одинаковыми названиями,то при указании
--столбцов для выборки указывается их полное имя вместе с именем таблицы
SELECT Orders.CreatedAt, Orders.ProductCount, Products.ProductName 
FROM Orders JOIN Products ON Products.Id = Orders.ProductId

--Также используя псевдонимы, мы можем сократить код:
SELECT O.CreatedAt, O.ProductCount, P.ProductName 
FROM Orders AS O JOIN Products AS P ON P.Id = O.ProductId

--Мы можем присоединять и другие таблицы. 
--Например, добавим к заказу информацию о покупателе из таблицы Customers:
SELECT Orders.CreatedAt, Customers.FirstName, Products.ProductName 
FROM Orders JOIN Products ON Products.Id = Orders.ProductId 
			JOIN Customers ON Customers.Id=Orders.CustomerId

--Условия после ключевого слова ON могут быть более сложными по составу.
--В данном случае выбираем все заказы на товары, производителем которых является Apple.
SELECT Orders.CreatedAt, Customers.FirstName, Products.ProductName 
FROM Orders JOIN Products ON Products.Id = Orders.ProductId AND Products.Manufacturer='Apple'
			JOIN Customers ON Customers.Id=Orders.CustomerId
ORDER BY Customers.FirstName