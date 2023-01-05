CREATE DATABASE IF NOT EXISTS SALES;
CREATE DATABASE IF NOT EXISTS departments;
drop database sales;
drop database departments;
create database if not exists sales;
use sales;
CREATE TABLE employees (
    employee_id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    salary INT NOT NULL,
    hire_date DATE
);
SELECT 
    *
FROM
    employees;
use sales;
CREATE TABLE sale (
    purchase_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    employee_id INT UNSIGNED NOT NULL,
    item_type VARCHAR(10) NOT NULL,
    item_name VARCHAR(255) NOT NULL,
    item_price FLOAT NOT NULL,
    PRIMARY KEY (purchase_id)
);

alter table sale
add foreign key(employee_id) references employees(employee_id) on delete cascade;

drop table sales;
use sales;
drop table sales;
drop database sales;

create database if not exists Sales;
use Sales;
CREATE TABLE Customer (
    customer_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE KEY,
    gender ENUM('M', 'F') NOT NULL,
    date_birth DATE NOT NULL,
    PRIMARY KEY (customer_id)
);

CREATE TABLE sale (
    purchase_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    item_type VARCHAR(10) NOT NULL,
    customer_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (purchase_id),
    FOREIGN KEY (customer_id)
        REFERENCES Customer (customer_id)
        ON DELETE CASCADE
);

alter table customer
add column number_of_Children INT unsigned not null; 

alter table customer
drop column children;

alter table customer
drop column number_of_children;

alter table sale
modify item_type varchar(10) null;

create schema if not exists sales;
commit;

use sales;
alter table employees
drop employees;

drop schema sales;

create schema if not exists company;
use company;
CREATE TABLE workers (
    worker_id INT UNSIGNED NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    gender ENUM('M', 'F'),
    email VARCHAR(255) NOT NULL,
    salary FLOAT NOT NULL,
    hire_date DATE NOT NULL,
    commission_pct FLOAT NOT NULL
);

alter table workers
modify commission_pct float default '0';

alter table workers
add 
(
primary key (worker_id),
unique key (email)
);

alter table workers
change first_name first_name varchar(25) null;

CREATE TABLE departments (
    department_id INT UNSIGNED NOT NULL,
    department_name VARCHAR(255) DEFAULT 'X',
    manager_id INT UNSIGNED NOT NULL,
    location_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (department_id)
);

alter table departments
add worker_id INT unsigned not null;

alter table departments
add foreign key (worker_id) references workers (worker_id) ON DELETE CASCADE;


drop database sales;
use world;
SELECT 
    AVG(population)
FROM
    city
WHERE
    countrycode = 'AFG';

use employees;
SELECT 
    first_name, last_name
FROM
    employees;

SELECT 
    *
FROM
    employees;
    
SELECT 
    dept_no
FROM
    departments;
SELECT 
    *
FROM
    departments;
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' AND gender = 'F';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie'
        OR first_name = 'Aruna';
        
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND (first_name = 'Kellie'
        OR first_name = 'Aruna');
        
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Denis' , 'Elvis');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('John' , 'Mark', 'Jacob')
        AND last_name NOT IN ('John' , 'Mark', 'Jacob');
        
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE 'Mark%';
SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE '2000%';
    
SELECT 
    *
FROM
    employees
WHERE
    emp_no LIKE '1000_';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%jack%');
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%jack%');
    
SELECT 
    *
FROM
    salaries;
    
SELECT 
    *
FROM
    salaries
WHERE
    salary BETWEEN 66000 AND 70000;
    
SELECT 
    *
FROM
    employees
WHERE
    emp_no NOT BETWEEN 10004 AND 10012;
    
SELECT 
    *
FROM
    departments;
SELECT 
    *
FROM
    departments
WHERE
    dept_no BETWEEN 'd003' AND 'd006';
    
SELECT 
    *
FROM
    departments;
SELECT 
    *
FROM
    departments
WHERE
    dept_no IS NOT NULL;
        
SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no IS NOT NULL;
    
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND hire_date >= '2000-01-01';
        
SELECT 
    *
FROM
    salaries
WHERE
    salary > 150000;
    
SELECT DISTINCT
    hire_date
FROM
    employees;
    
SELECT 
    *
FROM
    salaries
WHERE
    salary >= 100000;
    
SELECT 
    COUNT(salary)
FROM
    salaries
WHERE
    salary >= 100000;
    
SELECT 
    *
FROM
    titles
WHERE
    title LIKE '%manager%';
    
SELECT 
    COUNT(title)
FROM
    titles
WHERE
    title = 'manager';
    
SELECT 
    *
FROM
    employees
ORDER BY first_name DESC;
    
    
SELECT 
    COUNT(*)
FROM
    salaries
WHERE
    salary >= 100000;

