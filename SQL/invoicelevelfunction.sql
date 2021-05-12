use world;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `InvoiceLevel`(invoice_total DECIMAL(10,2)) RETURNS varchar(20) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE invoiceLevel VARCHAR(20);
    IF invoice_total >  23 THEN
		SET invoiceLevel = 'PLATINUM';
    ELSEIF (invoice_total <= 23 AND 
			invoice_total >= 15) THEN
        SET invoiceLevel = 'GOLD';
    ELSEIF invoice_total < 15 THEN
        SET invoiceLevel = 'SILVER';
    END IF;
	-- return the customer level
	RETURN (invoiceLevel);
END$$
DELIMITER ;