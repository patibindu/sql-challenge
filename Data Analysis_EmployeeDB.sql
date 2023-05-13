--Data Analysis(Queries)

-- Query1) List the employee number, last name, first name, sex, and salary of each employee.

CREATE VIEW Query1 AS
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
	FROM employees AS e
	INNER JOIN salaries AS s
	ON (e.emp_no = s.emp_no)
	ORDER BY s.salary DESC;
 
--Query2) List the first name, last name, and hire date for the employees who were hired in 1986.

CREATE VIEW Query2 AS
SELECT first_name, 
	last_name, 
	hire_date
FROM employees
WHERE hire_date > '1986-01-01'
AND hire_date < '1986-12-31'
ORDER BY hire_date;	

--Query3) List the manager of each department along with their department number, department name, employee number, last name, and first name.

CREATE VIEW Query3 AS
SELECT dm.dept_no, 
	d.dept_name,
	e.emp_no,
	e.last_name,
	e.first_name
FROM dept_manager AS dm
	INNER JOIN departments AS d
		ON (d.dept_no = dm.dept_no)
	INNER JOIN employees AS e
		ON (dm.emp_no = e.emp_no)
ORDER BY d.dept_name, e.last_name;

--Query4) List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

CREATE VIEW Query4 AS
SELECT d_emp.dept_no,
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM dept_emp AS d_emp
	INNER JOIN departments AS d
		ON (d_emp.dept_no = d.dept_no)
	INNER JOIN	employees AS e
		ON (d_emp.emp_no = e.emp_no)
ORDER BY d.dept_name, e.last_name;	
	
--Query5) List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

CREATE VIEW Query5 AS
SELECT first_name,
	last_name,
	sex
	FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'
ORDER BY last_name;

--Query6) List each employee in the Sales department, including their employee number, last name, and first name.

CREATE VIEW Query6 AS
SELECT d.dept_name,
	de.emp_no,
	e.last_name,
	e.first_name
FROM dept_emp AS de
	INNER JOIN departments AS d
		ON (de.dept_no = d.dept_no)
	INNER JOIN employees AS e
		ON (de.emp_no = e.emp_no)
WHERE d.dept_name = 'Sales'
ORDER BY d.dept_name, e.last_name;

--Query7) List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

CREATE VIEW Query7 AS
SELECT d.dept_name,
	de.emp_no,
	e.last_name,
	e.first_name
FROM dept_emp AS de
	INNER JOIN departments AS d
		ON (de.dept_no = d.dept_no)
	INNER JOIN employees AS e
		ON (de.emp_no = e.emp_no)
WHERE d.dept_name IN ('Sales', 'Development')
ORDER BY d.dept_name, e.last_name;
	
--Query8) List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

CREATE VIEW Query8 AS
SELECT last_name, COUNT(last_name) AS frequency_counts
FROM employees
GROUP BY last_name
ORDER BY frequency_counts DESC;