-- 변수의 사용
set serveroutput on

declare
-- 변수 선언 : 데이터형을 지정하여 변수를 선언.
	name varchar2(15);
	age number(3) := 25;

	-- 날짜를 저장할 수 있는 변수 선언.
	now_date date;

	-- 실제 테이블에 존재하는 컬럼의 데이터형, 크기를 참조하여 변수를 선언할 수 있다.
	ename emp.ename%type := '박기범';
	sal emp.sal%type;

	-- rowtype은 여러개의 컬럼을 하나의 변수에 저장하기 때문에 초기화를 할 수 없다.
	dept_row dept%rowtype;

begin
-- 값 할당.
	name := '강인섭'||'님';
	-- 현재 날짜 입력.
	now_date := sysdate;
-- 변수 사용.
-- 출력 : dbms_output.put(); 함수로만 구성하면 출력이 되지 않는다.
	dbms_output.put(name);
	dbms_output.put_line(age);

	-- 현재 날짜 출력.
	dbms_output.put_line(to_char(now_date,'yyyy-mm-dd q"분기" day'));

	-- %type을 사용한 변수에 값 할당.
	sal := 2021;
	--	ename := '박기범님'; -- 실제 컬럼의 크기보다 큰 데이터형을 입력하여 에러 발생.
	dbms_output.put_line(ename||' / '||sal );

	-- %rowtype을 사용한 변수에 값 할당.
	dept_row.deptno:=10;
	dept_row.dname:='개발부';
	dept_row.loc:='서울';

	dbms_output.put_line(dept_row.deptno ||' / '||dept_row.dname||' / '
	|| dept_row.loc);
 
end;
/