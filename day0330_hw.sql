/*
���� 3.
 ������̺��� �ټӳ���� 35�� �̻��� ��� ���� �����ȣ,�����, �Ի���, �ټӳ��, ������ ��ȸ�ϼ���.
 ��, �Ի����� ������������ �����Ͽ� ����ϰ�, �Ի����� ����-��-�� ���ϡ� �� �������� ����ϼ���*/
select  	empno, ename, to_char(hiredate,'mm-dd-yy day')hiredate,
					trunc(trunc(months_between (sysdate,hiredate),0)/12,0) continuous_years, sal
from			emp
where			trunc(months_between (sysdate,hiredate),0)/12 > 35
order by	hiredate desc;

--select last_analyzed, index_name, table_name from user_indexes;
--
--alter index pk_maker rebuild;
