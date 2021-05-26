DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
  dept_no VARCHAR NOT NULL,
  dept_name VARCHAR NOT NULL,
  primary key (dept_no)
);

DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
	emp_no VARCHAR NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	primary key (emp_no)
);

DROP TABLE IF EXISTS dep_emp;
CREATE TABLE dep_emp (
	emp_no VARCHAR NOT NULL,
	dept_no VARCHAR NOT NULL,
	primary key (emp_no, dept_no),
    foreign key (emp_no) references employees (emp_no),
    foreign key (dept_no) references departments (dept_no)
    
);

DROP TABLE IF EXISTS dept_manager;
CREATE TABLE dept_manager (
	dept_no VARCHAR NOT NULL,
	emp_no VARCHAR NOT NULL,
	primary key (dept_no, emp_no),
    foreign key (emp_no) references employees (emp_no),
    foreign key (dept_no) references departments (dept_no)
);

-- emp_no,emp_title_id,birth_date,first_name,last_name,sex,hire_date


DROP TABLE IF EXISTS salaries;
CREATE TABLE salaries (
	emp_no VARCHAR NOT NULL,
	salary FLOAT NOT NULL,
	primary key (emp_no),
    foreign key (emp_no) references employees (emp_no)
);

DROP TABLE IF EXISTS titles;
CREATE TABLE titles (
	title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL,
	primary key (title_id)
);



