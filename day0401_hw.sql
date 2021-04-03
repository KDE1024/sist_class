/*숙제 1. 매니저 번호를 입력받아 매니저가 관리하는 사원 정보를 emp테이블에서
       조회하는 PL/SQL을 작성하세요.

     조회 컬럼은 사원번호,사원명,부서번호, 입사일, 연봉을 조회하세요.

     단, 조회하는 코드와 업무처리 코드를 구분하여 코딩합니다.
        반복문 하나에서는 커서에서 인출한 데이터를 table에 저장하는 작업을 수행하고,
        테이블에 저장된 데이터를 사용하기위해서  반복문을 하나 더 실행합니다.
        table을 사용하여 출력하는 코드에서는 '사원번호,사원명,부서번호, 부서명, 입사일,연봉'을  출력합니다.
       부서명은 10번부서였을 때 개발부, 20 - 유지보수, 30 - 영업 그외는 기술지원 으로 출력합니다.
*/
set serveroutput on
set verify off

accept  mgr prompt '매니저 번호 입력 : ';

declare
	--사원번호,사원명,부서번호, 입사일, 연봉을 저장할 수 있는 record 선언
	type emp_rec is record (empno emp.empno%type, ename emp.ename%type, deptno emp.deptno%type,
													hiredate emp.hiredate%type, sal emp.sal%type);
	-- 조회된 레코드를 저장할수있는 table를 선언. (방하나가 조회된 행 하나를 저장)
	type emp_tab is table of emp_rec index by binary_integer;

	-- 방 하나가 조회된 행 하나를 저장할 수 있는 emp_table 을 사용하여 table 변수를 선언.
	emp_data emp_tab;
	-- record변수 선언
	ed emp_rec;

	-- 1. 커서 선언
	cursor cur_emp is
		select 	empno, ename, deptno, hiredate, sal
		from		emp
		where 	mgr=&mgr;

	-- 인덱스용
	idx number :=0;

	-- 부서명 저장용.
	dname varchar2(30) := '기술지원';

begin
---------------------------------------------- 데이터 처리 시작-----------------------------------------------
	-- 2. 커서 열기
	if cur_emp%isopen then  -- 커서가  열려있다면 닫아야함. 커서 2번 열리면 에러나서.
		close cur_emp;
	end if;

	open cur_emp;

	-- 3. 인출 : 인출된 레코드를 table의 방에 담는다.
	loop
    idx := idx+1;
		fetch cur_emp into emp_data(idx);
		exit when (cur_emp%notfound);

 	end loop;

	-- 4. 닫기
	close cur_emp;
------------------------------------------------- 데이터 처리 끝-------------------------------------------------

------------------------------------------------- 뷰 처리 시작 --------------------------------------------------
	if idx = 1 then
		dbms_output.put_line(&mgr||'매니저는 관리하는 사원이 없거나, 매니저가 아닙니다.');
	end if;

	for i in 1 .. emp_data.count loop
		ed := emp_data(i);

	if ed.deptno =10  then
		dname := '개발부';
	elsif ed.deptno =20  then
		dname := '유지보수';
	elsif ed.deptno =30 then
		dname :='영업부';
	else
		dname :='기술지원';
	end if;

		dbms_output.put_line(ed.empno||', '||ed.ename||', '||ed.deptno||', '||dname||', '||
													to_char(ed.hiredate,'yyyy-mm-dd day'));
		-- decode 함수는 sql에서만 사용할 수 있다.
--		dbms_output.put_line(decode(de.deptno, 10, '개발부', 20,'유지보수','기술'));

	--부서명은 10번부서였을 때 개발부, 20 - 유지보수, 30 - 영업 그외는 기술지원
	end loop;

------------------------------------------------- 뷰 처리 끝  ---------------------------------------------------

exception
when invalid_cursor then
dbms_output.put_line('커서가 잘못된 연산을 수행하였습니다.');
when others then
dbms_output.put_line('개발자가인지못한 예외 : '||sqlerrm);

end;
/


