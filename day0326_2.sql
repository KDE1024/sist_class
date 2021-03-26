-- outer join(한쪽 테이블에만 레코드가 존재하더라도 조회가능.)
-- 존재하는  모든 부서의 부서번호, 부서명, 위치, 사원번호, 사원명을 조회.

-- ANSI
select            d.deptno, d.dname, d.loc, e.empno, e.ename
from							dept d
left outer join 	emp e
on                e.deptno=d.deptno;

-- Oracle outer join
-- (+) 레코드가 없는 컬럼에 붙인다.
select	d.deptno, d.dname, d.loc, e.empno, e.ename
from    dept d, emp e
where   (e.deptno(+)=d.deptno); -- emp table에 deptno가 없으니까 emp에 (+) 붙여줌.-> 40번 부서 나옴.


-- 레코드가 존재하지 않는 테이블을 선택하면 조회결과가 나오지 않는다.
select      d.deptno, d.dname, d.loc, e.empno, e.ename
from				dept d
right join	emp e
on          e.deptno=d.deptno;/*40번 부서 안나옴*/

--
select      d.deptno, d.dname, d.loc, e.empno, e.ename
from				emp e
right join	dept d
on					e.deptno=d.deptno;/*join뒤에 나오는 테이블에 레코드가 있으니까 40번부서 나옴.*/

-- Oracle outer join
-- 레코드가 존재하는 컬럼에 (+) 소용x.
select	d.deptno, d.dname, d.loc, e.empno, e.ename
from    dept d, emp e
where   (e.deptno=d.deptno(+));

-- 레코드의 구성을 잘 모르지만 모든 레코드를 조회해야한다면, full outer join을 써야한다.
select      d.deptno, d.dname, d.loc, e.empno, e.ename
from				dept d
full join		emp e
on          e.deptno=d.deptno;/*레코드가 섞여서 나옴. -> 효율 떨어짐 -> 그래서 오라클에선 안씀*/
s
-- Oracle outer join
-- (+) 기호는 양쪽에 붙일 수 없다.
select	d.deptno, d.dname, d.loc, e.empno, e.ename
from    dept d, emp e
where   (e.deptno(+)=d.deptno(+));


-- 모든 부서에 근무하는 사원들의 부서번호, 부서명, 위치, 사원번호, 사원명,
-- 우편번호,시도, 구군, 번지를 조회
-- 단, 부서에 근무하는 사원이 존재하지 않으면 사원번호에 '0'번을 사원명'없음'을 대신 조회한다.

--  ANIS : 레코드가 있는 쪽
select    d.deptno, d.dname, d.loc, nvl(e.empno, 0)empno, nvl(e.ename,'없음') ename,
					z.zipcode, z.sido, z.gugun, z.dong, z.bunji
from      dept d
left join emp e
on        e.deptno=d.deptno
left join zipcode z
on        z.seq=e.empno;


-- Oracle : 레코드가 없는 쪽
select    d.deptno, d.dname, d.loc, nvl(e.empno, 0)empno, nvl(e.ename,'없음') ename,
					z.zipcode, z.sido, z.gugun, z.dong, z.bunji
from      dept d, emp e, zipcode z
where			(e.deptno(+)=d.deptno and z.seq(+)=e.empno);



-----------------------------------------------------------------
-- 사워네이블에서 사원명이 'WARD' 인 사워보다 연봉을 많이 수령하는 사원의
-- 사원번호, 사원명, 연봉, 직무, 입사일 조회.
select * from emp;

select  empno, sal, job, hiredate
from    emp
where		sal>(select sal from emp where ename='WARD');


-- self join : 조회용 테이블과 조건용 테이블을 잘 구분하여 사용할 것.
select e1.empno, e1.ename, e1.sal, e1.job, e1.hiredate,
			 e2.ename,/*조건용을 조회용으로->필요없음*/
			 e2.empno -- 조건용을 조회용으로 올리면 필요 없는 것만 나옴.
from   emp e1, emp e2
where  (e1.sal > e2.sal)and e2.ename='WARD';
			/*조회용 연봉이 조건용 연봉보다 많으면*/

-- 조인조건을 잘못 설정하면 모든 레코드의 합이 조회되어 나오는 Cartesion product이 발생할 수 있다.
select  e.empno, e.ename, d.deptno, d.dname
from		dept d, emp e;
