-- =========================================================================================================
-- =========================================================================================================
-- Select clients that have an invoice
-- Using: "IN"
USE sql_invoicing;

SELECT *
FROM clients
WHERE client_id IN (
	SELECT DISTINCT client_id
    FROM invoices
);
-- =========================================================================================================
-- =========================================================================================================
-- Select clients that have an invoice
-- Using: "EXISTS"
USE sql_invoicing;

SELECT *
FROM clients c
WHERE EXISTS (
	SELECT client_id
    FROM invoices 
    WHERE client_id = c.client_id
);
-- It mixed with "correlated subquery", each client we check him
-- For better performance use "EXISTS", because it doesn't return all, instead it just check whether...
-- =========================================================================================================
-- =========================================================================================================
-- Find the products that have never been orderd
-- Using: "IN"
USE sql_store;

SELECT *
FROM products
WHERE product_id NOT IN (
	SELECT DISTINCT product_id
    FROM order_items
);
-- =========================================================================================================
-- =========================================================================================================
-- Find the products that have never been orderd
-- Using: "EXISTS"
SELECT *
FROM products p
WHERE NOT EXISTS (
	SELECT product_id
    FROM order_items
    WHERE product_id = p.product_id
);