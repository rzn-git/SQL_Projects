--CREATE TABLE #temp_Employee ( EmployeeID int,
--JobTitle varchar(100), Salary int
--)

--Select *
--FROM #temp_Employee

--INSERT INTO #temp_Employee VALUES ( '1001', 'HR', '45000')

--insert into #temp_Employee
--select *
--from SQLTutorial..EmployeeSalary


Drop table if exists #Temp_Employee2
CREATE TABLE #Temp_Employee2 ( 
JobTitle varchar(50), 
EmployeesPerJob int, 
AvgAge int, 
AvgSalary int)

INSERT INTO #Temp_Employee2
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary) 
FROM SQLTutorial..EmployeeDemographics emp
JOIN SQLTutorial..EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
group by JobTitle

SELECT *
FROM #Temp_Employee2
