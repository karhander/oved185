-- dual
select 2 * 3 "mult"
from dual;

-- case str
select LOWER('SQL Course'), UPPER('SQL Course'), INITCAP('SQL Course')
from dual;

select lower(email) || '@test.com' as "email"
from EMPLOYEES
where LAST_NAME like 'K%';

-- ex
SELECT employee_id, last_name, department_id
FROM employees
WHERE LOWER(last_name) = 'higgins';

-- str fun
select CONCAT('Hello ', 'World') a,
    SUBSTR('HelloWorld', 1, 5) b,
    LENGTH('HelloWorld') c,
    INSTR('HelloWorld', 'W') d,
    LPAD(42, 10, '*') e,
    RPAD(42, 10, '*') f, 
    REPLACE('JACK and JUE','J','BL') g,
    TRIM('H' FROM 'HelloHWorldH') h
from dual;

SELECT employee_id,
    CONCAT(first_name, last_name) NAME,
    job_id,
    LENGTH(last_name),
    INSTR(last_name, 'a') "First 'a' (if any)"
FROM employees
WHERE SUBSTR(job_id, 4) = 'REP';
-- WHERE job_id like '%REP';

-- num
select ROUND(45.926, 2) cent,
    ROUND(45.926, 0) unity,
    ROUND(45.926, -1) dec,
    TRUNC(45.926, 2),
    MOD(1600, 300)
from dual;

SELECT last_name, hire_date
FROM employees
WHERE hire_date > '01-GEN-00';

select sysdate
from dual;

SELECT last_name, round((SYSDATE-hire_date)/7, 0) AS WEEKS
FROM employees
WHERE department_id = 90;

select round(MONTHS_BETWEEN('01-SET-95','11-GEN-94'), 1) months
from dual;

select ADD_MONTHS('11-GEN-94', 6)
from dual;

select NEXT_DAY('01-SET-95', 'VEN')
from dual;

select LAST_DAY('01-FEB-96')
from dual;

select ROUND(SYSDATE, 'MONTH'), ROUND(SYSDATE ,'YEAR'), trunc(SYSDATE ,'YEAR')
from dual;

SELECT last_name,
    TO_CHAR(hire_date, 'fmMon')
AS HIREDATE
FROM employees
where last_name = 'King';

SELECT TO_CHAR(salary, '99,999.00') SALARY
FROM employees
WHERE last_name = 'Ernst';

SELECT last_name,
    UPPER(CONCAT(SUBSTR(LAST_NAME, 2, 3), '_us'))
FROM employees
WHERE department_id = 60;

SELECT last_name, salary,
    NVL(commission_pct, 0),
    (salary*12) + (salary*12* NVL(commission_pct, 0)) AN_SAL
FROM employees;

SELECT last_name, salary, commission_pct,
NVL2(commission_pct, SALARY * (1 + COMMISSION_PCT), SALARY) income
FROM employees WHERE department_id IN (50, 80);
