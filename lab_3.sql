-- Database selection & environment check
USE school_db;
SELECT DATABASE();

-- Basic SELECT and COUNT
SELECT * FROM instructor;
SELECT COUNT(*) FROM instructor;

-- Column selection and Aliases
SELECT last_name, email_address FROM student;
SELECT last_name AS StudentLastName, email_address AS StudentEmail FROM student;

-- Filtering with WHERE and ORDER BY
SELECT title, is_active FROM course WHERE is_active = TRUE;
SELECT * FROM enrollment WHERE start_date > '2025-06-01';
SELECT title FROM course WHERE is_active = TRUE ORDER BY title ASC;

-- Comparison Operators & Date Filter
SELECT title, total_hours FROM course WHERE total_hours > 300;
SELECT last_name FROM instructor WHERE COLLATE utf8mb4_general_ci last_name = 'Dupont';
SELECT * FROM enrollment WHERE completion_date IS NOT NULL AND completion_date < '2025-12-31';

-- Logical Operators (AND, OR, NOT)
SELECT title FROM course WHERE is_active = FALSE AND instructor_ref = 3;
SELECT last_name FROM student WHERE email_address LIKE '%@gmail.com' OR email_address LIKE '%@yahoo.fr';
SELECT last_name FROM instructor WHERE NOT (last_name LIKE 'A%');

-- Text Pattern Matching (LIKE & BINARY)
SELECT last_name FROM instructor WHERE last_name LIKE 'M%';
SELECT email_address FROM student WHERE email_address LIKE '%@example.com';
SELECT title FROM course WHERE title LIKE '%Science%';
SELECT last_name FROM instructor WHERE BINARY last_name LIKE 'Dup%';

-- Set & Range Filtering (IN, BETWEEN, NOT)
SELECT last_name FROM student WHERE student_id IN (1, 3, 5, 7);
SELECT last_name FROM student WHERE student_id NOT IN (2, 4, 6);
SELECT * FROM enrollment WHERE start_date BETWEEN '2025-05-01' AND '2025-05-31';
SELECT * FROM enrollment WHERE start_date NOT BETWEEN '2025-01-01' AND '2025-12-31';

-- Handling NULL Values
SELECT * FROM enrollment WHERE completion_date IS NULL;
SELECT * FROM enrollment WHERE completion_date IS NOT NULL;
SELECT title FROM course WHERE is_active = FALSE AND expected_return_date IS NULL;

-- Sorting (ORDER BY) & Pagination (LIMIT / OFFSET)
SELECT last_name, first_name FROM instructor ORDER BY last_name ASC, first_name ASC;
SELECT * FROM student ORDER BY student_id ASC LIMIT 10 OFFSET 20;

-- Aggregation Functions & GROUP BY / HAVING
SELECT COUNT(*) AS total_active FROM course WHERE is_active = TRUE;
SELECT instructor_ref, COUNT(*) AS total_courses 
FROM course 
GROUP BY instructor_ref 
HAVING total_courses > 5;

-- Practical Exercises Queries
SELECT * FROM course ORDER BY course_id DESC LIMIT 3;
SELECT * FROM instructor WHERE CHAR_LENGTH(last_name) >= 5;
SELECT last_name, email_address FROM student WHERE email_address NOT LIKE '%@example.com' AND email_address NOT LIKE '%@test.org';
SELECT * FROM enrollment WHERE expected_end_date < CURDATE() AND actual_return_date IS NULL;

SELECT i.instructor_id, i.last_name, 
       COUNT(c.course_id) AS total_courses, 
       SUM(CASE WHEN c.is_active = TRUE THEN 1 ELSE 0 END) AS active_courses
FROM instructor i
LEFT JOIN course c ON i.instructor_id = c.instructor_ref
GROUP BY i.instructor_id, i.last_name;
