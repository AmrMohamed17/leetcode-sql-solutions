SELECT E.name
FROM Employee E
JOIN Employee EM ON EM.managerId = E.id
GROUP BY E.id, E.name
HAVING COUNT(*) > 4;