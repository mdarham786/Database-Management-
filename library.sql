# QUESTIONS ON LIKE AND REGULAR EXPRESSIONS                                                                     

#1 Create a database named library and a table named books with the following columns:

#id (INT, Primary Key, Auto Increment)
#title (VARCHAR(255))
#author (VARCHAR(100))
#year (YEAR)
#genre (VARCHAR(100))

create database library;
use library;

create table books(
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255),
  author VARCHAR(100),
  year VARCHAR(20),
  genre VARCHAR(100));
  SELECT * FROM library.books;
#2 Insert the following book records into the books table:
#"The Great Gatsby", "F. Scott Fitzgerald", 1925, "Fiction"
#"Pride and Prejudice", "Jane Austen", 1813, "Romance"
#"To Kill a Mockingbird", "Harper Lee", 1960, "Fiction"
#"1984", "George Orwell", 1949, "Dystopian"
#"Moby Dick", "Herman Melville", 1851, "Adventure"
#"Breaking Dawn", "Stephenie Meyer", 1876, "Fiction"

INSERT INTO books(id, title, author, year, genre)
VALUES(1, "The Great Gatsby", "F.Scott Fitzgerald", 1925, "Fiction"),
      (2, "Pride and Prejudice", "Jane Austen", 1813, "Romance"),
      (3, "To Kill a Mockingbird", "Harper Lee", 1960, "Fiction"),
      (4, "1984", "George Orwell", 1949, "Dystopian"),
      (5, "Moby Dick", "Herman Melville", 1851, "Adventure"),
	  (6, "Breaking Dawn", "Stephenie Meyer", 1876, "Fiction");

#3 Write a query to select all books where the title starts with the letter 'T' using the LIKE operator.      
SELECT * from books WHERE title LIKE "T%";

#4 Write a query to find all books where the author's last name ends with 'son' using the LIKE operator. 
SELECT * from books WHERE author LIKE "%SON";

#5 Write a query to find all books where the title contains the word 'and' using the LIKE operator.
 SELECT * FROM books WHERE title LIKE "%AND%";
 
#6 Write a query to retrieve all books where the title ends with the word 'bird' using the LIKE operator.
SELECT * FROM books WHERE title like "%bird";

#7 Write a query to find all books where the title has exactly 3 characters using the REGEXP operator.
SELECT * FROM books WHERE title REGEXP "^.{3}$";

#8 Write a query to select all books where the title contains a number using the REGEXP operator.
SELECT * FROM books WHERE title REGEXP "[0-9]";

#9 Write a query to retrieve all books where the author's name starts with any letter between 'A' and 'J' using the REGEXP operator.
SELECT * FROM books WHERE author REGEXP "^[A-J]";

#10 Write a query to select all books where the genre is either 'Fiction' or 'Adventure' using the REGEXP operator.
SELECT * FROM books WHERE genre REGEXP "Fiction|Adventure";

#11 Write a query to find all books where the title contains at least one uppercase letter using the REGEXP operator.
SELECT * FROM books WHERE title REGEXP "[A-Z]";

#12 Write a query to find all books where the year of publication is between 1800 and 1950 using the LIKE operator
SELECT * FROM books
WHERE year LIKE '18__'   
   OR year LIKE '190_'  
   OR year LIKE '191_'   
   OR year LIKE '192_'   
   OR year LIKE '193_'   
   OR year LIKE '194_'   
   OR year = '1950';   

#13 Write a query to retrieve all books where the author's name contains exactly two words using the REGEXP operator.
SELECT * FROM books WHERE author REGEXP "..";

#14 Write a query to find all books where the title starts with the letter 'P' and contains exactly two words using the REGEXP operator.
SELECT * FROM books WHERE title REGEXP "^P_";
SELECT * FROM books WHERE title LIKE "^B__";

#15 Write a query to find all books where the title contains any special characters (e.g., '!', '@', '#', etc.) using the REGEXP operator.
SELECT * FROM books WHERE title REGEXP '[!@#/]';