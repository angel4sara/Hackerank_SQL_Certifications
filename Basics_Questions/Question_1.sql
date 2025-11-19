-- 1. Merit Rewards

-- Problem Statement:
-- On the basis of merit, a company decides to promote some of its employees in the HR division
-- at the end of the quarter because of their high performance.
-- Write a query to find the employee IDs along with the names of all employees who work
-- in the HR department and earned a bonus of 5000 dollars or more in the last quarter.

-- Tables:
-- employee_information(employee_ID, name, division)
-- last_quarter_bonus(employee_ID, bonus)

-- Sample Data:
-- employee_information
-- | employee_ID | name     | division |
-- |--------------|----------|-----------|
-- | 1            | Julia    | HR        |
-- | 2            | Samantha | Tech      |
-- | 3            | Richard  | HR        |

-- last_quarter_bonus
-- | employee_ID | bonus |
-- |--------------|-------|
-- | 1            | 2000  |
-- | 2            | 5500  |
-- | 3            | 6240  |

-- Expected Output:
-- | employee_ID | name    |
-- |--------------|---------|
-- | 3            | Richard |

-- Solution:

SELECT e.employee_ID, e.name
FROM employee_information AS e
LEFT JOIN last_quarter_bonus AS q
    ON e.employee_id = q.employee_id
WHERE e.division = 'HR'
  AND q.bonus >= 5000;

