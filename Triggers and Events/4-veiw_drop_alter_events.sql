-- ============================================================================================================
-- ============================================================================================================
-- View all events
SHOW EVENTS;
-- ============================================================================================================
-- ============================================================================================================
-- Delete a specific event
DROP EVENT IF EXISTS yearly_delete_stale_audit_rows;
-- ============================================================================================================
-- ============================================================================================================
-- Change an event without the need to drop it and created it
DELIMITER //
ALTER EVENT yearly_delete_stale_audit_rows
ON SCHEDULE 
    EVERY 1 YEAR STARTS '2023-01-01' ENDS '2030-01-01'
DO BEGIN
	DELETE FROM payments_audit
    WHERE action_date < NOW() - INTERVAL 1 YEAR;
END//

DELIMITER ;
-- ============================================================================================================
-- We can also use alter for disable or enable an event
ALTER EVENT yearly_delete_stale_audit_rows DISABLE;
ALTER EVENT yearly_delete_stale_audit_rows ENABLE;
-- ============================================================================================================
-- ============================================================================================================
