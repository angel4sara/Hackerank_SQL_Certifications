-- 3. Product Sales per City


-- Problem Statement:
-- For each pair of city and product, return the names of the city and product, as well as the
-- total amount spent on the product to 2 decimal places. Order the result by the amount spent
-- from high to low, then by city name and product name in ascending order.


-- Tables:
-- city(id INT, city_name VARCHAR(128), postal_code VARCHAR(16), country_id INT)
-- customer(id INT, customer_name VARCHAR(255), city_id INT, customer_address VARCHAR(255), contact_person VARCHAR(255), email VARCHAR(128), phone VARCHAR(128), is_active INT)
-- invoice(id INT, invoice_number VARCHAR(255), customer_id INT, user_account_id INT, total_price DECIMAL(8,2))
-- invoice_item(id INT, invoice_id INT, product_id INT, quantity DECIMAL(8,2), price DECIMAL(8,2), line_total_price DECIMAL(8,2))
-- product(id INT, sku VARCHAR(32), product_name VARCHAR(128), product_description VARCHAR(255), current_price DECIMAL(8,2), quantity_in_stock DECIMAL(8,2), is_active INT)


-- Sample Data:
-- city
-- | id | city_name | postal_code | country_id |
-- |----|------------|--------------|-------------|
-- | 1 | London | W1A 1AA | 44 |
-- | 2 | Manchester | M1 1AE | 44 |


-- customer
-- | id | customer_name | city_id | customer_address | contact_person | email | phone | is_active |
-- |----|----------------|---------|------------------|----------------|------------------|--------|-----------|
-- | 1 | John Smith | 1 | 221B Baker St | NULL | john@abc.com | 5555 | 1 |
-- | 2 | Mary Jones | 2 | 45 King Rd | NULL | mary@xyz.com | 6666 | 1 |


-- invoice
-- | id | invoice_number | customer_id | user_account_id | total_price |
-- |----|----------------|--------------|----------------|--------------|
-- | 1 | INV001 | 1 | 1001 | 250.00 |
-- | 2 | INV002 | 2 | 1002 | 300.00 |


-- invoice_item
-- | id | invoice_id | product_id | quantity | price | line_total_price |
-- |----|-------------|-------------|----------|--------|-----------------|
-- | 1 | 1 | 1 | 2 | 50.00 | 100.00 |
-- | 2 | 1 | 2 | 3 | 50.00 | 150.00 |
-- | 3 | 2 | 1 | 4 | 75.00 | 300.00 |


-- product
-- | id | sku | product_name | product_description | current_price | quantity_in_stock | is_active |
-- |----|-------|---------------|--------------------|----------------|-------------------|------------|
-- | 1 | P001 | Keyboard | Wireless Keyboard | 50.00 | 100 | 1 |
-- | 2 | P002 | Mouse | Optical Mouse | 25.00 | 200 | 1 |


-- Expected Output:
-- | city | product | total_amount_spent |
-- |-------------|----------|--------------------|
-- | Manchester | Keyboard | 300.00 |
-- | London | Mouse | 150.00 |
-- | London | Keyboard | 100.00 |


-- Solution:
SELECT
c.city_name AS city,
p.product_name AS product,
ROUND(SUM(ii.line_total_price), 2) AS total_amount_spent
FROM city AS c
JOIN customer cu ON c.id = cu.city_id
JOIN invoice i ON cu.id = i.customer_id
JOIN invoice_item ii ON i.id = ii.invoice_id
JOIN product p ON ii.product_id = p.id
GROUP BY c.city_name, p.product_name
ORDER BY total_amount_spent DESC, c.city_name ASC, p.product_name ASC;
