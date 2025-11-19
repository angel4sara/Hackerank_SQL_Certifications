-- 2. Student Advisor


-- Problem Statement:
-- A university has started a student-advisor plan which assigns a professor as an advisor to each student for academic guidance.
-- Write a query to find the roll number and names of students who either have a male advisor with a salary of more than 15,000
-- or a female advisor with a salary of more than 20,000.


-- Tables:
-- student_information(roll_number, name, advisor)
-- faculty_information(employee_ID, gender, salary)


-- Sample Data:
-- student_information
-- | roll_number | name | advisor |
-- |--------------|--------|----------|
-- | 1 | Robert | 2 |
-- | 2 | Claire | 1 |
-- | 3 | Kimmy | 2 |


-- faculty_information
-- | employee_ID | gender | salary |
-- |--------------|--------|--------|
-- | 1 | M | 21000 |
-- | 2 | F | 18000 |


-- Expected Output:
-- | roll_number | name |
-- |--------------|--------|
-- | 2 | Claire |


-- Solution:
SELECT s.roll_number, s.name
FROM student_information AS s
LEFT JOIN faculty_information AS f
ON s.advisor = f.employee_id
WHERE
(f.gender = 'M' AND f.salary > 15000)
OR
(f.gender = 'F' AND f.salary > 20000);
