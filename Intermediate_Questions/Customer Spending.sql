-- 4. Customer Spending


-- Problem Statement:
-- List all customers who spent 25% or less than the average amount spent on all invoices.
-- For each customer, display their name and the amount spent to 6 decimal places.
-- Order the result by the amount spent from high to low.


-- Tables:
-- customer(id INT, customer_name VARCHAR(255), city_id INT, customer_address VARCHAR(255), contact_person VARCHAR(255), email VARCHAR(128), phone VARCHAR(128), is_active INT)
-- invoice(id INT, invoice_number VARCHAR(255), customer_id INT, user_account_id INT, total_price DECIMAL(8,2))


-- Sample Data:
-- customer
-- | id | customer_name | city_id | customer_address | contact_person | email | phone | is_active |
-- |----|----------------|---------|------------------|----------------|----------------|--------|-----------|
-- | 1 | John Smith | 1 | 221B Baker St | NULL | john@abc.com | 5555 | 1 |
-- | 2 | Mary Jones | 2 | 45 King Rd | NULL | mary@xyz.com | 6666 | 1 |
-- | 3 | David Brown | 3 | 12 Park Ave | NULL | david@pqr.com | 7777 | 1 |


-- invoice
-- | id | invoice_number | customer_id | user_account_id | total_price |
-- |----|----------------|--------------|----------------|--------------|
-- | 1 | INV001 | 1 | 1001 | 100.00 |
-- | 2 | INV002 | 2 | 1002 | 400.00 |
-- | 3 | INV003 | 3 | 1003 | 150.00 |


-- Expected Output:
-- | customer_name | amount_spent |
-- |----------------|--------------|
-- | John Smith | 100.000000 |


-- Solution:

WITH avg_invoice AS (
SELECT AVG(i.total_price) AS avg_total
FROM invoice i
)
SELECT
c.customer_name,
CAST(SUM(i.total_price) AS DECIMAL(20,6)) AS amount_spent
FROM customer c
JOIN invoice i
ON i.customer_id = c.id
GROUP BY c.customer_name
HAVING SUM(i.total_price) <= 0.25 * (SELECT avg_total FROM avg_invoice)
ORDER BY amount_spent DESC;
