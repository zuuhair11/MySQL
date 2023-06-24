-- =========================================================================================================
-- =========================================================================================================
-- Find customers who have ordered lettuce (id = 3)
-- Using: "IN"
USE sql_store;

SELECT customer_id, first_name, last_name
FROM customers 
WHERE customer_id IN (
	SELECT o.customer_id
    FROM order_items oi
	JOIN orders o
		ON oi.order_id = o.order_id
        
	WHERE oi.product_id = 3
);
-- =========================================================================================================
-- =========================================================================================================
-- Find customers who have ordered lettuce (id = 3)
-- Using: "JOIN"
USE sql_store;

SELECT DISTINCT customer_id, first_name, last_name
FROM customers c
JOIN orders o USING (customer_id)
JOIN order_items oi USING (order_id)

WHERE oi.product_id = 3
-- =========================================================================================================
-- =========================================================================================================