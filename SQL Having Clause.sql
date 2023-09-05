




Select JobTitle, avg(Salary)
FROM [SQLTutorial].[dbo].[EmployeeDemographics]
join SQLTutorial.dbo.EmployeeSalary
	on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
group by JobTitle
having avg(Salary) > 45000
order by AVG (Salary)