SELECT 
    COUNT(*)
FROM
    dept_manager;
    
SELECT 
    *
FROM
    employees
ORDER BY hire_date DESC;

SELECT 
    *
FROM
    employees
ORDER BY first_name , last_name ASC;

SELECT 
    *
FROM
    employees
GROUP BY emp_no
HAVING emp_no IN (69256 , 237165, 405098);

SELECT 
    first_name, COUNT(first_name)
FROM
    employees
GROUP BY first_name
ORDER BY first_name DESC;


SELECT 
    *
FROM
    titles;

use employees;

SELECT 
    title, COUNT(title)
FROM
    titles
GROUP BY title
ORDER BY title DESC;

SELECT 
    emp_no, COUNT(emp_no), first_name, last_name, gender
FROM
    employees
WHERE
    emp_no IN (10005 , 10007, 10004, 10030, 10035, 10047)
GROUP BY emp_no
ORDER BY emp_no DESC;

SELECT 
    first_name, COUNT(first_name) AS name_count
FROM
    employees
GROUP BY first_name
ORDER BY first_name DESC;

SELECT 
    salary, COUNT(salary) AS emps_with_same_salary
FROM
    salaries
WHERE
    salary > 80000
GROUP BY salary
ORDER BY salary ASC;


SELECT 
    salary, COUNT(salary)
FROM
    salaries
GROUP BY salary
HAVING AVG(salary) > 120000
ORDER BY salary;
SELECT 
    *, AVG(salary)
FROM
    salaries
WHERE
    salary > 120000
GROUP BY emp_no
ORDER BY emp_no;

SELECT 
    *, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000; 

    
    use employees;
SELECT 
    *, AVG(salary)
FROM
    salaries
WHERE
    salary > 120000
GROUP BY emp_no
ORDER BY emp_no ASC;

SELECT 
    *, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000;


SELECT 
    salary, COUNT(salary) AS emps_with_same_salary
FROM
    salaries
WHERE
    salary > 80000
GROUP BY salary
ORDER BY salary ASC;

SELECT 
    first_name, COUNT(first_name)
FROM
    employees
GROUP BY first_name
HAVING COUNT(first_name) > 250
ORDER BY first_name ASC;


SELECT 
    *, ROUND(AVG(salary), 0) AS Average_salary
FROM
    salaries
GROUP BY emp_no
HAVING ROUND(AVG(salary), 0) > 120000
ORDER BY emp_no ASC;

SELECT 
    first_name,
    COUNT(first_name) AS first_name_number,
    hire_date
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name ASC;

SELECT 
    *, COUNT(emp_no) AS employees_with_more_than_a_contract
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(emp_no) > 1
ORDER BY emp_no DESC;

SELECT 
    *
FROM
    dept_emp
LIMIT 100;

SELECT 
    *
FROM
    titles
LIMIT 10;

insert into employees(emp_no,birth_date,first_name,last_name,gender,hire_date) values (999903,'1977-09-14',"Ola","Baby","M",'1997-10-01');

insert into titles (emp_no, title, from_date, to_date) values (999903, "Senior Engineer", '1997-10-01','1999-08-30');

SELECT 
    *
FROM
    employees;
    
SELECT 
    *
FROM
    titles
ORDER BY emp_no DESC;

SELECT 
    *
FROM
    dept_emp;

insert into dept_emp (emp_no,dept_no,from_date,to_date) values (999903,'d005','1997-10-01','9999-01-01');

SELECT 
    *
FROM
    dept_emp
ORDER BY emp_no DESC;

SELECT 
    *
FROM
    dept_emp;

SELECT 
    *
FROM
    departments;


insert into departments (dept_no, dept_name) values ('d010','Business Analysis');
commit;
SELECT 
    *
FROM
    departments;

UPDATE departments 
SET 
    dept_name = 'Data Analysis'
WHERE
    dept_no = 'd010';
    
SELECT 
    *
FROM
    departments;
    
DELETE FROM departments 
WHERE
    dept_no = 'd010';
    
SELECT 
    *
FROM
    departments;
    
    rollback;
    
UPDATE departments 
SET 
    dept_name = 'Data Analysis'
WHERE
    dept_no = 'd010';
    commit;
    
DELETE FROM departments 
WHERE
    dept_no = 'd010';
    
SELECT 
    *
FROM
    departments;
    
    rollback;
use employees;
SELECT 
    *
FROM
    departments;

SELECT 
    COUNT(DISTINCT dept_name)
FROM
    departments;

SELECT 
    *
FROM
    dept_emp;

SELECT 
    COUNT(DISTINCT dept_no)
FROM
    dept_emp;
    
SELECT 
    *
FROM
    departments;
    
SELECT 
    *
FROM
    dept_emp;
    
SELECT 
    *
