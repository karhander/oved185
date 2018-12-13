select salary
from employees
where LAST_NAME = 'Abel';

SELECT last_name, first_name, salary
FROM employees
WHERE salary > (
    select salary
    from employees
    where LAST_NAME = 'Abel'
);

select manager_id
from EMPLOYEES
where EMPLOYEE_ID = 110;

select e.first_name, e.last_name, d.DEPARTMENT_NAME
from EMPLOYEES e, DEPARTMENTS d
where e.department_id = d.DEPARTMENT_ID and e.manager_id = (
    select manager_id
    from EMPLOYEES
    where EMPLOYEE_ID = 110
); -- and e.EMPLOYEE_ID != 110;

SELECT first_name, last_name, job_id, salary
FROM employees
WHERE job_id = (
    SELECT job_id
    FROM employees
    WHERE employee_id = 141
)
AND salary > (
    SELECT salary
    FROM employees
    WHERE employee_id = 143
);

SELECT first_name, last_name, job_id, salary
FROM employees
WHERE salary = (
    SELECT MIN(salary)
    FROM employees
);

SELECT department_id, MIN(salary)
FROM employees
GROUP BY department_id
HAVING MIN(salary) > (
    SELECT MIN(salary)
    FROM employees
    WHERE department_id = 70
)
order by 1;

SELECT last_name, job_id
FROM employees
WHERE job_id = (
    SELECT job_id
    FROM employees
    WHERE last_name = 'Haas'
);

-- any
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ANY(
    SELECT salary
    FROM employees
    WHERE job_id = 'IT_PROG'
)
AND job_id != 'IT_PROG';

SELECT salary
FROM employees
WHERE job_id = 'IT_PROG';

-- all
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ALL(
    SELECT salary
    FROM employees
    WHERE job_id = 'IT_PROG'
)
AND job_id != 'IT_PROG';

-- null
SELECT first_name, last_name, manager_id
FROM employees;

SELECT first_name, last_name, MANAGER_ID
FROM employees
WHERE employee_id IN (
    SELECT manager_id
    FROM employees
    where manager_id is not null
);
