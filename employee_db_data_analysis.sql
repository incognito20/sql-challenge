--List the employee number, last name, first name, sex, and salary of each employee.
--Joins employees and salaries

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON
salaries.emp_no=employees.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
--Joins employees, dept_manager, departments. Identifies employee numbers in dept_manager

SELECT employees.first_name AS "Manager First Name", employees.last_name AS "Manager Last Name",
dept_manager.dept_no AS "Department Number", departments.dept_name AS "Department", employees.emp_no AS "Employee Number"
FROM employees
JOIN dept_manager on (employees.emp_no = dept_manager.emp_no)
JOIN departments on (dept_manager.dept_no = departments.dept_no)
WHERE dept_manager.emp_no IN
(
SELECT emp_no
FROM dept_manager);

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
--Joins employees, dept_emp, and departments. Pulls every employee number from employees.

SELECT employees.first_name AS "Employee First Name", employees.last_name AS "Employee Last Name", employees.emp_no AS "Employee Number",
departments.dept_name AS "Department Name", dept_emp.dept_no AS "Department Number"
FROM employees
JOIN dept_emp ON (employees.emp_no = dept_emp.emp_no)
JOIN departments ON (dept_emp.dept_no = departments.dept_no)
WHERE employees.emp_no IN
(
SELECT emp_no
FROM employees);

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT first_name AS "First Name", last_name AS "Last Name", sex AS "Sex"
FROM employees
WHERE last_name LIKE 'B%' AND first_name = 'Hercules';

--List each employee in the Sales department, including their employee number, last name, and first name.

SELECT employees.first_name AS "Employee First Name", employees.last_name AS "Employee Last Name", dept_emp.emp_no AS "Employee Number"
FROM employees
JOIN dept_emp ON (employees.emp_no = dept_emp.emp_no)
WHERE dept_no IN (SELECT dept_no FROM departments WHERE dept_name = 'Sales');

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT employees.first_name AS "Employee First Name", employees.last_name AS "Employee Last Name", dept_emp.emp_no AS "Employee Number",
departments.dept_name AS "Department Name"
FROM employees
JOIN dept_emp ON (employees.emp_no = dept_emp.emp_no)
JOIN departments ON (dept_emp.dept_no = departments.dept_no)
WHERE dept_emp.dept_no IN (SELECT dept_no FROM departments WHERE dept_name = 'Sales' OR dept_name = 'Development');

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(last_name) AS "Last Name Count"
FROM employees
GROUP BY last_name
ORDER BY "Last Name Count" DESC;
