-- �� �� �ּ�.
/*
������ �ּ�.
*/

select * from tab;


select * from test;

--���ڵ� ����.(insert�ϴ� ������� �Էµ��� �ʴ´�.)
--�÷����� �����Ͽ� �߰�.
--(�÷��� ������ �����Ͽ� �߰��Ѵ�. : ���� �ٸ� �÷��� �ԷµǴ� �Ϳ� ����)

insert into test values(1, '�ڱ��', 24,sysdate);
--2��, ���μ�, 26, ���糯¥
insert into test values(2, '���μ�',26, sysdate);

--�÷����� ����Ͽ� ���ڵ带 ����.(Ư�� �÷����� ���� �Է�, ������ �÷����� null�� �Էµȴ�.)
--3��, ������� �߰�
insert into test(num,name)values(3,'�����');

--27, ���糯¥
insert into test(age, input_date) values(27, sysdate);
--transaction �Ϸ�
commit;

-----------------------------select-----------------------------------

select name, age
from   test;


-- test ���̺��� ��� ���ڵ��� �Է��� �� ��ȸ
select input_date
from   test;



-- �μ����̺��� �μ���ȣ, �μ���, ��ġ ��ȸ
select   deptno, dname, loc
from     dept;

-- ������̺��� �����ȣ, �����, ����, �μ���ȣ ��ȸ
SELECT  EMPNO, ENAME, JOB, DEPTNO
FROM EMP;

-- ��ȸ �÷��� *�� ����ϸ� �÷����� ���� ��� �÷��� ���� ��ȸ�� �� �� �ִ�.
SELECT *
FROM   TEST;


-- test ���̺��� �̸��� '�����'�� ����� ���̸� 26���� �Է����� �����ϴ�
-- ������ ��¥������ �����ϼ���.


update	test
set     age=26, input_date=sysdate
where   name='�����';

commit;

select	*
from		test;

-- ������̺��� �����ȣ�� 7839�� ����� ������� '������' ������ '����',
-- ������ 2000���� ����.

update	EMP
set			ENAME = '������', JOB='����', SAL=2000
where	  EMPNO=7839;

rollback;--�۾����

select * from test;
-----------------------delete--------------
--��� ���ڵ� ����
delete from test;
rollback;


--Ư�� ���ڵ� ����.
--test ���̺��� ��ȣ�� 1���� ���ڵ带 ����.
delete from  test
where num=1;

----------------------truncate ------------
--test ���̺��� ��� ���ڵ带 ����.
truncate table test;
--runcate�� transaction��� ������ �ƴϹǷ� rollback���� �۾��� ����� �� ����.
rollback;

select * from TEST;

purge recyclebin;

-------------------------drop----------------
--test ���̺��� ����
drop table test;

--������ ����
purge recyclebin;

--�����뿡 �ִ� ���̺� �����ϱ�.
flashback table test to before drop;





