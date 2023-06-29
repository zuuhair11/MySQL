-- ============================================================================================================
-- ============================================================================================================
-- Creating a procedure
USE sql_invoicing;

DELIMITER //

CREATE PROCEDURE get_clients()
BEGIN
	SELECT * FROM clients;
END//

DELIMITER ;
-- ============================================================================================================
-- Calling the procedure
USE sql_invoicing;

CALL get_clients();
-- ============================================================================================================
-- ============================================================================================================
-- Create a stored procedure called: get_invoices_with_balance()
-- to return all invoices with balance > 0
USE sql_invoicing;

DELIMITER //

CREATE PROCEDURE get_invoices_with_balance()
BEGIN
	SELECT * FROM invoices
	WHERE (invoice_total - payment_total) > 0;
END//

DELIMITER ;
-- ============================================================================================================
-- ============================================================================================================
-- Using the view: invoices_with_balance
USE sql_invoicing;

DELIMITER //

CREATE PROCEDURE get_invoices_with_balance()
BEGIN
	SELECT * FROM invoices_with_balance
	WHERE balance > 0;
END//

DELIMITER ;
-- ============================================================================================================
-- ============================================================================================================
