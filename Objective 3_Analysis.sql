-- 1. Combine the menu_items and order_details tables into a single table
SELECT * FROM menu_items;
SELECT * FROM order_details;

SELECT *
FROM order_details AS od LEFT JOIN menu_items AS mi
	ON od.item_id = mi.menu_item_id;

-- 2. What were the least and most ordered items? Which categories were they in?
SELECT item_name, category, COUNT(order_details_id) AS num_purchases
FROM order_details AS od LEFT JOIN menu_items AS mi
	ON od.item_id = mi.menu_item_id
    GROUP BY item_name, category
    ORDER BY num_purchases;

-- 3. What were the top 5 orders that spent the most money?
SELECT order_id, SUM(price) AS total_spent
FROM order_details AS od LEFT JOIN menu_items AS mi
	ON od.item_id = mi.menu_item_id
GROUP By order_id
ORDER BY total_spent DESC
LIMIT 5;
-- The highest spend order bought mostly italian even though Italian items arent as popular on the menu


-- 4. View the details of the highest spend order. What insights can you gather from the results?
SELECT category, COUNT(item_id) AS num_items
FROM order_details AS od LEFT JOIN menu_items AS mi
	ON od.item_id = mi.menu_item_id
WHERE order_id = 440
GROUP BY category;
--The highest spend order bought mostly Italian even though Italian items arent as popular on the menu


-- 5. View the details of the top 5 highest spent orders. What insights can you gather from the results?
SELECT order_id, category, COUNT(item_id) AS num_items
FROM order_details AS od LEFT JOIN menu_items AS mi
	ON od.item_id = mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY order_id, category;
--The top 5 highest spent orders are ordering Italian food than any other food. (individual results same as mentioned before) 
--Need to keep the expensive Italian dishes on our menu becuase people seem to like it more than other dishes
