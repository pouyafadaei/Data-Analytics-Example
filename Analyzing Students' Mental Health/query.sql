-- This query analyzes international students only
-- and aggregates their mental health and acculturative stress scores
-- grouped by their length of stay.

SELECT stay,
       COUNT(inter_dom)     AS count_int,
       ROUND(AVG(todep), 2) AS average_phq,
       ROUND(AVG(tosc), 2)  AS average_scs,
       ROUND(AVG(toas), 2)  AS average_as
FROM students
WHERE inter_dom = 'Inter'
GROUP BY stay
ORDER BY stay DESC;
