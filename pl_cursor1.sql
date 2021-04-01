-- dept 테이블의 모든 부서정보를 조회.
set serveroutput on

declare
	-- 커서에서 인출된 값을 저장할 변수
	deptno	dept.deptno%type;
	dname		dept.dname%type;
	loc			dept.loc%type;

	dept_row dept%rowtype;

	-- 1. 커서의 선언. cursor 커서명 is select,,,,,;
	cursor cur_dept
		is select deptno, dname, loc from dept;

begin

	if cur_dept%isopen then
	-- 커서가 열려 있다면 닫기
		close cur_dept;
	end if;

	-- 2. 커서 열기 : open 커서명;
	open cur_dept;

	--3. 인출 : 커서가 위치한 곳에 컬럼 값을 얻는 일. fetch 커서명 into 컬럼명,,;
	loop
--		fetch cur_dept into deptno, dname, loc;
		fetch cur_dept into dept_row;
		-- 인출된 레코드가 존재하지 않으면 반복문을 빠져 나간다.
		exit when(cur_dept%notfound);
		-- 인출된 레코드가 존재하면 값을 얻는다.
--		if cur_dept%found then                      --if로 굳이 안물어봐도 됨.
--			dbms_output.put_line('레코드 있음');
--			dbms_output.put_line(deptno||' / '||dname||' / '||loc);
      dbms_output.put_line(dept_row.deptno||' / '||dept_row.dname||' / '||dept_row.loc);
--		end if;

	end loop;

	-- 4. 커서 닫기
	close cur_dept;

	exception
	when invalid_cursor then
		dbms_output.put_line('커서가 잘못된 연산을 수행하였습니다.');
	when others then
		dbms_output.put_line('알수없는 예외');

end;
/
