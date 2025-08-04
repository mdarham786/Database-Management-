# FUNCTIONS                                                                         
CREATE DATABASE FUNCTIONS;
USE FUNCTIONS;

CREATE TABLE Employees(
emp_id INT,
emp_name VARCHAR(30),
department_id INT);
INSERT INTO Employees(emp_id, emp_name, department_id)
VALUES(1, "Alice", 10),
	  (2, "	Bob", 20),
      (3, "Charlie", 30),
      (4, "David",10),
      (5, "Eve", 40);
      
DELIMITER //

CREATE FUNCTION square_num(n INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN n*n;
END //

DELIMITER ; #THERE IS A SPACE B/W DELIMITER AND ;

SELECT emp_id, square_num(emp_id) AS square_emp_id FROM Employees;   


DELIMITER //

CREATE FUNCTION is_even(n INT)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    RETURN IF(n%2=0, "Even", "Odd");
END //

DELIMITER ;

SELECT emp_id, emp_name, is_even(emp_id) AS employ_id_type FROM employees;


#FUNCTION TO CONVERT DEGREE CELSIUS INTO DEGREE FAHRENHEIT.
DELIMITER //

CREATE FUNCTION Celsius_Fahrenheit_conversion(n INT)
RETURNS INT
DETERMINISTIC
BEGIN
     RETURN (n*9/5)+32;
END //
 
DELIMITER ;  
SELECT Celsius_Fahrenheit_conversion(37);

#ADDITION OF TWO NUMBERS
DELIMITER //

CREATE FUNCTION ADDITION(x INT, y INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN (x + y);
END //    
 
DELIMITER ;
SELECT ADDITION(10, 20);