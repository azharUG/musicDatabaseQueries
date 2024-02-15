-- Query 6:  Define an insightful query on your own that involves at least three tables

-- This query will return the top 5 genres by total sales

SELECT genres.Name AS Genre, SUM(invoices.Total) AS TotalSales
FROM genres
JOIN tracks ON genres.GenreId = tracks.GenreId
JOIN invoice_items ON invoice_items.TrackId = tracks.TrackId
JOIN invoices ON invoices.InvoiceId = invoice_items.InvoiceId
GROUP BY genres.Name
ORDER BY SUM(invoices.Total) DESC
LIMIT 5;






