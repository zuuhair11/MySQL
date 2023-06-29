-- ============================================================================================================
-- ============================================================================================================

-- User or session variables
-- They stored in the memory through the entire client session until the client disconnect from MySQL 'deleted'
SET @invoice_count = 0;

-- ============================================================================================================
-- ============================================================================================================

-- Local variable
-- Those type of variable, don't stay in the memory through entire user session
-- Just the stored procedure finish execution they deleted
USE sql_invoicing;

DROP PROCEDURE IF EXISTS get_risk_factor;
DELIMITER //

CREATE PROCEDURE get_risk_factor()
BEGIN
	DECLARE risk_factor DECIMAL(9, 2) DEFAULT 0;
    DECLARE invoices_total DECIMAL(9, 2);
    DECLARE invoices_count INT;
    
    SELECT COUNT(*), SUM(invoice_total)
	INTO invoices_count, invoices_total
    FROM invoices;
    
    SET risk_factor = invoices_total / invoices_count * 5;
    SELECT risk_factor;
END//

DELIMITER ;

-- ============================================================================================================
-- ============================================================================================================
CALL get_risk_factor();
-- ============================================================================================================
-- ============================================================================================================
