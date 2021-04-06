-- trigger ����
create or replace trigger test_trigger
after insert or update or delete on test_trigger1
for each row
declare

begin

-- triggering event ��
		if inserting then
		-- �߰��Ǳ��� ������ �� :old.�÷����� ���� �������� ������
		-- �߰��� ������ �� :new.�÷����� ���� �����Ѵ�.
			dbms_output.put_line('�߰� �۾� ����. ������ : '|| :old.name||' / ���İ� : '|| :new.name);
		end if;

		if updating then
		-- ����Ǳ� ���� :old.�÷���� ����� ������ :new.�÷��� ��� �����ϳ�
		-- ���� �ٸ���.
			dbms_output.put_line('���� �۾� ����. ������ : '|| :old.name||' / ���İ� : '|| :new.name);
		end if;

		if deleting then
		-- ����Ǳ� ���� :old.�÷����� �����ϳ�, ����� ������ :new.�÷�����
		-- ������ �����̱� ������ ���� �������� �ʴ´�.
			dbms_output.put_line('���� �۾� ����. ������ : '|| :old.name||' / ���İ� : '|| :new.name);
		end if;

end;
/
/*  DOS â-----------------------------------------------------------
SQL> insert into test_trigger1(name, age)values('�ڱ��',1);
�߰� �۾� ����. ������ :  / ���İ� : �ڱ��

1 ���� ���� ����������ϴ�.

SQL> update test_trigger1
  2  set name ='�ѱ��'
  3  where name='�ڱ��';
���� �۾� ����. ������ : �ڱ�� / ���İ� : �ѱ��

1 ���� ������Ʈ�Ǿ����ϴ�.

SQL> delete from test_trigger1 where name='�ѱ��';
���� �۾� ����. ������ : �ѱ�� / ���İ� :

1 ���� �����Ǿ����ϴ�.
--------------------------------------------------------------------
*/