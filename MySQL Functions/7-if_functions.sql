-- ============================================================================================================
-- ============================================================================================================
IF(expression, first, second);
-- ============================================================================================================
-- Using: "UNION"
SELECT 
	order_id,
    order_date,
    'Archived' AS status
FROM orders
WHERE YEAR(order_date) < YEAR(NOW());

UNION

SELECT 
	order_id,
    order_date,
    'Active' AS status
FROM orders 
WHERE YEAR(order_date) >= YEAR(NOW());
-- ============================================================================================================
-- ============================================================================================================
USE sql_store;

SELECT 
	order_id,
    order_date,
    IF(YEAR(order_date) = YEAR(NOW()), 'Active', 'Archived') AS status
FROM orders;
-- ============================================================================================================
-- ============================================================================================================
-- My solution
USE sql_store;

SELECT 
	product_id,
    name,
    (SELECT COUNT(product_id) FROM order_items WHERE product_id = p.product_id) AS orders,
    IF((SELECT COUNT(product_id) FROM order_items WHERE product_id = p.product_id) > 1, 'Many times', 'Once') AS frequency
FROM products p;
-- ============================================================================================================
-- ============================================================================================================
-- How the instructor solved it LOL, so much better
USE sql_store;

SELECT 
	p.product_id,
    p.name,
    COUNT(*) AS orders,
    IF(COUNT(*) > 1, 'Many times', 'Once') AS frequency
FROM products p
JOIN order_items oi
	ON p.product_id = oi.product_id
GROUP BY p.product_id, p.name
-- ============================================================================================================
-- ============================================================================================================