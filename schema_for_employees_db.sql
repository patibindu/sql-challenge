--Data Engineering
/* Use the provided information to create a table schema for each of the six CSV files. Be sure to do the following:

Remember to specify the data types, primary keys, foreign keys, and other constraints.

For the primary keys, verify that the column is unique. Otherwise, create a composite keyLinks to an external site., which takes two primary keys to uniquely identify a row.

Be sure to create the tables in the correct order to handle the foreign keys.

Import each CSV file into its corresponding SQL table.
*/

--Drop tables

DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

--create table titles
--title_id,title

CREATE TABLE titles (
	title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL,
	PRIMARY KEY  (title_id)
	);
SELECT * FROM titles;
SELECT * FROM titles LIMIT 100;	

--create an employee table
--emp_no,emp_title_id,birth_date,first_name,last_name,sex,hire_date
CREATE TABLE employees (
	emp_no INT NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex CHAR NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
	);
	
SELECT * FROM employees;
SELECT * FROM employees LIMIT 100;


--create departments table
--"dept_no","dept_name"

CREATE TABLE departments (
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR NOT NULL,
	PRIMARY KEY (dept_no)
	);

SELECT * FROM departments;
SELECT * FROM departments LIMIT 100;

--create dept_emp table
--emp_no,dept_no
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
	);
	
SELECT * FROM dept_emp;
SELECT * FROM dept_emp LIMIT 100;

--create table dept_manager
--dept_no,emp_no
CREATE TABLE dept_manager (
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
	);
	
SELECT * FROM dept_manager;
SELECT * FROM dept_manager LIMIT 100;

--create table salaries
--emp_no,salary
CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	PRIMARY KEY (emp_no, salary),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
	);
	
SELECT * FROM salaries;
SELECT * FROM salaries LIMIT 100;
