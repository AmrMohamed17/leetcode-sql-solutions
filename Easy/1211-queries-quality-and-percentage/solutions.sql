SELECT 
    q.query_name, 
    ROUND(AVG(q.rating / position), 2) AS quality, 
    ROUND(
        100.0 * (
            SELECT COUNT(*) 
            FROM Queries q2
            WHERE q2.query_name = q.query_name AND rating < 3
        ) / COUNT(q.query_name), 
        2
    ) AS poor_query_percentage
FROM Queries q
GROUP BY query_name;