-- 두개의 수를 입력 받아 더한 값을 반환하는  함수 작성.
create or replace function plus(num1 number, num2 number)
return number
is


begin


	return num1+num2;
end;
/
