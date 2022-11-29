-- 테이블명이 employees 라는 테이블의 모든 데이터 검색하기
select * from employees ;

select * from departments ;

select * from jobs;

select employee_id from employees;

select job_id from employees;

select hire_date from employees;

select department_name from departments;

select street_address from locations;

select hire_date, employee_id, first_name, salary from employees;

select department_id, department_name from departments;

select employee_id as 사번, first_name as 이름, salary as 급여 from employees;
-- 별명을 기술할때 as 를 생략해도 된다
-- 단 별명에 특수문자나 공백이 포함되면 ""를 사용하여 별명을 기술

select employee_id 사번, first_name 사번, salary 급여 from employees;

select employee_id "사*****번" from employees;

-- 사원들 중에 사번이 120번인 사원의 모든 데이터 검색
select * from employees where employee_id = 120;

select * from employees where employee_id > 120;

select employee_id, first_name, email from employees where employee_id < 150;


-- SQL에서 문자나, 날짜 데이터는 작은 따옴표로 묶는다. 대소문자를 구분한다
select * from employees where first_name = 'Lex';

select  first_name, salary from employees where salary >= 10000;

select first_name, hire_date, salary from employees
where hire_date =  '03/05/18';

select first_name, hire_date from employees where hire_date < '03/01/01';

select * from employees where salary <=10000 and hire_date < '03/01/01';

select * from employees where salary <= 5000 or job_id = 'ac_account';

select department_name, location_id from departments
where department_id <= 50 and department_id >= 20;


select department_name, location_id from departments
where department_id between 20 and 50;



select department_id, department_name from departments
where department_id = 10 or department_id = 40 or department_id = 60;

select department_id, department_name from departments
where department_id in (10,40,60);
