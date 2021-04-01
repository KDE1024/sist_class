-- 사원번호를 입력받아 CP_EMP1 테이블에서 사원 정보를 조회하는 PL/SQL
-- 조회컬럼은 사원명, 부서번호, 직무, 연봉을 조회하여 출력하세요.
set serveroutput on
set verify off

accept empno prompt '사원번호 : ';

declare
	-- where 절에서 사용할 변수
	i_empno 	cp_emp1.empno%type := &empno;
	-- into 절에서 사용할 변수
	ename 		cp_emp1.ename%type;
	deptno 		cp_emp1.deptno%type;
	job 			cp_emp1.job%type;
	sal 			cp_emp1.sal%type;
	-- 암시적 커서가 가지고 있는 값.
	row_cnt number;

begin

	select	ENAME, DEPTNO, JOB, SAL   -- 조회된 결과를 가진 컬럼의 값을
	into    ENAME, DEPTNO, JOB, SAL   -- 변수에 넣는다.(변수의 갯수와 형에 대한 주의!)
	from		cp_emp1
	where   empno=i_empno;

	row_cnt := sql%rowcount;

	dbms_output.put_line(row_cnt||'행 조회');

	dbms_output.put_line(i_empno||'번 사원정보 조회');
	dbms_output.put_line('사원명 : '||ename||', 부서번호 : '||deptno||', 직무 : '||
												job||', 연봉 : '||sal);

	exception
	when no_data_found then
			dbms_output.put_line(i_empno||'번 사원은 존재하지 않습니다.');
      dbms_output.put_line('에러코드 : '||sqlcode||', 메세지 : '||sqlerrm);
	when too_many_rows then
			dbms_output.put_line(i_empno||'번 사원으로 여러명이 검색되었습니다.');
			dbms_output.put_line('에러코드 : '||sqlcode||', 메세지 : '||sqlerrm);
  when others then
			dbms_output.put_line('개발자가 인지하지 못한 예외');
			dbms_output.put_line('에러코드 : '||sqlcode||', 메세지 : '||sqlerrm);
  

end;
/

