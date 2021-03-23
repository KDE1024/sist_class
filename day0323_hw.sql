 /*����1.
 ��� ���̺��� ������ 1500~3000������ �����
  �����ȣ, �����, ����, �Ի���, �μ���ȣ, ����,�Ŵ�����ȣ�� ��ȸ�Ͽ�
  emp_work���̺� �����Ͽ� �߰��մϴ�.*/
select * from emp_work;

create table emp_work(
empno number(4),
ename varchar2(10),
sal number(7,2),
hiredate date,
deptno number(2),
job varchar2(9),
mgr number(4)
);
commit;

insert into emp_work
(select empno, ename, sal, hiredate, deptno, job, mgr
from		emp
where		sal between 1500 and 3000);

/*����2.
  emp���̺��� 10�� 30�� �μ��� ��� ������ ��ȸ�Ͽ� emp_work���̺�
  ��ȸ ����� �߰��մϴ�.
   ��, �����ȣ�� ��ȸ�� �����ȣ�� 1000�� ���� ������ �߰��� ��.*/
insert into emp_work
(select  EMPNO+1000, ENAME, SAL, HIREDATE, DEPTNO, JOB, MGR
from		EMP
where   DEPTNO in (10,30));

/*���� 3.
 emp_work ���̺��� 10�� �μ��� �ٹ��ϴ� ������� ������  emp���̺���
  �����ȣ�� 7369�� ��� ������ 7782�� ����� ������ ���� �ݾ����� �����ϼ���.*/
select deptno, ename, sal from emp_work where deptno=10;
select sal from emp where empno in (7369, 7782);--3250
select * from emp_work;

update	emp_work
set     sal=(select sum(sal) from emp where empno in (7369, 7782))
where   deptno=10;

/*����4.
 �����簡 '����'���� ���� ������ �𵨸�, ����, ����, �ɼ�, �Է����� ��ȸ�ϼ���.
   ��, ������ ������������ ���� ���� �� 2~5��° ���ڵ常 ��� �մϴ�.
*/
select * from car_country;
select * from car_model;
select * from car_maker;

select	model, car_year, price, car_option, hiredate, h_num
from		(select	model, car_year, price, car_option, hiredate,
								row_number()over(order by price desc) h_num
				from		car_model
				where		model in (select model from car_maker where maker='����'))
where		h_num between 2 and 5;












