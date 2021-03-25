/*1. CP_EMP2���̺� �Ʒ��� ������ ���ڵ带 �߰��ϼ���.
   �����ȣ,�����,����,����,�Ŵ�����ȣ,�Ի���.
   1111,���μ�,���,2800,7902,�߰������� ����
   1112,�����,���,2800,7902,�߰������� ����
   1113,�ڱ��,�븮,3200,7893,�߰������� ���� */
select * from CP_EMP2;

insert into cp_emp2 (empno, ename, job, sal, mgr, hiredate)
values (1111,'���μ�','���',2800,7902,sysdate);

insert into cp_emp2 (empno, ename, job, sal, mgr, hiredate)
values (1112,'�����','���',2800,7902,sysdate);

insert into cp_emp2 (empno, ename, job, sal, mgr, hiredate)
values (1113,'�ڱ��','�븮',3200,7893,sysdate);

/*2. EMP���̺��� ����, CP_ EMP2���̺��� ���� ��������� �����ϰ� �ֽ��ϴ�.
  ������ ��� ����� ������ ��� ����� ������� �������� �Ի��� �������
   ���������� 3~10��° ���ڵ带 ��ȸ�ϼ���.

	��ȸ�÷��� �����ȣ �����,����,����,�Ի����� ��ȸ�մϴ�.
  ��, �Ի����� ��-��-�� �б��� �������� ����ϰ�, ������ 9�ڸ��� ���ߵ� 3�ڸ�����,�� �־� ����մϴ�.
*/
select  e_num, EMPNO, ENAME, JOB, SAL, HIREDATE
from (select   EMPNO, ENAME, JOB, SAL, HIREDATE,
							 row_number() over(order by hiredate desc)as e_num
			from 	(select	EMPNO, ENAME, JOB, SAL, HIREDATE
							from		(select	 EMPNO, ENAME, JOB, to_char(SAL,'9,999')SAL, to_char(HIREDATE,'yyyy-mm-dd')HIREDATE
											 from		EMP )

					    union all

							select	EMPNO, ENAME, JOB, SAL, HIREDATE
							from	 	(select	EMPNO, ENAME, JOB, to_char(SAL,'9,999')SAL, to_char(HIREDATE,'yyyy-mm-dd')HIREDATE
											 from		CP_EMP2 )))

where	e_num between 3 and 10



/*   rownum �ȵ�~~~~~~~~~~~~~~~~~~~~~~~
select  e_num, EMPNO, ENAME, JOB, SAL, HIREDATE
from (select  rownum e_num, EMPNO, ENAME, JOB, SAL, HIREDATE
			from 	(select	EMPNO, ENAME, JOB, SAL, HIREDATE
							from		(select	 EMPNO, ENAME, JOB, to_char(SAL,'9,999')SAL, to_char(HIREDATE,'yyyy-mm-dd')HIREDATE
											 from		EMP )

					    union all

							select	EMPNO, ENAME, JOB, SAL, HIREDATE
							from	 	(select	EMPNO, ENAME, JOB, to_char(SAL,'9,999')SAL, to_char(HIREDATE,'yyyy-mm-dd')HIREDATE
											 from		CP_EMP2 )))

where	e_num between 3 and 10
order by hiredate desc;*/


