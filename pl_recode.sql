-- 사원번호, 사원명, 직무, 입사일을 저장할 수 있는 recode 생성· 사용 하는 예제.
set serveroutput on

declare
	-- 1. recode 선언 : type 레코드명 is recode (레코드에 포함될 변수 ,,,,,,);
	type emp_rec is record (empno number(4), ename emp.ename%type, job varchar2(30), hiredate date);
	-- 2. 선언된 recode를 사용하여 변수를 선언한다. : 변수명 recode명
	kang emp_rec;

begin
	-- 3. 선언된 recode 변수를 사용한다.
	-- 값 할당 : 레코드변수명. 레코드 안에 정의된 변수명 := 값;
	  kang.empno  := 1111;
	  kang.ename := '강인섭';
	  kang.job := '개발자';
	  kang.hiredate := sysdate;

	-- 값 사용.
		dbms_output.put_line('사원명 : '||kang.ename||', 사원번호 : '||kang.empno|| ', 직무 : ' ||
												kang.job || ', 입사일 : '||to_char(kang.hiredate,'yyyy-mm-dd'));

end;
/
