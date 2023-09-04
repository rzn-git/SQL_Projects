--SELECT FirstName, LastName, Age,
--CASE 
--	when Age=38 then 'Stanley'
--	when Age> 30 then 'OLD'
--	when Age between 27 and 30 then 'Young'
--	else 'Baby'
--end
--FROM [SQLTutorial].[dbo].[EmployeeDemographics]
--where Age is not null
--order by Age




SELECT FirstName, LastName, JobTitle, Salary,
case 
	when JobTitle = 'Salesman' then Salary+ (Salary*0.10)
	when JobTitle = 'Accountant' then Salary+ (Salary*0.05)
	when JobTitle = 'HR' then Salary+ (Salary*0.000001)
	else Salary+ (Salary*0.03)
end as SalaryAfterRaise
FROM [SQLTutorial].[dbo].[EmployeeDemographics]
join SQLTutorial.dbo.EmployeeSalary
	on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
