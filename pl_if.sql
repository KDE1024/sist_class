-- 단일 if
-- 이름을 입력받아 이름이 '송준희'라면 이름앞에 '반장'을 붙여 출력하고
-- 그렇지 않으면 입력받은 이름만 출력.

set serveroutput on
set verify off

-- 이름을 입력받도록 메세지를 제공.
accept name prompt '이름 입력 : ';

declare
	-- 변수 선언
	name	varchar2(30) := '&name';
	num number;

begin

	if name ='송준희' then
		dbms_output.put('반장 ');
	end if;

	dbms_output.put_line(name);

	-- num 변수에 값 할당.
	num := -10 ;

--	-- num 변수의 값의 절대값 처리. (음수면 양수로 변환)
	if num < 0 then
		num := -num;
	end if;              --> abs 알고 있는데 ,, 굳이!?!!??  그냥 if 배워서 걍 해봄.

	-- num 변수를 출력
--	dbms_output.put_line(abs(num));  --> abs 함수 쓰면 젤 빠름.
	dbms_output.put_line(num);

	-- 입력받은  이름이 한상민, 박기범, 이예림, 김덕영 이라면 이름 출력전에
	-- '조장'을 붙여 출력한다. 그렇지 않으면 이름만 출력.

	 if name in('한상민', '박기범', '이예림', '김덕영') then
	 	dbms_output.put('조장 ');
	 end if;

	 dbms_output.put_line(name);


end;
/
