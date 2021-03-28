-- How many female customers do we have from the state of Oregon (OR)? -> 106
-- select count(*) 
-- from customers 
-- where gender='F' and state='OR'; 

-- Who over the age of 44 has an income of 100 000 or more? (excluding 44) -> 2497
-- select count(*) 
-- from customers 
-- where age > 44 and income >= 100000;

-- Who between the ages of 30 and 50 has an income less than 50 000?
-- (include 30 and 50 in the results) -> 2362
-- select count(*) 
-- from customers 
-- where age >= 30 and age <= 50 and income < 50000; 

-- What is the average income between the ages of 20 and 50? (Excluding 20 and 50) -> 59409.926240780098
-- select avg(income) 
-- from customers 
-- where age > 20 and age < 50; 

/* 
* Select people either under 30 or over 50 with an income above 50000
* Include people that are 50
* that are from either Japan or Australia -> 868
*/

-- select count(*)
-- from customers 
-- where 
--     (age < 30 or age >=50) 
--     and income > 50000 
--     and (country = 'Australia' or country = 'Japan');


-- What was our total sales in June of 2004 for orders over 100 dollars? -> 205226.06
-- select sum(totalamount) 
-- from Orders 
-- where orderdate >= '2004-6-1' and orderdate < '2004-7-1' and totalamount > 100;