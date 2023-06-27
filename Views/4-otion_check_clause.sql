-- ===========================================================================================================
-- ===========================================================================================================
USE sql_invoicing;

CREATE OR REPLACE VIEW invoices_with_balance AS 
SELECT 
	invoice_id,
    number,
    client_id,
    invoice_total,
    payment_total,
    invoice_total - payment_total AS balance,
    invoice_date,
    due_date,
    payment_date
FROM invoices
WHERE (invoice_total - payment_total) > 0
-- ===========================================================================================================
-- ===========================================================================================================
-- Now this row gonna disappeared
USE sql_invoicing;

UPDATE invoices_with_balance
SET payment_total = invoice_total 
WHERE invoice_id = 2;
-- ===========================================================================================================
-- ===========================================================================================================
-- But sometimes you don't want this to happen you don't want an update remove something from the view
-- By using: WITH CHECK OPTION
USE sql_invoicing;

CREATE OR REPLACE VIEW invoices_with_balance AS 
SELECT 
	invoice_id,
    number,
    client_id,
    invoice_total,
    payment_total,
    invoice_total - payment_total AS balance,
    invoice_date,
    due_date,
    payment_date
FROM invoices
WHERE (invoice_total - payment_total) > 0
WITH CHECK OPTION
-- ===========================================================================================================
-- ===========================================================================================================
