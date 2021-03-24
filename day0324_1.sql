
/*������ ���� �����ߵ� -------->> primary key�� ��������~~~~~*/

-- �÷� ���� ������� primary key�� ����.
-- �̸�, ��ȭ��ȣ, ���̵� �����ϴ� ���̺� ����.

-- �÷��� ��������(ũ��) primary key - ������׸��� �ڵ����� ������.
-- sys_00939, ������׸����� � ������ �����Ͽ����� �� �� ����.
drop table  primary_column;

create table primary_column(
	name varchar2(20),
	phone varchar2(13),
	id varchar2(20) constraint pk_primary_column primary key
);

-- ��������� ��ȸ�ϱ�.
select * from user_constraints
where	table_name='PRIMARY_COLUMN';

-- < primary key�� ���� �� �߰������ϴ� ���. >
-- 1. ���� �Է��ϴ� ��� (����)
insert into primary_column(name, phone, id) values ('�ѻ��','010-1234-5678','han');
-- 2. ���̵� �ٸ� ��. (����) - �� ���Ƶ�, �����̸Ӹ� Ű�� �ٸ��� ��.
insert into primary_column(name, phone, id) values ('�ѻ��','010-1234-5678','han1');



-- < �߰� �����ϴ� ���. >
-- 1. null�� �Էµ� ��.
--   (1)�÷����� �����Ǵ� ���. (Error)
insert into primary_column(name, phone) values ('�ѻ��','010-1234-5678');
--   (2)' '�� �ԷµǴ� ��� (Error)
insert into primary_column(name, phone, id) values ('�ѻ��','010-1234-5678','');

-- 2. ���� ���� �ԷµǴ� ��� (Error)
insert into primary_column(name, phone, id) values ('�̻�ö','010-2222-3333','han1');

select * from primary_column;




-- ���̺� ���� �������. (�÷��� ���ǿ� ��������� ���Ǹ� �и��Ͽ� �ۼ��� �� �ִ�.)
create table primary_table (
	name varchar2(20),
	phone varchar2(13),
	id varchar2(20),
	constraint pk_primary_table primary key(id)  --alter ����
	);
select * from primary_table;


-- �߰� ����.
insert into primary_table (name, phone, id)
						values ('������','010-1234-4321','jin');  /*2��  �����ϸ� ����.*/

select * from primary_table;

select * from user_constraints;

----------------------- �������� �÷��� �ϳ��� PK�� ����  -------------------------------------
-- �����۹�ȣ, �����۸�, ��������, ����
-- (�������� �Ϸ翡 �ѹ��� ���갡��)   -- date�� ���� �ʰ� ���� �ȵ�.

create table primary_multi(
	item_num number(4),
	name varchar(60),
	item_date char(8),
	item_info clob,
	constraint pk_primary_multi primary key (item_num, item_date)
);

select * from user_constraints
where table_name='PRIMARY_MULTI';

-- alter table primary_multi rename colum info_info to item_info; // �÷��� �ٲٱ�


-- 1. �߰�����.
-- (1) ���ʵ����� �Է�.
select * from primary_multi;

insert into primary_multi(item_num, name, item_date, item_info)
values (1000,'Ű����','20210301',
				'��극�� ������� ������ Ű����. �ݹ߷��� ������.');

--(2) ������ ��ȣ�� �������� �ٸ��� �Է� ����.
insert into primary_multi(item_num, name, item_date, item_info)
values (1000,'Ű����','20210302',
				'��극�� ������� ������ Ű����. �ݹ߷��� ������.');

insert into primary_multi(item_num, name, item_date, item_info)
values (1000,'Ű����','20210303',
				'��극�� ������� ������ Ű����. �ݹ߷��� ������.');

-- (3) ������ ��ȣ�� ��¥�� �ٸ��� �Է� ����.
insert into primary_multi(item_num, name, item_date, item_info)
values (1001,'Ű����','20210301',
				'���� Ű����� û��, ����, ����, ������ ������, ���⿡ ���� ���ϴ� Ű�� ������ �� �ִ�.');


-- 2. Error
-- (1) ������ ��ȣ�� �������ڰ� ���� ���.
insert into primary_multi(item_num, name, item_date, item_info)
values (1000,'���콺','20210301', /*3��1�Ͽ� 1000�� ���콺�ۿ� ����.*/
				'�ո��� ��ȣ�ϱ� ���� ���� ������ ����Ͽ� ������ ��ǰ���� ��¥�� insert �ȵ�.');

-- (2) null�� �ԷµǸ� error.
insert into primary_multi(name, item_date, item_info)
values ('Ű����','20210303',
				'��극�� ������� ������ Ű����. �ݹ߷��� ������.');

insert into primary_multi(item_num, name, item_date, item_info)
values (1000,'Ű����','',
				'��극�� ������� ������ Ű����. �ݹ߷��� ������.');

select * from PRIMARY_MULTI;
/*������ ���� ������ �� -------->> primary key�� ��������~~~~~*/

-- primary key�� �����ϸ�, unique index�� �ڵ�������.
-- index�� Ȯ���ϴ� Data Dictionary �� user_indexes
select * from user_indexes;



