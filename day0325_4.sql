-- union : ���δٸ� ���̺� �����Ʒ��� �����Ͽ� ��ȸ.
-- emp : �ѱ� ���� �������, cp_emp1 : �̱� ���� �������.
-- ����� ���� ��������� ��ȸ.
-- ��ȸ Į���� �����ȣ, �����,���� ����
select  empno, ename, job, sal
from		emp

union

select	empno, ename, job, sal
from		cp_emp1;

-- union : �ߺ������͸� ��ȸ���� �ʴ´�.

-- union all : �ߺ������͸� ��ȸ�Ѵ�.
select  empno, ename, job, sal
from		emp

union all

select	empno, ename, job, sal
from		cp_emp1;


-- <   Error.   >
--  (1) �÷��� ���������� ��ġ���� �ʴ� ���.
select  empno, ename, sal, job
from		emp

union all

select	empno, ename, job, sal
from		cp_emp1;

-- (2) �÷��� ������ ��ġ���� �ʴ� ���.
select  empno, ename, sal, job
from		emp

union all

select	empno, ename, job
from		cp_emp1;


-- ���� ��ȸ.
select  empno, ename, job, sal
from		emp
where		deptno=10

union all

select	empno, ename, job, sal
from		cp_emp1
order by empno;/*������ ���������� ����. �ƴϸ� subquery�� �ִ���.*/



















