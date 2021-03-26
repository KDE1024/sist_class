--------------------------join-------------------------------------
-- �μ��� ����� �����ϴ� ��쿡��
-- �����ȣ, �����, �Ի���, �μ���ȣ.
-- ANSI
-- ���� ���̺� �����ϴ� �÷��� �÷����� ����� �� ���̺��. �÷����� ����Ѵ�.
-- �÷��� � ���̺� �����ϴ� �� �˱� ��ƴ�.
select      empno, ename, hiredate, dept.deptno, dname,loc
from				dept
inner join  emp
on          emp.deptno=dept.deptno;

-- �÷��� � ���̺� �����ϴ��� �� �� �ֵ��� �÷��� �տ� ���̺���� ����Ͽ� ����Ѵ�,
-- ��ȸ �÷��� �ۼ��ϴ� �ڵ����� �þ��.
select      emp.empno, emp.ename, emp.hiredate, emp.deptno, dept.dname,dept.loc
from				dept
inner join  emp
on          emp.deptno=dept.deptno;

-- ���̺�� alias�� �ο��Ͽ� �÷��� ���� ���̺��� ����ϰ�, ª�� �ڵ�� ����� �� �ְԵȴ�.
-- ���̺�� alias�� �ο� : ���̺�� alias

-- ANSI
select      e.empno, e.ename, e.hiredate, e.deptno, d.dname,d.loc
from				dept d
inner join  emp  e
on          e.deptno=d.deptno;

-- Oracle
select  e.empno, e.ename, e.hiredate, e.deptno, d.dname,d.loc
from    dept d, emp e
where   e.deptno=d.deptno;


-- ������ 1000�̻� 3000������  �����ȣ, �����, �Ի���, �μ���ȣ, �μ���, ��ġ�� ��ȸ�ϼ���.

-- ANSI
select     e.empno, e.ename, e.sal, e.hiredate, d.deptno, d.dname, d.loc
from		   emp e
inner join dept d
on         e.deptno=d.deptno
where      e.sal between 1000 and 3000
order by	 sal;


-- Oracle
select 		e.empno, e.ename, e.sal, e.hiredate, d.deptno, d.dname, d.loc
from   		emp e, dept d
where  		(e.deptno=d.deptno /*��������*/) and e.sal between 1000 and 3000/*�˻����� */
order by	e.sal;


-- �������� �������� ��ⷮ�� 1600 �̻� 3000 ������ ��� ������ ������, �𵨸�, ����, ��ⷮ, ������ ��ȸ�ϼ���.

-- ANSI
select     cma.maker, cma.model, cmo.car_year, cmo.cc, cmo.price
from       car_maker cma
inner join car_model cmo
on         cmo.model=cma.model    --pk�� �ִ� maker�� driving key�� �ȴ�.
where			 cmo.cc between 1600 and 3000
order by	 cmo.cc;

-- Oracle
select    cma.maker, cma.model, cmo.car_year, cmo.cc, cmo.price
from      car_maker cma, car_model cmo
where     (cmo.model=cma.model) and  cmo.cc between 1600 and 3000
order by	cmo.cc;


--------------------------------- ���̺� 3���� �����ϱ�.--------------------------------------
-- �����ȣ, �����, ����, �μ���ȣ, �μ�, ��ġ, �����ȣ, �õ�, ����, ��.
-- ������̺��� �����ȣ�� �����ȣ���̺��� seq�� ������������ ���.
/*���ڵ尡 ��� emp table�� ���� �����̵Ǵ°� ����.*/

-- ANSI
select * from ZIPCODE;

select       e.empno, e.ename, e.sal, d.deptno, d.dname, d.loc, z.zipcode, z.sido,z.gugun, z.dong
from         dept d
inner join   emp e
on           e.deptno=d.deptno /*�˻��Ǵ� Ű�� �ڷο;ߵ�.*/
inner join   zipcode z
on           z.seq=e.empno;

-- Oracle
select		e.empno, e.ename, e.sal, d.deptno, d.dname, d.loc, z.zipcode, z.sido,z.gugun, z.dong
from      dept d, emp e, zipcode z
where     (e.deptno=d.deptno and z.seq=e.empno);  