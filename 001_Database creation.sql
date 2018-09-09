CREATE DATABASE InternetShopDb
GO

USE master;  
GO  
ALTER DATABASE InternetShopDb
COLLATE Cyrillic_General_CI_AS;
GO  

ALTER DATABASE InternetShopDb
SET SINGLE_USER WITH ROLLBACK IMMEDIATE
GO  



CREATE TABLE Customers
(ID int NOT NULL IDENTITY,
FName nvarchar(20) NULL,
MName nvarchar(20) NULL,
LName nvarchar(20) NULL,
[Address] nvarchar(20) NULL,
City nvarchar(20) NULL,
Phone char(12) NULL,
DateInSystem date DEFAULT GETDATE()
)
GO

CREATE TABLE Employees
(
	ID int NOT NULL IDENTITY,
	FName nvarchar(20) NOT NULL,
	MName nvarchar(20) NULL,
	LName nvarchar(20) NOT NULL,
	Post  nvarchar(25) NOT NULL,
	Salary money NOT NULL,
	PriorSalary money NULL
)  
GO

CREATE TABLE EmployeesInfo
(                                      
	ID int NOT NULL,  
	MaritalStatus varchar(10) NOT NULL,
	BirthDate date NOT NULL, 
	[Address] nvarchar(50) NOT NULL,
	Phone char(12) NOT NULL
)
GO	

CREATE TABLE Products
(
	ID int NOT NULL IDENTITY,
	Name nvarchar(50) NOT NULL,          
)
GO

CREATE TABLE ProductDetails
(
	ID int NOT NULL,
	Color nchar(20) NULL,
    [Description] nvarchar(max) NULL,     
)
GO

CREATE TABLE Stocks
(
	ProductID int NOT NULL,
	Qty int DEFAULT 0
)
GO

CREATE TABLE Orders
(
	ID int NOT NULL IDENTITY,
	CustomerID int NULL,  
	EmployeeID int NULL,
	OrderDate date DEFAULT GETDATE()
)  
GO

CREATE TABLE OrderDetails
(
	OrderID int NOT NULL,
	LineItem int NOT NULL,
	ProductID int NULL,
	Qty int NOT NULL,
	Price money NOT NULL,
	TotalPrice AS CONVERT(money, Qty*Price) 
)  
GO

ALTER TABLE Customers
ADD
PRIMARY KEY(ID)

ALTER TABLE Employees
ADD
PRIMARY KEY(ID)
GO

ALTER TABLE EmployeesInfo
ADD
UNIQUE(ID)
GO

ALTER TABLE EmployeesInfo
ADD
FOREIGN KEY (ID) REFERENCES Employees (ID)
ON DELETE CASCADE
GO

ALTER TABLE Products
ADD
PRIMARY KEY(ID)
GO

ALTER TABLE ProductDetails
ADD
PRIMARY KEY(ID)
GO

ALTER TABLE ProductDetails
ADD
FOREIGN KEY (ID) REFERENCES Products (ID)
ON DELETE CASCADE
GO

ALTER TABLE Stocks
ADD
UNIQUE (ProductID)
GO

ALTER TABLE Stocks
ADD
FOREIGN KEY (ProductID) REFERENCES Products (ID)
ON DELETE CASCADE
GO

ALTER TABLE Orders
ADD
PRIMARY KEY (ID)
GO

ALTER TABLE Orders
ADD
FOREIGN KEY (CustomerID) REFERENCES Customers(ID)
ON DELETE SET NULL
GO

ALTER TABLE Orders
ADD
FOREIGN KEY (EmployeeID) REFERENCES Employees(ID)
ON DELETE SET NULL
GO

ALTER TABLE OrderDetails
ADD
PRIMARY KEY(OrderId, LineItem)
GO

ALTER TABLE OrderDetails
ADD
FOREIGN KEY(OrderID) REFERENCES Orders(ID)
ON DELETE CASCADE
GO

ALTER TABLE OrderDetails
ADD
FOREIGN KEY(ProductID) REFERENCES Products(ID)
ON DELETE SET NULL
GO






