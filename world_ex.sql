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
