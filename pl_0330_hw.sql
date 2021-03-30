/*숙제 1.
하루 용돈, 교통비, 점심값을 변수에 저장하고 아래와 같은형식으로 출력하는 PL/SQL작성하세요.
하루용돈 XX원, 편도교통비 : xx 원, 왕복교통비 : xx원, 점심값 : xx원 남은 용돈xx 원입니다.
*/
/*숙제 2.
나이를 accept으로 입력받아 태어난 해를 구해서 출력하는 PL/SQL을 작성하세요.
*/
set serveroutput on
set verify off

accept name prompt '이름 입력 : '

declare
-- 변수선언.
	pay number(7);
	sub_cost number(7);
	lunch number(7);

	birth_year char(4);


begin
--값 할당.
		pay := 20000;
		sub_cost := 2500;
		lunch :=10000;

-- 출력.
    dbms_output.put_line('하루 용돈 : '||pay||'원, 편도 교통비 :'||sub_cost||'원, 왕복 교통비 : '|| (sub_cost)*2||
													'원, 점심값 : '||lunch||'원, 남은 용돈'||(pay- sub_cost*2 - lunch)||'원 입니다.');
		dbms_output.put_line('&name');
end;
/
/*
숙제 3.
 사원테이블에서 근속년수가 35년 이상인 사원 들의 사원번호,사원명, 입사일, 근속년수, 연봉을 조회하세요.
 단, 입사일의 내림차순으로 정렬하여 출력하고, 입사일은 ‘월-일-년 요일’ 의 형식으로 출력하세요*/
select  	empno, ename, to_char(hiredate,'mm-dd-yy day'),
					trunc(trunc(months_between (sysdate,hiredate),0)/12,0) continuous_years, sal
from			emp
where			trunc(months_between (sysdate,hiredate),0)/12 > 35
order by	hiredate desc;
