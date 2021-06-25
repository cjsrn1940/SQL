/*그룹함수*/

select  first_name, round(salary, -4)
from employees;

--그룹함수 -> 오류발생(반드시 이유를 확인할것)
--first_name은 1대1로 매칭되는 값이 있고 avg1(salary)는 그룹함수이기 때문
select first_name, avg(salary)
from employees;

--그룹함수 avg()
select avg(salary)
from employees;

--그룹함수 count()
select  count(*),-- *은 null도포함
        count(first_name), -- 컬럼명 사용시 null을 제외한 count
        count(commission_pct) -- 컬럼명 사용시 null을 제외한 count
from employees;

-- 조건절 추가
select  count(*)
from employees
where salary > 16000;

--그룹함수 sum()
select  sum(salary), count(*) --그룹함수끼리는 표현할 수 있다. 둘다 row 1개
from employees;

--그룹함수 avg() null일때 0으로 변환해서 사용
select  count(*),                                   --전체갯수 107
        count(commission_pct),                      --35 commission_pct 값이 있는 직원
        sum(commission_pct),                        --전체합계
        
        avg(commission_pct),                        --null을 포함 안함, 평균은 35 인원으로 계산
        sum(commission_pct)/count(commission_pct),  --null제외    7.8/35
        
        avg(nvl(commission_pct, 0)),                --null을 0으로 바꿔 평균계산
        sum(commission_pct)/count(*)                --null포함    7.8/107
        
from employees;

--그룹함수 max() min()
select max(salary), min(salary)
from employees;

select first_name, salary
from employees
order by salary desc;

select first_name, max(salary) --오류 --> 이렇게 표현하는 방법은?
from employees;

/*groub by 절*/
--전체 부서, 급여 출력
select  department_id, salary
from employees
order by department_id asc;

--부서번호, 부서별평균 급여
select  department_id, avg(salary)
from employees
group by department_id
order by department_id asc;

--group by 절 사용시 주의
--되는 경우
select  department_id, count(*), sum(salary)
from employees
group by department_id;

--안되는 경우
select department_id, job_id, count(*), sum(salary)
from employees
group by department_id;


--그룹을 더 세분화
select  department_id, job_id, avg(salary)
from employees
group by department_id, job_id;

--예제
select  department_id, count(*), sum(salary)
from employees
group by department_id;

--그룹함수는 where 절에서 사용할 수 없다
--안되는 예제
select  department_id, count(*), sum(salary)
from employees
where sum(salary) >= 20000
group by department_id;

-- 그룹전용 where절 --> having 절
select  department_id, count(*), sum(salary)
from employees
group by department_id
having sum(salary) >= 20000;

--* sum(salary)가 20000 이상이면서 부서코드가 100인 숫자, 급여합계    100,6,51608
select  department_id, count(*), sum(salary)
from employees
where department_id = 100
group by department_id
having sum(salary) >= 20000;

select  department_id, count(*), sum(salary)
from employees
group by department_id, job_id
having sum(salary) >= 20000
and job_id = 'IT_PROG';

/*
select  문
    select 절
    from 절
    where 절
    group by 절
    having 절
    order by 절
*/

--case ~end 문
select  employee_id,
        job_id, 
        salary,
        
        case
            when job_id='AC_' then salary+salary*0.1
            when job_id='SA_REP' then salary+salary*0.2
            when job_id='ST_CLERK' then salary+salary*0.3
            else salary
        end as rSalary
from employees;

--decode()
select  employee_id,
        job_id, 
        salary,
        decode(
            job_id, 'AC_ACCOUNT', salary+salary*0.1,
                    'SA_REP', salary+salary*0.2,
                    'ST_CLERK', salary+salary*0.3,
            salary
        ) as rSalary
from employees;