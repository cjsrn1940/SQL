--Q1
select  e.employee_id,
        e.first_name,
        e.last_name,
        d.department_name
from employees e, departments d
where e.department_id = d.department_id
order by d.department_name asc, e.employee_id desc;

--Q2
select  e.employee_id,
        e.first_name,
        e.salary,
        d.department_name,
        j.job_title
from employees e, departments d, jobs j
where e.department_id = d.department_id
and e.job_id = j.job_id
order by employee_id asc;

--Q2-1
select  e.employee_id,
        e.first_name,
        e.salary,
        d.department_name,
        j.job_title
from employees e, departments d, jobs j
where e.department_id = d.department_id(+)
and e.job_id = j.job_id(+)
order by employee_id asc;

--Q3
select  l.location_id,
        l.city,
        d.department_name,
        d.department_id
from locations l, departments d
where l.location_id = d.location_id
order by l.location_id asc;

--Q3-1
select  l.location_id,
        l.city,
        d.department_name,
        d.department_id
from locations l, departments d
where l.location_id = d.location_id(+)
order by l.location_id asc;

--Q4
select  r.region_name,
        c.country_name
from countries c, regions r
where c.region_id = r.region_id
order by r.region_name asc, c.country_name desc;

--Q5
select  em.employee_id,
        em.first_name,
        em.hire_date,
        
        ma.first_name,
        ma.hire_date
from employees em, employees ma
where em.manager_id = ma.employee_id
and em.hire_date < ma.hire_date;

--Q6
select  c.country_name,
        c.country_id,
        l.city,
        l.location_id,
        d.department_name,
        d.department_id
from countries c, locations l, departments d
where l.country_id = c.country_id
and l.location_id = d.location_id
order by c.country_name asc;

--Q7
select  j.job_id,
        e.employee_id,
        e.first_name || ' ' || e.last_name,
        e.job_id,
        j.start_date,
        j.end_date
from job_history j, employees e
where j.employee_id = e.employee_id
and j.job_id = 'AC_ACCOUNT';

--Q8
select  d.department_id,
        d.department_name,
        ma.first_name,
        l.city,
        c.country_name,
        r.region_name
from departments d, employees ma, locations l, countries c, regions r
where d.manager_id = ma.employee_id
and d.location_id = l.location_id
and l.country_id = c.country_id
and c.region_id = r.region_id;

--Q9
select  e.employee_id,
        e.first_name,
        d.department_name,
        m.first_name
from employees e, departments d, employees m
where e.department_id = d.department_id(+)
and e.manager_id = m.employee_id;