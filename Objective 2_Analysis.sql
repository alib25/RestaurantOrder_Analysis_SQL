-- 1. View the order_details table
SELECT *
FROM order_details;

-- 2. What is the date range of the table?
SELECT MIN(order_date), MAX(order_date)
FROM order_details;
-- The date range is 2023-01-01 to 2023-03-31

-- 2. How many orders were made within this date range?
SELECT COUNT(DISTINCT order_id) 
FROM order_details;
-- There were 5,370 orders made during this date range

-- 3. How many items were ordered within this date range?
SELECT COUNT(*)
FROM order_details;
--There were 12,234 items ordered during this date range

-- 4. Which orders had the most number of items?
SELECT order_id, COUNT(item_id) AS num_item
FROM order_details
GROUP BY order_id;
-- There are seven orders that had the most number of items, the most no. of items ordered were 14

-- 5. How many orders had more than 12 items?
SELECT order_id, COUNT(item_id) AS num_items
FROM order_details
GROUP BY order_id
ORDER BY num_items DESC;
-- There are 20 orders with items more than 12

-- 6. How many orders had more than 12 items?
SELECT COUNT(*) FROM

(SELECT order_id, COUNT(item_id) AS num_items
FROM order_details
GROUP BY order_id
HAVING num_items > 12) AS num_orders;
-- The most ordered item was hamburger with 622 purchases in American category and the least ordered item was chicken tacos with 123 purchases in Mexican category
