-- 1~100까지 반복하는 for
set serveroutput on


declare
	j number;
	total number:=0;
	msg varchar2(40);
	msg_len number;

begin

	for i in 1 .. 100 loop
		dbms_output.put(i||' ');
	end loop;

	dbms_output.put_line(' ');



	for j1 in 0 .. 10 loop
		j:=j1;
	dbms_output.put(j||' ');
	end loop;

	dbms_output.put_line('-----'||j||' ');

	-- 1~100 까지 짝수만 출력.
		for i in 1 .. 100 loop
			if mod(i,2)=0  then
				dbms_output.put_line(i||' ');
			end if;
			total := total +i;
	 end loop;

	dbms_output.put(' ');

	-- 1~100까지 합을  구하여 출력.
	dbms_output.put_line(total);

	-- msg에 담겨진 문자열을 한글자씩 잘라서 출력.
	msg := 'Java Oracle';

	msg_len := length(msg);
--	dbms_output.put_line(msg_len);  //출력해봐서 글자수 알기.

	for i in 1 .. msg_len loop
		dbms_output.put_line( substr(msg,i,1) );
	end loop;

  dbms_output.put_line(' ');

	-- 반복문 빠져나가기
	for i in 1 .. 100 loop
		dbms_output.put_line(i);

--    if i = 10 then
--	  	exit; -- 가장 가까운 반복문을 빠져나감.
--	  end if; -- 1. if 문으로 exit.
		exit when ( i=10);  --2. when 으로 exit.


	end loop;


end;
/