FROM
    salaries;
    
SELECT 
    SUM(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
    
SELECT 
    MAX(emp_no)
FROM
    dept_emp;
    
SELECT 
    AVG(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
    
CREATE TABLE departments_dup AS SELECT dept_no, dept_name FROM
    departments;
    
SELECT 
    *
FROM
    departments_dup;
    
SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_info, dept_name, 'N/A') AS dept_info
FROM
    departments_dup
ORDER BY dept_no ASC;
    
insert into departments_dup (dept_no, dept_name) values ('d011', 'null');
insert into departments_dup (dept_no, dept_name) values ('d012', 'null');

use employees;
SELECT 
    *
FROM
    departments_dup;
    
SELECT 
    dept_no,
    IFNULL(dept_name,
            'Department name not provided') AS dept_name
FROM
    departments_dup;
    
SELECT 
    *
FROM
    departments_dup;

UPDATE departments_dup 
SET 
    dept_name = ' '
WHERE
    dept_no IN ('d011' , 'd012');

SELECT 
    *
FROM
    departments_dup;

SELECT 
    dept_no,
    IFNULL(dept_name, 'Department is not provided') AS dept_name
FROM
    departments_dup;

alter table departments_dup modify column dept_name varchar(40) Null;

use employees;
SELECT 
    *
FROM
    departments;

SELECT 
    *
FROM
    departments_dup;

drop table departments_dup;
rollback;

CREATE TABLE departments_dup AS SELECT * FROM
    departments;
CREATE OR REPLACE VIEW departmentss AS
    SELECT 
        *
    FROM
        departments;

SELECT 
    *
FROM
    departments_dup;
SELECT 
    *
FROM
    departmentss;

alter table departments_dup change dept_name dept_name varchar(40) default 'null';

insert into departments_dup(dept_no,dept_name) values('d011', ' ');
SELECT 
    dept_no,
    IFNULL(dept_name, 'Department not provided') AS dept_name
FROM
    departments_dup;

use hr;

SELECT 
    *
FROM
    employees
WHERE
    commission_pct IS NULL;

SELECT 
    first_name,
    salary,
    IFNULL(commission_pct,
            'Commission_pct not provided') AS commission_pct
FROM
    employees;


SELECT 
    *
FROM
    employees;

use employees;
alter table departments_dup change dept_name dept_name varchar(40) default null;

SELECT 
    *
FROM
    departments_dup;

DELETE dept_no FROM departments 
WHERE
    dept_no = 'd001';

use hr;
SELECT 
    *
FROM
    locations;

DELETE location_id FROM locations 
WHERE
    location_id = 1000;
use employees;
DELETE FROM departments_dup 
WHERE
    dept_no = 'd011';

SELECT 
    *
FROM
    departments_dup;
insert into departments_dup(dept_no,dept_name) values('d012', 'null');


insert into departments_dup(dept_no,dept_name) values('d011', null);

UPDATE departments_dup 
SET 
    dept_name = NULL
WHERE
    dept_no = 'd012';

insert into departments_dup(dept_no, dept_name) values('d013', null);

SELECT 
    *
FROM
    departments_dup;

SELECT 
    dept_no,
    IFNULL(dept_name,
            'Department name not provided') AS dept_name
FROM
    departments_dup;

alter table departments_dup modify column dept_name varchar(40) not null;

SELECT 
    *
FROM
    departments_dup;
alter table departments_dup modify dept_name varchar(40) not null;

alter table departments_dup add dept_managers varchar(40) not null unique key;


use hr;

SELECT 
    *
FROM
    locations;

alter table locations modify column state_province varchar(50) default 0;

alter table locations add column city_id INT unsigned not null;

alter table locations drop column city_id;


SELECT 
    *
FROM
    employees;

use hr;


SELECT 
    employee_id, AVG(salary)
FROM
    employees
WHERE
    hire_date > '1997-01-01'
GROUP BY employee_id
HAVING AVG(salary) > 1000
ORDER BY employee_id DESC;

SELECT 
    COUNT(DISTINCT employee_id) AS employee_number
FROM
    employees;

SELECT 
    employee_id,
    first_name,
    last_name,
    job_id,
    MAX(salary) AS employee_highest_salary
FROM
    employees
WHERE
    job_id IN ('AD_PRES' , 'IT_PROG',
        'FI_MGR',
        'FI_ACCOUNT',
        'PU_CLERK',
        'ST_MAN',
        'ST_CLERK',
        'SA_REP',
        'SH_CLERK')
GROUP BY job_id
HAVING MAX(salary)
ORDER BY MAX(salary) DESC;



SELECT 
    *
FROM
    employees
WHERE
    job_id = 'PU_CLERK'
ORDER BY salary DESC;

SELECT 
    COUNT(DISTINCT employee_id)
FROM
    employees
WHERE
    salary BETWEEN 11000 AND 24000;

SELECT 
    first_name, job_id, salary
FROM
    employees
WHERE
    salary BETWEEN 11000 AND 24000;

SELECT 
    COUNT(employee_id)
FROM
    employees
WHERE
    salary NOT BETWEEN 11000 AND 24000;

SELECT 
    COUNT(employee_id)
FROM
    employees;

SELECT 
    COUNT(DISTINCT employee_id)
FROM
    employees;

SELECT 
    COUNT(employee_id)
FROM
    employees
WHERE
    salary BETWEEN 11000 AND 24000;

CREATE OR REPLACE VIEW limited_view AS
    SELECT 
        first_name, last_name, commission_pct, hire_date, job_id
    FROM
        employees
    WHERE
        job_id IN ('ST_CLERK' , 'SH_CLERK');

SELECT 
    *
FROM
    limited_view;

use employees;
grant select, update, alter on departments_dup to 'pope'@'localhost';

revoke select, update, alter on departments_dup from 'pope'@'localhost';
SELECT 
    *
FROM
    departments_dup;

DELETE FROM departments_dup 
WHERE
    dept_no = 'd011';
use employees;

alter table departments_dup modify column dept_name varchar(30) not null;

SELECT 
    *
FROM
    departments;

alter table departments
add column dept_manager varchar(40) not null;

alter table departments
drop column dept_manager;

alter table departments modify column dept_name varchar(30) default null;

UPDATE departments 
SET 
    dept_name = NULL
WHERE
    dept_no = 'd007';

SELECT 
    dept_no,
    IFNULL(dept_name, 'Department is not provided') AS dept_name
FROM
    departments;

UPDATE departments 
SET 
    dept_name = 'Sales'
WHERE
    dept_no = 'd007';

use employees;

SELECT 
    *
FROM
    departments;

alter table departments add column dept_manager varchar(40) default null;

SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_manager, dept_name, dept_no) AS dept_manager
FROM
    departments
