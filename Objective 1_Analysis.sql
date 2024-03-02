USE restaurant_db;

-- 1. View the menu_items table
SELECT *
FROM menu_items;

-- 2. Find the number of items on the menu
SELECT COUNT(*)
FROM menu_items;
-- There are 32 items on the menu

-- 3. What are the least and most expensive items on the menu?
SELECT *
FROM menu_items
ORDER BY price;
-- Most expensive $19.95- Shrimp Scampi, least expensive-$5.00 Edamame

SELECT *
FROM menu_items
ORDER BY price DESC;

-- 4. How many Italian dishes are on the menu?
SELECT COUNT(*)
FROM menu_items
WHERE category='Italian';
-- There are 9 italian dishes on the menu 

-- 5. What are the least and most expensive Italian dishes on the menu? 
SELECT *
FROM menu_items
WHERE category='Italian'
ORDER By price;

SELECT *
FROM menu_items
WHERE category='Italian'
ORDER By price DESC;
-- The least expensive italian item is fettuccine alfredo at $14.5,the most expensive italian item is Shrimp Scampi at $19.95

-- 6. How many dishes are in each category?
SELECT category, COUNT(menu_item_id) AS num_dishes
FROM menu_items
GROUP BY category;

-- 7. What is the average dish price within each category?
SELECT category, AVG(price) AS avg_price
FROM menu_items
GROUP BY category;
