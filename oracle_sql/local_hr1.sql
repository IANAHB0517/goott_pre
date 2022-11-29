--like 검색
-- 상품명에 "만두" 라는 단어가 들어있는 상품만 검색
-- 문자는 대소문자 까지 똑같아야 하고, = 의 경우 정확하게 같아야 만족
select * from employees where first_name = 'Nan';



--아래의 와일드 카드를 이용하여 like 검색을 진행 할 수 있다.
-- 1) % : 여러글자(어떤 글자라도 상관 없음)
-- 2) _ : 한글자(어떤 글자라도 상관 없음)

-- 사원 중에서 이름에 n이라는 글자가 포함되어 있는 사원의 정보
select * from employees where first_name like '%n%';

select * from employees where first_name like '%n_';

-- 사원 중에서 직무에 'st'라는 글자가 포함된 사원이고, 급여거 6000이상인 사원으 모든 정보

select * from employees where job_id like '%ST%' and salary >= 6000;

-- (null) : 텅비어 있다. 아무런 값이 없다. =(equal) , != <>(not equal) 등의 연산자를 사용할 수 없다.
--컴퓨터에서 공백 ' ' 에도 값이 있다.
--사원 중에서 커미션을 받는 사원의 모든 정보 출력
-- is null or is not null 연산

select * from employees where commission_pct > 0;

select * from employees where commission_pct is not null;

select * from employees where commission_pct is null;

--order by 절 : 특정 컬럼을 기준으로 정렬하여 출력한다
-- asc 라는 키워드를 붙이거나 생략하면 오름차순 정렬
--desc 라는 키워드를 붙이면 내림차순 정렬이 된다.

--입사연도 2004년인 사원들 중에 사번, 이름, 입사일, 급여를 출력하되 급여 내림차순으로 출력
select employee_id, first_name,hire_date,salary
from employees
where hire_date like '04%'
order by salary desc;

-- 부서번호가 20번인 사원인 사원의 사번, 이름, 입사일, 근무부서번호를 출력하되
-- 급여 기준으로 내림차순 정렬하고, 급여가 같다면 입사일 기준 오름차순 정렬

select employee_id, first_name, hire_date, salary, department_id
from employees 
where department_id = 20
order by salary desc, hire_date asc;

-- 몇 명의 사원이 있는지 세어보자
select count(*)  from employees;

-- 기초문법, 함수, 서브쿼리, 조인(*). 테이블 설계, CRUD 하는 법
-- 데이터를 관리한다 : CRUD 작업.
--Create(데이터를 생성하고, 저장)
--Read (원하는 데이터를 검색)
--Update (데이터를 수정)
--Delete (데이터 삭제)

--테이블 생성
-- Products 라는 테이블 생성
-- 상품번호(product_id), 상품명(product_name), 수량 (qty), 가격 (price) 등의 데이터를 저장할 수 있도록 만드자
-- data type [ Number ({전체 자릿수}.{소수점 자릿수}) ] [ 문자 ][ 날짜 ] 등
-- 주민등록번호 : 000000 - 0000000 (문자형)
-- 모바일 : 000-0000-0000 (문자형)
-- 보통 우리가 사용하는 모든 데이터는 문자타입이 가장 많다.

-- create table {생성할 테이블의 이름}(
--{생성할 열의 이름} {데이터 타입} ,
--{생성할 열의 이름} {데이터 타입} ,

create table Products(
product_id varchar2(4),
product_name char(12),
qty number(3) ,
price number(7));

-- 테이블 수정
alter table products
modify qty number(5);

-- 테이블 row 저장
-- insert into {테이블명 (컬럼명) (values)};
-- 컬럼명을 생략시 모든 컬럼 값을 순서대로 주어야 한다

insert into products values('N100','새우깡', 100, 2000);
insert into products values('N104','왕새우깡', 100, 3500);
insert into products(product_id, product_name, qty) values('N101', '양파링', 200);
insert into products values('A200', '사이다', 1000, 1500);
insert into products values('B200', '콜라', 1000, 1800);

insert into products(product_id, product_name,qty) values('N108', '감자깡', 400);
insert into products(price) where product_id = 'N108' values (1500);

-- 테이블 row 수정
--update {테이블 명} set {컬럼명 = 값}, ... [ where 조건식 ];

update products set price = 2500 where product_name = '양파링';
update products set price = 2500 where product_name = '감자깡';

-- 모든 상품의 가격을 10% 인상한다.(update 문의 where 절을 생략하면 테이블의 모든 행에 대해서 수정된다.)
update products set price = price * 1.10;

-- 데이터 삭제
-- delete from { 테이블명 } [where 조건식];

delete from products where product_id = 'A200';

delete from products;



select * from products;


-- 테이블 삭제
drop table products;

---------------------------------------------------------------------------------

-- 서브 쿼리(sub Query) : SQL 하나의 문장에 2개 이상의 select 문장이 결합되어 있는 것

--사번이 110번인 사원이 근무하는 부서명을 검색 해보자
--1) 사원 테이블에서 사번이 110번인 사원이 근무하는 부서번호 검색 : 100
--2) 부서테이블에서 부서 번호가 100번인 부서의 부서명 검색 : Finance ;

select department_id from employees where employee_id = 110;
select department_name from departments where department_id = 100;


select department_name from departments where department_id = (select department_id from employees where employee_id = 110);

-- 부서명이 Finance인 부서가 위치한 시, 주, 도로명 주소, 우편번호를 검색하세요

select city, street_address, state_province, postal_code
from locations 
where location_id = (select location_id from departments where department_name = 'Finance');

-- 조인이나 서브쿼리가 존재하는 이유
-- 데이터 베이스는 데이터 중복을 최소화 하기 위해 데이터를 분리하여 여러개의 테이블에 저장하게 된다
-- 여러개의 테이블에서 하나의 결과를 도출해야 할 때 조인 또는 서브쿼리를 사용하게 되는 것이다.

-- 전사원에게 택배를 보내고자 한다.
-- 사무실 주소 , 부서명 , 이름
-- 이를 위해서 3개의 테이블 (사원, 부서 , 위치)를 조인 해야한다

select l.street_address, l.postal_code, l.city, l.state_province, d.department_name, e.first_name
from employees e, locations l, departments d
where e.department_id = d.department_id
and d.location_id = l.location_id;
