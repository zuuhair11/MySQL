-- =========================================================================================================
-- =========================================================================================================
-- Select clients with at least two invoices
-- Using: "IN"
USE sql_invoicing;

SELECT *
FROM clients
WHERE client_id IN (
	SELECT client_id
    FROM invoices
    GROUP BY client_id
	HAVING COUNT(*) >= 2
);
-- =========================================================================================================
-- =========================================================================================================
-- Select clients with at least two invoices
-- Using: "ANY"
USE sql_invoicing;

SELECT *
FROM clients
WHERE client_id = ANY (
	SELECT client_id
    FROM invoices
    GROUP BY client_id
	HAVING COUNT(*) >= 2
);
-- =========================================================================================================
-- =========================================================================================================