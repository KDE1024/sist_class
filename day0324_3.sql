-- unique ���.
-- ��ȣ, �̸�, ��ȭ��ȣ�� ����.
																		/*�ݵ�� �ְ� �����ϸ� �����̸Ӹ�
																		 �������� �ְ� unique
																		 �����Ұž� foreign*/
---------------------------------------- �÷� ���� �������. ---------------------------------------
select * from UNIQUE_COLUMN;

create table unique_column(
	num number,
	name varchar2(30),
	phone varchar2(13) constraints uk_phone unique
);

-- ������� Ȯ��.
select * from user_constraints; -- constraint_name �� uk_phone ��������ִ°� Ȯ�� ����.
-- ������ �ε��� Ȯ��.
select * from user_indexes; -- index_name �� uk_phone ��������ִ°� Ȯ�� ����.

--  1. �߰�����.
-- (1) �����Է�.
insert into unique_column(num, name, phone) values (1,'�׽�Ʈ','010-1234-5678');

-- (2) �ٸ� ��ȭ ��ȣ�� �ԷµǴ� ���.
insert into unique_column(num, name, phone) values (2,'�׽�Ʈ','010-1234-5679');

-- (3) ��ȭ��ȣ�� null�� �ԷµǴ� ���. -- ��� ����� �ڵ����� �������� ���ݾ�?
insert into unique_column(num, name, phone) values (3,'�׽�Ʈ','');

insert into unique_column(num, name) values (4,'�׽�Ʈ');


--  2. Error
-- (1) ���� ��ȭ��ȣ�� �ԷµǸ� ����.     /*��ȭ��ȣ�� ����ũ �ȵ�. �̸����� ok.*/
insert into unique_column(num, name, phone) values (5,'���ϴ�','010-1234-5679');

select * from unique_column;

---------------------------------------- ���̺� ����  �������. ---------------------------------------
create table unique_table(
	num number,
	name varchar2(30),
	email varchar2(50),
	card_num char(4),
	constraint uk_email unique( email ),
	constraint uk_card_num unique(card_num));

-- ������� Ȯ��.
select * from user_constraints where constraint_type='U';

select * from user_indexes where table_name='UNIQUE_TABLE';




select * from UNIQUE_TABLE;










