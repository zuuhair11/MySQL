-- =========================================================================================================
-- =========================================================================================================
USE sql_invoicing;

SELECT 
	invoice_id,
    invoice_total,
    (SELECT AVG(invoice_total) FROM invoices) AS invoice_average,
	invoice_total - (SELECT invoice_average) AS difference
FROM invoices;
-- =========================================================================================================
-- =========================================================================================================
USE sql_invoicing;

SELECT 
	c.client_id,
    name,
    (SELECT SUM(invoice_total) FROM invoices i WHERE i.client_id = c.client_id) AS total_sales,
    (SELECT AVG(invoice_total) FROM invoices) AS average,
	(SELECT total_sales - average) AS difference
FROM clients c
