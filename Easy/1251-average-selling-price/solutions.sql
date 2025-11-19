SELECT 
    P.product_id, 
    COALESCE(
        ROUND(
            SUM(P.price * U.units) / SUM(U.units), 
            2
        ), 
        0
    ) AS average_price
FROM Prices P
LEFT JOIN UnitsSold U 
    ON U.product_id = P.product_id
    AND P.start_date <= U.purchase_date
    AND U.purchase_date <= P.end_date
GROUP BY P.product_id;