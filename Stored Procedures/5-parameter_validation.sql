-- ============================================================================================================
-- ============================================================================================================
USE sql_invoicing;

DROP PROCEDURE IF EXISTS make_payment;
DELIMITER //

CREATE PROCEDURE make_payment(invoice_id INT, payment_amount DECIMAL(9, 2), payment_date DATE)
BEGIN
	UPDATE invoices i
    SET i.payment_total = payment_amount,
		i.payment_date = payment_date
	WHERE i.invoice_id = invoice_id;
END//

DELIMITER ;

CALL make_payment(2, 100, '2019-01-01');
-- ============================================================================================================
-- ============================================================================================================
-- But what if I put a negative value, instead of 100, -100
USE sql_invoicing;

DROP PROCEDURE IF EXISTS make_payment;
DELIMITER //

CREATE PROCEDURE make_payment(invoice_id INT, payment_amount DECIMAL(9, 2), payment_date DATE)
BEGIN
	IF payment_amount <= 0 THEN 
		-- Throw an error 
		SIGNAL SQLSTATE '22003'
			-- Optional: setting a descriptive message 
			SET MESSAGE_TEXT = 'Invalid payment amount';
	END IF;
    
	UPDATE invoices i
    SET i.payment_total = payment_amount,
		i.payment_date = payment_date
	WHERE i.invoice_id = invoice_id;
END//

DELIMITER ;

CALL make_payment(2, -100, '2019-01-01');
-- ============================================================================================================
-- ============================================================================================================
