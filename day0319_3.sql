--------------------------- ��ȯ �Լ� -----------------------------
-- ���� ��ȯ
-- 0 : �����Ͱ� ������ 0�� ä�� �����ش�.
-- 9 : �����Ͱ� �ִ� �͸� �����ش�.
select    to_char(2021, '0,000,000'), to_char(2021.0319, '00,000,000.00'), --�Ҽ��� �ڸ�.
					to_char(2021, '9,999,999'), to_char(2021.0319, '99,999,999.99'),
					to_char(202103, '9,999')
from			dual;

select		to_char(13*721231123,'9,999,999,999,999,9990')
from			dual;

-- ��¥ ��ȯ\-- ������ ��¥�����̰ų� Ư�����ڰ� �ƴ� ���ڸ� ����� �� ����.Error
-- ��¥������ �ƴϰų� Ư�����ڰ� �ƴ� ��쿡�� "�� ����Ͽ� �ش� ���ڸ� ǥ���Ѵ�.
select		to_char(sysdate, 'yyyy-mm-dd d dy"����" day am hh12, hh, hh24:mi:ss q')
from      dual;

-- ��¥ ������ ��� Error
select		to_char(sysdate, ' yyy"��" mm "��" dd"��" q"�б�" hh24 "��"mi "��" ss"��"  ')
from			dual;

-- ������̺��� �����ȣ, �����, �Ի��� ��ȸ
-- ��, �Ի����� '��-��-�� �б�'�� ��������  ��ȸ�� ��.
select  empno, ename, to_char(hiredate, 'mm-dd-yyyy q"�б�"') as hiredate
from		emp;

-- ������̺��� 1981�⿡ �Ի��� ������� �����ȣ, �����, ����, �Ի���, ����
select  EMPNO, ENAME, SAL, HIREDATE, JOB
from		emp
where		to_char(hiredate, 'yyyy') = 1981;
--where		to_char(hiredate, 'q') = 2; //�б� �񱳵� ����.

-- ���� ��ȯ
-- =22 �� ��������. java���� 319�� ���
-- ���ڿ��� ���������̶�� to_number�� ������� �ʾƵ� ����ȯ�� �ȴ�.
select  '3' + '19' , to_number('3')+ to_number('19'), to_number('19')
from		dual;

-- ��¥������ ���ڿ��� Date������ ��ȯ
select		'2021-03-19', to_date('2021-03-19', 'yyyy-mm-dd')
from			dual;

-- Date���� �÷��� �� �߰�.
-- ���� ��¥
insert into test1(input_date) values (sysdate);

-- �ٸ� ��¥ : ��¥ ������ ���ڿ� ���. �ð� ������ ��� 00�� 00�� 00�ʷ� �߰�.
insert into test1(input_date) values ('2021.03-20');

-- �ٸ� ��¥ : to_date �Լ� ���.
insert into test1(input_date) values (to_date('2021-03-21','yyyy-mm-dd'));

select to_char (input_date, 'yyyy-mm-dd am hh24:mi:ss') from test1;

-- to_date�� error�� �߻��ϴ� ��� : to_char�Լ� ���.
select  /*to_char('2021-03-19','mm-dd-yy')*/
/*to_char�� ù��° �Ű������³�¥ �̰ų� ���� �ε� ���ڿ� ���� ����*/
				to_char(to_date('2021-03-19','yyyy-mm-dd'),'mm-dd-yy')
from		dual;

-------------------------------�����Լ�----------------------------------------
select		decode('c','a','����','b','��','c','��','��Ʈ')
from			dual;

-- ������̺��� �����ȣ, �Ŵ�����ȣ, �μ���ȣ, �μ��� ��ȸ.
-- ��, �μ����� �μ���ȣ������ �Ʒ��Ͱ��� �����Ͽ� ��ȸ�� ��.
-- 	10-SI����, 20-SM ��������, 30-SE�����Ͼ� �� �� ��� �������� ����
select    empno, mgr, deptno, decode(deptno,10,'si����',20,'��������',30, 'se�����Ͼ�','����') deptname
from			emp;

-- ������̺��� �����ȣ, �����, �μ���ȣ, ����, �μ��� ���ʽ��� ��ȸ
-- ��, �μ��� ���ʽ��� �Ʒ��� ���� �����Ѵ�.
-- 10�� �μ��� ������ 20%�� å��, 20�� �μ��� ���� 25%�� å��.
-- 30�� �μ��� ����+���ʽ��� �ջ��� �ݾ��� 15%�� å��
-- �� �ܴ� ������ 100%�� å���Ѵ�.

select    empno, ename, deptno, sal,
			decode(deptno, 10, '20%', 20, '25%', 30, '15%') ,
			decode(deptno, 10,sal*0.2, 20, sal*0.25, 30, (sal+nvl(comm,0))*0.15) as bonus
from			emp;
