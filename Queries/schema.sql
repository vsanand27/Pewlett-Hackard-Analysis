CREATE TABLE departments (
dept_no VARCHAR(4)  Not Null,
dept_name VARCHAR(40) Not Null,
Primary Key(dept_no),
Unique (dept_name)
);

CREATE TABLE employees(
	emp_no INT NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR NOT NULL,
     last_name VARCHAR NOT NULL,
     gender VARCHAR NOT NULL,
     hire_date DATE NOT NULL,
     PRIMARY KEY (emp_no)
);

CREATE TABLE dept_manager (
dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no)
);

Select * from departments;

CREATE TABLE titles (emp_no INT NOT NULL,	
	title VARCHAR NOT NULL,
	from_date DATE	NOT NULL,
	to_date date NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no)
);	

CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR	NOT NULL,
	from_date DATE	NOT NULL,
	to_date DATE NOT NULL,
	PRIMARY KEY(emp_no)
);

ALTER TABLE dept_emp
DROP CONSTRAINT dept_emp_pkey;

ALTER TABLE dept_emp
ADD CONSTRAINT dept_emp_pk PRIMARY KEY (emp_no,dept_no);

SELECT first_name, last_name 
FROM employees
WHERE birth_date between '1952-01-01' AND '1995-12-31';

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE table_name ='emp_no';

-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

SELECT count(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31');

-- Retirement eligibility
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Challenge
SELECT e.emp_no, e.first_name, e.last_name,e.gender, e.birth_date,e.hire_date,
	s.salary, 
	t.title, t.from_date, t.to_date,
	de.to_date, de.dept_no
FROM employees AS e
INNER JOIN salaries AS s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
ON (e.emp_no=t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
       AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	   AND (t.to_date = '9999-01-01')
	   AND (de.to_date='9999-01-01')
ORDER BY e.birth_date;

SELECT e.emp_no, e.first_name, e.last_name,e.gender, e.birth_date,e.hire_date,
	s.salary, 
	t.title, t.from_date, t.to_date,
	de.to_date, de.dept_no,
	d.dept_no, d.dept_name
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
ORDER BY e.birth_date;

- - TASK 1 CREATED NEW RITEREE TABLE	   
SELECT e.emp_no, e.first_name, e.last_name,e.gender, e.birth_date,e.hire_date,
	s.salary, 
	t.title, t.from_date, t.to_date,
	de.to_date, de.dept_no,
	d.dept_no, d.dept_name
INTO 
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