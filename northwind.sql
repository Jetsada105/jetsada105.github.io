Select EmployeeID,FirstName,LastName from Employees
Select * from Employees where city = 'USA'
Select * from Products where CategoryID IN (1, 2, 4, 8)
AND UnitPrice BETWEEN 100 AND 200;
Select Country, City, CompanyName, ContactName, Phone
from Customers where Region IN ('WA', 'WY');
Select * from Products where  (CategoryID = 1 AND UnitPrice <= 20)
or (CategoryID = 8 AND UnitPrice >= 150);
Select CustomerID, CompanyName, Country, Fax from Customers 
where Country = 'USA' AND Fax IS NULL Order by CompanyName
Select * from Customers where CompanyName LIKE '%Com%';

Select ProductID, ProductName, UnitPrice, UnitsInStock, UnitPrice * UnitsInStock 
AS [StockValue] from Products

Select ProductID as รหัส, ProductName as สินค้า, UnitsInStock + UnitsOnOrder as รวมจำนวน, ReorderLevel as จุดสั่งซื้อใหม่
from Products 
where (UnitsInStock + UnitsOnOrder) < ReorderLevel;

Select ProductID, ProductName, UnitPrice, ROUND(UnitPrice * 0.07, 2) as Vat7
from Products;

Select EmployeeID,TitleOfCourtesy + ' ' + FirstName + SPACE(1) + LastName as [Employee Name]
from Employees;

Select EmployeeID,TitleOfCourtesy + ' ' + FirstName + ' ' + LastName as [Employee Name]
from Employees

Select * from [Order Details]

Select orderID, ProductID, UnitPrice, Quantity, Discount,
        (UnitPrice * Quantity) as TotalPrice,
        (UnitPrice * Quantity)-(UnitPrice * Quantity * Discount) as NetPrice
from [Order Details]

Select orderID, ProductID, UnitPrice, Quantity, Discount,
        (UnitPrice * Quantity) as TotalPrice,
        UnitPrice * Quantity * (1-Discount) as NetPrice
from [Order Details]

-- ราคาจริง = ราคาเต็ม - ส่วนลด
-- ราคาเต็ม = ราคา * จำนวน
-- ส่วนลบ = ราคาเต็ม - ลด
-- ราคาจริง = (ราคา * จำนวน) - (ราคา * จำนวน * ลด)
-- ราคาจริง = ราคา * จำนวน * (1-ลด)
Select (42.40*35)-(42.40*35*0.15)

Select employeeID, FirstName, BirthDate, Datediff(YEAR, BirthDate, '2024-12-31') Age,
        HireDate, DATEDIFF(YEAR,HireDate,GETDATE()) YearInoffice
from Employees

Select getdate()

-- แสดงจำนวนสินค้าที่มีเก็บไว้
Select COUNT(*) as จำนวนสินค้า, count(ProductID), count(productName), count(UnitPrice)
from Products
Where UnitsInStock < 15
--จำนวนลูกค้าที่อยู่ประเทศ USA
Select count(*) from Customers where Country = 'USA'
--จำนวนจำนวนพนักงานที่อยู่ใน London
Select count(*) from Employees where City = 'London'
--จำนวนใบสั่งซื้อที่ออกไปปี 1997
Select count(*) from Orders Where year(OrderDate) =1997
--จำนวนครั้งที่ขายสินค้ารหัส 1
Select count (*) from [Order Details] where ProductID = 1

-- function Sum
-- จำนวนสินค้าที่ขายได้ทั้งหมด
Select sum(quantity)
from[Order Details]
where productID =2

-- มูลค่าสินค้าในคลังทั้งหมด
Select sum(UnitPrice * UnitsInStock)
from Products
-- จำนวนสินค้ารหัสประเภท ที่สั่งซื้อไปแล้ว
Select sum(UnitsOnOrder)
from Products
where CategoryID = 8

-- function Max, Min
-- ราคาสินค้ารหัส ๅ ที่ขายได้ราคาสูงสุดและต่ำสุด
Select max(UnitPrice), min(UnitPrice)
from [Order Details]
where ProductID =71

-- function AVG
-- ราคาสินค้าทั้งหมดที่เคยข่ยได้ รหัสสินค้า 5
Select avg(UnitPrice), min(UnitPrice), max(UnitPrice)
from [Order Details]
where ProductID = 5

-- Group By

-- ประเทศ และจำนวนสินค้า
Select Country, COUNT(*)
from Customers
Group BY Country

Select CategoryID, avg(UnitPrice) as AvgPrice, min(UnitPrice) as MinPrice, max(UnitPrice) as MaxPrice
from Products
GROUP BY CategoryID;


-- รายการสินค้าในใบส้่งซื้อทุกใบ
SELECT OrderID, COUNT(*) AS ItemCount
FROM [Order Details]
GROUP BY OrderID;

-- รายการสินค้าในใบส้่งซื้อทุกใบ
-- เฉพาะในใบสั่งซื้อที่มีสินค้ามากกว่า 3 ชนิด
Select orderID, count(*)
from [Order Details]
GROUP BY orderID
Having Count(*)>3

-- ประเทศ และจำนวนใบสั่งซื้อที่ส่งสินค้าไปถึงปลายทาง
-- ต้องการเฉพาะที่มีจำนวนใบสั่งซื้อ
Select ShipCountry, count(*) numOfOrders
from Orders
GROUP BY ShipCountry
Having Count(*)>=100

-- ข้อมูลรหัสใบสั่งซื้อ ยอดเงินรวมในใบสั่งซื้อนั้น แสดงเฉพาะใบสั่งสั่งซื้อที่มียอดเงินน้อยกว่า 100
Select orderID, sum(UnitPrice * Quantity * (1-Discount))
from [Order Details]
GROUP BY orderID
Having sum(UnitPrice * Quantity * (1-Discount)) < 100

-- ประเทศใดที่มีจำนวนใบสั่งซื้อสินค้าไปปลายทางต่ำกว่า 20 รายการ ใน ปี 1997
Select ShipCountry, COUNT(*) as numOfOrders
from Orders
where YEAR(OrderDate) = 1997
GROUP BY ShipCountry
Having COUNT(*) < 20
ORDER BY COUNT(*) DESC

-- ใบสั้งใดที่มียอดขายสูงที่สุด แสดงรหัสใบสั่งซื้อและยอดขาย
Select top 1 orderID, sum(UnitPrice * Quantity * (1-Discount)) as total
from [Order Details]
GROUP BY orderID
ORDER BY total DESC

-- ใบสั้งใดที่มียอดขายต่ำที่สุด 5 อันดับ แสดงรหัสใบสั่งซื้อและยอดขาย
Select top 5 orderID, sum(UnitPrice * Quantity * (1-Discount)) as total
from [Order Details]
GROUP BY orderID
ORDER BY total ASC
