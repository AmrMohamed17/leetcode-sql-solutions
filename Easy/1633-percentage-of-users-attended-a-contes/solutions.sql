SELECT 
    R.contest_id, 
    ROUND(
        100 * (
            COUNT(U.user_id) / (SELECT COUNT(*) FROM Users)
        ), 
        2
    ) AS percentage
FROM Users U
JOIN Register R 
    ON U.user_id = R.user_id
GROUP BY R.contest_id
ORDER BY 
    percentage DESC, 
    R.contest_id;