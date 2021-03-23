select * from EMP;

-- ������̺��� �Ի�����  23���� ����� �����ȣ, �����, ����, �Ŵ��� ��ȣ, �Ի���, ������ ��ȸ�Ͽ�
-- cp_emp3���̺� �߰��ϼ���. //������  subquery
insert into cp_emp3
(select  EMPNO, ENAME, JOB, MGR, HIREDATE, SAL
from    emp
where		to_char(hiredate,'dd')=23);

commit;

select * from CP_EMP3;

select * from car_country;--������
select * from car_maker;-- ������
select * from car_model;--��������


-- 5�ʿ� 6�ʿ� �Ǹŵ� ������ �𵨸�, �Ѱ���, ��� ������ ��ȸ
select   	model,sum(PRICE) total_price, trunc(avg(CAR_YEAR),0) avg_car_year
from    	car_model
where			to_char(HIREDATE,'ss') in ('05','06')
group by  model;

create table car_sales(
		model varchar2(30),
		total_price number,
		avg_car_year number,
		input_date date);


-- 5�ʿ� 6�ʿ� �Ǹŵ� ������ �𵨸�, �Ѱ���, ��� ������ ��ȸ�Ͽ� �����Ǹ�-
-- ���̺� �߰�.
insert into car_sales
(select   	model,sum(PRICE) total_price, trunc(avg(CAR_YEAR),0) avg_car_year,
						sysdate
from    	car_model
where			to_char(HIREDATE,'ss') in ('05','06')
group by  model);

select * from car_sales;

-----------------------------update subquery---------------------------------------
select * from cp_emp1;
-- �����Ȥ 1213�̸鼭 ������� '���й�'��  ����� ������
-- �����ȣ�� 1212�� ����� ������ ������ ����.
update  cp_emp1
set     sal=(select sal from cp_emp1 where empno=1212)
where		empno=1213 and ename='���й�';

commit;

-- cp_emp2 ���̺��� 7698 �Ŵ����� �����ϴ� ����� ������ cp_emp1 ���̺���
-- �����ȣ�� 1213�� ����� �������� ����. (5���� ������ �����ض�!->������ subquery!!)
--(�ٵ� update�� �ܼ��� subquery�� ��.)
select * from cp_emp2;

update  cp_emp2
set    	sal=(select sal from cp_emp1 where empno=1213)
where   empno in (select empno from cp_emp2 where mgr=7698);

commit;

-------------------------------delete subquery-------------------------------------
select * from cp_emp4;

create table cp_emp4 as (select empno, ename, deptno, job, hiredate from emp);

-- cp_emp1 ���̺��� �����ȣ�� '7566'�� ����� �ٹ��ϴ� �μ���ȣ�� ��ȸ�Ͽ�,
-- cp_emp4 ���̺��� �ش� �λ��� �ٹ��ϴ� ����� ��� �����ϼ���. (-> 20�� �μ� ��� ������)

delete from cp_emp4
where			  deptno = (select deptno from cp_emp1 where empno=7566);

commit;

-- cp_emp1 ���̺��� 10�� �μ��� �ٹ��ϴ� �����ȣ�� ��ȸ�Ͽ�,
-- cp_emp4 ���̺� ��ġ�ϴ� ��������� �����ϼ���. (->10���μ� ��� ������)

delete from cp_emp4
where       empno in (select empno from cp_emp1 where deptno=10);

select * from cp_emp4;   