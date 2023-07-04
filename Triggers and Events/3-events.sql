-- ============================================================================================================
-- ============================================================================================================
USE sql_invoicing;

-- Show all variables
SHOW VARIABLES LIKE 'event%';

-- Sometimes the events sest to OFF in MySQL so:
SET GLOBAL event_scheduler = ON;
-- ============================================================================================================
-- ============================================================================================================
DROP EVENT IF EXISTS yearly_delete_stale_audit_rows;
DELIMITER //

-- Create an event
CREATE EVENT yearly_delete_stale_audit_rows
ON SCHEDULE
	-- If once use: AT
	-- AT '2030-01-01'
    
    -- If regularly use: EVERY		(STARTS and ENDS is optional)
    EVERY 1 YEAR STARTS '2023-01-01' ENDS '2030-01-01'
DO BEGIN
	DELETE FROM payments_audit
    WHERE action_date < NOW() - INTERVAL 1 YEAR;
END//

DELIMITER ;
-- ============================================================================================================
-- ============================================================================================================
