/****************************************************************************
************************   T R A N S A C T - S Q L   ************************
************************ P R A C T I C A L   W O R K ************************
*****************************************************************************
*****  Lesson IV  ******      SUBQUERY. FUNCTION     ************************
****************************************************************************/

USE InternetShopDB
GO

--1) ������� ����� �����������, � ������� ���� 4 � ����� ������� �� ��� ����� (��������� ���������).
select stable.Name, COUNT(stable.Name) Orders from (select o.ID, e.FName+' '+e.LName Name from Employees e
join Orders o on o.EmployeeID=e.ID) stable
group by stable.Name
HAVING COUNT(stable.Name)>=4

select  e.FName+' '+e.LName Name, 
(select COUNT(o.ID) Count from Orders o where o.EmployeeID=e.ID having COUNT(o.ID) >=4) 
from Employees e


--2) ������� ������ �����������, � ������� ������� ����� ������ ������ ��� ������� �������� �� ���� �������.


select inner_table.LName, AVG(inner_table.Total) AVGTotalPrice from (Select o.ID, c.LName, SUM(od.TotalPrice) Total from Customers c 
join Orders o on o.CustomerID=c.ID
join OrderDetails od on od.OrderID=o.id
GROUP BY o.Id, c.LName) inner_table
group by inner_table.LName
Having AVG(inner_table.Total)>(select AVG(inner_table.Total) from (select od.OrderID, SUM(od.TotalPrice) Total from OrderDetails od
group by od.OrderID) inner_table)








--3) ����� ������� ����� ������� �� ��������� ���� �������. 
--4) ������� ������� ���������� ����� ������� ��� ��������� ����������� �������. 
--   ������� ��������� ��� ��������� - ���� ������ � ����� �������, �� ������� ��������� ������������. 
--   ������� ���������� ������ ��������� ������ �������. 
--5) ����� ������� �� ����� ����� ���������, ������� ������� ����� �������������� � ���������, 
--   ������� ���������������� ������� ������������.
--   �����, �����, ����� ����������� �������, ������� ����� ���������� "��������" ������� � ��������� ���
--   ��������� (@DateFrom, @DateTo). �����, �� ������ ���������� ������� � ������� � ������� ����������� ������.
--   ���������� ������ ���������� ����. 
--6) �������� �������, ������� ����� ���������� ������� ���������� ID ��������, ����� ��������� ���������� ��������,
--   ����� ����� � ������� ����.
--7) ������� ������ �������� � �� ������� ����, ������� ��������� ������� ��������� ������� ��������� ��������.
--   ������ ���������� �������:
--   ��� ��� ���� �� ���� � ��� �� ������� ����������, ���������� ����� ������� �� ������� ��������, � ����� �� 
--   ���� ������� ��������� ������� �� ������ ������ ��������� (� ������ ������ ��� ������: �������� � �������).
--8) ����� ������� ������� ���� ��������� � ��������, �.e. �� ������� � ������� ������� ����� ������, ��� ������.
--9) ������� �����������, ������������, ������� ���� ������ �� ������� ������, ���������� �������� �� ������
--   � �������������� ������ (��������������, �������, �������������� ��������).