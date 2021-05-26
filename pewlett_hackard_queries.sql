--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT employees.last_name, employees.first_name, employees.hire_date
FROM employees
WHERE hire_date <= '1986/12/31' AND hire_date >= '1986/1/1';

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select * from departments

CREATE TABLE merged_dept_emp AS 
SELECT departments.dept_name, departments.dept_no, dept_manager.emp_no
FROM departments
INNER JOIN dept_manager ON
departments.dept_no = dept_manager.dept_no;

SELECT * from merged_dept_emp;

SELECT employees.last_name, employees.first_name, merged_dept_emp.dept_name, merged_dept_emp.dept_no, merged_dept_emp.emp_no
FROM employees
INNER JOIN merged_dept_emp ON
merged_dept_emp.emp_no = employees.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
CREATE TABLE table2 AS 
SELECT employees.emp_no, employees.last_name, employees.first_name, dep_emp.dept_no
FROM employees
INNER JOIN dep_emp ON
employees.emp_no = dep_emp.emp_no;

select * from table2

CREATE TABLE table3 AS 
SELECT table2.emp_no, table2.last_name, table2.first_name, table2.dept_no, departments.dept_name
FROM table2
INNER JOIN departments ON
table2.dept_no = departments.dept_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' AND employees.last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT emp_no, last_name, first_name, dept_name
FROM table3
WHERE dept_name = 'Sales';


--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp_no, last_name, first_name, dept_name
FROM table3
WHERE dept_name = 'Sales' OR dept_name = 'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "Name Count"
FROM employees
GROUP BY last_name
HAVING COUNT(*) > 1
ORDER BY "Name Count" DESC;