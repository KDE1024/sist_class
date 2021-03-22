/*����1.
emp���̺��� ����Ͽ� �Ʒ��� ���� ��ȸ �ϼ���.
  xxx�� Xxxx����� �Ի����� yyyy-mm-dd ���� �� �Դϴ�. ������ xxx $�Դϴ�.
 ��. �Ի������ ��,ȭ,�� �Ի��� ����� ���ؼ��� ��ȸ�մϴ�.
     ������� ù���ڸ� �빮�ڷ� ��ȸ�ϰ�, �Ի����� �������� �����Ͽ� ����ϵ�
     �Ի����� ���ٸ� ������ ������������ �����Ͽ� ����ϼ���.
      ������ 3�ڸ����� ,�� �־����ϼ���.*/

select * from emp;   --�� :2,ȭ:3, ��:5

select  	empno, initcap(ename)as ename, to_char(hiredate,'yyyy-mm-dd')as hiredate, to_char(sal,'9,999')as sal
from			emp
where			to_char(hiredate, 'd')=2 or to_char(hiredate,'d')=3 or to_char(hiredate,'d')=5
order by  hiredate, sal desc;


--2. dept���̺��� '��'�� ���� ������ �ִ� �μ��� �μ���ȣ, �μ�������ȸ�ϼ���.
select * from dept;

select		DEPTNO, DNAME
from			dept
where			LOC = 'DALLAS';


/*3. ��� ���̺��� ������ , �����, ������, ������ ��ȸ�ϼ���.
  (������ ���������� ��ȸ�Ǿ���մϴ�.) */

select    JOB, count(empno),sum(sal)
from			emp
group by	rollup(JOB);

/*4.  ������̺��� 3,4�б⿡ �Ի��� �������  �μ��� ������,
    �������, �ְ���, ��������, ������� ��ȸ�Ͽ� �μ��� ������������ �����Ͽ�
    �Ʒ��� ���� ����ϼ���.
    ��¿� )  xx���μ� ������� [x]��, ������� : [xx],
	   �ְ��� [xx], ��������[xx]*/

select   		deptno ||'�� �λ��� ������� ['||count(empno)||'] ��, '||
						'������� : ['|| trunc(avg(sal),0) ||'] �ְ���: ['|| max(sal)||
						'], �������� : ['|| min(sal)||']'as total
from		    emp
where				to_char(hiredate, 'q') in(3,4)
group by	 	deptno
order by		deptno;








