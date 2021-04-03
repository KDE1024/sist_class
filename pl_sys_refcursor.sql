-- sys_refcursor 사용 :  커서의 선언와 쿼리문을 분리할 수 있다.
-- 부서번호를 입력받아 emp 테이블에서 사원정보 조회.
-- 조회 컬럼 : 사원번호, 사원명, 부서번호, 연봉을 조회.
-- 단, 부서번호는 10번, 20번, 30번만 사용할 수 있고 해당 번호가 아니면 '부서번호는
-- 10, 20, 30번만 입력해주세요.'를 출력한다.
set serveroutput on
set verify off

accept deptno prompt '부서번호 : ';

declare

	-- 레코드 선언
	type emp_rec is record (empno number, ename varchar2(30), deptno number, sal number);
	-- 레코드를 사용한 변수 선언.
	er emp_rec;


  -- 부서번호
	d_no number := &deptno;

  -- sys_refcursor 선언 :  커서의 선언과쿼리문을 분리할 수 있다.
  -- 커서명 sys_refcursor
	emp_cur sys_refcursor;

begin

	if d_no in (10, 20, 30) then
	-- 2. open
	open emp_cur for
		select	empno, ename, deptno, sal
		from		emp
		where   deptno = d_no;

	-- 3. 인출
	loop
		fetch emp_cur into er;
		exit when(emp_cur%notfound);

		dbms_output.put_line(er.empno||' / '||er.ename||' / '||er.deptno||' / '||er.sal);
	end loop;

	else
		dbms_output.put_line('부서번호는 10, 20, 30번만 입력해주세요.');
	end if;

	-- 4. 닫기
	close emp_cur;




exception
when invalid_cursor then
	dbms_output.put_line('앗! 잘못된 커서 연산');
when others then
	dbms_output.put_line('앗! 알수없는 예외'||sqlerrm);


end;
/
