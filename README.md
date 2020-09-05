# Pewlett-Hackard-Analysis

 ## Overview

We have been tasked by our manager to determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program for the company, We are using SQL and showing the data for them.

## Results

* Deliverable 1 consisted of us creating a retirement table from our SQL database We made and exported a Retirement Table consisting of employees who were born 1952 and and 1955 and ran into a issue of dealing with duplicate entries due to employees switching titles

* So then we faced the issue of removing those duplicates which we where able to do using the code 
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

After that we were able to put the data in its frame and have a cleaner data of all the retiring employees 
[![Retiringtables](https://github.com/mhossain615/Pewlett-Hackard-Analysis/blob/master/orginalcsvandimages/retiringtitles.jpg)


  * For Delivarable Two We were tasked with making the mentorship-eligibility table and figuring out who was eligble for it
  We were able to do this with code for SQL 

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




* With that code we were able to establish the CSV for the elible employees
[![Retiringtables](https://github.com/mhossain615/Pewlett-Hackard-Analysis/blob/master/orginalcsvandimages/Mentorship.jpg)

## Results 

We had two questions that we had to solve, How many roles will need to be filled as the "silver tsunami" begins to make an impact and Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

We need to fill 90,398 roles for company and from what we gathered from our information we realized that there are enough qualified employees to be able to mentor the next generation of employees as there are is a big amount of employees retiring.
