-- The formate how the dates stored in the database, we have to change it during the dispaly to the user
-- ============================================================================================================
-- ============================================================================================================
SELECT DATE_FORMAT(NOW(), '%y');        -- 23
SELECT DATE_FORMAT(NOW(), '%Y');        -- 2023
-- ============================================================================================================
-- ============================================================================================================
SELECT DATE_FORMAT(NOW(), '%m');        -- 06
SELECT DATE_FORMAT(NOW(), '%M');        -- June
-- ============================================================================================================
-- ============================================================================================================
SELECT DATE_FORMAT(NOW(), '%M %d %Y');  -- June 25 2023
SELECT DATE_FORMAT(NOW(), '%M %D %Y');  -- Junde 25th 2023
-- ============================================================================================================
-- ============================================================================================================
SELECT TIME_FORMAT(NOW(), '%H:%i %p');  -- 07:58 AM
-- ============================================================================================================
-- ============================================================================================================