-- 컬럼명과 변수명을 구분
-- 사원번호를 입력받아 cp_emp4 테이블에서 삭제.
set serveroutput on
set verify off

accept empno prompt '사원번호 입력 : ';

declare

	i_empno cp_emp4.empno%type := &empno;

begin

	delete from cp_emp4 where empno=i_empno;

  if sql%rowcount > 0 then

		dbms_output.put_line( sql%rowcount ||'건 삭제 되었습니다.');
		commit;
	else
	 dbms_output.put_line( i_empno
	 											||'번 사원은 존재하지 않습니다. 사원번호를 확인하세요.');
	end if;


end;
/
