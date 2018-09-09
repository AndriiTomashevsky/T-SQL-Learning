USE productsdb;
 
--LEFT JOIN: выборка будет содержать все строки из первой или левой таблицы.
--с дубликатами.
--После LEFT JOIN указывается присоединяемая таблица.
--Так как здесь используется выборка по левой таблице, то вначале будут выбираться 
--все строки из Orders, а затем к ним будут добавляться связанные строки из Customers
SELECT FirstName, CreatedAt, ProductCount, Price, ProductId 
FROM Orders LEFT JOIN Customers ON Orders.CustomerId = Customers.Id

--Inner Join объединяет строки из дух таблиц при соответствии условию. Если одна 
--из таблиц содержит строки, которые не соответствуют этому условию, то данные строки 
--не включаются в выходную выборку. Left Join выбирает все строки первой таблицы 
--и затем присоединяет к ним строки правой таблицы. К примеру, возьмем таблицу Customers 
--и добавим к покупателям информацию об их заказах.
--Поскольку один из покупателей из таблицы Customers не имеет связанных заказов 
--из Orders, то соответствующие столбцы, которые берутся из Orders, будут иметь 
--значение NULL.

-- INNER JOIN
SELECT FirstName, CreatedAt, ProductCount, Price 
FROM Customers JOIN Orders ON Orders.CustomerId = Customers.Id
 
--LEFT JOIN
SELECT FirstName, CreatedAt, ProductCount, Price 
FROM Customers LEFT JOIN Orders ON Orders.CustomerId = Customers.Id

--Используем левостороннее соединение для добавления к заказам информации 
--о пользователях и товарах:

SELECT Customers.FirstName, Orders.CreatedAt, Products.ProductName, Products.Manufacturer
FROM Orders LEFT JOIN Customers ON Orders.CustomerId = Customers.Id
			LEFT JOIN Products ON Orders.ProductId = Products.Id

--RIGHT JOIN: выборка будет содержать все строки из второй или правой таблицы
--Изменим в примере выше тип соединения на правостороннее.
--Теперь будут выбираться все строки из Orders, а к ним уже будет присоединяться 
--связанные по условию строки из таблицы Customers:

SELECT FirstName, CreatedAt, ProductCount, Price, ProductId 
FROM Customers RIGHT JOIN Orders ON Orders.CustomerId = Customers.Id