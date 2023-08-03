SELECT td.user_id, u.username, td.training_id, td.training_date, count(*)
FROM  USER u 
INNER JOIN TRAINING_DETAILS td 
ON u.user_id = td.user_id
WHERE (td.user_id, td.training_id, td.training_date)
IN (SELECT user_id, training_id, training_date 
    FROM  TRAINING_DETAILS 
    GROUP BY  user_id, training_id, training_date 
    HAVING COUNT(*) > 1
   )
GROUP BY td.user_id, td.training_id
ORDER BY td.training_date DESC;