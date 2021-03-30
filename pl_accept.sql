-- accept 사용
set serveroutput on
set verify off

accept name prompt '이름 입력 : '

declare

begin
	dbms_output.put_line('&name');
end;
/
