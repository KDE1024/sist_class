-- test_trigger1 ���̺��� �߰��۾��� �߻��ϸ� test_trigger2 ���̺극 ���� ���� �߰��ϰ�,
-- test_trigger1 ���̺��� �����۾��� �߻��ϸ� test_trigger2  ���̺� ���� ���� ���� �ǵ��� �����ϰ�,
-- test_trigger1 ���̺��� ���� �۾��� �߻��ϸ� test_trigger2 ���̺����� ���� ���� �����ǵ��� trigger ����.
create or replace trigger test_trigger1
after insert or delete or update on test_trigger1
for each row

declare

begin
	-- insert �� ��
	if inserting then 
	
	end if;
	
	-- update �� ��	
	if updating then
	
	end if;
	
	-- delete �� ��
	if deleting then
	
	end if;

end;
/
 