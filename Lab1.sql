--ต้องการข้อมูลพนักงานทั้งหมด
Select * from Employees
--รหัสพนักงานชื่อนามสกุลพนักงานทั้งหมด
Select EmployeeID,FirstName,LastName from Employees
--พนักงานที่อยู่เมือง london
Select * from Employees where city = 'london'