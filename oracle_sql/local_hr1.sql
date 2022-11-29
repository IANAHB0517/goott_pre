--like �˻�
-- ��ǰ�� "����" ��� �ܾ ����ִ� ��ǰ�� �˻�
-- ���ڴ� ��ҹ��� ���� �Ȱ��ƾ� �ϰ�, = �� ��� ��Ȯ�ϰ� ���ƾ� ����
select * from employees where first_name = 'Nan';



--�Ʒ��� ���ϵ� ī�带 �̿��Ͽ� like �˻��� ���� �� �� �ִ�.
-- 1) % : ��������(� ���ڶ� ��� ����)
-- 2) _ : �ѱ���(� ���ڶ� ��� ����)

-- ��� �߿��� �̸��� n�̶�� ���ڰ� ���ԵǾ� �ִ� ����� ����
select * from employees where first_name like '%n%';

select * from employees where first_name like '%n_';

-- ��� �߿��� ������ 'st'��� ���ڰ� ���Ե� ����̰�, �޿��� 6000�̻��� ����� ��� ����

select * from employees where job_id like '%ST%' and salary >= 6000;

-- (null) : �ֺ�� �ִ�. �ƹ��� ���� ����. =(equal) , != <>(not equal) ���� �����ڸ� ����� �� ����.
--��ǻ�Ϳ��� ���� ' ' ���� ���� �ִ�.
--��� �߿��� Ŀ�̼��� �޴� ����� ��� ���� ���
-- is null or is not null ����

select * from employees where commission_pct > 0;

select * from employees where commission_pct is not null;

select * from employees where commission_pct is null;

--order by �� : Ư�� �÷��� �������� �����Ͽ� ����Ѵ�
-- asc ��� Ű���带 ���̰ų� �����ϸ� �������� ����
--desc ��� Ű���带 ���̸� �������� ������ �ȴ�.

--�Ի翬�� 2004���� ����� �߿� ���, �̸�, �Ի���, �޿��� ����ϵ� �޿� ������������ ���
select employee_id, first_name,hire_date,salary
from employees
where hire_date like '04%'
order by salary desc;

-- �μ���ȣ�� 20���� ����� ����� ���, �̸�, �Ի���, �ٹ��μ���ȣ�� ����ϵ�
-- �޿� �������� �������� �����ϰ�, �޿��� ���ٸ� �Ի��� ���� �������� ����

select employee_id, first_name, hire_date, salary, department_id
from employees 
where department_id = 20
order by salary desc, hire_date asc;

-- �� ���� ����� �ִ��� �����
select count(*)  from employees;

-- ���ʹ���, �Լ�, ��������, ����(*). ���̺� ����, CRUD �ϴ� ��
-- �����͸� �����Ѵ� : CRUD �۾�.
--Create(�����͸� �����ϰ�, ����)
--Read (���ϴ� �����͸� �˻�)
--Update (�����͸� ����)
--Delete (������ ����)

--���̺� ����
-- Products ��� ���̺� ����
-- ��ǰ��ȣ(product_id), ��ǰ��(product_name), ���� (qty), ���� (price) ���� �����͸� ������ �� �ֵ��� ������
-- data type [ Number ({��ü �ڸ���}.{�Ҽ��� �ڸ���}) ] [ ���� ][ ��¥ ] ��
-- �ֹε�Ϲ�ȣ : 000000 - 0000000 (������)
-- ����� : 000-0000-0000 (������)
-- ���� �츮�� ����ϴ� ��� �����ʹ� ����Ÿ���� ���� ����.

-- create table {������ ���̺��� �̸�}(
--{������ ���� �̸�} {������ Ÿ��} ,
--{������ ���� �̸�} {������ Ÿ��} ,

create table Products(
product_id varchar2(4),
product_name char(12),
qty number(3) ,
price number(7));

-- ���̺� ����
alter table products
modify qty number(5);

-- ���̺� row ����
-- insert into {���̺�� (�÷���) (values)};
-- �÷����� ������ ��� �÷� ���� ������� �־�� �Ѵ�

insert into products values('N100','�����', 100, 2000);
insert into products values('N104','�ջ����', 100, 3500);
insert into products(product_id, product_name, qty) values('N101', '���ĸ�', 200);
insert into products values('A200', '���̴�', 1000, 1500);
insert into products values('B200', '�ݶ�', 1000, 1800);

insert into products(product_id, product_name,qty) values('N108', '���ڱ�', 400);
insert into products(price) where product_id = 'N108' values (1500);

-- ���̺� row ����
--update {���̺� ��} set {�÷��� = ��}, ... [ where ���ǽ� ];

update products set price = 2500 where product_name = '���ĸ�';
update products set price = 2500 where product_name = '���ڱ�';

-- ��� ��ǰ�� ������ 10% �λ��Ѵ�.(update ���� where ���� �����ϸ� ���̺��� ��� �࿡ ���ؼ� �����ȴ�.)
update products set price = price * 1.10;

-- ������ ����
-- delete from { ���̺�� } [where ���ǽ�];

delete from products where product_id = 'A200';

delete from products;



select * from products;


-- ���̺� ����
drop table products;

---------------------------------------------------------------------------------

-- ���� ����(sub Query) : SQL �ϳ��� ���忡 2�� �̻��� select ������ ���յǾ� �ִ� ��

--����� 110���� ����� �ٹ��ϴ� �μ����� �˻� �غ���
--1) ��� ���̺��� ����� 110���� ����� �ٹ��ϴ� �μ���ȣ �˻� : 100
--2) �μ����̺��� �μ� ��ȣ�� 100���� �μ��� �μ��� �˻� : Finance ;

select department_id from employees where employee_id = 110;
select department_name from departments where department_id = 100;


select department_name from departments where department_id = (select department_id from employees where employee_id = 110);

-- �μ����� Finance�� �μ��� ��ġ�� ��, ��, ���θ� �ּ�, �����ȣ�� �˻��ϼ���

select city, street_address, state_province, postal_code
from locations 
where location_id = (select location_id from departments where department_name = 'Finance');

-- �����̳� ���������� �����ϴ� ����
-- ������ ���̽��� ������ �ߺ��� �ּ�ȭ �ϱ� ���� �����͸� �и��Ͽ� �������� ���̺� �����ϰ� �ȴ�
-- �������� ���̺��� �ϳ��� ����� �����ؾ� �� �� ���� �Ǵ� ���������� ����ϰ� �Ǵ� ���̴�.

-- ��������� �ù踦 �������� �Ѵ�.
-- �繫�� �ּ� , �μ��� , �̸�
-- �̸� ���ؼ� 3���� ���̺� (���, �μ� , ��ġ)�� ���� �ؾ��Ѵ�

select l.street_address, l.postal_code, l.city, l.state_province, d.department_name, e.first_name
from employees e, locations l, departments d
where e.department_id = d.department_id
and d.location_id = l.location_id;
