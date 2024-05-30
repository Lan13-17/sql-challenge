CREATE TABLE departments(
	"dept_no" VARCHAR(4) NOT NULL,
	"dept_name" VARCHAR(20) NOT NULL,
	PRIMARY KEY ("dept_no")
)
select * from departments

CREATE TABLE dept_emp(
	"emp_no" VARCHAR(6) NOT NULL,
	"dept_no" VARCHAR(4) NOT NULL,
	PRIMARY KEY ("emp_no")
)
select * from dept_emp

CREATE TABLE dept_manager(
	"dept_no" VARCHAR(4) NOT NULL,
	"emp_no" VARCHAR(6) NOT NULL,
	PRIMARY KEY ("emp_no")
)
select * from dept_manager

CREATE TABLE employees(
	"emp_no" VARCHAR(6) NOT NULL,
	"emp_title_id" VARCHAR(5) NOT NULL,
	"birth_date" VARCHAR(8),
	"first_name" VARCHAR NOT NULL,
	"last_name" VARCHAR NOT NULL,
	"sex" VARCHAR(1) NOT NULL,
	"hire_date" VARCHAR(8),
	PRIMARY KEY ("emp_no")
)
select * from employees

CREATE TABLE salaries(
	"emp_no" VARCHAR(6) NOT NULL,
	"salary" INT NOT NULL,
	PRIMARY KEY ("emp_no")
)
select * from salaries

CREATE TABLE titles(
	"title_id" VARCHAR(5),
	"title" VARCHAR(20),
	PRIMARY KEY ("title_id")
)
select * from titles

--1
select employees.emp_no, employees.first_name, employees.last_name, employees.sex, salaries.salary
FROM employees
LEFT JOIN salaries ON employees.emp_no = salaries.emp_no

--2
select first_name, last_name, hire_date from employees
where hire_date like '%1986'

--3
select dept_manager.emp_no, dept_manager.dept_no, departments.dept_name, employees.first_name, employees.last_name
FROM dept_manager
JOIN departments ON dept_manager.dept_no = departments.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no

--4
select employees.emp_no, employees.first_name, employees.last_name, dept_emp.dept_no, departments.dept_name
FROM dept_emp
JOIN departments ON dept_emp.dept_no = departments.dept_no
JOIN employees ON dept_emp.emp_no = employees.emp_no

--5
select first_name, last_name, sex from employees
where first_name like 'Hercules' and last_name like 'B%'

--6
select employees.emp_no, employees.first_name, employees.last_name, dept_emp.dept_no, departments.dept_name
FROM dept_emp
JOIN departments ON dept_emp.dept_no = departments.dept_no
JOIN employees ON dept_emp.emp_no = employees.emp_no
where dept_name like 'Sales'

--7
select employees.emp_no, employees.first_name, employees.last_name, dept_emp.dept_no, departments.dept_name
FROM dept_emp
JOIN departments ON dept_emp.dept_no = departments.dept_no
JOIN employees ON dept_emp.emp_no = employees.emp_no
where dept_name like 'Sales' or dept_name like 'Development'

--8
select last_name, count(last_name) from employees
group by last_name
order by count(last_name) desc