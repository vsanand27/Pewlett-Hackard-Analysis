
-- Retiree table with title - duplicated employee nos - task 1
SELECT e.emp_no, e.first_name, e.last_name,e.gender, e.birth_date,e.hire_date,
	s.salary, 
	t.title, t.from_date, t.to_date AS t_to_date,
	de.to_date AS de_to_date, de.dept_no AS de_dept_no,
	d.dept_no AS d_dept_no, d.dept_name
INTO c_1_new_retiree_table_1
	FROM employees AS e
INNER JOIN salaries AS s
	ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp AS de
	ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
	ON (e.emp_no=t.emp_no)
INNER JOIN departments AS d
	ON (de.dept_no=d.dept_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
       AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	   AND (de.to_date='9999-01-01')
ORDER BY e.birth_date,d.dept_name;

-- title count with duplication
SELECT title, count(title) 
INTO title_count_retiree_w_duplication
FROM c_1_new_retiree_table_without_duplicate
GROUP BY title;

--Task 1 a Retirement table with title - Not Duplicated - task 1
SELECT e.emp_no, e.first_name, e.last_name,e.gender, e.birth_date,e.hire_date,
	s.salary, 
	t.title, t.from_date, t.to_date AS t_to_date,
	de.to_date AS de_to_date, de.dept_no AS de_dept_no,
	d.dept_no AS d_dept_no, d.dept_name
INTO c_1_new_retiree_table_without_duplicate
	FROM employees AS e
INNER JOIN salaries AS s
	ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp AS de
	ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
	ON (e.emp_no=t.emp_no)
INNER JOIN departments AS d
	ON (de.dept_no=d.dept_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
       AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	   AND (t.to_date = '9999-01-01')
	   AND (de.to_date='9999-01-01')
ORDER BY e.birth_date,d.dept_name;

-- title count without duplication
SELECT title, count(title) 
INTO title_count_retiree_without_duplication
FROM c_1_new_retiree_table_without_duplicate
GROUP BY title;

-- check table
SELECT *
FROM c_1_new_retiree_table_1;

-- check for duplication of records: All records is 1 count value
select emp_no, count(*)
FROM c_1_new_retiree_table_1
GROUP BY emp_no
HAVING COUNT(emp_no)>=1;


-- create table 1965 retiree birth table

-- 1965 Mentorship retiree_list_1965_birth
SELECT e.emp_no, e.first_name, e.last_name,e.gender, e.birth_date,e.hire_date,
	s.salary, 
	t.title, t.from_date, t.to_date AS t_to_date,
	de.to_date AS de_to_date, de.dept_no AS de_dept_no,
	d.dept_no AS d_dept_no, d.dept_name
INTO mentor_list_1965_v2
FROM employees AS e
INNER JOIN salaries AS s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
ON (e.emp_no=t.emp_no)
INNER JOIN departments AS d
ON (de.dept_no=d.dept_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	   AND (t.to_date = '9999-01-01')
	   AND (de.to_date='9999-01-01')
ORDER BY e.birth_date,d.dept_name;

--Mentor Count Table
SELECT title, count(title) 
INTO mentor_title_count
FROM mentor_list_1965_v2
GROUP BY title;

select emp_no, count(emp_no) from
mentor_list_1965_v2
GROUP BY emp_no
HAVING count(emp_no)>=1;