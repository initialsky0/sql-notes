/* Setup and ETC */

-- Database: movr
-- (On user postgres)
-- CREATE DATABASE movr;
-- (Restore database on bash command)
-- psql -d "Movr" -U postgres -f ./Course-data/mystery/schema.sql
-- psql -d "Movr" -U postgres -f ./Course-data/mystery/data.sql

-- Database movr_employee
-- CREATE DATABASE "Movr_Employees";
-- (Restore database on bash command)
-- psql -d "Movr_Employees" -U postgres -f ./Course-data/mystery/movr_employees.sql

-- Command to run query across DB
-- create extension dblink;

-- dblink template
-- SELECT *
-- FROM dblink('host=localhost user=postgres password=password dbname=dbname', 
--    'SELECT col1, col2, ... FROM <table>;'
-- ) 
-- AS t1(col1 NAME, col2 NAME, ...);

/* Query to solve mystery */
-- CREATE VIEW suspect_rides AS 
-- SELECT * 
-- FROM vehicle_location_histories AS vlh 
-- WHERE vlh.lat BETWEEN -74.997 AND -74.9968 
-- AND vlh.long BETWEEN 40.5 AND 40.6 
-- AND vlh.timestamp::date = '2020-06-23'::date; 

-- 1-3 clue
-- SELECT DISTINCT 
--     rides.vehicle_id, 
--     "users"."name" AS "owner name", 
--     users.address, 
--     v.status, 
--     v.current_location 
-- FROM rides 
-- JOIN vehicle_location_histories AS vlh ON rides.id = vlh.ride_id 
-- JOIN vehicles AS v ON rides.vehicle_id = v.id 
-- JOIN users ON v.owner_id = users.id 
-- WHERE DATE_TRUNC('day', rides.end_time) = '2020-06-23' 
-- AND vlh.lat BETWEEN -74.997 AND -74.9968 
-- AND vlh.long BETWEEN 40.5 AND 40.6; 

-- 4 clue 
-- SELECT DISTINCT 
--     rides.vehicle_id, 
--     users.name AS "rider name", 
--     users.address 
-- FROM suspect_ride AS sr 
-- JOIN rides ON rides.id = sr.ride_id 
-- JOIN users ON users.id = rides.rider_id;

-- 5-6 clue
-- CREATE VIEW "suspect_name" AS 
-- SELECT DISTINCT 
--     split_part( users.name, ' ', 1 ) AS "first name", 
--     split_part( users.name, ' ', 2 ) AS "last name" 
-- FROM suspect_ride AS sr 
-- JOIN rides ON rides.id = sr.ride_id 
-- JOIN users ON users.id = rides.rider_id;

-- SELECT * 
-- FROM dblink('host=localhost user=postgres password=password dbname=Movr_Employees', 
--    'SELECT emp_no, first_name, last_name FROM employees;'
-- ) 
-- AS e(emp_no NAME, first_name NAME, last_name NAME) 
-- JOIN suspect_name AS sn ON e.last_name = sn."last name" 
-- ORDER BY e.last_name;
