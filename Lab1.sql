Select * from Employees
Select EmployeeID,FirstName,LastName from Employees
Select * from Employees where city = 'london'
Select City, Country from Customers
Select Distinct City, Country from Customers
Select * from products where Unitprice>200
Select * from Customers where City='london' or City ='vancouver'
Select * from Customers where Country ='USA' or City ='vancouver'
Select * from Products where Unitprice >= 50 and UnitPrice <= 100
Select * from Customers where Country in ('Brazil','Argentina','maxico')
Select * from Customers where CompanyName like 'A%'
Select * from Customers where CompanyName like '%Y'
Select FirstName, lastname from Employees where FirstName LIKE '%an%'
Select * from Employees where FirstName LIKE '___'
Select CompanyName from Customers where CompanyName LIKE '_A%'
Select ProductName,UnitPrice from Products order by UnitsInStock DESC
Select CategoryID, ProductName, UnitPrice from Products order by CategoryID ASC, UnitPrice DESC
