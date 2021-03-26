--------------------------join-------------------------------------
-- 부서에 사원이 존재하는 경우에만
-- 사원번호, 사원명, 입사일, 부서번호.
-- ANSI
-- 양쪽 테이블에 존재하는 컬럼은 컬럼명을 사용할 때 테이블명. 컬럼명을 사용한다.
-- 컬럼이 어떤 테이블에 존재하는 지 알기 어렵다.
select      empno, ename, hiredate, dept.deptno, dname,loc
from				dept
inner join  emp
on          emp.deptno=dept.deptno;

-- 컬럼이 어떤 테이블에 존재하는지 알 수 있도록 컬럼명 앞에 테이블명을 명시하여 사용한다,
-- 조회 컬럼에 작성하는 코딩량이 늘어난다.
select      emp.empno, emp.ename, emp.hiredate, emp.deptno, dept.dname,dept.loc
from				dept
inner join  emp
on          emp.deptno=dept.deptno;

-- 테이블명에 alias를 부여하여 컬럼이 속한 테이블을 명시하고, 짧은 코드로 사용할 수 있게된다.
-- 테이블명에 alias를 부여 : 테이블명 alias

-- ANSI
select      e.empno, e.ename, e.hiredate, e.deptno, d.dname,d.loc
from				dept d
inner join  emp  e
on          e.deptno=d.deptno;

-- Oracle
select  e.empno, e.ename, e.hiredate, e.deptno, d.dname,d.loc
from    dept d, emp e
where   e.deptno=d.deptno;


-- 연봉이 1000이상 3000이하인  사원번호, 사원명, 입사일, 부서번호, 부서명, 위치를 조회하세요.

-- ANSI
select     e.empno, e.ename, e.sal, e.hiredate, d.deptno, d.dname, d.loc
from		   emp e
inner join dept d
on         e.deptno=d.deptno
where      e.sal between 1000 and 3000
order by	 sal;


-- Oracle
select 		e.empno, e.ename, e.sal, e.hiredate, d.deptno, d.dname, d.loc
from   		emp e, dept d
where  		(e.deptno=d.deptno /*조인조건*/) and e.sal between 1000 and 3000/*검색조건 */
order by	e.sal;


-- 보유중인 차량에서 배기량이 1600 이상 3000 이하인 모든 차량의 제조사, 모델명, 연식, 배기량, 가격을 조회하세요.

-- ANSI
select     cma.maker, cma.model, cmo.car_year, cmo.cc, cmo.price
from       car_maker cma
inner join car_model cmo
on         cmo.model=cma.model    --pk가 있는 maker가 driving key가 된다.
where			 cmo.cc between 1600 and 3000
order by	 cmo.cc;

-- Oracle
select    cma.maker, cma.model, cmo.car_year, cmo.cc, cmo.price
from      car_maker cma, car_model cmo
where     (cmo.model=cma.model) and  cmo.cc between 1600 and 3000
order by	cmo.cc;


--------------------------------- 테이블 3개를 조인하기.--------------------------------------
-- 사원번호, 사원명, 연봉, 부서번호, 부서, 위치, 우편번호, 시도, 구군, 동.
-- 사원테이블의 사원번호와 우편번호테이블의 seq를 조인조건으로 사용.
/*레코드가 적어서 emp table이 조인 조건이되는게 좋음.*/

-- ANSI
select * from ZIPCODE;

select       e.empno, e.ename, e.sal, d.deptno, d.dname, d.loc, z.zipcode, z.sido,z.gugun, z.dong
from         dept d
inner join   emp e
on           e.deptno=d.deptno /*검색되는 키가 뒤로와야됨.*/
inner join   zipcode z
on           z.seq=e.empno;

-- Oracle
select		e.empno, e.ename, e.sal, d.deptno, d.dname, d.loc, z.zipcode, z.sido,z.gugun, z.dong
from      dept d, emp e, zipcode z
where     (e.deptno=d.deptno and z.seq=e.empno);  