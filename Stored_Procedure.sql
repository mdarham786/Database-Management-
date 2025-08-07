CREATE DATABASE stored_procedure;
USE stored_procedure;
create table employees(
emp_id INT,
name VARCHAR(20),
department VARCHAR(10),
salary INT);

INSERT INTO employees(emp_id,  name , department, salary)
VALUES(1, "Alice", "HR", 50000),
	  (2, "Bob", "IT", 70000),
      (3, "Charlie", "IT", 60000),
      (4, "David", "HR", 55000),
      (5, "Eve", "Finance", 65000);
      
#1. Simple example of sgtored procedure
    DELIMITER //
    CREATE PROCEDURE ShowAllEmployees()
    BEGIN
        SELECT * FROM employees;
    END //
    DELIMITER ;
    
    #TO RUN
    CALL ShowAllEmployees();
    
#2. Create a stored procedure to fetch all the employees from a specific department.
    DELIMITER //
    CREATE PROCEDURE GetEmployeesByDepartment(IN dept_name VARCHAR(50))
    BEGIN
        SELECT * FROM employees WHERE department = dept_name;
    END //
    DELIMITER ;
    
    #Usage
    CALL GetEmployeesByDepartment("IT");
    CALL GetEmployeesByDepartment("HR");
    CALL GetEmployeesByDepartment("Finance");
    
    #2. Create a stored procedure to insert a new employee.
       DELIMITER //
       CREATE PROCEDURE Insert_a_NewEmployee( IN emps_id INT, names VARCHAR(50), departments VARCHAR(20), salaries INT)
       BEGIN
           INSERT INTO employees(emp_id,  name , department, salary)
           VALUES(emps_id, names, departments, salaries);
       END //
       DELIMITER ;
        CALL Insert_a_NewEmployee(6, "John", "Finance", 77600);
       select * from employees;