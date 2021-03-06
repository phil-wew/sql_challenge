CREATE TABLE Departments (
    dept_no VARCHAR  NOT NULL ,
    dept_name VARCHAR  NOT NULL ,
    PRIMARY KEY(dept_no)
)

CREATE TABLE dept_emp (
    emp_no INT  NOT NULL ,
    dept_no VARCHAR  NOT NULL ,
    PRIMARY KEY (emp_no, dept_no)
)

CREATE TABLE employees (
    emp_no INT  NOT NULL ,
    emp_title_id VARCHAR  NOT NULL ,
    birth_date DATE  NOT NULL ,
    first_name VARCHAR  NOT NULL ,
    last_name VARCHAR  NOT NULL ,
    sex VARCHAR  NOT NULL ,
    hire_date DATE  NOT NULL ,
    PRIMARY KEY(emp_no)
)

CREATE TABLE dept_manager (
    dept_no VARCHAR   NOT NULL,
    emp_no INT   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (dept_no, emp_no));

CREATE TABLE salaries (
    emp_no INT  NOT NULL ,
    salary INT  NOT NULL ,
    PRIMARY KEY (
        emp_no
    )
)

CREATE TABLE titles (
    title_id VARCHAR  NOT NULL ,
    title VARCHAR  NOT NULL ,
    PRIMARY KEY( title_id
    )
)

--1. List the following details of each employee: employee number, last name, first name, sex, and salary.



SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no;



--2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
	WHERE hire_date BETWEEN '01/01/1986' AND '12/31/1986' ;



--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT departments.dept_name,dept_manager.dept_no, dept_manager.emp_no, employees.last_name, employees.first_name
FROM employees
JOIN dept_manager ON dept_manager.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_manager.dept_no;


--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT departments.dept_name, employees.last_name, employees.first_name, employees.emp_no
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no;


--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex
FROM employees
	WHERE first_name = 'Hercules' AND last_name LIKE 'B%'



--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales'

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales' OR dept_name ='Development'

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT (*)
FROM employees
GROUP BY last_name
ORDER BY 2 DESC;

