-- =========================================================================================================
-- =========================================================================================================
-- It's necessary to give it an aliase, whether we are gonna use it or not
SELECT * 
FROM (
    SELECT 
        c.client_id,
        name,
        (SELECT SUM(invoice_total) FROM invoices i WHERE i.client_id = c.client_id) AS total_sales,
        (SELECT AVG(invoice_total) FROM invoices) AS average,
        (SELECT total_sales - average) AS difference
    FROM clients c

) AS sales_summary;
-- =========================================================================================================
-- =========================================================================================================
-- Now we can filter it, let's say I want only the client who has total sales
SELECT * 
FROM (
    SELECT 
        c.client_id,
        name,
        (SELECT SUM(invoice_total) FROM invoices i WHERE i.client_id = c.client_id) AS total_sales,
        (SELECT AVG(invoice_total) FROM invoices) AS average,
        (SELECT total_sales - average) AS difference
    FROM clients c

) AS sales_summary
WHERE total_sales IS NOT NULL
-- =========================================================================================================
-- =========================================================================================================