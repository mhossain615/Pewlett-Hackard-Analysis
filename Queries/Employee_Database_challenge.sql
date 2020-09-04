-- Creating Retirement Titles table
SELECT empl.emp_no,
	empl.first_name,
	empl.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees as empl
	INNER JOIN titles as t
		ON (empl.emp_no = t.emp_no)
WHERE (empl.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY empl.emp_no;



-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;


-- creating Retiring Titles table
SELECT COUNT(emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(emp_no) DESC;



-- Create table of employees eligible for mentorship program
SELECT DISTINCT ON (empl.emp_no) empl.emp_no,
	empl.first_name,
	empl.last_name,
	empl.birth_date,
	de.from_date,
	t.to_date,
	t.title
INTO mentorship_eligibility
FROM employees AS empl
	INNER JOIN dept_empl AS de
		ON (empl.emp_no = de.emp_no)
	INNER JOIN titles as t
		ON (empl.emp_no = t.emp_no)
WHERE (empl.birth_date BETWEEN ' 1965-01-01' AND '1965-12-31')
	AND (t.to_date = '9999-01-01')
ORDER BY empl.emp_no;
