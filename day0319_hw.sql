-- 1. ������̺��� �����ȣ, �����,����, �Ŵ�����ȣ,����,�Ի����� ��ȸ�ϼ���.
--��, �Ի����� ��-��-���� �������� ����ϼ���.������ 3�ڸ����� ,�� �־� ����ϼ���.
select 	empno, job, mgr, to_char(sal, '9,999'), to_char(hiredate, 'mm"��" dd"��" yy"��"') hiredate
from		emp;


--2. ������̺��� 3,4�б⿡ �Ի��� �������  �����ȣ,�����,����,����, �Ի����� ��ȸ�ϼ���.
select  EMPNO, ENAME, JOB, HIREDATE
from		emp
where		to_char(hiredate, 'q')= 3 or to_char(hiredate, 'q') = 4;

--3. ������̺��� �μ���ȣ, �����ȣ, ����, ���ʽ�, �Ѽ��ɾ�,�Ի����� ��ȸ�ϼ���.
--��. �Ѽ��ɾ��� '����+����+���ʽ�'�� �ջ��� �ݾ����� ��ȸ�ϼ���.
--������ ������ 12�� ���� ���� ������ �����Ͽ� ����ϼ���.
select  DEPTNO, EMPNO, SAL, COMM, sal + (sal/12)+ comm as total, HIREDATE
from		emp;


