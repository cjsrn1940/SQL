--EQUI Join
select  e.employee_id,
        e.first_name,
        e.department_id,
        d.department_id
from employees e, departments d
where e.department_id = d.department_id;


select  em.first_name, 
        em.department_id,
        em.job_id,
        de.department_name,
        de.department_id,
        jo.job_title,
        jo.job_id
from employees em, departments de, jobs jo
where em.department_id = de.department_id
and em.job_id = jo.job_id;

/*outer join*/
--left join
select  em.employee_id,
        em.first_name,
        em.department_id,
        de.department_name
from employees em left outer join departments de
on em.department_id = de.department_id;

select  em.employee_id,
        em.first_name,
        em.department_id,
        de.department_name
from employees em, departments de
where em.department_id = de.department_id(+);


--right join
select  em.employee_id,
        em.first_name,
        em.department_id,
        de.department_name
from employees em right outer join departments de
on em.department_id = de.department_id;

select  em.employee_id,
        em.first_name,
        em.department_id,
        de.department_name
from employees em, departments de
where em.department_id(+) = de.department_id;

--right join --> left join
select  em.employee_id,
        em.first_name,
        em.department_id,
        de.department_name
from departments de left outer join employees em
on de.department_id = em.department_id;


--full outer join
select  em.employee_id,
        em.first_name,
        em.department_id,
        de.department_name 
from employees em full outer join departments de
on em.department_id = de.department_id;

--full outer join + 기호 사용할 수 없다
select  e.employee_id,
        e.first_name,
        e.department_id,
        d.department_id
from employees e, departments d
where e.department_id(+) = d.department_id(+);

--self join
select  em.employee_id,
        em.first_name,
        em.phone_number,
        em.manager_id,
        em.department_id,
        ma.employee_id,
        ma.first_name,
        ma.phone_number
from employees em, employees ma
where em.manager_id = ma.employee_id;



--조인 컬럼을 사용할때는 조심해서 사용해야 한다
select *
from employees em , locations lo
where em.salary = lo.location_id;