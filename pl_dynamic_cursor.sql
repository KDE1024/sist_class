-- 동을 입력 받아 우편번호, 시도, 구군, 동 번지를 조회.

set serveroutput on
set verify off

accept dong prompt '동 입력 : ';

declare
		cnt number :=0;
begin

for zip_cur in
					(select zipcode, sido, gugun, dong, bunji from zipcode where dong like '&dong%')

	loop

	dbms_output.put_line(zip_cur.zipcode||' '||zip_cur.sido||' '||zip_cur.gugun||' '||
												zip_cur.dong||' '||zip_cur.bunji);

		cnt := cnt + 1;
	end loop;

	if cnt = 0 then
		dbms_output.put_line('&dong은 존재하지 않습니다.');
	end if;

end;
/
