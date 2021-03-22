-- distinct�� ����� �ߺ�����
-- ��� ���̺��� �μ� ��ȣ�� ��ȸ.
-- ��, ���� �μ���ȣ�� ��ȸ���� �ʴ´�.
-- �������� ��ȸ�Ǵ� �÷��� ���� ���Ǵ��� ������ �߻����� �ʴ´�.
select  distinct deptno, empno
from		emp;


-- group by�� ����� �ߺ�����
-- �������� ��ȸ�Ǵ� �÷��� ���� ���Ǹ� ������ �߻��Ѵ�.
select  		deptno
from      	emp
group by		deptno;

-- ������̺��� ������� 3���� �ʰ��ϴ� �μ��� �μ���ȣ, ������� ��ȸ.
select			deptno, count(deptno)
from				emp
group by    deptno
having      count(deptno)>3; --�����Լ� �� �� ����


--group by �� �����Լ��� ���� �׷캰 ���踦 ���� �� �ִ�.
-- ������̺��� �μ���/*���𰡸� ���ľ� �ȴٴ� �� -> group by*/ �ο���, �ְ���, ��������, ��տ����� ��ȸ.
select    	deptno, count(deptno), max(sal), min(sal), trunc(avg(sal),0)
from				emp
group by		deptno
order by		deptno;

-- ������̺��� �Ŵ����� �����ϴ»���� 2�� �̻��� �Ŵ�����, ������� ��, ��տ���, �ְ���, �������� ��ȸ.
-- �Ŵ�����ȣ�� ������������ �����Ͽ� ��ȸ.
select    mgr, count(empno),avg(sal), max(sal), min(sal)
from			emp
group by	mgr
having		count(empno)>3
order by	mgr desc;



-- �׷캰 ���� ���.
-- ������̺��� �μ��� �����հ� ������ ��ȸ.
-- rollup :  �׷캰 �հ踦 ����ϰ�, ������ ���߿� ����Ѵ�.
select      deptno, sum(sal)
from       	emp
group by		rollup (deptno);


-- cube : ������ ���� ����ϰ�, �׷캰 �հ踦 ����Ѵ�.
select      deptno, sum(sal)
from       	emp
group by		cube (deptno);


-- �Ұ�, ���հ踦 ��ȸ�� ��
-- ������̺��� �μ��� ������ ��, �Ұ�� ������ ��ȸ
select    deptno,job, sum(sal)
from    	emp
group by  cube(deptno, job);


--
select    deptno,job, sum(sal)
from    	emp
group by  rollup(deptno, job);


-- ������̺��� �Ŵ����� �μ��� �����հ� �Ұ�, ������ cube�� rollup�� ����Ͽ� ��ȸ.  /////
select    mgr, sal, sum(sal)
from    	emp
group by  cube(mgr,sal);

--
select    mgr, sal, sum(sal)
from    	emp
group by  rollup(mgr,sal);

