SELECT * 
FROM SQLTutorial.dbo.EmployeeDemographics 
UNION
SELECT * 
FROM SQLTutorial.dbo.WareHouseEmployeeDemographics



SELECT *
FROM SQLTutorial.dbo. EmployeeDemographics
Full Outer Join SQLTutorial.dbo. WareHouseEmployeeDemographics 
ON EmployeeDemographics. EmployeeID = WareHouseEmployeeDemographics. EmployeeID

-- union all keeps duplicate data

SELECT * 
FROM SQLTutorial.dbo.EmployeeDemographics 
UNION all
SELECT * 
FROM SQLTutorial.dbo.WareHouseEmployeeDemographics
order by EmployeeID

-- if data type same then union will work

SELECT EmployeeID, FirstName, Age
FROM SQLTutorial.dbo.EmployeeDemographics 
UNION 
SELECT EmployeeID, JobTitle, Salary
FROM SQLTutorial.dbo.EmployeeSalary
order by EmployeeID