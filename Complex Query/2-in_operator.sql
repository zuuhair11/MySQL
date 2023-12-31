-- =========================================================================================================
-- =========================================================================================================
-- Find the products that have never been orderd
USE sql_store;

SELECT *
FROM products 
WHERE product_id NOT IN (
	SELECT DISTINCT product_id
	FROM order_items
);
-- =========================================================================================================
-- =========================================================================================================
-- Find clients without invoices
USE sql_invoicing;
SELECT *
FROM clients
WHERE client_id IN (
	SELECT DISTINCT client_id
    FROM invoices
    WHERE payment_date IS NULL
);
-- =========================================================================================================
-- =========================================================================================================
