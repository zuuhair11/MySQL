-- =========================================================================================================
-- =========================================================================================================
-- Select employees whose salary is above the average in their office
-- for each employee
--      calculate the avg salary for employee.office
--      return the employee if salary > avg
USE sql_hr;

SELECT *
FROM employees e
WHERE salary > (
	SELECT AVG(salary)
    FROM employees
    WHERE office_id = e.office_id
);
-- =========================================================================================================
-- =========================================================================================================
-- Get invoices that are larger than the client's average invoice amount
USE sql_invoicing;

SELECT *
FROM invoices i
WHERE invoice_total > (
	SELECT AVG(invoice_total)
    FROM invoices
    WHERE client_id = i.client_id
);
-- =========================================================================================================
-- =========================================================================================================