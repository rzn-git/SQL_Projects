

Select *
From EmployeeErrors





 --Using Substring, when we dont have common ID like EmployeeID to match 2 tables

Select err.FirstName, Substring(err.FirstName,1,3), dem.FirstName, Substring(dem.FirstName,1,3)
FROM EmployeeErrors err
JOIN SQLTutorial.dbo.EmployeeDemographics dem
	on Substring(err.FirstName,1,3) = Substring(dem.FirstName,1,3)




