 /*숙제1.
 사원 테이블에서 연봉이 1500~3000사이인 사원의
  사원번호, 사원명, 연봉, 입사일, 부서번호, 직무,매니저번호를 조회하여
  emp_work테이블에 생성하여 추가합니다.*/
select * from emp_work;

create table emp_work(
empno number(4),
ename varchar2(10),
sal number(7,2),
hiredate date,
deptno number(2),
job varchar2(9),
mgr number(4)
);
commit;

insert into emp_work
(select empno, ename, sal, hiredate, deptno, job, mgr
from		emp
where		sal between 1500 and 3000);

/*숙제2.
  emp테이블에서 10번 30번 부서의 사원 정보를 조회하여 emp_work테이블에
  조회 결과를 추가합니다.
   단, 사원번호는 조회된 사원번호에 1000을 더한 값으로 추가할 것.*/
insert into emp_work
(select  EMPNO+1000, ENAME, SAL, HIREDATE, DEPTNO, JOB, MGR
from		EMP
where   DEPTNO in (10,30));

/*숙제 3.
 emp_work 테이블에서 10번 부서에 근무하는 사원들의 연봉을  emp테이블의
  사원번호가 7369번 사원 연봉과 7782번 사원의 연봉을 더한 금액으로 변경하세요.*/
select deptno, ename, sal from emp_work where deptno=10;
select sal from emp where empno in (7369, 7782);--3250
select * from emp_work;

update	emp_work
set     sal=(select sum(sal) from emp where empno in (7369, 7782))
where   deptno=10;

/*숙제4.
 제조사가 '현대'에서 만든 차량의 모델명, 연식, 가격, 옵션, 입력일을 조회하세요.
   단, 가격의 내림차순으로 정렬 했을 때 2~5번째 레코드만 출력 합니다.
*/
select * from car_country;
select * from car_model;
select * from car_maker;

select	model, car_year, price, car_option, hiredate, h_num
from		(select	model, car_year, price, car_option, hiredate,
								row_number()over(order by price desc) h_num
				from		car_model
				where		model in (select model from car_maker where maker='현대'))
where		h_num between 2 and 5;












