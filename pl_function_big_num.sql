-- 두개의 수를 입력 받아 둘 중 큰 수를 반환하는 함수를 만들어라.
create or replace function big_num(num1 number, num2 number)
return number
is
	big_num number;

begin

	big_num := num1;

	if num1 < num2 then
	big_num := num2;
	end if;

	return big_num;

end;
/
