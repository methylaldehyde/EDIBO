use world;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_invoices_by_empl_no_arg`()

BEGIN
   set @inEmplId=3;
   set @inYear='2010';
   set @inMonth='01';
   set @filtr = concat('%',@inYear,'-',@inMonth,'-%');
   
   select concat(em.FirstName,' ',em.LastName), Company, pkInvoiceId, InvoiceDate, Total
   from employees em
   join customers c on em.pkEmployeeId=c.fkSupportRepId
   join invoices inv on c.pkCustomerId=inv.fkCustomerId
   where em.pkEmployeeId=@inEmplId
   and InvoiceDate like @filtr
   order by InvoiceDate asc;
  
END$$
DELIMITER ;