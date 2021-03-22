select * from EMP;

-- ������̺��� �����ȣ, �����, �μ���ȣ, �μ��� ��ȸ
-- ��, �μ����� �Ʒ�ǥ�� ���� �ѱ۷� �� �μ����� ���.

select  EMPNO, ENAME, DEPTNO, decode (deptno, 10,'���ߺ�', 20,'����������', 30, '�','�౸��') h_dname
from		emp;

select  EMPNO, ENAME, DEPTNO,
				case deptno when 10 then '���ߺ�'
										when 20 then '����������'
										when 30 then '�'
				else '�౸��'
				end as H_Dname
from		emp;


-- ������̺��� �����ȣ, �����, ����, �Ѽ��ɾ�, ������ ���ʽ��� ��ȸ
-- ��, ������ ���ʽ��� �Ʒ��� ����.
-- CLERK- ���� 10%�� ���ʽ�, SALESMAN -����+comm �ջ�ݾ� 20%
-- MANAGER - ���� 15% ���ʽ�, ANALYST - ���� 30%, PRESIDENT -���� 150%

select  empno, ename, sal, sal+nvl(comm,0) as total_sal, job,
        case job when 'CLERK' then sal*0.1
        				 when 'SALESMAN' then (sal+comm)*0.2
        				 when 'MANAGER' then sal*0.15
        				 when 'ANALYST' then sal*0.3
--       				 when 'PRESIDENT' then sal*1.5
					 			 else sal*1.5
				end as bonus
from		emp;

--------------------------------order by------------------------------------------
-- ������̺��� �����ȣ, �����, ����, �Ի����� ��ȸ
-- ��, ���� �������� �Ի��� ������� ��ȸ�� ��.
select  empno, ename, sal, hiredate
from		emp
order by hiredate desc;

-- ������̺��� �����ȣ, �����, ����, �Ի���, �μ���ȣ ��ȸ
-- ��, �μ���ȣ�� ������������ �����ϵ�, �μ���ȣ�� ���ٸ� ������ ������������ ����,
-- ������ ���ٸ� ������� ������������ ����
select		empno, ename, sal, hiredate, deptno
from			emp
order by	deptno, sal, ename;

-- ������̺��� �����ȣ, �����, ����, ����, �μ���ȣ,
-- ��, ������ ������������ �����ϵ�, ������ ���ٸ� ������ ������������ �����ϰ�,
-- ������ ���ٸ� �Ի����� ������������ ����.
select  	empno, ename, sal, job, deptno, hiredate
from			emp
order by  job desc, sal, hiredate desc;


--------------------------------�����Լ�----------------------------------------
-- ������̺��� �����ȣ, �����, ����, ������ ���� ��ȸ
-- ���� ������ �߻�. ���� ���� ���Ŀ��� ������ �ǳ� �ڴ�.

select    EMPNO, ENAME, SAL, rank() over(order by sal) as rank
from			emp;

select    EMPNO, ENAME, SAL, row_number() over(order by sal desc) as rank
from			emp;


---- �з��� ���� ����. partotion by ���.
---- �����ȣ, �����, �μ���ȣ, ����, ������ ��ȸ.
---- ������̺��� �μ����� ���� �������� ������ ��ȸ. (�ߺ������� �߻����� �ʴ´�.)
select    EMPNO, ENAME, DEPTNO, SAL, row_number() over (partition by deptno order by sal) rank
from			emp;


-- ������̺��� �����ȣ, �����, �μ���ȣ, �Ŵ�����ȣ, ������ ��ȸ
-- ��, �Ŵ������� ���� �������� ������ ��ȸ�ϼ���.(�ߺ������� �߻����� �ʴ´�.)
select  EMPNO, ENAME, DEPTNO, SAL, row_number()over(partition by mgr order by sal) rank
from		emp;


-------------------------------------�����Լ�(�׷��Լ�)--------------------------------------------
--�÷����� ��� �ϳ��� ����� �Լ�.
--������̺��� ��ü ����� ��ȸ
select  count(empno) /* ename �������� ��ȸ�Ǵ� �÷��� ���� ���Ǹ� ���� �߻�. */
from		emp;-- �� ������ ����

-- count�� null�� �÷��� ���ؼ��� ���迡 �������� �ʴ´�.
select  count(comm), count(mgr)
from		emp;

-- ������̺��� ��ü�����, ���ʽ��� �޴� �����, ���ʽ��� ���� �ʴ� ������� ��ȸ.
select  count(empno), count(comm), count(empno)-count(comm)
from		emp;

-- ������̺��� �ϳ⿡ �������� ����Ǵ� �Ѿ�, ���ʽ��� ����Ǵ� �Ѿ�, ��ü�Ѿ��� ��ȸ.
-- sum()�� ���� �÷��� ���� �� �ִ�.
select	sum(sal),sum(comm), sum(sal)+sum(comm)
from		emp;

-- avg()�� �����÷��� ���� �� �ִ�.
-- ������̺��� �������, �Ǽ��� ������ �������, ���ʽ� ����� ��ȸ
select  avg(sal) , trunc(avg(sal),0), avg(comm)
from		emp;

-- max(), min() �����÷��� ������ �ִ�.
-- ������̺��� ������ �ְ�,
select  max(sal), min(sal)
from		emp;


------------------------
-- ������̺��� ��տ������� ���� �޴� �����
-- �����ȣ, �����, �Ի���, ������ ��ȸ.
select  empno, ename, hiredate, sal
from		emp
where		sal>avg(sal);
