SELECT 
    ST.student_id,
    ST.student_name,
    sub.subject_name,
    COUNT(E.subject_name) AS attended_exams
FROM Students AS ST
CROSS JOIN Subjects AS sub
LEFT JOIN Examinations AS E
    ON ST.student_id = E.student_id
   AND E.subject_name = sub.subject_name
GROUP BY 
    ST.student_id,
    ST.student_name,
    sub.subject_name
ORDER BY 
    ST.student_id,
    sub.subject_name;