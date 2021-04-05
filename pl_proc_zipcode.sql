-- 동을 입력받아 우편번호, 시도, 구군, 동, 번지를 출력하는 PL/SQL.
create or replace procedure proc_zipcode(dong varchar2, cur_zip out sys_refcursor)
is

i_dong varchar2(100) := dong;

begin

-- 동이 입력되지 않으면
if i_dong = null then
	 i_dong := '상도동';
end if;

-- 커서 열기
open cur_zip for
	select	zipcode, sido, gugun, dong, bunji
	from    zipcode
	where		dong like i_dong || '%';

end;
/
