use NamasteySql;
SELECT * FROM [dbo].[dept];
SELECT * FROM [dbo].[employee];
--3- write a query to print dep name and average salary of employees in that dep .
SELECT
	d.dep_name,
	AVG(salary)
FROM dept d
JOIN employee e ON d.dep_id=e.dept_id
GROUP BY dep_name;

--4- write a query to print dep names where none of the emplyees have same salary.
SELECT
	DISTINCT d.dep_name
FROM dept d
JOIN employee e ON d.dep_id=e.dept_id
GROUP BY d.dep_name
HAVING COUNT(DISTINCT e.salary)=COUNT(e.emp_id);

select d.dep_name
from employee e
inner join dept d on e.dept_id=d.dep_id
group by d.dep_name
having count(e.emp_id)=count(distinct e.salary)

--8- write a query to print dep name for which there is no employee
SELECT DISTINCT d.dep_name
FROM dept d
LEFT JOIN employee e ON d.dep_id=e.dept_id
WHERE e.emp_id IS NULL;

--9- write a query to print employees name for which dep id is not avaiable in dept table
SELECT e.dept_id,e.emp_name
FROM employee e
LEFT JOIN dept d ON d.dep_id=e.dept_id
WHERE dep_id IS NULL;

