-- ===========================================================================================================
-- ===========================================================================================================
-- If the view doesn't have one of those, we call it updatable view, we can update data through it:

-- DISTINCT
-- Aggregate functions / (MIN, MAX, SUM)
-- GROUP BY / HAVING
-- UNION
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

-- Now we can delete
DELETE FROM invoices_with_balance
WHERE invoice_id = 1;

-- Now we can update the due_date to two days after:
UPDATE invoices_with_balance
SET due_date = DATE_ADD(due_date, INTERVAL 2 DAY)
WHERE invoice_id = 2;
-- ===========================================================================================================
-- ===========================================================================================================