ORDER BY dept_no ASC;

insert into departments(dept_no, dept_name) values ('d012', null);

SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_manager, dept_name, dept_no) AS dept_info
FROM
    departments;

drop table departments_dup;

CREATE TABLE departments_dup AS SELECT dept_no, dept_name FROM
    departments;

SELECT 
    *
FROM
    departments_dup;

UPDATE departments_dup 
SET 
    dept_name = 'Business Analysis'
WHERE
    dept_no = 'd012';
UPDATE departments_dup 
SET 
    dept_no = NULL
WHERE
    dept_name = 'Business Analysis';

alter table departments_dup modify column dept_no char(4) default null;

alter table departments_dup add column dept_info varchar(20) default null;

SELECT 
    dept_name,
    dept_info,
    COALESCE(dept_info, dept_no, dept_name) AS dept_new
FROM
    departments_dup;

SELECT 
    *
FROM
    departments_dup;

alter table departments_dup drop column dept_info;

DELETE FROM departments_dup 
WHERE
    dept_no IS NULL;

alter table departments_dup modify column dept_name varchar(40) default null;

UPDATE departments_dup 
SET 
    dept_name = 'Public Relations'
WHERE
    dept_no = 'd010';
DELETE FROM departments_dup 
WHERE
    dept_no = 'd002';

insert into departments_dup(dept_no, dept_name) values ('d012','Data Science');



#..............................

DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup (
    emp_no INT(11) NOT NULL,
    dept_no CHAR(4) NULL,
    from_date DATE NOT NULL,
    to_date DATE NULL
);

 

INSERT INTO dept_manager_dup

select * from dept_manager;

 

INSERT INTO dept_manager_dup (emp_no, from_date)

VALUES                (999904, '2017-01-01'),

                                (999905, '2017-01-01'),

                               (999906, '2017-01-01'),

                               (999907, '2017-01-01');

 

DELETE FROM dept_manager_dup 
WHERE
    dept_no = 'd001';

INSERT INTO departments_dup (dept_name)

VALUES                ('Public Relations');

 

DELETE FROM departments_dup 
WHERE
    dept_no = 'd002';
    
SELECT 
    *
FROM
    dept_manager
ORDER BY dept_no ASC;
    
UPDATE departments_dup 
SET 
    dept_name = NULL
WHERE
    dept_no = 'd012';
	UPDATE departments_dup 
SET 
    dept_no = NULL
WHERE
    dept_name = 'Public Relations';
    
SELECT 
    *
FROM
    departments_dup;
SELECT 
    *
FROM
    dept_manager;
    
SELECT 
    COUNT(DISTINCT emp_no)
FROM
    employees;
    
SELECT 
    e.emp_no, e.first_name, e.last_name, e.hire_date, m.dept_no
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
ORDER BY e.emp_no;
    
