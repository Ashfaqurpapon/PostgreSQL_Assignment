CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(100),
    age INT,
    email VARCHAR(100),
    frontend_mark INT,
    backend_mark INT,
    status VARCHAR(50)
)


CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(50),
    credits INT
)

CREATE TABLE enrollment(
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES "students"(student_id),
    course_id INT REFERENCES "courses"(course_id)
)

INSERT INTO students(student_id, student_name, age, email, frontend_mark, backend_mark, status)
VALUES 
 (1, 'Sameer', 21, 'sameer@example.com', 48, 60, NULL),
 (2, 'Zoya', 23, 'zoya@example.com', 52, 58, NULL),
 (3, 'Nabil', 22, 'nabil@example.com', 37, 46, NULL),
 (4, 'Rafi',24, 'rafi@example.com', 41, 40, NULL),
 (5, 'Sophia', 22, 'sophia@example.com', 50, 52, NULL),
 (6, 'Hasan', 23, 'hasan@gmail.com', 43, 39, NULL);


 INSERT INTO courses(course_id, course_name, credits)
 VALUES
  (1, 'Next.js', 3),
  (2, 'React.js', 4),
  (3, 'Databases', 3),
  (4, 'Prisma', 3);


 INSERT INTO enrollment(enrollment_id, student_id, course_id)
 VALUES 
  (1, 1, 1),
  (2, 1, 2),
  (3, 2, 1),
  (4, 3, 2);

  SELECT * FROM students;


-- Query 1:
INSERT INTO students(student_name, age, email, frontend_mark, backend_mark, status) 
VALUES 
 ( 'Ashfaqur Rahman Papon', 23, 'ashfaqurpapon@gmail.com', 60, 55, NULL);



-- Query 2:
 SELECT  student_name FROM enrollment 
 JOIN students ON enrollment.student_id = students.student_id
 JOIN courses ON enrollment.course_id = courses.course_id
 WHERE course_name = 'Next.js';


-- Query 3:
 UPDATE students 
 SET status = 'Awarded'
 WHERE (frontend_mark + backend_mark) = (SELECT max(frontend_mark + backend_mark) FROM students);


-- Query 4:
DELETE from courses 
WHERE course_name NOT IN (
SELECT course_name from courses
JOIN enrollment on enrollment.course_id = courses.course_id);



--  Query 5:
SELECT student_name FROM students LIMIT 2 OFFSET 2;



-- Query 6:
 SELECT course_name, count(*) from courses
 JOIN enrollment ON enrollment.course_id = courses.course_id
 GROUP BY course_name;


-- Query 7:
 SELECT avg(age) FROM students;



-- Query 8:
 SELECT student_name FROM students
    WHERE email LIKE '%example.com';



