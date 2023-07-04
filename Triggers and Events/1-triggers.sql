-- Trigger is a block of SQL code that gets automatically gets executed before or after
-- an insert, update or delete statement.
-- ============================================================================================================
-- ============================================================================================================
USE sql_invoicing;

-- We can modify data of any table, except this table payments
-- If we do so we are gonna end up with infinit loop
DROP TRIGGER IF EXISTS payments_after_insert;
DELIMITER //

-- AS naming convention: table's name(payments), action(after, before), sql statement(insert, delete)
CREATE TRIGGER payments_after_insert
	AFTER INSERT ON payments
    FOR EACH ROW 
BEGIN
	UPDATE invoices
    SET payment_total = payment_total + NEW.amount
    WHERE invoice_id = NEW.invoice_id;
END//

DELIMITER ;

INSERT INTO payments
VALUES(DEFAULT, 5, 3, '2019-01-01', 10, 1); 
-- ============================================================================================================
-- ============================================================================================================
-- Create a trigger that gets fired when we delete a payments
USE sql_invoicing;

DROP TRIGGER IF EXISTS payments_after_delete
DELIMITER //

CREATE TRIGGER payments_after_delete
	AFTER DELETE ON payments
    FOR EACH ROW
BEGIN
	UPDATE invoices
    SET payment_total = payment_total - OLD.amount 
    WHERE invoice_id = OLD.invoice_id;
END//

DELIMITER ;

DELETE
FROM payments 
WHERE payment_id = 9;
-- ============================================================================================================
-- ============================================================================================================
