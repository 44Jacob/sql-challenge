
-- 1. Provide a list detailing each employee's number, last name, first name, gender, and salary.
SELECT 
    emp_no, 
    last_name, 
    first_name,
    sex, 
    salary
FROM employees
JOIN salaries 
using (emp_no);

-- 2. Generate a list of employees hired in 1986, including their first names, last names, and hire dates..
SELECT 
    first_name, 
    last_name, 
    hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- 3. Provide a list showing the manager for each department, including the department's number and name, 
--   as well as the manager's employee number, last name, and first name.
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

-- 4.Generate a list for each employee that includes their department number, employee number, last name, 
--  first name, and the name of their department.
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

-- 5.  Provide a list of employees with the first name Hercules and a last name starting with 'B', including 
--    their first names, last names, and gender.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' 
AND last_name 
LIKE 'B%';

-- 6.Generate a list of all employees in the Sales department, detailing their employee numbers, last names, and first names
SELECT emp_no, last_name, first_name
FROM employees 
JOIN dept_emp 
USING (emp_no)
JOIN departments 
USING(dept_no)
WHERE dept_name = 'Sales';

-- 7.Provide a list of employees working in both the Sales and Development departments, including each individual's employee number, 
--   last name, first name, and the name of their department
SELECT emp_no, last_name, first_name, dept_name
FROM employees 
JOIN dept_emp
USING (emp_no)
JOIN departments  
USING (dept_no)
WHERE dept_name IN ('Sales', 'Development');

-- 8.Generate a list showing the frequency of each employee's last name in descending order, indicating 
--   how many employees share the same last name.
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;
