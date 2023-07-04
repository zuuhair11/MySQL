-- ============================================================================================================
-- ============================================================================================================
USE sql_invoicing;

DROP TRIGGER IF EXISTS payments_after_insert;
DELIMITER //

CREATE TRIGGER payments_after_insert
	AFTER INSERT ON payments
    FOR EACH ROW
BEGIN
	UPDATE invoices
    SET payment_total = payment_total + NEW.amount
    WHERE invoice_id = NEW.invoice_id;
    
    -- For any payment insert
    INSERT INTO payments_audit
    VALUES(NEW.client_id, NEW.date, NEW.amount, 'Insert', NOW());
END//

DELIMITER ;
-- ============================================================================================================
USE sql_invoicing;

DROP TRIGGER IF EXISTS payments_after_delete;
DELIMITER //

CREATE TRIGGER payments_after_delete
	AFTER DELETE ON payments
    FOR EACH ROW
BEGIN
	UPDATE invoices
    SET payment_total = payment_total - OLD.amount
    WHERE invoice_id = OLD.invoice_id;
    
    -- For any delete
    INSERT INTO payments_audit
    VALUES(OLD.client_id, OLD.date, OLD.amount, 'Delete', NOW());
END//

DELIMITER ;
-- ============================================================================================================
-- ============================================================================================================
-- Insert payment row
INSERT INTO payments
VALUES(DEFAULT, 5, 3, '2019-01-01', 10, 1);		-- payment_id: 11

-- Delete payment row
DELETE FROM payments WHERE payment_id = 11;
-- ============================================================================================================
-- ============================================================================================================
