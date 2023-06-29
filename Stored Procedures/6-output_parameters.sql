-- ============================================================================================================
-- ============================================================================================================
USE sql_invoicing;

DROP PROCEDURE IF EXISTS get_unpaid_invoices_for_client;
DELIMITER //

CREATE PROCEDURE get_unpaid_invoices_for_client(
	client_id INT, 
    OUT invoices_count INT, 
    OUT invoices_total DECIMAL(9, 2)
)
BEGIN
	SELECT COUNT(*), SUM(invoice_total)
	INTO invoices_count, invoices_total
    
    FROM invoices i
	WHERE i.client_id = client_id AND
		  i.payment_total = 0;
END//

DELIMITER ;
-- ============================================================================================================
USE sql_invoicing;

-- First we have to define the variable that I am gonna return
SET @invoices_count = 0;
SET @invoices_total = 0;

-- Then passing them when I call my procedural
CALL get_unpaid_invoices_for_client(3, @invoices_count, @invoices_total);

-- So now I can display my variables's data
SELECT @invoices_count, @invoices_total;
-- ============================================================================================================
-- ============================================================================================================
