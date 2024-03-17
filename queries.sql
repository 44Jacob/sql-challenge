
--1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT 
    emp_no, 
    last_name, 
    first_name,
    sex, 
    salary
FROM employees
JOIN salaries 
using (emp_no);

--2.List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT 
    first_name, 
    last_name, 
    hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT 
    dept_name,
    emp_no AS manager_employee_number,
    last_name AS manager_last_name,
    dept_no,
    first_name AS manager_first_name
FROM departments
JOIN dept_manager
USING (dept_no)
JOIN employees 
USING (emp_no);

--4.List the department number for each employee along with that employee’s employee number, last name,first name, and department name.
SELECT emp_no,
       last_name,
       first_name,
       dept_no,
       dept_name
FROM employees 
JOIN dept_emp
USING (emp_no)
JOIN departments 
USING(dept_no);

--5.  List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' 
AND last_name 
LIKE 'B%';

--6.List each employee in the Sales department, including their employee number, last name, and first name.
SELECT emp_no, last_name, first_name
FROM employees 
JOIN dept_emp 
USING (emp_no)
JOIN departments 
USING(dept_no)
WHERE dept_name = 'Sales';

--7.List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp_no, last_name, first_name, dept_name
FROM employees 
JOIN dept_emp
USING (emp_no)
JOIN departments  
USING (dept_no)
WHERE dept_name IN ('Sales', 'Development');

--8.List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;
