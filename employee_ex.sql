-- SELECT statement
-- SELECT * FROM "public"."employees";
-- SELECT * FROM "public"."departments";
-- SELECT COUNT(*) FROM "public"."salaries" where emp_no = 10001;
-- SELECT * from "titles" where emp_no = 10006;

-- AS and SCALAR Function
-- select emp_no as "Employee #", birth_date as "Birthday", first_name as "First Name" from "public"."employees";
-- select emp_no as "Employee #", concat(first_name, ' ', last_name) as "Employee Name" from "public"."employees";

-- AGGREGATE Function
-- select count(*) from employees;
-- Exercise Highest salary, Total amount of salaries paid
-- select max(salary) as "Highest Salary", sum(salary) as "Total Salaries Paid" from salaries;

-- Exercise
-- Q1: What is the average salary for the company? -> 63810.744836143706
-- select avg(salary) from salaries;
-- Q2: What year was the youngest person born in the company? -> 1965-02-01
-- SELECT max("birth_date") from employees;

-- Exercise Employee with name Mayumi Schueller
-- select * 
-- from employees 
-- /* 
--    filter on first name AND last name to limit the amount of data 
--    returned and focus the filtering on a single person.
--  */
-- where first_name='Mayumi' and last_name='Schueller';

-- Query for female employee
-- select * 
-- from employees 
-- where gender='F';

-- Like Operator

-- Find the age of all employees who's name starts with M.
-- SELECT emp_no, first_name, EXTRACT (YEAR FROM AGE(birth_date)) as "age" 
-- FROM employees
-- WHERE first_name LIKE 'M%';

-- How many people's name start with A and end with R?
-- SELECT COUNT(*) 
-- FROM employees
-- WHERE first_name ILIKE 'A%R';

/* Time and Date */
-- Get me all the employees above 60, use the appropriate date functions
-- SELECT AGE(birth_date) as age, * FROM employees
-- WHERE EXTRACT( YEAR FROM AGE(birth_date) ) > 60;

--  How many employees where hired in February? -> 24448
-- SELECT count( * ) FROM employees 
-- WHERE EXTRACT( MONTH from hire_date ) = 2;

-- How many employees were born in november? -> 24500
-- SELECT count( * ) FROM employees 
-- WHERE EXTRACT( MONTH from birth_date ) = 11;

-- Who is the oldest employee? (Use the analytical function MAX) -> 69 years
-- SELECT MAX( AGE(birth_date) ) AS oldest_employee FROM employees;

/* Distinct */
-- What unique titles do we have?
-- SELECT DISTINCT title FROM titles;

-- How many unique birth dates are there?
-- SELECT count( DISTINCT birth_date ) FROM employees;

/* Order By */
-- Sort employees by first name ascending and last name descending
-- SELECT * FROM employees 
-- ORDER BY first_name ASC, last_name DESC;

-- Sort employees by age
-- SELECT age(birth_date) as age , * FROM employees 
-- ORDER BY age(birth_date);

-- Sort employees who's name starts with a "k" by hire_date
-- SELECT * FROM employees 
-- WHERE first_name ILIKE 'k%'
-- ORDER BY hire_date;

/* Inner Join */
-- Show me for each employee which department they work in
-- SELECT emp.*, dept.dept_name AS "working_dept"
-- FROM employees AS emp 
-- INNER JOIN dept_emp AS dpemp ON emp.emp_no = dpemp.emp_no 
-- INNER JOIN departments AS dept ON dpemp.dept_no = dept.dept_no
-- ORDER BY emp_no;

/* Group By */
-- How many people were hired on any given hire date?
-- SELECT employees.hire_date, count(employees.emp_no) 
-- FROM employees
-- GROUP BY employees.hire_date 
-- ORDER BY employees.hire_date;

-- Show me all the employees, hired after 1991 and count the amount of positions they've had
-- SELECT emp.*, count(t.title) AS "position_hold"
-- FROM employees AS emp 
-- INNER JOIN titles AS t USING(emp_no) 
-- WHERE date_trunc( 'YEAR', emp.hire_date ) >= '1991-1-1'
-- GROUP BY emp.emp_no 
-- ORDER BY emp.emp_no;

-- Show me all the employees that work in the department development and the from and to date.
-- SELECT emp.*, de.from_date, de.to_date 
-- FROM employees AS emp 
-- INNER JOIN dept_emp AS de ON emp.emp_no = de.emp_no 
-- INNER JOIN departments AS d ON de.dept_no = d.dept_no 
-- WHERE d.dept_name = 'Development'
-- GROUP BY emp.emp_no, de.from_date, de.to_date 
-- ORDER BY emp.emp_no;

/* Having */
-- Show me all the employees, hired after 1991, that have had more than 2 titles
-- SELECT emp.*, count(t.title) AS "position_hold"
-- FROM employees AS emp 
-- INNER JOIN titles AS t USING(emp_no) 
-- WHERE EXTRACT( 'YEAR' FROM emp.hire_date ) > 1991 
-- GROUP BY emp.emp_no 
-- HAVING count(t.title) > 2 
-- ORDER BY emp.emp_no;

-- Show me all the employees that have had more than 15 salary changes that work in the department development
-- SELECT emp.*, count(s.salary) AS "# of raises" 
-- FROM employees AS emp 
-- INNER JOIN salaries AS s ON emp.emp_no = s.emp_no 
-- INNER JOIN dept_emp AS de ON emp.emp_no = de.emp_no 
-- INNER JOIN departments AS d ON de.dept_no = d.dept_no 
-- WHERE d.dept_name = 'Development'
-- GROUP BY emp.emp_no 
-- HAVING count(s.salary) > 15 
-- ORDER BY emp.emp_no;

-- Show me all the employees that have worked for multiple departments
-- SELECT emp.*, count(de.dept_no) AS "dept_worked" 
-- FROM employees AS emp 
-- INNER JOIN dept_emp AS de ON emp.emp_no = de.emp_no 
-- GROUP BY emp.emp_no 
-- HAVING count(de.dept_no) > 1 
-- ORDER BY emp.emp_no;