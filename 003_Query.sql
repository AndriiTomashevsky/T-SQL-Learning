/****************************************************************************
************************   T R A N S A C T - S Q L   ************************
************************ P R A C T I C A L   W O R K ************************
*****************************************************************************
*****  Lesson III  *****            QUERY            ************************
****************************************************************************/

USE InternetShopDB
GO

--1. ЗАПРОСЫ С JOIN.
--1) Вывести всех сотрудников, у которых День Рождения в августе.
select * from Employees e
join EmployeesInfo ei on e.ID=ei.ID
where month(BirthDate)=8
--2) Вывести информацию о заказах (клиент, дата заказа, товар, описание, цена)
--   тех клиентов, которые сделали заказ без помощи консультанта.

select c.FName+' '+c.LName as Customer,o.OrderDate,p.Name,pd.Description,od.Price from Orders o
join Customers c on o.CustomerID=c.ID
join OrderDetails od on od.OrderID=o.id
join Products p on p.ID=od.ProductID
join ProductDetails pd on pd.ID=p.ID
where o.EmployeeID is null

--3) Вывести в хронологическом порядке информацию, кто из сотрудников, каких 
--   клиентов обслуживал и дату заказа.
select e.FName+' '+e.LName Employee, c.FName+' '+c.LName Customer,o.OrderDate from Employees e
join Orders o on o.EmployeeID=e.ID
join Customers c on c.ID=o.CustomerID
order by o.OrderDate

--4) Вывести продажи за последние два месяца (дата заказа, клиент, товар,
--   описание, количество, сумма) в хронологическом порядке.
--5) Вывести клиентов, которые покупали ноутбуки или нетбуки за последний месяц, 
--   цена которых была больше 400$.
--6) Вывести информацию о покупках смартфонов (день заказа, продукт, описание, 
--   цена), в список не включать iPhone 6.

--2. ЗАПРОСЫ С JOIN И АГРЕГАТНЫМИ ФУНКЦИЯМИ.
--1) Вывести статистику продаж (общую сумму) по каждому из сотрудников за весь период.
select e.FName+' '+e.LName as Emplooyee, SUM(od.TotalPrice) TotalPrice from Employees e
left join Orders o on e.ID=o.EmployeeID
left join OrderDetails od on od.OrderID=o.ID
group by e.FName,e.LName 
--2) Вывести статистику продаж (общую сумму) по каждому из сотрудников за последний месяц.
select e.FName+' '+e.LName as Emplooyee, SUM(od.TotalPrice) TotalPrice from Employees e
left join Orders o on e.ID=o.EmployeeID and o.OrderDate>=DATEADD(MONTH,-1,GETDATE())
left join OrderDetails od on od.OrderID=o.ID
group by e.FName,e.LName 
--3) Вывести статистику продаж по товарам (общее количество и сумма продаж, мин, макс 
--   и среднюю цену) в порядке убывания по сумме.
select p.Name, SUM(od.Qty) Qty, SUM(od.TotalPrice) TotalSold, MIN(od.Price) min,
MAX(od.Price) max, AVG(od.Price) FalceAvg from Products p
left join OrderDetails od on od.ProductID=p.ID
group by p.Name
order by TotalSold desc

--4) Вывести статистику продаж по городам (общая сумма, средняя сумма и количество заказов).
select c.City, SUM(od.TotalPrice) TotalSold, AVG(od.TotalPrice) avg, COUNT(o.ID) Count from Customers c
left join Orders o on o.CustomerID=c.ID
left join OrderDetails od on od.OrderID=o.ID
group by c.City

select * from Customers c
left join Orders o on o.CustomerID=c.ID
left join OrderDetails od on od.OrderID=o.ID

select o.ID, c.City, SUM(od.TotalPrice) TotalSold, AVG(od.TotalPrice) avg, COUNT(o.ID) Count from Customers c
left join Orders o on o.CustomerID=c.ID
left join OrderDetails od on od.OrderID=o.ID
group by c.City, o.ID



