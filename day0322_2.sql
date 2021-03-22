-- distinct를 사용한 중복배제
-- 사원 테이블에서 부서 번호를 조회.
-- 단, 같은 부서번호는 조회하지 않는다.
-- 여러행이 조회되는 컬럼과 같이 사용되더라도 에러가 발생하지 않는다.
select  distinct deptno, empno
from		emp;


-- group by를 사용한 중복배제
-- 여러행이 조회되는 컬러과 같이 사용되면 에러가 발생한다.
select  		deptno
from      	emp
group by		deptno;

-- 사원테이블에서 사원수가 3명을 초과하는 부서의 부서번호, 사원수를 조회.
select			deptno, count(deptno)
from				emp
group by    deptno
having      count(deptno)>3; --집계함수 쓸 수 있음


--group by 와 집계함수를 쓰면 그룹별 집계를 얻을 수 있다.
-- 사원테이블에서 부서별/*무언가를 합쳐야 된다는 말 -> group by*/ 인원수, 최고연봉, 최저연봉, 평균연봉을 조회.
select    	deptno, count(deptno), max(sal), min(sal), trunc(avg(sal),0)
from				emp
group by		deptno
order by		deptno;

-- 사원테이블에서 매니저가 관리하는사원이 2명 이상인 매니저별, 관리사원 수, 평균연봉, 최고연봉, 최저연봉 조회.
-- 매니저번호의 내림차순으로 정렬하여 조회.
select    mgr, count(empno),avg(sal), max(sal), min(sal)
from			emp
group by	mgr
having		count(empno)>3
order by	mgr desc;



-- 그룹별 총합 출력.
-- 사원테이블에서 부서별 연봉합과 총합을 조회.
-- rollup :  그룹별 합계를 출력하고, 총합을 나중에 출력한다.
select      deptno, sum(sal)
from       	emp
group by		rollup (deptno);


-- cube : 총합을 먼저 출력하고, 그룹별 합계를 출력한다.
select      deptno, sum(sal)
from       	emp
group by		cube (deptno);


-- 소계, 총합계를 조회할 때
-- 사원테이블에서 부서별 직무의 합, 소계와 총합을 조회
select    deptno,job, sum(sal)
from    	emp
group by  cube(deptno, job);


--
select    deptno,job, sum(sal)
from    	emp
group by  rollup(deptno, job);


-- 사원테이블에서 매니저별 부서의 연봉합과 소계, 총합을 cube와 rollup을 사용하여 조회.  /////
select    mgr, sal, sum(sal)
from    	emp
group by  cube(mgr,sal);

--
select    mgr, sal, sum(sal)
from    	emp
group by  rollup(mgr,sal);

