-- ============================================================================================================
-- ============================================================================================================
USE sql_invoicing;

DROP PROCEDURE IF EXISTS get_clients_by_state;
DELIMITER //

CREATE PROCEDURE get_clients_by_state(state CHAR(2))
BEGIN
	IF state IS NULL THEN
		SELECT * FROM clients;
	ELSE 
		SELECT * FROM clients c
        WHERE c.state = state;
	END IF;
END//

DELIMITER ;

-- it will return all clients when you gave it a 'NULL' value 
CALL get_clients_by_state(NULL);
-- ============================================================================================================
-- ============================================================================================================
-- a better way to achieve the same results
USE sql_invoicing;

DROP PROCEDURE IF EXISTS get_clients_by_state;
DELIMITER //

CREATE PROCEDURE get_clients_by_state(state CHAR(2))
BEGIN
	SELECT * FROM clients c
    WHERE c.state = IFNULL(state, c.state);
 -- WHERE c.state = c.state; 
END//

DELIMITER ;
CALL get_clients_by_state(NULL);
-- ============================================================================================================
-- ============================================================================================================
-- Write a stored procedure called called get_payments with two parameters
USE sql_invoicing;

DROP PROCEDURE IF EXISTS get_payments;
DELIMITER //

CREATE PROCEDURE get_payments(client_id INT, payment_method TINYINT)
BEGIN
	SELECT * FROM payments p
    WHERE p.client_id = IFNULL(client_id, p.client_id) AND
		  p.payment_method = IFNULL(payment_method, p.payment_method);
END//

DELIMITER ;

-- Gonna return all clients having the same payment method
CALL get_payments(NULL, 1);
-- ============================================================================================================
-- ============================================================================================================
