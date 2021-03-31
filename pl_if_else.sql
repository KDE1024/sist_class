-- 수를 입력 받아 '홀수' 인지 '짝수' 인지 출력하는 코드
set serveroutput on
set verify off

accept num prompt '수 입력 : ';
accept name prompt '이름 입력 : ';

declare

	num number := &num;

	-- 입력받은 이름을 저장할 변수를 선언하세요.
	name varchar2(300) := '&name';

begin

	dbms_output.put(num||'은(는) ');

	if mod(num,2)=0 then
		dbms_output.put_line('짝수');
	else
	  dbms_output.put_line('홀수');
	end if;

	-- 이름이 '송준희'라면 '반장'을 출력하고, 그렇지 않으면 '평민'을 출력한 후
	-- 이름을 출력.
  if name = '송준희' then
  	dbms_output.put('반장');
	else
		dbms_output.put('평민 ');
	end if;
    dbms_output.put_line(name);
end;
/      