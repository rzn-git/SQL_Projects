--select FirstName as Fname
--from SQLTutorial.dbo.EmployeeDemographics

--select FirstName Fname
--from SQLTutorial.dbo.EmployeeDemographics

--select FirstName + ' '+LastName as FullName
--from SQLTutorial.dbo.EmployeeDemographics


--select avg (Age) as AvgAge
--from SQLTutorial.dbo.EmployeeDemographics

--select Demo.EmployeeID, Sal.Salary
--from SQLTutorial.dbo.EmployeeDemographics as Demo
--Join SQLTutorial.dbo.EmployeeSalary as Sal
--	on Demo.EmployeeID = Sal.EmployeeID


--select a.EmployeeID, a.FirstName, a.FirstName, b.JobTitle, c.Age
--from SQLTutorial.dbo.EmployeeDemographics  a
--left Join SQLTutorial.dbo.EmployeeSalary  b
--	on a.EmployeeID = b.EmployeeID
--left join SQLTutorial.dbo.WareHouseEmployeeDemographics c
--	on a.EmployeeID = c.EmployeeID




select Demo.EmployeeID, Demo.FirstName, Demo.FirstName, Sal.JobTitle, Ware.Age
from SQLTutorial.dbo.EmployeeDemographics  Demo
left Join SQLTutorial.dbo.EmployeeSalary Sal
	on Demo.EmployeeID = Sal.EmployeeID
left join SQLTutorial.dbo.WareHouseEmployeeDemographics Ware
	on Demo.EmployeeID = Ware.EmployeeID