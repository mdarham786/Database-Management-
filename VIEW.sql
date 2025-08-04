# VIEW                                                                                   
create database VIEW;
use view;

create table employee(
emp_id INT,
name VARCHAR(20),
department VARCHAR(10),
salary INT);

INSERT INTO employee(emp_id,  name , department, salary)
VALUES(1, "Alice", "HR", 50000),
	  (2, "Bob", "IT", 70000),
      (3, "Charlie", "IT", 60000),
      (4, "David", "HR", 55000),
      (5, "Eve", "Finance", 65000);
      
#1	Create a view table to show name and salary of employees.
CREATE VIEW employee_salary AS
SELECT name, salary FROM employee;

SELECT*FROM employee_salary;  

#[CREATE A VIEW WITH CONDITIONALS]
#2 View of high_earning employees(salary>60000).
CREATE VIEW high_earners AS
SELECT name, department, salary
FROM employee
WHERE salary>60000;

select*from  high_earners;

#3[CREATE A VIEW WITH AGGREGATE FUNCTIONS]
#3 Create a view that shows total salary by department
CREATE VIEW department_salary_summary AS
SELECT department, SUM(salary) AS total_salary
FROM employee
GROUP BY department;

select*from department_salary_summary;

#[UPDATE A VIEW]
#You can use CREATE OR REPLACE
CREATE OR REPLACE VIEW high_earners AS
SELECT name, department, salary 
FROM employee
WHERE salary>65000;

#[DROP A VIEW]
DROP VIEW IF EXISTS high_earners;