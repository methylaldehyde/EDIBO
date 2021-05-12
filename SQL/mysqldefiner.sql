DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `InvoiceTotalToday`(inInvoiceId int) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
declare TotalTodayVar decimal(10,2);
select sum(ii.Quantity * t.UnitPrice) as TotalToday
#from invoices i
#join invoice_items ii on ii.fkInvoiceId = i.pkInvoiceId
from invoice_items ii
join tracks t on t.pkTrackId = ii.fkTrackId
#join media_types md on md.pkMediaTypeId = t.fkMediaTypeId
#join genres g on g.pkGenreId = t.fkGenreId
#join albums al on al.pkAlbumId = t.fkAlbumId
#join artists ar on ar.pkArtistId = al.fkArtistId
#where i.pkInvoiceId = inInvoiceId into @TotalTodayVar;
where ii.fkInvoiceId = inInvoiceId into @TotalTodayVar;
RETURN (@TotalTodayVar);
END$$
DELIMITER ;