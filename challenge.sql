--CHALLENGE---------------------------------------------
-- PART 1: Generate the following tables

--#1. Number of [titles] Retiring : emp_no, first_name, last_name, title, from_date, salary 
	--titles: emp#, title, fromdate, to date
	--salaries: emp#, salary, fromdate, todate 
	--employees: em#, birth_date, first_name, last_name, gender, hire_date 
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	tl.title,
	tl.from_date,
	s.salary	
INTO titles_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN titles as tl
ON (e.emp_no = tl.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (tl.to_date = '9999-01-01');

--#2. Only the most recent titles 
SELECT COUNT (title), title
INTO count_titles 
FROM titles_info 
Group by title
Order by title ;

--#3. Who's ready for a mentor?
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	tl.title,
	tl.from_date,
	tl.to_date
INTO mentor_info 
INNER JOIN titles as tl
ON (e.emp_no = tl.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (tl.to_date = '9999-01-01');
