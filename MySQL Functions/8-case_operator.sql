-- ============================================================================================================
-- ============================================================================================================
-- Using: IF()
USE sql_store;

SELECT 
	order_id,
    IF(YEAR(order_date) = YEAR(NOW()), 'Active', 'Archived') AS category
FROM orders;
-- ============================================================================================================
-- ============================================================================================================
-- Using: CASE()
USE sql_store;

SELECT 
    order_id,
    CASE 
        WHEN YEAR(order_date) = YEAR(NOW()) THEN 'Active'
        WHEN YEAR(order_date) = YEAR(NOW()) - 1 THEN 'Last Year'
        WHEN YEAR(order_date) < YEAR(NOW()) - 1 THEN 'Archived'
        
        ELSE 'Future'
    END AS category

FROM orders;
-- ============================================================================================================
-- ============================================================================================================
SELECT 
	CONCAT(first_name, ' ', last_name) AS  customer,
    points,
    CASE 
		WHEN points > 3000 THEN 'Gold'
        WHEN points >= 2000 THEN 'Silver'
        ELSE 'Bronze'
	END AS category
    
FROM customers
ORDER BY points DESC;