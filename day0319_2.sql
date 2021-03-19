--------------------문자열 함수----------------------------
-- 문자열의 길이
select  length('test'), length('Today is friday.')
from		dual;

-- 사원테이블에서 사원명이 4글자인 사원의 사원명, 사원번호, 입사일 조회
select  ename, empno, hiredate
from		emp
where		length(ename)=4;

-- 대문자, 소문자 변환
select  upper('abcd'), upper('AbCd'), lower('ABCD'), lower('AbCd')
from		dual;

-- 사원테이블에서 사원명이 'scott'인 사원의 사원명, 직무, 연봉, 입사일을 조회
select  Ename, job, sal, hiredate
from		Emp
where		lower(ename) = 'scott';
--where		ename=upper('scott');

select*from emp;

-- 첫글자를 대문자로, 공백 이후의 첫글자도 대문자로만든다.
select  initcap('java'), initcap('orcale'), initcap('i am a girl.')
from		dual;


-- 문자열 내에 특정 문자열의 인덱스 얻기.
-- select	instr('test','t') --1 나옴. 자바는 0 나옴.
select 	instr('test','e'), instr('test','k')
from    dual;

-- 사원테이블에서 사원명에  'A'가 있는 사원의 사원명, 사원번호, 연봉을 조회
select  ENAME, EMPNO, SAL
from		emp
where		instr(ename,'A') <>0; /*>0 도 ㄱㅊ*/
--where		instr(ename, 'A') !=0;

-- 문자열 자르기
-- 시작 문자로부터 자를 땐 시작 인덱스를 0 또는 1로 사용할 수 있다.
select		substr('abcdefg',3,4), substr ('acdefg',3),substr ('acdefg',0/*1*/,4)
from			dual;

-- 문자열 합치기
select 'ABC'||'DEF'||'HIJ',concat( concat('abc','def'), 'hij')
from    dual;

-- 공백 제거
select		'['||trim('   A BC   ')||']', '['||ltrim('   A BC   ')||']',
					'['||rtrim('   A BC   ')||']'
from      dual;

-- 문자열이 특정 문자열로 감싸져 있을 때 문자열을 삭제할 수 있다.
-- trim (지울 문자열 from 문자열)
select		trim('a' from'aaaaaOracleaaaa')
from      dual;

-- 문자열 치환
select		replace('abcabcabc','bc','a')
from      dual;

-- 사원테이블에서 사원명을 조회.
-- 단, 사원명에 'A'를 'a'로 변경하여 조회.
select		ename, replace(ename, 'A','a'), initcap (ename)-- 뭐든간에 첫글자를 대문자로.
from			emp;


-- 동일 길이의 문자열 만들기. //한글만 2byte
-- 왼쪽 채우기.
select		lpad('test',10,'a'), lpad('test',15,'/'), lpad('test',10, 1)
from			dual;

-- 오른쪽 채우기.
select		rpad('test',10,'a'), rpad('test',15,'#')
from			dual;

-- 사원테이블에서 사원번호, 사원명, 입사일을 조회.
-- 단, 사원번호는 sist_0000001111의 형식으로 출력할 것.
select  empno,concat('SIST_', lpad(empno,10,0)) as format_empno, ename, hiredate
from		emp;