SELECT 
    *
FROM
    departments_dup;
SELECT 
    *
FROM
    dept_manager;
    
SELECT 
    e.emp_no,
    e.birth_date,
    e.first_name,
    e.last_name,
    e.hire_date,
    dm.dept_no,
    dm.from_date
FROM
    dept_manager dm
        LEFT JOIN
    employees e ON e.emp_no = dm.emp_no
ORDER BY e.emp_no ASC;     

use employees;
use employees;
alter table departments_dup
add foreign key(dept_no) references dept_manager(dept_no) ON DELETE CASCADE;

use employees;
CREATE TABLE dept_manager_dup AS SELECT * FROM
    dept_manager;


alter table dept_manager_dup add primary key(dept_no);

SELECT 
    dm.dept_no, dm.emp_no, dm.from_date, d.dept_name
FROM
    departments d
        LEFT JOIN
    dept_manager dm ON dm.dept_no = d.dept_no
ORDER BY d.dept_no ASC;

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    dm.dept_no,
    dm.from_date
FROM
    employees e
        LEFT JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
WHERE
    e.last_name = 'Markovitch'
ORDER BY dm.dept_no DESC;


SELECT 
    dm.dept_no, dm.emp_no, dm.from_date, d.dept_name
FROM
    dept_manager dm
        JOIN
    departments d ON dm.dept_no = d.dept_no
ORDER BY dm.dept_no;

SELECT 
    dm.dept_no, dm.emp_no, dm.from_date, d.dept_name
FROM
    dept_manager dm,
    departments d
WHERE
    dm.dept_no = d.dept_no
ORDER BY dm.dept_no;

SELECT 
    e.emp_no, e.first_name, e.last_name, e.hire_date, t.title
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    first_name = 'Margareta'
        AND last_name = 'Markovitch';

SELECT 
    e.*, d.*
FROM
    departments d
        CROSS JOIN
    dept_manager dm
        JOIN
    employees e ON dm.emp_no = e.emp_no
WHERE
    d.dept_no = 'd009'
ORDER BY d.dept_no , dm.dept_no;
    
SELECT 
    dm.*, d.*
FROM
    departments d
        CROSS JOIN
    dept_manager dm
WHERE
    d.dept_no = 'd009';
    
SELECT 
    e.gender, COUNT(e.gender) AS gender_count
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    title = 'Manager'
GROUP BY gender
ORDER BY gender DESC;

SELECT 
    gender, title, emp_no
FROM
    employees
        JOIN
    titles USING (emp_no)
WHERE
    title = 'Manager';
use employees;

SELECT 
    e.first_name, e.last_name, e.emp_no
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    title = 'Manager'
ORDER BY t.emp_no;

SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            t.emp_no
        FROM
            titles t);


use employees;

SELECT 
    d.emp_no, d.dept_no, e.first_name, e.last_name, e.hire_date
FROM
    employees e
        JOIN
    dept_emp d ON d.emp_no = e.emp_no
ORDER BY d.emp_no ASC;

use employees;
SELECT 
    d.emp_no,
    d.dept_no,
    e.first_name,
    e.last_name,
    e.hire_date,
    ds.dept_name,
    ds.dept_manager
FROM
    employees e
        JOIN
    dept_emp d ON d.emp_no = e.emp_no
        JOIN
    departments ds ON ds.dept_no = d.dept_no
GROUP BY d.dept_no
ORDER BY d.emp_no ASC
LIMIT 20;

SELECT 
    d.dept_no, d.dept_name, d.dept_manager, de.from_date
FROM
    departments d
        LEFT JOIN
    dept_emp de ON d.dept_no = de.dept_no
GROUP BY d.dept_no
ORDER BY d.dept_name;

SELECT 
    d.dept_no, d.dept_name, d.dept_manager, de.from_date
FROM
    dept_emp de
        LEFT JOIN
    departments d ON d.dept_no = de.dept_no
GROUP BY d.dept_no
ORDER BY d.dept_name;

SELECT 
    de.dept_no, de.from_date, dm.emp_no
FROM
    dept_emp de
        CROSS JOIN
    dept_manager dm ON de.dept_no = dm.dept_no
GROUP BY dm.emp_no
ORDER BY de.from_date;

SELECT 
    de.emp_no, de.dept_no, NULL AS from_date, NULL AS to_date
FROM
    dept_emp de 
UNION SELECT 
    dm.from_date, dm.to_date, NULL AS emp_no, NULL AS dept_no
FROM
    dept_manager dm
GROUP BY emp_no;

SELECT 
    e.first_name, e.last_name, e.hire_date
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager dm
        WHERE
            e.hire_date BETWEEN '1990-01-01' AND '1995-01-01');

