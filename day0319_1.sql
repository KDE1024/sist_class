select		'��Ƽ��' name, 20 age
from		  dual;

-------------------------------��ġ�Լ�-------------------------------
select		abs(-3), abs(3)
from      dual;

--�ݿø�. round( ��, �ݿø� ���� �� �� �ڸ���)
--555.555,2 ->������ �ڸ��� �ݿø� �ؼ� �ι��� �ڸ��� ���ž�
--�Ű������� ���� ������ �Ҽ��� ���� ó�� �ڸ����� �ݿø� �Ѵ�.
-- �����ο����� �ش� �ڸ����� �ݿø��ȴ�.
select		round(555.555,2), round(555.554,2), round(555.555), round(555.555,-1)
from      dual;

--�ø�. ceil(��)
select    ceil(10.1), ceil(10.0)
from			dual;

--����. floor(��)
select		floor(10.9), floor(10.0)
from			dual;

--����. trunc(��, ������ �ڸ���)
select		trunc(555.555,2), trunc(555.555,1), trunc(555.555,-1)
from      dual;

--11,111 -�ʴ��� ����. 11,100
--������̺��� �����ȣ, �����, ����, ������ ��ȸ�ϼ���.
--��, ������ ������ 3.3% �� ����Ͽ� ������ �����Ͽ� ��ȸ�Ѵ�.
select    EMPNO, ENAME, SAL, trunc(SAL*0.033, -1) as tax
from			EMP;


------------------------------null ��ȯ-------------------------------
select		nvl('','��'), nvl(null,'��ȯ��')
from			dual;

-- ������̺��� �����ȣ, �����, ���� ���ʽ��� ��ȸ�ϼ���
-- ��, ���ʽ��� �������� �ʴ� �����  100���� ����ϼ���.
select    EMPNO, ENAME, SAL, nvl(COMM,100) as comm
from			emp;

-- ������̺��� �����ȣ, �����, ����, ���ʽ�, �� ���ɾ��� ��ȸ�ϼ���
-- �Ѽ��ɾ��� ������ ���ʽ��� �ջ��� �ݾ�.
select		empno, ename, sal, comm, sal+nvl(comm,0) as total
from      emp;

--null�� �ƴ� �� ������ ���� null�� �� ������ ���� ����.
select    nvl2('','null�� �ƴҶ�','null �� ��') ,nvl2('a','null�� �ƴҶ�','null �� ��')
from			dual;

-- ��� ���̺��� �����ȣ, �����, �Ŵ������θ� ���.
select  empno, ename, nvl2(mgr,0,1)--�����ϸ� 0, �������� ������ 1
from		emp;

------------------------------------insert �÷��� null�� �ԷµǴ� ��Ȳ---------------------------------
--number�� date�� �÷��� ������ ��쿡 null �Է�.
alter table test1 add input_date date;

insert into test1 (name) values ('�׽�Ʈ');

select	*	from test1;
commit;


-- varchar2�� char�� �÷��� ������ ���� ''�� �ԷµǴ� ��쿡 null�� �Էµȴ�.
-- �÷��� ������ ���
insert into test1(age, input_date) values(20,sysdate);
-- ''�Էµ� ���
insert into test1(name,age, input_date) values('',20,sysdate);

select * from test1;
commit;

-- test1 table���� �̸�, ���̸� ��ȸ
-- ��, �̸��� null�� ��쿡�� '����'����, ���̰� null�ΰ�� 0���� ���.
select    nvl(name,'����') as name, nvl(age,0) as age
from			test1;

