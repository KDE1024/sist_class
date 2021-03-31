-- update :  컬럼명과 변수명을 다르게 설정.
-- 사원번호, 사원명, 부서번호를 입력받아 cp_emp4 테이블에서 사원번호와 같은 레코드를
-- 변경.
set serveroutput on
set verify off

accept empno prompt '사원번호 : ';
accept ename prompt '사원명 : ';
accept deptno prompt '부서번호 : ';

declare
	i_empno cp_emp4.empno%type := &empno;
	i_ename cp_emp4.ename%type := '&ename';
	i_deptno cp_emp4.deptno%type := &deptno;

	row_cnt number;
begin

-- update :  컬럼명과 변수명이 서로 식별되도록 변수명을 다르게 설정한다.
update cp_emp4
set    ename = i_ename, deptno =i_deptno
where  empno=i_empno;

row_cnt :=  sql%rowcount;
if row_cnt <> 0 then
	dbms_output.put_line(row_cnt||'건 변경 되었습니다.');
	commit;
--	else
--		rollback;
end if;

-- commit을 수행한 후 암시적 커서(sql)의 속성값(rowcount)은 사라진다.
--dbms_output.put_line(sql%rowcount);

end;
/
