--Q1
select  first_name,
        manager_id,
        commission_pct,
        salary
from employees
where manager_id is not null
and commission_pct is null
and salary > 3000;

--Q2
select  employee_id,
        first_name,
        salary,
        to_char(hire_date, 'yyyy-mm-dd day'),
        replace(phone_number, '.','-'),
        department_id
from employees
where (department_id, salary) in (select    department_id,
                                            max(salary)
                                  from employees
                                  group by department_id)
order by salary desc;

--Q3
select  m.manager_id,
        e.first_name,
        m.raS,
        m.miS,
        m.maS
from employees e, (select  manager_id,
                           round(avg(salary),0) as raS,
                           min(salary) as miS,
                           max(salary) as maS
                    from employees
                    where hire_date >= '050101'
                    group by manager_id
                    having avg(salary) >= 5000) m
where e.employee_id = m.manager_id
order by m.raS desc;

--Q4
select  e.employee_id,
        e.first_name,
        d.department_name,
        m.first_name
from employees e, departments d, employees m
where e.department_id = d.department_id(+)
and e.manager_id = m.employee_id;

--Q5
--첫번째
select  rownum,
        employee_id,
        first_name,
        salary,
        hire_date
from employees
where hire_date >= '050101'
order by hire_date asc;

--두번째
select  rownum,
        hire_t.employee_id,
        hire_t.first_name,
        hire_t.salray,
        hire_t.hire_date
from (select  rownum,
            employee_id,
            first_name,
            salary,
            hire_date
    from employees
    where hire_date >= '050101'
    order by hire_date asc) hire_t
where rownum >= 1
and rownum <= 11;

--세번째
select  hHire_t.rn,
        hHire_t.employee_id,
        hHire_t.first_name,
        hHire_t.salary,
        hHire_t.hire_date
from (select  rownum rn,
                hire_t.employee_id,
                hire_t.first_name,
                hire_t.salary,
                hire_t.hire_date
        from (select  rownum,
                    employee_id,
                    first_name,
                    salary,
                    hire_date
            from employees
            where hire_date >= '050101'
            order by hire_date asc) hire_t
            ) hHire_t
where rn >= 11
and rn <= 20;

--Q6
select  e.first_name || ' ' || e.last_name,
        e.salary,
        d.department_name,
        e.hire_date
from employees e, departments d
where e.department_id = d.department_id
and e.hire_date = (select  max(hire_date)
                    from employees);
         
--Q7
--Q7
select  e.employee_id,
        e.first_name,
        e.last_name,
        e.salary,
        aSlt.aSalary,
        j.job_title
from    employees e, jobs j,
        (
            select  department_id
            from    (
                        select  avg(salary) aSalary,
                                department_id
                        from employees 
                        group by department_id
                    ) aSel,
                    (
                        select  max(aSelect.aSalary) mSalary
                        from    (select  avg(salary) aSalary,
                                         department_id
                                from employees
                                group by department_id) aSelect
                    ) mSel
            where aSel.aSalary = mSel.mSalary
        ) endS,
        (
            select  avg(salary) aSalary,
                    department_id
            from employees 
            group by department_id
        ) aSlt
where e.job_id = j.job_id
and e.department_id = ends.department_id
and e.department_id = aslt.department_id;

--Q8
select  d.department_name
from    departments d,
        (
            select  department_id
            from    (
                        select  avg(salary) aSalary,
                                department_id
                        from employees 
                        group by department_id
                    ) aSel,
                    (
                        select  max(aSelect.aSalary) mSalary
                        from    (select  avg(salary) aSalary,
                                         department_id
                                from employees
                                group by department_id) aSelect
                    ) mSel
            where aSel.aSalary = mSel.mSalary
        ) endS
where d.department_id = endS.department_id;


--Q9
select  rAvg.region_name
from    (
            select  r.region_name, avg(e.salary) aSalary
            from    regions r, countries c, locations l, departments d, employees e
            where e.department_id = d.department_id
            and d.location_id = l.location_id
            and l.country_id = c.country_id
            and c.region_id = r.region_id
            group by r.region_name
        ) rAvg,
        (
            select  max(rSalary.aSalary) mSalary
            from    (
                        select  r.region_name, avg(e.salary) aSalary
                        from    regions r, countries c, locations l, departments d, employees e
                        where e.department_id = d.department_id
                        and d.location_id = l.location_id
                        and l.country_id = c.country_id
                        and c.region_id = r.region_id
                        group by r.region_name
                    ) rSalary
        ) rMax
where rAvg.aSalary = rMax.mSalary;


--Q10
select  job_title
from    (
            select  j.job_title, avg(e.salary) aSalary
            from    jobs j, employees e
            where e.job_id = j.job_id
            group by j.job_title
        ) jAvg,
        (
            select  max(jSalary.aSalary) mSalary
            from    (
                        select  j.job_title, avg(e.salary) aSalary
                        from    jobs j, employees e
                        where e.job_id = j.job_id
                        group by j.job_title
                    ) jSalary
        ) jMax
where jAvg.aSalary = jMax.mSalary;