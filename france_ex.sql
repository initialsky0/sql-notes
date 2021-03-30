-- Exercise
-- How many towns are there in france? -> 36684
SELECT count(*) FROM towns;

/* Window */
--  Count the number of towns per region
-- SELECT DISTINCT r.id, 
--     r.name, 
--     count(t.name) OVER (
--         PARTITION BY d.region 
--     ) AS "towns in region"
-- FROM regions AS r 
-- JOIN departments AS d ON d.region = r.code 
-- JOIN towns AS t ON t.department = d.code 
-- ORDER BY r.id;