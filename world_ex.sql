-- Exercise
-- How many official languages are there? -> 238
-- SELECT count(*) FROM countrylanguage WHERE isofficial = true;

-- What is the average life expectancy in the world? -> 66.48603611164265
-- SELECT avg(lifeexpectancy) FROM country;

-- What is the average population for cities in the netherlands? -> 185001.750000000000
-- select avg(population) from city WHERE countrycode = 'NLD';

-- How many cities are in the district of Zuid-Holland, Noord-Brabant and Utrecht?
-- SELECT COUNT(*) FROM city
-- WHERE district IN ('Zuid-Holland', 'Noord-Brabant', 'Utrecht');


/* Distinct */
-- Can I get a list of distinct life expectancy ages
-- Make sure there are no nulls
-- SELECT DISTINCT lifeexpectancy FROM country 
-- WHERE lifeexpectancy IS NOT NULL;

/* Window */
-- Show the population per continent
-- SELECT DISTINCT continent, 
--     sum(population) OVER (
--         PARTITION BY continent 
--     ) AS "pop per continent"
-- FROM country;

-- To the previous query add on the ability to calculate the percentage of the world population
-- What that means is that you will divide the population of that continent by the total population and multiply by 100 to get a percentage.
-- Make sure you convert the population numbers to float using `population::float` otherwise you may see zero pop up
-- Try to use CONCAT AND ROUND to make the data look pretty
-- SELECT DISTINCT continent, 
--     round(
--         (
--             sum(population::numeric) OVER win1 / 
--             sum(population::numeric) OVER () * 
--             100
--         ), 2
--     ) || '%' AS "continent pop percentage"
-- FROM country
-- WINDOW win1 AS (PARTITION BY continent);

