--Pracite02
--Q1
select  count(manager_id) "haveMngCnt"
from employees;

--Q2
select  max(salary) 최고임금,
        min(salary) 최저임금,
        max(salary)-min(salary) "최고임금-최저임금"
from employees;

--Q3
select  to_char(max(hire_date),'yyyy"년" mm"월" dd"일"')
from employees;

--Q4
select  department_id,
        avg(salary),
        max(salary),
        min(salary)
from employees
group by department_id
order by department_id desc;

--Q5
select  job_id,
        round(avg(salary), 0),
        max(salary),
        min(salary)
from employees
group by job_id
order by min(salary) desc, round(avg(salary), 0) asc;

--Q6
select  to_char(min(hire_date),'yyyy-mm-dd day')
from employees;

--Q7
select  department_id,
        avg(salary),
        min(salary),
        avg(salary)-min(salary)
from employees
group by department_id
having avg(salary)-min(salary) < 2000
order by avg(salary)-min(salary) desc;

--Q8
select  job_id,
        max(max_salary)-min(min_salary)
from jobs
group by job_id
order by max(max_salary)-min(min_salary) desc;

--Q9
select  manager_id,
        round(avg(salary), 0),
        avg(salary),
        min(salary),
        max(salary)
from employees
where hire_date >= '050101'
group by manager_id
having round(avg(salary), 1) >= 5000
order by round(avg(salary), 1) desc;

--Q10
select  
    hire_date,
    case
        when hire_date < '021231'   then '창립멤버'
        when hire_date < '040101'   then '03년입사'
        when hire_date < '050101'   then '04년입사'
    else '상장이후입사'
    end optDate
from employees
order by hire_date asc;