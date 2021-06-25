--Q1
select  first_name 이름,
        salary 월급,
        phone_number 전화번호,
        hire_date 입사일
from employees
order by hire_date asc;

--Q2
select  job_title,
        max_salary
from jobs
order by max_salary desc;

--Q3
select  first_name,
        manager_id,
        commission_pct,
        salary
from employees
where manager_id is not null
and commission_pct is null
and salary > 3000;

--Q4
select  job_title,
        max_salary
from jobs
where max_salary >= 10000
order by max_salary desc;

--Q5
select  first_name,
        salary,
        nvl(commission_pct, 0)
from employees
order by salary desc;

--Q6
select  first_name,
        salary,
        to_char(hire_date, 'yyyy-mm'),
        department_id
from employees
where department_id in (10, 90, 100);

--Q7
select  first_name,
        salary
from employees
where first_name like '%s%'
or first_name like '%S%';

--Q8
select  department_name
from departments
order by LENGTH(department_name) desc;

--Q9
select  upper(country_name)
from countries
order by country_name asc;

--Q10
select  first_name,
        salary,
        replace(phone_number, '.','-'),
        hire_date
from employees
where hire_date < '03/12/31';