-- 한 줄 주석.
/*
여러줄 주석.
*/

select * from tab;


select * from test;

--레코드 삽입.(insert하는 순서대로 입력되지 않는다.)
--컬럼명을 생략하여 추가.
--(컬럼의 순서에 유의하여 추가한다. : 값이 다른 컬럼에 입력되는 것에 주의)

insert into test values(1, '박기범', 24,sysdate);
--2번, 강인섭, 26, 현재날짜
insert into test values(2, '강인섭',26, sysdate);

--컬럼명을 기술하여 레코드를 삽입.(특정 컬럼에만 값을 입력, 생략된 컬럼에는 null이 입력된다.)
--3번, 김덕영을 추가
insert into test(num,name)values(3,'김덕영');

--27, 현재날짜
insert into test(age, input_date) values(27, sysdate);
--transaction 완료
commit;

-----------------------------select-----------------------------------

select name, age
from   test;


-- test 테이블에서 모든 레코드의 입력일 만 조회
select input_date
from   test;



-- 부서테이블에서 부서번호, 부서명, 위치 조회
select   deptno, dname, loc
from     dept;

-- 사원테이블에서 사원번호, 사원명, 직무, 부서번호 조회
SELECT  EMPNO, ENAME, JOB, DEPTNO
FROM EMP;

-- 조회 컬럼에 *을 사용하면 컬럼명을 몰라도 모든 컬럼에 대해 조회를 할 수 있다.
SELECT *
FROM   TEST;


-- test 테이블에서 이름이 '김덕영'인 사람의 나이를 26으로 입력일을 변경하는
-- 시점의 날짜정보로 설정하세요.


update	test
set     age=26, input_date=sysdate
where   name='김덕영';

commit;

select	*
from		test;

-- 사원테이블에서 사원번호가 7839인 사원의 사원명을 '진재혁' 직무를 '관리',
-- 연봉을 2000으로 변경.

update	EMP
set			ENAME = '진재혁', JOB='관리', SAL=2000
where	  EMPNO=7839;

rollback;--작업취소

select * from test;
-----------------------delete--------------
--모든 레코드 삭제
delete from test;
rollback;


--특정 레코드 삭제.
--test 테이블에서 번호가 1번인 레코드를 삭제.
delete from  test
where num=1;

----------------------truncate ------------
--test 테이블의 모든 레코드를 절삭.
truncate table test;
--runcate는 transaction대상 쿼리가 아니므로 rollback으로 작업을 취소할 수 없다.
rollback;

select * from TEST;

purge recyclebin;

-------------------------drop----------------
--test 테이블을 삭제
drop table test;

--휴지통 비우기
purge recyclebin;

--휴지통에 있는 테이블 복구하기.
flashback table test to before drop;

