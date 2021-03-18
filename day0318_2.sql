-- 사원테이블에서 10번 부서에 근무하는 사원들의 사원번호, 사원명, 매니저번호,
-- 연봉, 부서번호를 조회하세요.

select    empno, ename, mgr, sal, deptno
from			emp
where			deptno=10;


--사원테이블에서 10번 부서사원들을를 제외하고 나머지의 사원번호, 사원명, 매니저번호,
--입사일, 부서번호 조회
select		empno, ename, mgr, hiredate, deptno
from			emp
where			deptno <>10;
--where     deptno !=10;


-- 사원테이블에서 연봉이 1600이상인 사원들의 사원번호, 연봉, 사원명, 직무,
-- 입사일을 조회
select			EMPNO, SAL, ENAME, JOB, HIREDATE
from        EMP
where       sal>=1600;
--where			sal>1599;

/*이상, 초과 주의하기!!!!!!!!!!!!!!!!!!!!*/

-- 사원테이블에서 연봉이 1600 초과인 사원들의 사원번호, 연봉, 사원명, 직무,
-- 입사일을 조회
select			EMPNO, SAL, ENAME, JOB, HIREDATE
from        EMP
where       sal>1600;


-- 사원테이블에서 연봉이 1600이상 3000이하인 사원의 사원명, 사원번호, 연봉, 직무 조회하기
select			ENAME, EMPNO, SAL, JOB
from 				emp
where				sal between 1600 and 3000;
--where       sal >=1600 and sal <=3000;


-- 사원테이블에서 7902, 7698, 7566 매니저가 관리하는 사원의 사원번호, 사원명,
-- 매니저번호, 입사일, 직무 조회
select		EMPNO, ENAME, MGR, HIREDATE, JOB --블럭 잡힌거만 실행 : ctrl + F7
from      emp
--where     mgr =7902 or mgr = 7698 or mgr = 7566; -- || java로 생각하면 안됨
where			mgr in(7902,7698,7566);


-- 사원테이블에서 보너스를 받는 사원들의 사원번호, 연봉, 보너스, 사원명, 직무를 조회하기
-- null은 관계연산자로 비교할 수 없다. !=, <>로 할 수없다
-- is null, is not null
select	EMPNO, SAL, COMM, ENAME, JOB
from    emp
where		comm is not null;
--where   COMM != null;

-- 사원테이블에서 사원명이 'Allen'인 사원이 사원번호, 사원명, 입사일, 직무, 부서번호를 조회하기
select  EMPNO, ENAME, HIREDATE, JOB, DEPTNO
from		emp
where		ename like 'ALLEN';
--where   ENAME='ALLEN';


-- 사원테이블에서 사원명이 'A'로 시작하는 사원들의 사원명, 연봉, 직무, 입사일을 조회하세요.
select		ENAME, SAL, JOB, HIREDATE
from      emp
where     ename like 'A%';


-- 사원테이블에서 사원명이 'S'로 끝나는 사원들의 사원명, 연봉, 사원번호, 매니저번호, 입사일을 조회하세요.
select		ENAME, SAL, EMPNO, MGR, HIREDATE
from      emp
where     ename like '%ES';--' ' : 대소문자 가림!


-- 사원테이블에서 사원명이 'A'가 들어가있는 사원들의 사원명, 연봉, 사원번호, 입사일을 조회.
select    ENAME, SAL, EMPNO, HIREDATE
from 			emp
where     ename like '%A%';


-- 사원테이블에서 사원명이 'L'이 두개 있는 사원들의 사원명, 매니저번호, 직무를 조회. 
select  ename, mgr, job
from		emp
where		ename like '%L%L%';



select * from emp
