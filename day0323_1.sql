select * from EMP;

-- 사원테이블에서 입사일이  23일인 사원의 사원번호, 사원명, 직무, 매니저 번호, 입사일, 연봉을 조회하여
-- cp_emp3테이블에 추가하세요. //복수행  subquery
insert into cp_emp3
(select  EMPNO, ENAME, JOB, MGR, HIREDATE, SAL
from    emp
where		to_char(hiredate,'dd')=23);

commit;

select * from CP_EMP3;

select * from car_country;--제조국
select * from car_maker;-- 제조사
select * from car_model;--차량정보


-- 5초와 6초에 판매된 차량의 모델명, 총가격, 평균 연식을 조회
select   	model,sum(PRICE) total_price, trunc(avg(CAR_YEAR),0) avg_car_year
from    	car_model
where			to_char(HIREDATE,'ss') in ('05','06')
group by  model;

create table car_sales(
		model varchar2(30),
		total_price number,
		avg_car_year number,
		input_date date);


-- 5초와 6초에 판매된 차량의 모델명, 총가격, 평균 연식을 조회하여 차랑판매-
-- 테이블에 추가.
insert into car_sales
(select   	model,sum(PRICE) total_price, trunc(avg(CAR_YEAR),0) avg_car_year,
						sysdate
from    	car_model
where			to_char(HIREDATE,'ss') in ('05','06')
group by  model);

select * from car_sales;

-----------------------------update subquery---------------------------------------
select * from cp_emp1;
-- 사원번혹 1213이면서 사원명이 '이학민'인  사원의 연봉을
-- 사원번호가 1212인 사원의 연봉과 같도록 변경.
update  cp_emp1
set     sal=(select sal from cp_emp1 where empno=1212)
where		empno=1213 and ename='이학민';

commit;

-- cp_emp2 테이블에서 7698 매니저가 관리하는 사원의 연봉을 cp_emp1 테이블의
-- 사원번호가 1213인 사원의 연봉으로 변경. (5명의 연봉을 변경해라!->복수행 subquery!!)
--(근데 update는 단수행 subquery만 됨.)
select * from cp_emp2;

update  cp_emp2
set    	sal=(select sal from cp_emp1 where empno=1213)
where   empno in (select empno from cp_emp2 where mgr=7698);

commit;

-------------------------------delete subquery-------------------------------------
select * from cp_emp4;

create table cp_emp4 as (select empno, ename, deptno, job, hiredate from emp);

-- cp_emp1 테이블에서 사원번호가 '7566'인 사원이 근무하는 부서번호를 조회하여,
-- cp_emp4 테이블에서 해당 부사의 근무하는 사원을 모두 삭제하세요. (-> 20번 부서 모두 삭제됨)

delete from cp_emp4
where			  deptno = (select deptno from cp_emp1 where empno=7566);

commit;

-- cp_emp1 테이블에서 10번 부서에 근무하는 사원번호를 조회하여,
-- cp_emp4 테이블에 일치하는 사원정보를 삭제하세요. (->10번부서 모두 삭제됨)

delete from cp_emp4
where       empno in (select empno from cp_emp1 where deptno=10);

select * from cp_emp4;   