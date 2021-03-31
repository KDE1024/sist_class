-- 1~10까지 반복 출력하는 while //while은 변수가 있어야 한다.
set serveroutput on

declare
	i number;
begin

	i:=1; --초기값

  while i < 11 loop    -- 조건식
  	dbms_output.put_line( i||' ');
  	i := i+1;              -- 증·감소식
  end loop;

  dbms_output.put_line(' ');

	-- 1 ~ 100 까지 출력하는데. 1 2 짝 4 5 짝
	i := 1; -- i 초기화

	while i < 101 loop
	 if mod(i,3)=0 then
  	dbms_output.put( '짝');
	 else
		dbms_output.put(i|| ' ');
		end if;
		i := i +1;   -- 증·감소식
	end loop;

    dbms_output.put_line(' ');

end;
/
