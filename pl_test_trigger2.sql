-- test_trigger1 테이블에서 추가작업이 발생하면 test_trigger2 테이브레 동일 값을 추가하고,
-- test_trigger1 테이블에서 변경작업이 발생하면 test_trigger2  테이블에 같은 값이 변경 되도록 설정하고,
-- test_trigger1 테이블에서 삭제 작업이 발생하면 test_trigger2 테이블에서도 같은 값이 삭제되도록 trigger 구성.
create or replace trigger test_trigger1
after insert or delete or update on test_trigger1
for each row

declare

begin
	-- insert 의 비교
	if inserting then 
	
	end if;
	
	-- update 의 비교	
	if updating then
	
	end if;
	
	-- delete 의 비교
	if deleting then
	
	end if;

end;
/
 