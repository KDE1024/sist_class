-- 태어난 해를 저장하고, 변수를 사용하여 나이 구하기.
--select  months_between(trunc(sysdate,'YEAR'),trunc(to_date('19961024','YYYYMMDD'),'YEAR'))/12+1 as age
--from		dual;

--set인데 select를 쓰셨어요
set serveroutput on

declare
		-- 변수의 선언
		birth_year char(4);
		now_year char(4);
begin
		-- 값 할당
		birth_year := 1988;
		now_year := to_char(sysdate, 'yyyy');

		dbms_output.put_line('테어난 해 '||birth_year||'년 나이'||
													(now_year - birth_year +1)||'살');

-- Error :  관계 연산자는 출력할 수 없다.
--		dbms_output.put_line( 3 > 2 );

end;
/
