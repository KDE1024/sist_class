select * from EMP;

-- 사원테이블에서 사원번호, 사원명, 부서번호, 부서명 조회
-- 단, 부서명은 아래표와 같이 한글로 된 부서명을 출력.

select  EMPNO, ENAME, DEPTNO, decode (deptno, 10,'개발부', 20,'유지보수부', 30, '운영','축구부') h_dname
from		emp;

select  EMPNO, ENAME, DEPTNO,
				case deptno when 10 then '개발부'
										when 20 then '유지보수부'
										when 30 then '운영'
				else '축구부'
				end as H_Dname
from		emp;


-- 사원테이블에서 사원번호, 사원명, 연봉, 총수령액, 직무별 보너스를 조회
-- 단, 직무별 보너스는 아래와 같다.
-- CLERK- 연봉 10%의 보너스, SALESMAN -연봉+comm 합산금액 20%
-- MANAGER - 연봉 15% 보너스, ANALYST - 연봉 30%, PRESIDENT -연봉 150%

select  empno, ename, sal, sal+nvl(comm,0) as total_sal, job,
        case job when 'CLERK' then sal*0.1
        				 when 'SALESMAN' then (sal+comm)*0.2
        				 when 'MANAGER' then sal*0.15
        				 when 'ANALYST' then sal*0.3
--       				 when 'PRESIDENT' then sal*1.5
					 			 else sal*1.5
				end as bonus
from		emp;

--------------------------------order by------------------------------------------
-- 사원테이블에서 사원번호, 사원명, 연봉, 입사일을 조회
-- 단, 가장 마지막에 입사한 사원부터 조회될 것.
select  empno, ename, sal, hiredate
from		emp
order by hiredate desc;

-- 사원테이블에서 사원번호, 사원명, 연봉, 입사일, 부서번호 조회
-- 단, 부서번호의 오름차순으로 정렬하되, 부서번호가 같다면 연봉의 오룸차순으로 정렬,
-- 연봉이 같다면 사원명의 오름차순으로 정렬
select		empno, ename, sal, hiredate, deptno
from			emp
order by	deptno, sal, ename;

-- 사원테이블에서 사원번호, 사원명, 연봉, 직무, 부서번호,
-- 단, 직무의 내림차순으로 정렬하되, 직무가 같다면 연봉의 오름차순으로 정렬하고,
-- 연봉이 같다면 입사일의 내림차순으로 정렬.
select  	empno, ename, sal, job, deptno, hiredate
from			emp
order by  job desc, sal, hiredate desc;


--------------------------------순위함수----------------------------------------
-- 사원테이블에서 사원번호, 사원명, 연봉, 연봉의 순위 조회
-- 동일 순위가 발생. 동일 순위 이후에는 순위가 건너 뛴다.

select    EMPNO, ENAME, SAL, rank() over(order by sal) as rank
from			emp;

select    EMPNO, ENAME, SAL, row_number() over(order by sal desc) as rank
from			emp;


---- 분류별 순위 설정. partotion by 사용.
---- 사원번호, 사원명, 부서번호, 연봉, 순위를 조회.
---- 사원테이블에서 부서별로 낮은 연봉부터 순위를 조회. (중복순위는 발생하지 않는다.)
select    EMPNO, ENAME, DEPTNO, SAL, row_number() over (partition by deptno order by sal) rank
from			emp;


-- 사원테이블에서 사원번호, 사원명, 부서번호, 매니저번호, 연봉을 조회
-- 단, 매니저별로 높은 연봉부터 순위를 조회하세요.(중복순위는 발생하지 않는다.)
select  EMPNO, ENAME, DEPTNO, SAL, row_number()over(partition by mgr order by sal) rank
from		emp;


-------------------------------------집계함수(그룹함수)--------------------------------------------
--컬럼값을 모아 하나로 만드는 함수.
--사원ㅌ이블에서 전체 사원수 조회
select  count(empno) /* ename 여러행이 조회되는 컬럼과 같이 사용되면 에러 발생. */
from		emp;-- 한 행으로 나옴

-- count는 null인 컬럼에 대해서는 집계에 포함하지 않는다.
select  count(comm), count(mgr)
from		emp;

-- 사원테이블에서 전체사원수, 보너스를 받는 사원수, 보너스를 받지 않는 사원수를 조회.
select  count(empno), count(comm), count(empno)-count(comm)
from		emp;

-- 사원테이블에서 일년에 연봉으로 지출되는 총액, 보너스로 지출되는 총액, 전체총액을 조회.
-- sum()은 숫자 컬럼만 넣을 수 있다.
select	sum(sal),sum(comm), sum(sal)+sum(comm)
from		emp;

-- avg()는 숫자컬럼만 넣을 수 있다.
-- 사원테이블에서 연봉평균, 실수를 제외한 연봉평균, 보너스 평균을 조회
select  avg(sal) , trunc(avg(sal),0), avg(comm)
from		emp;

-- max(), min() 숫자컬럼만 넣을수 있다.
-- 사원테이블에서 연봉의 최고값,
select  max(sal), min(sal)
from		emp;


------------------------
-- 사원테이블에서 평균연봉보다 많이 받는 사원의
-- 사원번호, 사원명, 입사일, 연봉을 조회.
select  empno, ename, hiredate, sal
from		emp
where		sal>avg(sal);
