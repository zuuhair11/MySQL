-- =========================================================================================================
-- =========================================================================================================
-- Select invoices largar than all invoices of client 3
-- Using: "MAX"
USE sql_invoicing;

SELECT *
FROM invoices
WHERE invoice_total > (
	SELECT MAX(invoice_total)
    FROM invoices
    WHERE client_id = 3
);
-- =========================================================================================================
-- =========================================================================================================
-- Select invoices largar than all invoices of client 3
-- Using: "ALL"
USE sql_invoicing;

SELECT *
FROM invoices
WHERE invoice_total > ALL (
	SELECT invoice_total
    FROM invoices
    WHERE client_id = 3
);
-- comparing each row, if the value is greater than those value: ALL (10, 20, 30), then return it
-- =========================================================================================================
-- =========================================================================================================