SELECT * 
FROM SQLTutorial.dbo.EmployeeDemographics 

UNION

SELECT * 
FROM SQLTutorial.dbo.WareHouseEmployeeDemographics



SELECT *
FROM SQLTutorial.dbo. EmployeeDemographics
Full Outer Join SQLTutorial.dbo. WareHouseEmployeeDemographics 
ON EmployeeDemographics. EmployeeID = WareHouseEmployeeDemographics. EmployeeID
