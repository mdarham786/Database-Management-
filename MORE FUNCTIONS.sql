# MORE FUNCTIONS                                                           
CREATE DATABASE FUNCTIONS_1;
USE FUNCTIONS_1;
CREATE TABLE employees(
emp_id INT,
name VARCHAR(50),
monthly_salary DECIMAL(10,2));
INSERT INTO employees(emp_id, name, monthly_salary)
VALUES(1, "Alice", 10000.00),
	  (2, "Bob", 20000.00),
      (3, "Charlie", 30000.00),
      (4, "David", 40000.00);
      
ALTER TABLE employees
ADD marks INT;
SET SQL_SAFE_UPDATES=0;
UPDATE employees SET marks = 95 WHERE emp_id = "1";
UPDATE employees SET marks = 25 WHERE emp_id = "2";
UPDATE employees SET marks = 86 WHERE emp_id = "3";
UPDATE employees SET marks = 72 WHERE emp_id = "4";
    
#1. CREATE A FUNCTION TO GET ANNUAL SALARY.
DELIMITER //
CREATE FUNCTION get_annual_salary(monthly DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN (monthly*12);
END //
DELIMITER ;
SELECT emp_id, name, get_annual_salary(monthly_salary) AS annual_salary FROM employees;

#CREATE A FUNCTION TO CALCULATE TAX, TAX=10% OF TAX(SAY)

DELIMITER //
CREATE FUNCTION tax_calculation(salary DECIMAL(10,2))
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    RETURN(salary*0.1);
END //
DELIMITER ;
SELECT name, tax_calculation(monthly_salary) AS tax FROM employees; 

#3.  CREATE A FUNCTION  TO ASSIGN GRADES.
     DELIMITER //
     CREATE FUNCTION get_grades(marks INT)
     RETURNS VARCHAR(10)
     DETERMINISTIC
     BEGIN
         RETURN CASE
             WHEN marks >= 90 THEN "A"
             WHEN marks >= 75 THEN "B"
             WHEN marks >= 60 THEN "C"
             ELSE"D"
		 END;
     END // 
     DELIMITER ;
     SELECT name, get_grades(marks) AS grades FROM employees;
     
#4.  CREATE A PROGRAM TO FIND GREATEST NUMBER
     DELIMITER //
     CREATE FUNCTION greatest_number(x INT, y INT)
     RETURNS INT
     DETERMINISTIC
     BEGIN
         RETURN IF(x>y, x, y);
     END //
     DELIMITER ;
     SELECT greatest_number(5, 15);
     
     
     
      DELIMITER //
     CREATE FUNCTION larger_number(x INT, y INT)
     RETURNS INT
     DETERMINISTIC
     BEGIN
         RETURN CASE
             WHEN x>y THEN x
		     ELSE y
         END;    
     END //
     DELIMITER ;
     SELECT larger_number(25, 95);
     
     
      DELIMITER //
     CREATE FUNCTION larger_num(x INT, y INT)
     RETURNS INT
     DETERMINISTIC
     BEGIN
		RETURN greatest(x,y);
	END //
     DELIMITER ;
	SELECT larger_number(25, 95);