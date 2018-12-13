-- departments locations on location_id
SELECT d.department_id, d.department_name, l.location_id, l.city
FROM departments d, locations l
where d.location_id = l.location_id;

-- same, w/ natural join
SELECT department_id, department_name, location_id, city
FROM departments NATURAL JOIN locations;

-- employees departments on department_id
SELECT e.employee_id, e.last_name, d.location_id, d.department_id
FROM employees e, departments d
where e.department_id = d.department_id;

-- join using
SELECT e.employee_id, e.last_name, d.location_id, department_id
FROM employees e JOIN departments d
USING (department_id);

-- join on
SELECT e.employee_id, e.last_name, e.department_id, d.location_id
FROM employees e JOIN departments d
ON (e.department_id = d.department_id);

-- self join
SELECT e.employee_id, e.last_name employee, m.last_name manager
FROM employees e JOIN employees m
ON (e.manager_id = m.employee_id)
order by 1;

-- join and
SELECT e.employee_id, e.last_name, e.department_id, d.location_id
FROM employees e JOIN departments d
ON (e.department_id = d.department_id)
    AND e.manager_id = 149;

-- 3-join
SELECT employee_id, city, department_name
FROM employees e JOIN departments d
ON d.department_id = e.department_id
JOIN locations l
ON d.location_id = l.location_id;

select first_name, last_name, city
from employees natural join departments
natural JOIN locations;

select EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT_ID
from employees
where DEPARTMENT_ID is null;

SELECT e.first_name, e.last_name, e.department_id, d.department_name
FROM employees e LEFT OUTER JOIN departments d
-- FROM employees e JOIN departments d
ON e.department_id = d.department_id
order by 2;

select DEPARTMENT_ID
from DEPARTMENTS
where MANAGER_ID is null;

select *
from EMPLOYEES
where DEPARTMENT_ID = 140;

SELECT e.last_name, e.department_id, d.department_name
FROM employees e RIGHT OUTER JOIN departments d
-- FROM employees e JOIN departments d
ON (e.department_id = d.department_id);

SELECT e.first_name, e.last_name, d.department_id, d.department_name
FROM employees e FULL OUTER JOIN departments d
-- FROM employees e JOIN departments d
-- FROM employees e left outer JOIN departments d
-- FROM employees e right outer JOIN departments d
ON (e.department_id = d.department_id)
order by 2;

SELECT last_name, department_name
FROM employees CROSS JOIN departments;

SELECT first_name, last_name, commission_pct, department_name
FROM employees CROSS JOIN departments;

select first_name, last_name, job_id
from EMPLOYEES natural join JOB_HISTORY;

select FIRST_NAME, LAST_NAME, START_DATE, END_DATE, DEPARTMENT_NAME
from job_history j natural join DEPARTMENTS
join EMPLOYEES e
on j.EMPLOYEE_ID = e.EMPLOYEE_ID;
