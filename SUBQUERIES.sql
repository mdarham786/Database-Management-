create database sub;
use sub;

create table students(
student_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50),
age int not null,
major varchar(50)
);

insert into students values
(1,"Alice",20,"Engineering"),
(2,"Bob",22,"Arts"),
(3,"Charlie",21,"Engineering"),
(4,"David",23,"Medicine"),
(5,"Eva",22,"Arts");

create table scores(
student_id int not null,
subject varchar(50),
score int not null
);

insert into scores values
(1,"Mathematics",85),
(1,"Physics",90),
(2,"History",75),
(3,"Mathematics",82),
(3,"Physics",89),
(4,"Biology",88),
(5,"History",88);

# 1.Retrieve the names of students with a score higher than 80 in Mathematics.
SELECT name
FROM students
WHERE student_id IN (
    SELECT student_id
    FROM scores
    WHERE subject = 'Mathematics' AND score > 80
); 

# 2.Find students who have scored in Physics but are not Engineering majors. 
    	SELECT name
FROM students
WHERE student_id IN (
    		SELECT student_id
    		FROM scores
    		WHERE subject = 'Physics'
) AND major <> 'Engineering'; 


# 3.List the names of students whose average score across all subjects is above 85. 
SELECT name
FROM students
WHERE student_id IN (
    SELECT student_id
    FROM scores
    GROUP BY student_id
    HAVING AVG(score) > 85
); 

# 4.Identify students who have taken both Mathematics and Physics. 
SELECT name
FROM students
WHERE student_id IN (
    SELECT student_id
    FROM scores
    WHERE subject = 'Mathematics'
) AND student_id IN (
    SELECT student_id
    FROM scores
    WHERE subject = 'Physics'
);  

# 5.Find students who scored the highest in each subject. 
SELECT name, subject, score
FROM students s
JOIN scores sc ON s.student_id = sc.student_id
WHERE (subject, score) IN (
    SELECT subject, MAX(score)
    FROM scores
    GROUP BY subject
); 


# 6.List students who scored above the average score in History. 
SELECT name
FROM students
WHERE student_id IN (
    SELECT student_id
    FROM scores
    WHERE subject = 'History' AND score > (
        SELECT AVG(score)
        FROM scores
        WHERE subject = 'History'
    )
);  


# 7.Find the student with the lowest score in any subject. 
SELECT name 
FROM students
WHERE student_id = (
    SELECT student_id
    FROM scores
    ORDER BY score ASC
    LIMIT 1
);  

# 8.Retrieve the names of students who haven’t taken any subjects in the Arts major. 
SELECT name
FROM students
WHERE major <> 'Arts' AND student_id NOT IN (
    SELECT student_id
    FROM scores
    WHERE subject IN ('History')
);  

# 9.Find students who have the same major as students who scored above 85 in Biology.
SELECT name
FROM students
WHERE major IN (
    SELECT major
    FROM students
    WHERE student_id IN (
        SELECT student_id
        FROM scores
        WHERE subject = 'Biology' AND score > 85
    )
);  

# 10.List students who scored exactly the average score in Mathematics. 
SELECT name
FROM students
WHERE student_id IN (
    SELECT student_id
    FROM scores
    WHERE subject = 'Mathematics' AND score = (
        SELECT AVG(score)
        FROM scores
        WHERE subject = 'Mathematics'
    )
);  


# 11.Retrieve the names of students whose scores are all above the average score for their major. 
SELECT name
FROM students
WHERE student_id NOT IN (
    SELECT student_id
    FROM scores
    WHERE score < (
        SELECT AVG(score)
        FROM scores s
        JOIN students st ON s.student_id = st.student_id
        WHERE st.major = students.major
    )
); 


# 12.Find the top three students in each subject based on scores. 
SELECT name, subject, score
FROM students s
JOIN scores sc ON s.student_id = sc.student_id
WHERE (subject, score) IN (
    SELECT subject, score
    FROM (
        SELECT subject, score,
               RANK() OVER(PARTITION BY subject ORDER BY score DESC) AS ranking
        FROM scores
    ) AS ranked_scores
    WHERE ranking <= 3
); 

# 13.List students whose highest score is in Physics. 
SELECT name
FROM students
WHERE student_id IN (
    SELECT student_id
    FROM scores
    WHERE subject = 'Physics' AND score = (
        SELECT MAX(score)
        FROM scores
        WHERE student_id = scores.student_id
    )
); 


# 14.Retrieve students who scored the lowest in each subject. 
SELECT name, subject, score
FROM students s
JOIN scores sc ON s.student_id = sc.student_id
WHERE (subject, score) IN (
    SELECT subject, MIN(score)
    FROM scores
    GROUP BY subject
);  


# 15.Find students who scored in Mathematics but not in Physics. 
SELECT name
FROM students
WHERE student_id IN (
    SELECT student_id
    FROM scores
    WHERE subject = 'Mathematics'
) AND student_id NOT IN (
    SELECT student_id
    FROM scores
    WHERE subject = 'Physics'
);  


# 16.List students who scored above the average score in their own major. 
SELECT name
FROM students
WHERE student_id IN (
    SELECT student_id
    FROM scores
    WHERE score > (
        SELECT AVG(s2.score)
        FROM scores s2
        WHERE s2.student_id IN (
            SELECT s3.student_id
            FROM students s3
            WHERE s3.major = (
                SELECT s4.major
                FROM students s4
                WHERE s4.student_id = scores.student_id
            )
        )
    )
);



# 17.Identify students who scored higher in Mathematics than any Arts major. 
SELECT name
FROM students
WHERE student_id IN (
    SELECT student_id
    FROM scores
    WHERE subject = 'Mathematics' AND score > (
        SELECT MAX(score)
        FROM scores s
        JOIN students st ON s.student_id = st.student_id
        WHERE st.major = 'Arts'
    )
);  


# 18.Retrieve students who scored above 80 in all their subjects. 
SELECT name
FROM students
WHERE student_id NOT IN (
    SELECT student_id
    FROM scores
    WHERE score <= 80
);  

# 19.List students who scored higher than the student with the lowest score in Physics. 
SELECT name
FROM students
WHERE student_id IN (
    SELECT student_id
    FROM scores
    WHERE score > (
        SELECT MIN(score)
        FROM scores
        WHERE subject = 'Physics'
    )
);  


# 20.Find students who scored exactly the highest score in each of their subjects. 
SELECT name, subject, score
FROM students s
JOIN scores sc ON s.student_id = sc.student_id
WHERE score = (
    SELECT MAX(score)
    FROM scores
    WHERE subject = sc.subject
);
