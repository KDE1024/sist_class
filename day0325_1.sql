-- check, notnull, default
-- ���̴� 20~30�븸 �Է�, �̸��� �ݵ�� �ԷµǾ�� �Ѵ�.
-- �Է����� �����Ǹ� ���ڵ尡 �߰��Ǵ� ������ ��¥ ������ �߰� �Ǿ�� �Ѵ�.

create table other_constraint(
	num number(5),
	name varchar2(30byte) not null,
	age number(2) check (age between 20 and 39),
	input_date date default sysdate
);

-- ������� Ȯ��.
-- check, not null -> ��������̴ϱ� ���⼭ Ȯ�� ����.
select * from user_constraints
where table_name ='OTHER_CONSTRAINT';


-- default
select * from user_tab_cols
where table_name='OTHER_CONSTRAINT';   -- ������ ������  ��3��
select * from OTHER_CONSTRAINT;

-- 1. �߰�����
-- (1) �̸��� �ԷµǸ鼭, ���̰� 20~30��, �Է����� �����Ǿ�� �ȴ�.
insert into other_constraint(num, name, age, input_date)
values(1,'�ڱ��', 25, sysdate);
-- �̸��� �ԷµǸ鼭, ���̰� 20~30��, �Է����� �����Ǿ �ȴ�.(default)
insert into other_constraint(num, name, age)
values(2,'���μ�', 26);


-- 2. �߰� ����
-- (1) check ���ǿ� ����.
insert into other_constraint(num, name, age)
values(3,'������', 19);

insert into other_constraint(num, name, age)
values(3,'������', 40);

-- (2) not null ���ǿ� ����. --�÷��� ���� �ݵ�� �Է��ؾ� �� ��
insert into other_constraint(num, age)
values(3, 40);

insert into other_constraint(num,name ,age)
values(3,'',40);



select * from OTHER_CONSTRAINT;


          
            