SELECT FirstName, LastName, Gender, Salary
, count (Gender) over (partition by Gender) as TotalGender
  FROM [SQLTutorial].[dbo].[EmployeeDemographics] dem
  join SQLTutorial.dbo.EmployeeSalary sal
	on dem.EmployeeID = sal.EmployeeID


	   	  
SELECT FirstName, LastName, Gender, Salary, count (Gender) 
  FROM [SQLTutorial].[dbo].[EmployeeDemographics] dem
  join SQLTutorial.dbo.EmployeeSalary sal
	on dem.EmployeeID = sal.EmployeeID
group by FirstName, LastName, Gender, Salary



SELECT Gender, count (Gender) 
  FROM [SQLTutorial].[dbo].[EmployeeDemographics] dem
  join SQLTutorial.dbo.EmployeeSalary sal
	on dem.EmployeeID = sal.EmployeeID
group by  Gender