-- 시퀀스를 사용하여 고정길이의 증가하는 숫자형식의 문자열을 반환하는 함수.
-- 키로 사용하는 경우.
-- sist_00000000001의 형식으로 반환되어야 한다.

create or replace function sist_num
return char
is
	temp_num varchar2(15);

begin

	temp_num := concat('SIST_', lpad(seq_func.nextval,10,0));

	return temp_num;
end;
/
