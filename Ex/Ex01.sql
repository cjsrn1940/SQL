select * 
from employees;

select * 
from departments;

--원하는 컬럼만 조회하기
select employee_id, first_name, last_name
from  employees;

--예제)
select first_name, phone_number, hire_date, salary
from employrees;

select first_name,
    last_name,
    phone_number,
    email,
    hire_date
from employees;

--출력할 때 컬럼에 별명 사용하기
select employee_id as empNo,
    first_name as "f-name",
    salary as "급 여"
from employees;

--예제)
select  fist_name 이름,
        phone_number 전화번호,
        hire_date 입사일,
        salary 급여
from employees;


select  employee_id as 사원번호,
        first_name as 이름,
        last_name as 성,
        salary as 급여,
        phone_number as 전화번호,
        email as 이메일,
        hire_date as 입사일
from employees;

--연결 연산자(Concatenation)로 컬럼들 붙이기
select  first_name,
        last_name
from employees;

select  first_name || last_name
from employees;

select  first_name || ' ' || last_name
from employees;

select first_name || ' hire date is ' || hire_date "입사일"
from employees;

--산술 연산자 사용하기
select  first_name,
        salary,
        salary*12
from employees;

select  first_name,
        salary,
        salary*12,
        (salary+300)*12
from employees;

--예제)
select  job_id*12
from employees;

--예제)
select  first_name || '-' || last_name "성명",
        salary "급여",
        salary*12 "연동",
        salary*12+5000 "연봉2",
        phone_number "전화번호"
from employees;

/*where절*/
select *
from employees
where department_id = 10;

--예제
select first_name, salary
from employees
where salary >= 15000;

select first_name,
        hire_date
from employees
where hire_date >= '07/01/01';

select  salary, first_name
from employees
where first_name = 'Lex';

--조건이 2개이상 일때 한꺼번에 조회하기
select *
from employees
where salary >= 14000
and salary <= 17000;

--예제
select first_name, salary
from employees
where salary <= 14000
or salary >= 17000;

select first_name,
        hire_date
from employees
where hire_date >= '04/01/01'
and hire_date <= '05/12/31';

select first_name, salary
from employees
where salary between 14000 and 17000;

--IN 연산자로 여러 조건을 검사하기
select first_name, last_name, salary
from employees
where first_name in ('Neena', 'Lex', 'John');

select first_name, last_name, salary
from employees
where first_name = 'Neena'
or first_name = 'Lex'
or first_name = 'John';

--예제
select *
from employees
where salary in (2100, 3100, 4100, 5100);

--Like 연산자로 비슷한것들 모두 찾기
select first_name, last_name, salary
from employees
where first_name like '____l';

--예제
select first_name, salary
from employees
where first_name like '%am%';

--예제
select first_name, salary
from employees
where first_name like '_a%';

--예제
select first_name
from employees
where first_name like '___a%';

--예제
select first_name
from employees
where first_name like '___a__';