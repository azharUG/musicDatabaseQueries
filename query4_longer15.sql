-- Query 4:  Write a query that lists all the customers that listen to longer-than-average tracks, excluding the tracks that are longer than 15 minutes. 

SELECT DISTINCT c.*
FROM customers AS c
JOIN invoices AS i ON c.CustomerId = i.CustomerId
JOIN invoice_items AS ii ON i.InvoiceId = ii.InvoiceId
JOIN tracks AS t ON ii.TrackId = t.TrackId
WHERE t.Milliseconds > (
    SELECT AVG(t2.Milliseconds)
    FROM tracks AS t2
    WHERE t2.Milliseconds < (1000 * 60 * 15)
)
AND t.Milliseconds < (1000 * 60 * 15)
ORDER BY c.CustomerId;

-- Used gemini with prompt: Write a query that lists all the customers that listen to longer-than-average tracks, excluding the tracks that are longer than 15 minutes. 
-- gemeni also had the context of the assignment and the database schema.