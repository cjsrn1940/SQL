--Q1
select  count(salary)
from employees
where salary < (select  avg(salary)
                from employees);
                
--Q2
select  avg(salary),
        max(salary)
from employees;

select  employee_id,
        first_name,
        salary,
        (select  avg(salary)
        from employees),
        (select  max(salary)
        from employees)
from employees
where salary >= (select  avg(salary)
                from employees)
and salary <= (select  max(salary)
                from employees)
order by salary asc;

--Q3
select  l.location_id,
        l.street_address,
        l.postal_code,
        l.city,
        l.state_province,
        l.country_id
from departments d, locations l
where d.location_id = l.location_id
and d.department_id = (select  department_id
                        from employees
                        where first_name = 'Steven'
                        and last_name = 'King');
                        
--Q4
select  employee_id,
        first_name,
        salary
from employees
where salary < any(select  salary
                   from employees
                   where job_id = 'ST_MAN')
order by salary desc;

--Q5
--조건절비교
select  employee_id,
        first_name,
        salary,
        department_id
from employees
where (department_id, salary) in (select  department_id,
                                          max(salary)
                                  from employees
                                  group by department_id)
order by salary desc;

--테이블조인
select  e.employee_id,
        e.first_name,
        e.salary,
        e.department_id,
        s.mSalary
from employees e, (select  department_id,
                           max(salary) mSalary
                   from employees
                   group by department_id) s
where e.department_id = s.department_id
and e.salary = s.mSalary
order by e.salary desc;

--Q6
select  j.job_title,
        e.Ssalary
from jobs j, (select  job_id,
                      sum(salary) Ssalary
              from employees
              group by job_id) e
where j.job_id = e.job_id
order by e.Ssalary desc;

--Q7
select  e.employee_id,
        e.first_name,
        e.salary
from employees e, (select  department_id, avg(salary) aSalary
                    from employees
                    group by department_id) s
where e.department_id = s.department_id
and e.salary > s.aSalary;

--Q8
select  ort.rn,
        ort.employee_id,
        ort.first_name,
        ort.salary,
        ort.hire_date
from (select  rownum rn,
              ot.employee_id,
              ot.first_name,
              ot.salary,
              ot.hire_date
      from (select employee_id,
                   first_name,
                   salary,
                   hire_date
            from employees
            order by hire_date asc) ot  
      ) ort      
where rn >= 11
and rn <= 15; 