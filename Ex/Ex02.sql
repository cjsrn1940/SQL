/*where절*/
--NULL
select first_name, salary, commission_pct, salary*commission_pct
from employees
where salary between 13000 and 15000;

select first_name, salary, commission_pct
from employees
where commission_pct is null;

select first_name, salary, commission_pct
from employees
where commission_pct is not null;

--예제) 커미션비율이 있는 사원의 이름과 연봉 커미션비율을 출력하세요
select first_name, salary
from employees
where commission_pct is not null;

--예제) 담당매니저가 없고 커미션비율이 없는 직원의 이름을 출력하세요
select first_name
from employees
where commission_pct is null
and manager_id is null;

--order by
select first_name, salary
from employees
order by salary desc;   --내림차순

select first_name, salary
from employees
order by salary asc;   --오름차순

select first_name, salary
from employees
order by salary asc, first_name asc;   --1순위 급여 오름차순,
                                        --급여가 동률일때 이름을 오름차순
                            
--select, from, where, order by 절 위치            
select first_name, salary
from employees
where salary >= 9000
order by salary desc;

--예제) 부서번호를 오름차순으로 정렬하고 부서번호, 급여, 이름을 출력하세요
select department_id, salary, first_name
from employees
order by department_id asc;

--예제)급여가 10000 이상인 직원의 이름 급여를 급여가 큰 직원부터 출력
select first_name, salary
from employees
where salary >= 10000
order by salary desc;


/*단일행 함수*/
select email, initcap(email), department_id
from employees
where department_id = 100;

--가상의 테이블 dual
select initcap('aaaaa')
from dual;

--lower(), upper()
select first_name, lower(first_name), upper(first_name)
from  employees
where department_id = 100;

--substr()
select substr('abcdefg', 4, 3)
from dual;

select substr('900214-1234234', 8, 1)
from dual;

select first_name, substr(first_name, 1, 3), substr(first_name, -3, 2)
from  employees
where department_id = 100;

--lpad() rpad()
select  first_name, 
        lpad(first_name, 10, '*'),
        rpad(first_name, 10, '*')
from employees;

--replace()
select  first_name,
        replace(first_name, 'a', '*'),
        replace(first_name, substr(first_name, 2, 3), '***')
from employees;

select first_name, substr(first_name, 2, 3)
from employees;

/*숫자함수*/
select  round(123.346, 2) r2,
        round(123.346, 0) as r0,
        round(127.346, -1) as "r-1"
from dual;


--trunc
select  trunc(123.456, 2),
        trunc(123.956, 0),
        trunc(123.456, -1)
from dual;

--abs
select abs(-5)
from dual;

/*날짜 함수*/
select sysdate
from dual;

--MONTH_BETWEEN(d1, d2)
select  sysdate,
        hire_date,
        months_between(sysdate, hire_date)
from employees;

select  sysdate,
        hire_date,
        round(months_between(sysdate, hire_date), 0)
from employees;


/*변환함수*/
--to_char()
select first_name, salary*12, to_char(salary*12, '$999,999,99')
from employees
where department_id = 110;

select  to_char(9876, '99999'),
        to_char(9876, '099999'),
        to_char(9876, '$9999'),
        to_char(9876, '99999.99'),
        to_char(987654321, '999,999,999'),
        to_char(987654321, '999,999,999.999')
from dual;

--to_char() 날짜 --> 문자열
select  sysdate, 
        to_char(sysdate, 'yy-mm-dd hh24:mi:ss'),
        to_char(sysdate, 'yyyy"년" mm"월" dd"일"' ),
        to_char(sysdate, 'yy-mm-dd'),
        to_char(sysdate, 'yy.mm.dd'),
        to_char(sysdate, 'yyyy'),
        to_char(sysdate, 'yy'),
        to_char(sysdate, 'mm'),
        to_char(sysdate, 'MONTH'),
        to_char(sysdate, 'DD'),
        to_char(sysdate, 'day'),
        to_char(sysdate, 'hh'),
        to_char(sysdate, 'hh24'),
        to_char(sysdate, 'mi'),
        to_char(sysdate, 'ss'),
        to_char(sysdate, 'yymmdd')
from dual;

--nvl() nvl2()
select  first_name,
        commission_pct, 
        nvl(commission_pct, 0),
        nvl2(commission_pct, 100, 0)
from employees;
