-- primary_column ���̺��� �ڽ� ���̺��� ����.
-- id�� ����Ͽ� �ΰ����� ������ �� ������ ��.
-- �ڽ����̺��� �÷����� ���������� ũ��� �޶� �ȴ�.
select * from PRIMARY_TABLE;
select * from FOREIGN_COLUMN;

create table foreign_column(
	id varchar2(20) constraint fk_id references primary_column(id) on delete cascade,
	subject varchar2(30),
	score number(3)
);

select * from user_constraints
where	constraint_type = 'R';

------- 1. �߰�����.
--(1) �θ����̺��� �����ϴ� ������ ���ڵ尡 �߰��� ��.

insert into foreign_column (id, subject, score) values ('han','�ڹ�','90');
insert into foreign_column (id, subject, score) values ('han','����Ŭ','95');

select * from foreign_column;

-- (2) null �Է� ���.
insert into foreign_column(id, subject, score) values ('','����Ŭ','95');


------- 2. �߰� ����.
-- (1) �θ����̺��� �������� �ʴ� ������ �߰��� ��.
insert into foreign_column(id, subject, score) values('han2','����Ŭ','95');


------- 3. ���ڵ� ����.
-- �ڽ� ���̺��� ���ڵ�� �׳� �����ȴ�.
-- �θ� ���̺��� ���ڵ�� �ڽ� ���̺��� ���ڵ尡 �����ϴ� ��쿣 �������� �ʴ´�.

-- han1 ���̵�� �����ϴ� ���ڵ尡 �������� �����Ƿ� �ٷ� �����ȴ�.
delete from primary_column where id='han1';

-- han ���̵�� �����ϴ� ���ڵ尡 �����ϹǷ� �������� �ʴ´�.
delete from primary_column where id='han';
-- �����Ϸ��� �ڽ� ���ڵ带 ��� ���� �� �θ����̺��� ���ڵ带 �����Ѵ�.
delete from foreign_column where id='han';
delete from primary_column where id='han';

select * from PRIMARY_COLUMN;
select * from FOREIGN_COLUMN;
rollback;

----------------------------- ���̺� ���� ���� ����------------------------------
-- �ڽ����̺��� �÷����� ���������� ũ��� �޶� �ȴ�.

create table foreign_table(
	r_id varchar2(30),
	subject varchar2(20),
	score number(3),
	constraints fk_r_id foreign key(r_id) references primary_table(id)
);

select * from user_constraints;
select * from FOREIGN_TABLE;
select * from PRIMARY_TABLE;