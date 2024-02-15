
-- Query 5:  Write a query that lists all the tracks that are not in one of the top 5 genres with longer duration in the database. 

SELECT t.*
FROM tracks AS t
INNER JOIN genres AS g ON t.GenreId = g.GenreId
WHERE t.GenreId NOT IN (
    SELECT g2.GenreId
    FROM genres AS g2
    ORDER BY (
        SELECT AVG(t2.Milliseconds)
        FROM tracks AS t2
        WHERE t2.GenreId = g2.GenreId
    ) DESC
    LIMIT 5
);