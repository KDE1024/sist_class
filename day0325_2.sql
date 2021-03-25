-- alter �� ��� 
create table test_alter(
	num number,
	neam varchar2(30),
	age number(2),
	addr number
);

-- �÷��� ����
-- neam -> name
alter table test_alter rename column neam to name;

-- �÷��� �������� ����
-- addr �÷��� ���������� number -> varchar2(300) ����.
-- ���ڵ尡 �����ϸ� ���� ������������ ũ�⸸ ����ǰ� ,
-- ���ڵ尡 �������� ������ ������ �� ��ü�� ���� �����ϴ�.
alter table test_alter modify addr varchar(300);

-- ���ڵ� �߰�
insert into test_alter ( num, name, age, addr)
values(1,'�ڱ��',27,'����� ������ ���ﵿ');

commit;

-- ���ڵ尡 �����ϸ� ���������� ������ �� ����.
alter table test_alter modify addr number;

-- age �� number(2) -> number(22)�� ����.
alter table test_alter modify age number(22);


-- �÷� ����
-- age �÷� ����.
alter table test_alter drop column age;

truncate table test_alter;-- ���̺� ����!(���ڵ� ����)

-- �÷� �߰�(�÷� ���� ��������� �߰��� �� �ִ�.)
-- id �÷� �߰�(PK)
alter table test_alter add id varchar2(20) constraint pk_test_alter primary key;

-- DD���� ������� ��ȸ
select * from user_constraints where table_name ='TEST_ALTER';

-- �÷��� �����ҋ��� ��������� ������ �� �ִ�.
-- name varchar2(15)�� �ʼ��Է� ������ ����. -> not null
alter table test_alter modify name varchar2(15) not null; -- �̸��� �ݵ�� �Է��ؾ� �մϴ�.

-- ������� ����.
-- PK�� Ȱ��ȭ �Ǿ������Ƿ� ���� id�� �߰��� �� ����.
insert into test_alter (id, name) values ('kim','�����');
--insert into test_alter (id, name) values ('kim','������'); -- ���⼱insert �ȵ�. ������� �ɷ������ϱ�.

-- ��������� ��Ȱ��ȭ.
alter table test_alter disable constraint pk_test_alter;
select * from user_constraints where table_name ='TEST_ALTER'; /*statusdp disable �� �� Ȯ��.*/

insert into test_alter (id, name) values ('kim','������');

-- ��������� Ȱ��ȭ. (������׿� ����Ǵ� ���ڵ尡 �����ϸ� ��������� Ȱ��ȭ���� �ʴ´�.)
--alter table test_alter enable constraint pk_test_alter; -- ���⼱ ���� �ȵ�. ����Ǵ� ���ڵ� �־.
delete from test_alter where name='������';
commit;

alter table test_alter enable constraint pk_test_alter;
select * from user_constraints where table_name ='TEST_ALTER';  /*statusdp enable �� �� Ȯ��.*/

-- ������� ����.
-- primary key�� �����ϸ� not null�� �������� �ʴ´�.
-- DBA�� �ο��� ������׸����� ����.
alter table test_alter drop constraint pk_test_alter;
select * from user_constraints where table_name ='TEST_ALTER'; -- p �������� Ȯ��....

-- �ڵ����� �ο��� ������׸����� ����.
alter table test_alter drop constraint SYS_C007533;

-- ������� �߰�. (���̺� ���� ������� ����)
-- id �÷��� PK���� �߰�.
alter table test_alter add constraint pk_test_altet primary key(id);
select * from user_constraints where table_name ='TEST_ALTER'; -- pk ����.


                                                  
select * from TEST_ALTER;  