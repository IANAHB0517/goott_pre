-- ���̺���� employees ��� ���̺��� ��� ������ �˻��ϱ�
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

select employee_id as ���, first_name as �̸�, salary as �޿� from employees;
-- ������ ����Ҷ� as �� �����ص� �ȴ�
-- �� ���� Ư�����ڳ� ������ ���ԵǸ� ""�� ����Ͽ� ������ ���

select employee_id ���, first_name ���, salary �޿� from employees;

select employee_id "��*****��" from employees;

-- ����� �߿� ����� 120���� ����� ��� ������ �˻�
select * from employees where employee_id = 120;

select * from employees where employee_id > 120;

select employee_id, first_name, email from employees where employee_id < 150;


-- SQL���� ���ڳ�, ��¥ �����ʹ� ���� ����ǥ�� ���´�. ��ҹ��ڸ� �����Ѵ�
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
