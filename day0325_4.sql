-- union : 서로다른 테이블 위·아래로 조합하여 조회.
-- emp : 한국 본사 사원정보, cp_emp1 : 미국 지사 사원정보.
-- 본사와 지사 사원정보를 조회.
-- 조회 칼럼은 사원번호, 사원명,직무 연봉
select  empno, ename, job, sal
from		emp

union

select	empno, ename, job, sal
from		cp_emp1;

-- union : 중복데이터를 조회하지 않는다.

-- union all : 중복데이터를 조회한다.
select  empno, ename, job, sal
from		emp

union all

select	empno, ename, job, sal
from		cp_emp1;


-- <   Error.   >
--  (1) 컬럼의 데이터형이 일치하지 않는 경우.
select  empno, ename, sal, job
from		emp

union all

select	empno, ename, job, sal
from		cp_emp1;

-- (2) 컬럼의 개수가 일치하지 않는 경우.
select  empno, ename, sal, job
from		emp

union all

select	empno, ename, job
from		cp_emp1;


-- 정상 조회.
select  empno, ename, job, sal
from		emp
where		deptno=10

union all

select	empno, ename, job, sal
from		cp_emp1
order by empno;/*마지막 쿼리에서만 가능. 아니면 subquery로 넣던가.*/



