SELECT 
    e.first_name, e.last_name, e.hire_date, dm.from_date
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
WHERE
    e.hire_date BETWEEN '1990-01-01' AND '1995-01-01';

SELECT 
    *
FROM
    dept_manager
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            employees
        WHERE
            hire_date BETWEEN '1990-01-01' AND '1995-01-01');
            
            use employees;
            
SELECT 
    e.first_name,
    e.last_name,
    e.birth_date,
    e.gender,
    e.hire_date
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            s.emp_no
        FROM
            salaries s
        WHERE
            hire_date BETWEEN '1985-01-01' AND '2010-01-01');


SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            titles t
        WHERE
            e.emp_no = t.emp_no
                AND title = 'Assistant Engineer');
            
SELECT 
    COUNT(title)
FROM
    titles
WHERE
    title = 'Assistant Engineer';

SELECT 
    title
FROM
    titles
WHERE
    title = 'Assistant Engineer'
LIMIT 15129;


SELECT 
    *
FROM
    titles
WHERE
    title = 'Manager'
        AND emp_no IN (110022 , 110039);

use employees;

SELECT 
    d.emp_no, d.from_date, NULL AS dept_no, NULL AS to_date
FROM
    dept_emp d 
UNION SELECT 
    dm.dept_no, dm.to_date, NULL AS emp_no, NULL AS from_date
FROM
    dept_manager dm
ORDER BY emp_no DESC;

SELECT 
    d.emp_no,
    IFNULL(d.dept_no,
            'Department number not included')
FROM
    dept_emp d
ORDER BY emp_no;
SELECT 
    d.dept_no,
    d.dept_manager,
    COALESCE(d.dept_manager,
            d.dept_name,
            'Department name not included') AS dept_name
FROM
    departments d
ORDER BY dept_name;
SELECT 
    *
FROM
    titles;
SELECT 
    *
FROM
    dept_manager;

SELECT 
    d.dept_manager, d.dept_name
FROM
    departments d
WHERE
    d.dept_no IN (SELECT 
            de.dept_no
        FROM
            dept_emp de
        ORDER BY d.dept_name); 

use employees;


SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(d.dept_no) AS department_ID,
            (SELECT 
                    de.emp_no
                FROM
                    dept_manager de
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp d ON e.emp_no = d.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A 
UNION SELECT 
    B.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(d.dept_no) AS department_ID,
            (SELECT 
                    de.emp_no
                FROM
                    dept_manager de
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp d ON e.emp_no = d.emp_no
    WHERE
        e.emp_no BETWEEN 10021 AND 10040
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS B;
    
    drop table if exists emp_manager;
CREATE TABLE emp_manager (
    emp_no INT(11) NOT NULL,
    dept_no CHAR(4) DEFAULT NULL,
    manager_no INT(11) NOT NULL
);

SELECT 
    *
FROM
    dept_manager;

SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS employees_id,
            MIN(de.dept_no) AS department_id,
            (SELECT 
                    dm.emp_no
                FROM
                    dept_manager dm
                WHERE
                    emp_no = 110022) AS manager_id
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A 
UNION SELECT 
    B.*
FROM
    (SELECT 
        e.emp_no AS employees_id,
            MIN(de.dept_no) AS department_id,
            (SELECT 
                    dm.emp_no
                FROM
                    dept_manager dm
                WHERE
                    dm.emp_no = 110039) AS manager_id
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS B;
    
SELECT 
    *
FROM
    emp_manager;
    
    insert into emp_manager
    select U.*
    from 
	(select 
    A.*
    from 
    (select e.emp_no as employees_id, min(de.dept_no) as department_id,
    (select dm.emp_no from dept_manager dm where dm.emp_no = 110022)
    from employees e
    join dept_emp de on e.emp_no = de.emp_no
    where e.emp_no <=10020 
    group by e.emp_no
    order by e.emp_no) as A
    union select 
    B.*
    from 
    (select e.emp_no as employees_id, min(de.dept_no) as department_id,
    (select dm.emp_no from dept_manager dm where dm.emp_no = 110039)
    from employees e
    join dept_emp de on e.emp_no = de.emp_no
    where e.emp_no > 10020
    group by e.emp_no
    order by e.emp_no
    limit 20) as B
    union select 
    C.*
    from 
    (select e.emp_no as employees_id, min(de.dept_no) as department_id, 
    (select dm.emp_no from dept_manager dm where dm.emp_no = 110039)
    from employees e
    join dept_emp de on e.emp_no = de.emp_no
    where e.emp_no = 110022
    group by e.emp_no
    order by e.emp_no) as C
    union select
    D.*
    from 
    (select e.emp_no as employees_id, min(de.dept_no) as department_id,
    (select dm.emp_no from dept_manager dm where dm.emp_no = 110022)
    from employees e
    join dept_emp de on e.emp_no = de.emp_no
    where e.emp_no = 110039
    group by e.emp_no
    order by e.emp_no) as D) as U;
    
    use employees;
SELECT 
    *
FROM
    emp_manager;
    
    
    use practice;
    
SELECT 
    *
FROM
    icc_world_cup;
    
SELECT 
    Team_Name,
    COUNT(1) AS Matches_Played,
    SUM(Number_win) AS Matches_won,
    SUM(Team_point) AS Point
FROM
    (SELECT 
        team_1 AS Team_Name,
            CASE
                WHEN team_1 = winner THEN 1
                ELSE 0
            END AS Number_win,
            CASE
                WHEN team_1 = winner THEN 3
                ELSE 0
            END AS Team_Point
    FROM
        icc_world_cup UNION ALL SELECT 
        team_2 AS Team_Name,
            CASE
                WHEN team_2 = winner THEN 1
                ELSE 0
            END AS Number_win,
            CASE
                WHEN team_2 = winner THEN 3
                ELSE 0
            END AS Team_Point
    FROM
        icc_world_cup) AS A
GROUP BY Team_Name
ORDER BY Point DESC;
    
SELECT 
    *
FROM
    customer_orders;
    
SELECT 
    customer_id,
    MIN(order_date) AS first_order,
    MIN(order_amount) AS first_amount
FROM
    customer_orders
GROUP BY customer_id;
    
    with first_order_date as (
    select customer_id, min(order_date) as first_visit_date
    from customer_orders
    group by customer_id
    order by customer_id)

, subsequent_order_date as (
select customer_id, sum(order_date) - min(order_date) as subsequent_visit_date
from customer_orders
group by customer_id
order by customer_id)
    
, first_order_amount as (
select customer_id, min(order_amount) as first_visit_amount
from customer_orders
group by customer_id
order by customer_id)

, subsequent_order_amount as (
select customer_id, sum(order_amount) - min(order_amount) as subsequent_visit_amount
from customer_orders
group by customer_id
order by customer_id)

, Overall as (
select co.customer_id, co.order_amount, fd.first_visit_date, sd.subsequent_visit_date, fa.first_visit_amount, sa.subsequent_visit_amount,
case 
when order_date = first_visit_date then order_date else 0 end as first_visit,
case
when order_date <> first_visit_date then subsequent_visit_date else 0 end as subsequent_visit,
case 
when order_amount = first_visit_amount then order_amount else 0 end as first_amount,
case
when order_amount <> first_visit_amount then subsequent_visit_amount else 0 end as subsequent_amount
from customer_orders co
join first_order_date fd on co.customer_id = fd.customer_id
join subsequent_order_date sd on co.customer_id = sd.customer_id
join first_order_amount fa on co.customer_id = fa.customer_id
join subsequent_order_amount sa on co.customer_id = sa.customer_id
group by customer_id
order by customer_id)

select customer_id, first_visit, sum(subsequent_visit), first_amount, (sum(order_amount) - first_amount) as subsequent_amount from overall group by customer_id;


use practice;

SELECT 
    *
FROM
    customer_orders;

with first_visit as (
select customer_id, min(order_date) as first_visit_date
from customer_orders
group by customer_id)

,visit_flag as (
select co.customer_id, co.order_date, fv.first_visit_date,
case 
when co.order_date = fv.first_visit_date then 1 else 0 end as first_visit_flag,
case
when co.order_date <> fv.first_visit_date then 1 else 0 end as subsequent_visit_flag
from customer_orders co
join first_visit fv on co.customer_id = fv.customer_id
group by customer_id
order by customer_id)

select customer_id, order_date, sum(first_visit_flag), sum(subsequent_visit_flag) from visit_flag group by customer_id;


SELECT 
    *
FROM
    customer_orders;

with first_order as ( 
select customer_id, min(order_date) as first_visit_date
from customer_orders
group by customer_id
order by order_date ASC)

, visit_flag as (
select co.*, fo.first_visit_date,
case 
when co.order_date = fo.first_visit_date then 1 else 0 end as first_visit_flag,
case
when co.order_date <> fo.first_visit_date then 1 else 0 end as repeat_visit_flag
from customer_orders co 
join first_order fo on co.customer_id = fo.customer_id 
group by customer_id)

select customer_id, order_date, sum(first_visit_flag), sum(repeat_visit_flag)
from visit_flag
group by customer_id;



SELECT 
    *
FROM
    customer_orders;

with first_visit as (
select customer_id, min(order_date) as first_visit_date, count(1) as number_visit
from customer_orders
group by customer_id
)

, first_amount as (
select customer_id, min(order_amount) as first_visit_amount
from customer_orders
group by customer_id)

, customer_flag as (
select co.*, fv.first_visit_date, fa.first_visit_amount, fv.number_visit,
case
when co.order_date = fv.first_visit_date then 1 else 0 end as customer_date_flag,
case
when co.order_amount = fa.first_visit_amount then order_amount else 0 end as customer_amount_flag
from customer_orders co
join first_visit fv on co.customer_id = fv.customer_id
join first_amount fa on co.customer_id = fa.customer_id)


select customer_id, customer_date_flag, customer_amount_flag, (number_visit - customer_date_flag) as subsequent_date_flag, (sum(order_amount) - customer_amount_flag) as subsequent_amount_flag
from customer_flag
group by customer_id;


use hr;

desc countries;
desc employees;
SELECT 
    *
FROM
    regions
WHERE
    commission_pct IS NULL;
desc job_history;

SELECT 
    employee_id, first_name, last_name
FROM
    employees
WHERE
    employee_id IN (SELECT 
            employee_id
        FROM
            job_history
        ORDER BY first_name ASC);

SELECT 
    *
FROM
    job_history;
SELECT 
    *
FROM
    departments;

SELECT 
    e.employee_id, e.first_name, e.job_id
FROM
    employees e
WHERE
    EXISTS( SELECT 
            d.department_name, d.manager_id
        FROM
            departments d
        WHERE
            e.department_id = d.department_id
        ORDER BY e.first_name DESC);

SELECT 
    employee_id,
    IFNULL(commission_pct, 'No commission') AS commission_pct,
    salary
FROM
    employees
WHERE
    commission_pct IS NULL;

SELECT 
    employee_id,
    salary,
    COALESCE(commission_pct,
            ROUND(salary / 10000, 2),
            'No commission') AS commission_pct
FROM
    employees
WHERE
    commission_pct IS NULL;

SELECT 
    *
FROM
    employees;
SELECT 
    *
FROM
    departments;

SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    e.hire_date,
    e.department_id,
    e.commission_pct,
    d.department_name,
    d.location_id
FROM
    employees e
        JOIN
    departments d ON e.department_id = d.department_id
WHERE
    commission_pct IS NOT NULL
        OR commission_pct IS NULL
GROUP BY employee_id;

SELECT 
    *
FROM
    job_history;
SELECT 
    *
FROM
    employees;

SELECT 
    j.employee_id,
    j.job_id,
    j.start_date,
    e.first_name,
    e.last_name,
    e.salary,
    e.commission_pct,
    e.hire_date
FROM
    job_history j
        LEFT JOIN
    employees e ON j.employee_id = e.employee_id
WHERE
    start_date <> hire_date
GROUP BY employee_id
ORDER BY employee_id;

SELECT 
    j.employee_id,
    j.job_id,
    j.start_date,
    e.first_name,
    e.last_name,
    e.salary,
    e.commission_pct,
    e.hire_date
FROM
    employees e
        LEFT JOIN
    job_history j ON e.employee_id = j.employee_id
GROUP BY employee_id
ORDER BY employee_id; 

use employees;
desc employees;
desc dept_manager;
desc departments;

SELECT 
    e.first_name, e.last_name, d.dept_no, e.hire_date
FROM
    employees e
        JOIN
    dept_manager d ON e.emp_no = d.emp_no
GROUP BY dept_no
ORDER BY dept_no;

SELECT 
    *
FROM
    departments;
SELECT 
    dept_no, COUNT(1) AS num_dept, dept_name
FROM
    departments
GROUP BY dept_name;

UPDATE departments 
SET 
    dept_name = 'Engineering'
WHERE
    dept_no = 'd011';

SELECT 
    *
FROM
    departments;
    

SELECT 
    *
FROM
    employees;
SELECT 
    *
FROM
    departments;

use hr;
SELECT 
    *
FROM
    employees;
SELECT 
    *
FROM
    departments;

SELECT 
    d.department_name,
    COUNT(DISTINCT e.employee_id) AS Number_employees,
    e.job_id,
    ROUND(SUM(e.salary), 2) AS sum_salary,
    TRUNCATE(AVG(salary), 2) AS average_salary,
    e.department_id
FROM
    employees e
        JOIN
    departments d ON e.department_id = d.department_id
GROUP BY department_name
ORDER BY Number_employees DESC;

CREATE OR REPLACE VIEW Department_temp AS
    SELECT 
        COUNT(DISTINCT e.employee_id) AS Number_employees,
        e.job_id,
        d.department_name
    FROM
        employees e
            JOIN
        departments d ON e.department_id = d.department_id
    GROUP BY job_id
    HAVING department_name IN ('Sales' , 'Shipping', 'Finance', 'IT')
    ORDER BY department_name DESC;
    
SELECT 
    *
FROM
    Department_temp;


    

    

    

