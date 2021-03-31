-- 사원번호, 사원명, 부서번호, 직무, 입사일을 입력받아 cp_emp4 테이블에 추가하는
-- PL/SQL을 작성하세요.
set serveroutput on
set verify off

accept empno prompt '사원번호 : ';
accept ename prompt '사원명 : ';
accept job prompt '직무 : ';
accept deptno prompt '부서전호 : ';

declare

	row_cnt number;

	empno 	cp_emp4.empno%type := &empno;
	ename 	cp_emp4.ename%type :='&ename';
	job			cp_emp4.job%type := '&job';
	deptno  cp_emp4.deptno%type := &deptno;

begin
	-- 컬럼이 정의 되는 부분과 변수가 정의되는 부분이 달라서 컬럼명과 변수명이 같아도 된다.
	insert into cp_emp4(empno, ename, deptno, job, hiredate)
	values (empno, ename, deptno, job, sysdate);

	row_cnt := sql%rowcount;

	if row_cnt = 1 then
		dbms_output.put_line(sql%rowcount||'건 추가');
		commit; -- commit할 조건을 달아 줄 때 if가 필요하다.
	end if;
end;
/
