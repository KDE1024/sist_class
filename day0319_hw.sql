-- 1. 사원테이블에서 사원번호, 사원명,직무, 매니저번호,연봉,입사일을 조회하세요.
--단, 입사일은 월-일-년의 형식으로 출력하세요.연봉은 3자리마다 ,를 넣어 출력하세요.
select 	empno, job, mgr, to_char(sal, '9,999'), to_char(hiredate, 'mm"월" dd"일" yy"년"') hiredate
from		emp;


--2. 사원테이블에서 3,4분기에 입사한 사원들의  사원번호,사원명,연봉,직무, 입사일을 조회하세요.
select  EMPNO, ENAME, JOB, HIREDATE
from		emp
where		to_char(hiredate, 'q')= 3 or to_char(hiredate, 'q') = 4;

--3. 사원테이블에서 부서번호, 사원번호, 연봉, 보너스, 총수령액,입사일을 조회하세요.
--단. 총수령액은 '연봉+월급+보너스'를 합산한 금액으로 조회하세요.
--월급은 연봉을 12로 나눈 값을 원단위 절사하여 계산하세요.
select  DEPTNO, EMPNO, SAL, COMM, sal + (sal/12)+ comm as total, HIREDATE
from		emp;


