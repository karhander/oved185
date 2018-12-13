-- grouping
SELECT
    --round(AVG(salary), 2),
    AVG(salary),
    MAX(salary),
    MIN(salary),
    SUM(salary)
FROM employees;

-- min/max
SELECT MIN(hire_date), MAX(hire_date), min(last_name)
FROM employees;

-- count
SELECT COUNT(*)
FROM employees;

-- count not null
SELECT COUNT(commission_pct)
FROM employees;

SELECT COUNT(DISTINCT department_id)
FROM employees;

SELECT DISTINCT department_id
FROM employees;

-- grouping exclude null values, NVL to include them
-- SELECT round(AVG(commission_pct), 3), round(AVG(NVL(commission_pct, 0)), 3)
SELECT AVG(commission_pct), AVG(NVL(commission_pct, 0))
FROM employees;

-- group by
SELECT department_id, round(AVG(salary), 0), sum(salary)
--SELECT department_id, AVG(salary), sum(salary)
FROM employees
GROUP BY department_id
order by 2 desc;

SELECT round(AVG(salary), 0)
FROM employees
GROUP BY department_id;

SELECT department_id, job_id, SUM(salary)
FROM employees
GROUP BY department_id, job_id
order by department_id;

SELECT department_id, COUNT(last_name)
FROM employees
group by department_id -- mandatory!
order by 2 desc;

select last_name, count(last_name)
from EMPLOYEES
group by LAST_NAME
order by 2 desc;

select last_name, first_name
from EMPLOYEES
where last_name in ('Cambrault', 'Grant', 'Taylor', 'Smith', 'King');

-- "where" can't filter groups:
SELECT department_id, round(AVG(salary), 0)
FROM employees
--WHERE AVG(salary) > 8000
GROUP BY department_id;

-- use "having" instead
SELECT department_id, round(AVG(salary), 0)
FROM employees
GROUP BY department_id
-- HAVING AVG(salary) > 8000;
-- having DEPARTMENT_ID < 50
--    and AVG(salary) > 8000;
having DEPARTMENT_ID in (20, 80);

SELECT job_id, SUM(salary)
FROM employees
WHERE job_id NOT LIKE '%REP%'
GROUP BY job_id
HAVING SUM(salary) > 13000
ORDER BY 2;

-- max avg salary for dep
--SELECT MAX(AVG(salary))
SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id
order by 2 desc;

SELECT e.department_id, d.DEPARTMENT_NAME, MAX(salary) as max
FROM employees e, DEPARTMENTS d
where e.DEPARTMENT_ID = d.DEPARTMENT_ID
GROUP BY e.department_id, d.DEPARTMENT_NAME
order by 2 desc;

SELECT round(MAX(AVG(salary)), 0)
from EMPLOYEES
GROUP BY department_id;

SELECT department_id, round(AVG(salary), 0)
FROM employees
GROUP BY department_id
order by 2 desc;

