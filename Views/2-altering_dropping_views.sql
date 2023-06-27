-- ===========================================================================================================
-- ===========================================================================================================
USE sql_invoicing;

-- DROPPING
DROP VIEW IF EXISTS sales_by_client;
CREATE VIEW sales_by_client AS
SELECT 
	c.client_id,
    c.name,
    SUM(i.invoice_total) AS total_sales
FROM clients c
JOIN invoices i
	ON c.client_id = i.client_id
GROUP BY c.client_id, c.name;
-- ===========================================================================================================
-- ===========================================================================================================
-- OR REPLACE
USE sql_invoicing;

CREATE OR REPLACE VIEW sales_by_client AS
SELECT 
	c.client_id,
    c.name,
    SUM(i.invoice_total) AS total_sales
FROM clients c
JOIN invoices i
	ON c.client_id = i.client_id
GROUP BY c.client_id, c.name;
-- ===========================================================================================================
-- ===========================================================================================================
