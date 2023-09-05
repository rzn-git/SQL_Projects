

WITH CTE_Employee as
(SELECT FirstName, LastName, Gender, Salary
, count (Gender) over (partition by Gender) as TotalGender
, avg(Salary) over (partition by Gender) as AvgSalary
  FROM [SQLTutorial].[dbo].[EmployeeDemographics] emp
  join SQLTutorial.dbo.EmployeeSalary sal
	on emp.EmployeeID = sal.EmployeeID
	where Salary > '45000'
)

select FirstName, AvgSalary
from CTE_Employee