--------------------------- select subquery----------------------------
-- 단수행.
-- emp 테이블에서 사원번호가 '7369'번 사원이 근무하는 부서번호를조회하여
-- cp_emp1 테이블에 같은 부서사원의 정보를 모두 조회.
select * from emp;
select * from cp_emp1;

select		empno, ename, deptno, job, sal
from			cp_emp1
where 		deptno = (select deptno from emp where empno = 7369);

-- 모델명이 '그랜저'인 차량의 제조국을조회.

select  country
from		car_country
where		maker =(select maker from car_maker where model='그랜저');

-- 제조사가 '현대'인 차량의 모델명, 연식, 가격, 옵션을 조회.
select	model, car_year, price, car_option
from	  car_model
where model in (select model from car_maker where maker='현대');


-------------------- scalar subquery----------------------
-- 조회된 값을 사용하여 다른 테이블의 컬럼값을 조회하여 보여줄 때.
-- 사원번호, 사원명, 부서번호, 부서명 조회.
select  empno, ename, deptno,
				(select dname from dept where dept.deptno=emp.deptno/*같은이름이 2개의 테이블에 있음*/) dname
from 		emp;


-- car_model, car_maker 사용.
-- 2012년식 차량의 모델명, 년식, 가격, 옵션, 입력일, 이미지, 제조사를 조회하기.
select * from CAR_MAKER;
select * from CAR_MODEL;

select  MODEL, CAR_YEAR, PRICE, CAR_OPTION, CAR_IMG,
				(select maker from car_maker where car_maker.model=car_model.model)maker
from    car_model
where		car_year='2012';


-- select 다중행subquery (검색된 결과를 가지고 재조회: inline view를 사용한 조회)
-- alias 가 실제 컬럼명처럼 사용.
select    empno, ename, job, sal, hi       -- inline view에 존재하는 컬럼과 레코드를 검색.
from			(select empno, ename, sal, job, hiredate as hi from emp)
where			to_char(hi,'yyyy')='1980';


------------------------------------ rownum------------------------------------
-- 사원테이블에서 입사년도가  '1981'년인 사원들의 순차번호, 사원번호,사원명, 입사일을 조회.
-- 조회결과에 가상번호를 사용.
select * from emp;

select		rownum, empno, ename, hiredate
from			emp
where			to_char(hiredate, 'yyyy') = '1981';

-- rownum은 order by 보다 먼저 생성되므로 정렬하게되면 번호가 섞인다.
-- 사원 테이블에서 순차번호, 사원번호, 사원명, 직무를 조하세요.
-- 단, 사원명의 오름차순으로 정렬하여 조회.
select		rownum, empno, ename, job
from      emp
order by	ename;

-- 1번부터는 검색이 되지만 그 이후의 번호는 검색되지 않는다.
-- 사원테이블에서 번호, 사원번호, 사원명을 조회.
-- 단, 번호가 2~5번 까지의 레코드만 출력.
select  rownum, empno,ename
from  	emp
--where		rownum between 2 and 5;
where   rownum >=2 and rownum <6;


-- select 마다 같은 이름으로 따로 사용된다.
select  rownum, rnum, ename, empno
from		(select rownum rnum, ename, empno from emp order by ename);


-- 사원테이블에서 가장 마지막에 입사한 이전 사원부터 5건의 사원정보를 조회. -- 2번부터 조회 어떻게하는 겅미,
-- (2~6번까지 조회)
-- 가장 마지막에 입사한 사원에게 1번을 부여한다.
select hiredate from emp order by hiredate desc;

-------------------------------------------------------------
select rnum, empno, ename, job, hiredate
from	(select	rownum rnum, EMPNO, ENAME, JOB, HIREDATE-- rownum은 1번부터만 조회되므로 rownum을 실제 컬럼처럼인식 시키면됨.
			from (select 		EMPNO, ENAME, JOB, HIREDATE
						from			EMP
						order by 	hiredate desc))
where	rnum between 2 and 6;
-------------------------------------------------------------
select empno, ename, job, hiredate, rnum
from		(select	empno, ename, job, hiredate,
							row_number()over(order by hiredate desc) rnum
					from		emp)
where		rnum between 2 and 6;
--------------------------------------------------------------


-- 우편 번호 테이블에서 '시도'가 서울인 레코드를 dong의 내림차순으로 정렬했을 때
-- 150~200번 사이의 레코드를 출력.
-- 단, 번지가 null 이면 '번지없음' 으로 조회
-- 조회컬럼 : 우편번호, 시도, 구군, 동, 번지 조회
select*from zipcode;

-- 내가 한거 //zipcode 빼먹음
select	rnum, SIDO, GUGUN, DONG, BUNJI
from		(select 	SIDO, GUGUN, DONG, BUNJI,
									row_number()over(order by	dong desc) rnum
				from 		  zipcode
				where			sido =  '서울')
where		rnum between 150 and 200;

-- 선생님이 해주신것
select	zipcode, sido, gugun, dong, nvl(bunji,'번지없음') -- -> 여기서하면 50건 /*, flag_num */
from	 (select	zipcode, sido, gugun, dong, bunji/*-> 여기서nvl하면 8천건 */,
								row_number()over(order by	dong desc) flag_num
				from	zipcode
				where sido='서울')
where		flag_num between 150 and 200;

select *
from	user_tab_cols;  