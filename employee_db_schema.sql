-- Drop table if exists
DROP TABLE titles;

--create titles table
CREATE TABLE titles (
  title_id VARCHAR(10) PRIMARY KEY,
  title VARCHAR(20) NOT NULL UNIQUE
);

select * from titles;


-- Drop table if exists
DROP TABLE employees;

-- create employees table
CREATE TABLE employees (
  emp_no INTEGER PRIMARY KEY,
  emp_title VARCHAR(10) NOT NULL,
  FOREIGN KEY (emp_title) REFERENCES titles(title_id),
  birth_date DATE NOT NULL,
  first_name VARCHAR(20) NOT NULL,
  last_name VARCHAR(20) NOT NULL,
  sex VARCHAR(1) NOT NULL,
  hire_date DATE NOT NULL
);

select * from employees;

-- Drop table if exists
DROP TABLE salaries;

--create salaries table
CREATE TABLE salaries (
  emp_no INTEGER NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  salary FLOAT NOT NULL
);

select * from salaries;


-- Drop table if exists
DROP TABLE departments;

--create departments table
CREATE TABLE departments (
  dept_no VARCHAR(5) PRIMARY KEY,
  dept_name VARCHAR(20) NOT NULL UNIQUE
);

select * from departments;

-- Drop table if exists
DROP TABLE dept_manager;

--create dept_manager table
CREATE TABLE dept_manager (
  dept_no VARCHAR(5) NOT NULL,
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  emp_no INTEGER,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  PRIMARY KEY (dept_no, emp_no)
);

select * from dept_manager;

-- Drop table if exists
DROP TABLE dept_emp;

--create dept_emp table
CREATE TABLE dept_emp (
  emp_no INTEGER NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  dept_no VARCHAR(5) NOT NULL,
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  PRIMARY KEY (emp_no, dept_no)
);

select * from dept_emp;

