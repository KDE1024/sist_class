-- outer join(���� ���̺��� ���ڵ尡 �����ϴ��� ��ȸ����.)
-- �����ϴ�  ��� �μ��� �μ���ȣ, �μ���, ��ġ, �����ȣ, ������� ��ȸ.

-- ANSI
select            d.deptno, d.dname, d.loc, e.empno, e.ename
from							dept d
left outer join 	emp e
on                e.deptno=d.deptno;

-- Oracle outer join
-- (+) ���ڵ尡 ���� �÷��� ���δ�.
select	d.deptno, d.dname, d.loc, e.empno, e.ename
from    dept d, emp e
where   (e.deptno(+)=d.deptno); -- emp table�� deptno�� �����ϱ� emp�� (+) �ٿ���.-> 40�� �μ� ����.


-- ���ڵ尡 �������� �ʴ� ���̺��� �����ϸ� ��ȸ����� ������ �ʴ´�.
select      d.deptno, d.dname, d.loc, e.empno, e.ename
from				dept d
right join	emp e
on          e.deptno=d.deptno;/*40�� �μ� �ȳ���*/

--
select      d.deptno, d.dname, d.loc, e.empno, e.ename
from				emp e
right join	dept d
on					e.deptno=d.deptno;/*join�ڿ� ������ ���̺� ���ڵ尡 �����ϱ� 40���μ� ����.*/

-- Oracle outer join
-- ���ڵ尡 �����ϴ� �÷��� (+) �ҿ�x.
select	d.deptno, d.dname, d.loc, e.empno, e.ename
from    dept d, emp e
where   (e.deptno=d.deptno(+));

-- ���ڵ��� ������ �� ������ ��� ���ڵ带 ��ȸ�ؾ��Ѵٸ�, full outer join�� ����Ѵ�.
select      d.deptno, d.dname, d.loc, e.empno, e.ename
from				dept d
full join		emp e
on          e.deptno=d.deptno;/*���ڵ尡 ������ ����. -> ȿ�� ������ -> �׷��� ����Ŭ���� �Ⱦ�*/
s
-- Oracle outer join
-- (+) ��ȣ�� ���ʿ� ���� �� ����.
select	d.deptno, d.dname, d.loc, e.empno, e.ename
from    dept d, emp e
where   (e.deptno(+)=d.deptno(+));


-- ��� �μ��� �ٹ��ϴ� ������� �μ���ȣ, �μ���, ��ġ, �����ȣ, �����,
-- �����ȣ,�õ�, ����, ������ ��ȸ
-- ��, �μ��� �ٹ��ϴ� ����� �������� ������ �����ȣ�� '0'���� �����'����'�� ��� ��ȸ�Ѵ�.

--  ANIS : ���ڵ尡 �ִ� ��
select    d.deptno, d.dname, d.loc, nvl(e.empno, 0)empno, nvl(e.ename,'����') ename,
					z.zipcode, z.sido, z.gugun, z.dong, z.bunji
from      dept d
left join emp e
on        e.deptno=d.deptno
left join zipcode z
on        z.seq=e.empno;


-- Oracle : ���ڵ尡 ���� ��
select    d.deptno, d.dname, d.loc, nvl(e.empno, 0)empno, nvl(e.ename,'����') ename,
					z.zipcode, z.sido, z.gugun, z.dong, z.bunji
from      dept d, emp e, zipcode z
where			(e.deptno(+)=d.deptno and z.seq(+)=e.empno);



-----------------------------------------------------------------
-- ������̺��� ������� 'WARD' �� ������� ������ ���� �����ϴ� �����
-- �����ȣ, �����, ����, ����, �Ի��� ��ȸ.
select * from emp;

select  empno, sal, job, hiredate
from    emp
where		sal>(select sal from emp where ename='WARD');


-- self join : ��ȸ�� ���̺�� ���ǿ� ���̺��� �� �����Ͽ� ����� ��.
select e1.empno, e1.ename, e1.sal, e1.job, e1.hiredate,
			 e2.ename,/*���ǿ��� ��ȸ������->�ʿ����*/
			 e2.empno -- ���ǿ��� ��ȸ������ �ø��� �ʿ� ���� �͸� ����.
from   emp e1, emp e2
where  (e1.sal > e2.sal)and e2.ename='WARD';
			/*��ȸ�� ������ ���ǿ� �������� ������*/

-- ���������� �߸� �����ϸ� ��� ���ڵ��� ���� ��ȸ�Ǿ� ������ Cartesion product�� �߻��� �� �ִ�.
select  e.empno, e.ename, d.deptno, d.dname
from		dept d, emp e;
