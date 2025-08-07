# TRIGGER                                                                                
CREATE DATABASE triggers;
use triggers;

#Create a trigger that updates an inventory table whenever a new sale is recorded in the sales table.
#Specifically, when a new sale is inserted into the sales table, the trigger should decrease the quantity of the corresponding product in the inventory table.

CREATE TABLE inventory(
   product_id INT PRIMARY KEY,
   product_name VARCHAR(100),
   quantity INT);
   
CREATE TABLE sales(
  sale_id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT,
  amount DECIMAL(10, 2),
  sale_date DATE,
  quantity_sold INT);

  #Insert sample data into the inventory table.
  
  INSERT INTO inventory(product_id,  product_name, quantity)
  VALUES(1, "Product A", 100),
        (2, "Product B", 150),
        (3, "Product C", 200);
        
#Create trigger

DELIMITER //
CREATE TRIGGER after_sales_insert
AFTER INSERT ON Sales
FOR EACH ROW
BEGIN 
    UPDATE inventory
    SET quantity = quantity - NEW.quantity_sold
    WHERE product_id = NEW.product_id;
END //
DELIMITER ; 
show triggers;

INSERT INTO sales(product_id, amount, sale_date, quantity_sold)
VALUES(1, 50.00, "2024-07-01", 10);  

INSERT INTO sales(product_id, amount, sale_date, quantity_sold)
VALUES(2, "60.00", "2024-08-01", 20); 
		
select*from inventory; 

#Syntax for dropping a trigger 
DROP TRIGGER IF EXISTS after_sales_insert; 
select * from sales;

CREATE TABLE employees(
 emp_id INT PRIMARY KEY,
 name VARCHAR(50),
 salary DECIMAL(10,2));
 
 CREATE TABLE employees_log(
  log_id INT AUTO_INCREMENT PRIMARY KEY,
  emp_id INT,
  action VARCHAR(50),
  log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

#1. Trigger to log insert activity
     DELIMITER //
     CREATE TRIGGER insert_activity
     AFTER INSERT ON employees
     FOR EACH ROW
     BEGIN
         INSERT INTO employees_log(emp_id, action, log_time)
         VALUES(new.emp_id, "inserted", now());
     END //
     DELIMITER ;

INSERT INTO employees(emp_id, name, salary)
VALUES(1, "Raj", 90.00),
      (2, "Rohit", 70.00),
      (3, "Deepak", 80.00),
      (4, "John", -60.00);
 
select * from employees; 
show triggers;

#2 TRIGGER TO PREVENT NEGATIVE SALARY
   DELIMITER //
   CREATE TRIGGER check_salary_before_insert
   BEFORE INSERT ON employees
   FOR EACH ROW
   BEGIN
       IF NEW.salary<0 THEN
          SIGNAL SQLSTATE"45000"
	      SET MESSAGE_TEXT = "Salary cannot be negative";
       END IF;
   END;
   DELIMITER ;