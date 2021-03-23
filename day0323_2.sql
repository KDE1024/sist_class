--------------------------- select subquery----------------------------
-- �ܼ���.
-- emp ���̺��� �����ȣ�� '7369'�� ����� �ٹ��ϴ� �μ���ȣ����ȸ�Ͽ�
-- cp_emp1 ���̺� ���� �μ������ ������ ��� ��ȸ.
select * from emp;
select * from cp_emp1;

select		empno, ename, deptno, job, sal
from			cp_emp1
where 		deptno = (select deptno from emp where empno = 7369);

-- �𵨸��� '�׷���'�� ������ ����������ȸ.

select  country
from		car_country
where		maker =(select maker from car_maker where model='�׷���');

-- �����簡 '����'�� ������ �𵨸�, ����, ����, �ɼ��� ��ȸ.
select	model, car_year, price, car_option
from	  car_model
where model in (select model from car_maker where maker='����');


-------------------- scalar subquery----------------------
-- ��ȸ�� ���� ����Ͽ� �ٸ� ���̺��� �÷����� ��ȸ�Ͽ� ������ ��.
-- �����ȣ, �����, �μ���ȣ, �μ��� ��ȸ.
select  empno, ename, deptno,
				(select dname from dept where dept.deptno=emp.deptno/*�����̸��� 2���� ���̺� ����*/) dname
from 		emp;


-- car_model, car_maker ���.
-- 2012��� ������ �𵨸�, ���, ����, �ɼ�, �Է���, �̹���, �����縦 ��ȸ�ϱ�.
select * from CAR_MAKER;
select * from CAR_MODEL;

select  MODEL, CAR_YEAR, PRICE, CAR_OPTION, CAR_IMG,
				(select maker from car_maker where car_maker.model=car_model.model)maker
from    car_model
where		car_year='2012';


-- select ������subquery (�˻��� ����� ������ ����ȸ: inline view�� ����� ��ȸ)
-- alias �� ���� �÷���ó�� ���.
select    empno, ename, job, sal, hi       -- inline view�� �����ϴ� �÷��� ���ڵ带 �˻�.
from			(select empno, ename, sal, job, hiredate as hi from emp)
where			to_char(hi,'yyyy')='1980';


------------------------------------ rownum------------------------------------
-- ������̺��� �Ի�⵵��  '1981'���� ������� ������ȣ, �����ȣ,�����, �Ի����� ��ȸ.
-- ��ȸ����� �����ȣ�� ���.
select * from emp;

select		rownum, empno, ename, hiredate
from			emp
where			to_char(hiredate, 'yyyy') = '1981';

-- rownum�� order by ���� ���� �����ǹǷ� �����ϰԵǸ� ��ȣ�� ���δ�.
-- ��� ���̺��� ������ȣ, �����ȣ, �����, ������ ���ϼ���.
-- ��, ������� ������������ �����Ͽ� ��ȸ.
select		rownum, empno, ename, job
from      emp
order by	ename;

-- 1�����ʹ� �˻��� ������ �� ������ ��ȣ�� �˻����� �ʴ´�.
-- ������̺��� ��ȣ, �����ȣ, ������� ��ȸ.
-- ��, ��ȣ�� 2~5�� ������ ���ڵ常 ���.
select  rownum, empno,ename
from  	emp
--where		rownum between 2 and 5;
where   rownum >=2 and rownum <6;


-- select ���� ���� �̸����� ���� ���ȴ�.
select  rownum, rnum, ename, empno
from		(select rownum rnum, ename, empno from emp order by ename);


-- ������̺��� ���� �������� �Ի��� ���� ������� 5���� ��������� ��ȸ. -- 2������ ��ȸ ����ϴ� �Ϲ�,
-- (2~6������ ��ȸ)
-- ���� �������� �Ի��� ������� 1���� �ο��Ѵ�.
select hiredate from emp order by hiredate desc;

-------------------------------------------------------------
select rnum, empno, ename, job, hiredate
from	(select	rownum rnum, EMPNO, ENAME, JOB, HIREDATE-- rownum�� 1�����͸� ��ȸ�ǹǷ� rownum�� ���� �÷�ó���ν� ��Ű���.
			from (select 		EMPNO, ENAME, JOB, HIREDATE
						from			EMP
						order by 	hiredate desc))
where	rnum between 2 and 6;
-------------------------------------------------------------
select empno, ename, job, hiredate, rnum
from		(select	empno, ename, job, hiredate,
							row_number()over(order by hiredate desc) rnum
					from		emp)
where		rnum between 2 and 6;
--------------------------------------------------------------


-- ���� ��ȣ ���̺��� '�õ�'�� ������ ���ڵ带 dong�� ������������ �������� ��
-- 150~200�� ������ ���ڵ带 ���.
-- ��, ������ null �̸� '��������' ���� ��ȸ
-- ��ȸ�÷� : �����ȣ, �õ�, ����, ��, ���� ��ȸ
select*from zipcode;

-- ���� �Ѱ� //zipcode ������
select	rnum, SIDO, GUGUN, DONG, BUNJI
from		(select 	SIDO, GUGUN, DONG, BUNJI,
									row_number()over(order by	dong desc) rnum
				from 		  zipcode
				where			sido =  '����')
where		rnum between 150 and 200;

-- �������� ���ֽŰ�
select	zipcode, sido, gugun, dong, nvl(bunji,'��������') -- -> ���⼭�ϸ� 50�� /*, flag_num */
from	 (select	zipcode, sido, gugun, dong, bunji/*-> ���⼭nvl�ϸ� 8õ�� */,
								row_number()over(order by	dong desc) flag_num
				from	zipcode
				where sido='����')
where		flag_num between 150 and 200;

select *
from	user_tab_cols;  