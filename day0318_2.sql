-- ������̺��� 10�� �μ��� �ٹ��ϴ� ������� �����ȣ, �����, �Ŵ�����ȣ,
-- ����, �μ���ȣ�� ��ȸ�ϼ���.

select    empno, ename, mgr, sal, deptno
from			emp
where			deptno=10;


--������̺��� 10�� �μ���������� �����ϰ� �������� �����ȣ, �����, �Ŵ�����ȣ,
--�Ի���, �μ���ȣ ��ȸ
select		empno, ename, mgr, hiredate, deptno
from			emp
where			deptno <>10;
--where     deptno !=10;


-- ������̺��� ������ 1600�̻��� ������� �����ȣ, ����, �����, ����,
-- �Ի����� ��ȸ
select			EMPNO, SAL, ENAME, JOB, HIREDATE
from        EMP
where       sal>=1600;
--where			sal>1599;

/*�̻�, �ʰ� �����ϱ�!!!!!!!!!!!!!!!!!!!!*/

-- ������̺��� ������ 1600 �ʰ��� ������� �����ȣ, ����, �����, ����,
-- �Ի����� ��ȸ
select			EMPNO, SAL, ENAME, JOB, HIREDATE
from        EMP
where       sal>1600;


-- ������̺��� ������ 1600�̻� 3000������ ����� �����, �����ȣ, ����, ���� ��ȸ�ϱ�
select			ENAME, EMPNO, SAL, JOB
from 				emp
where				sal between 1600 and 3000;
--where       sal >=1600 and sal <=3000;


-- ������̺��� 7902, 7698, 7566 �Ŵ����� �����ϴ� ����� �����ȣ, �����,
-- �Ŵ�����ȣ, �Ի���, ���� ��ȸ
select		EMPNO, ENAME, MGR, HIREDATE, JOB --�� �����Ÿ� ���� : ctrl + F7
from      emp
--where     mgr =7902 or mgr = 7698 or mgr = 7566; -- || java�� �����ϸ� �ȵ�
where			mgr in(7902,7698,7566);


-- ������̺��� ���ʽ��� �޴� ������� �����ȣ, ����, ���ʽ�, �����, ������ ��ȸ�ϱ�
-- null�� ���迬���ڷ� ���� �� ����. !=, <>�� �� ������
-- is null, is not null
select	EMPNO, SAL, COMM, ENAME, JOB
from    emp
where		comm is not null;
--where   COMM != null;

-- ������̺��� ������� 'Allen'�� ����� �����ȣ, �����, �Ի���, ����, �μ���ȣ�� ��ȸ�ϱ�
select  EMPNO, ENAME, HIREDATE, JOB, DEPTNO
from		emp
where		ename like 'ALLEN';
--where   ENAME='ALLEN';


-- ������̺��� ������� 'A'�� �����ϴ� ������� �����, ����, ����, �Ի����� ��ȸ�ϼ���.
select		ENAME, SAL, JOB, HIREDATE
from      emp
where     ename like 'A%';


-- ������̺��� ������� 'S'�� ������ ������� �����, ����, �����ȣ, �Ŵ�����ȣ, �Ի����� ��ȸ�ϼ���.
select		ENAME, SAL, EMPNO, MGR, HIREDATE
from      emp
where     ename like '%ES';--' ' : ��ҹ��� ����!


-- ������̺��� ������� 'A'�� ���ִ� ������� �����, ����, �����ȣ, �Ի����� ��ȸ.
select    ENAME, SAL, EMPNO, HIREDATE
from 			emp
where     ename like '%A%';


-- ������̺��� ������� 'L'�� �ΰ� �ִ� ������� �����, �Ŵ�����ȣ, ������ ��ȸ. 
select  ename, mgr, job
from		emp
where		ename like '%L%L%';



select * from emp
