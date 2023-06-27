-- ===========================================================================================================
-- ===========================================================================================================
-- Creating the view
USE sql_invoicing;

CREATE VIEW sales_by_client AS
SELECT 
	c.client_id,
    c.name,
    SUM(i.invoice_total) AS total_sales
FROM clients c
JOIN invoices i USING(client_id)
GROUP BY c.client_id, c.name;
-- ===========================================================================================================
-- ===========================================================================================================
-- We can use our view as a table now, views behaviove like a virtual table
-- But views don't store data, data actually stored in the tables,
USE sql_invoicing;

SELECT *
FROM sales_by_client
ORDER BY total_sales DESC;

-- OR even join it with other table
USE sql_invoicing;

SELECT *
FROM sales_by_client s
JOIN clients c USING(client_id);
-- ===========================================================================================================
-- ===========================================================================================================
-- Create a view 'clients_balance' to see the balance of each client
USE sql_invoicing;

CREATE VIEW clients_balance AS
SELECT 
	c.client_id,
    c.name,
    SUM(i.invoice_total - i.payment_total) AS balance
FROM clients c
JOIN invoices i
	ON c.client_id = i.client_id
GROUP BY c.client_id, c.name;
-- ===========================================================================================================
-- ===========================================================================================================
