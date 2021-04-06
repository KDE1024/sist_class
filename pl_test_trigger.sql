-- trigger 선언
create or replace trigger test_trigger
after insert or update or delete on test_trigger1
for each row
declare

begin

-- triggering event 비교
		if inserting then
		-- 추가되기전 이전의 값 :old.컬럼명은 값이 존재하지 않으나
		-- 추가된 이후의 값 :new.컬럼명은 값이 존재한다.
			dbms_output.put_line('추가 작업 수행. 이전값 : '|| :old.name||' / 이후값 : '|| :new.name);
		end if;

		if updating then
		-- 변경되기 전의 :old.컬럼명과 변경된 이후의 :new.컬럼명 모두 존재하나
		-- 값이 다르다.
			dbms_output.put_line('변경 작업 수행. 이전값 : '|| :old.name||' / 이후값 : '|| :new.name);
		end if;

		if deleting then
		-- 변경되기 전의 :old.컬럼명은 존재하나, 변경된 이후의 :new.컬럼명은
		-- 삭제된 이후이기 때문에 값이 존재하지 않는다.
			dbms_output.put_line('삭제 작업 수행. 이전값 : '|| :old.name||' / 이후값 : '|| :new.name);
		end if;

end;
/
/*  DOS 창-----------------------------------------------------------
SQL> insert into test_trigger1(name, age)values('박기범',1);
추가 작업 수행. 이전값 :  / 이후값 : 박기범

1 개의 행이 만들어졌습니다.

SQL> update test_trigger1
  2  set name ='한기범'
  3  where name='박기범';
변경 작업 수행. 이전값 : 박기범 / 이후값 : 한기범

1 행이 업데이트되었습니다.

SQL> delete from test_trigger1 where name='한기범';
삭제 작업 수행. 이전값 : 한기범 / 이후값 :

1 행이 삭제되었습니다.
--------------------------------------------------------------------
*/