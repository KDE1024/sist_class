select * from dba_sys_privs
where grantee='SCOTT';

--scott 계정에 시노님 권한 부여
grant create synonym to scott;

--scott 계정에 시노님 권한 회수
revoke create synonym from scott;

-- 시노님 생성
-- car_model 테이블에  'cmo' 라는 이름의 synonym 을 부여하기.
create synonym cmo for car_model;


-- synonym 을 조회하는 Data Dictionary
select * from user_synonyms;

-- synonym명 사용
select * from cmo;

-- 실제 테이블명 사용
select * from car_model;


-- 시노님 삭제
drop synonym cmo;


----------------------------------------  View   ---------------------------------------------
select * from user_views;

grant create view to scott;
revoke create view from scott;


select * from dba_sys_privs
where	grantee = 'SCOTT';


-- 단순뷰. cp_emp4 table를 사용한 단순 뷰 생성 : 뷰이름  view_emp
create view view_emp
as select * from cp_emp4;

select * from user_views;

-- view를 사용한 조회
select * from view_emp;
-- 실제 테이블 조회
select * from cp_emp4;

-- 실제 레코드에 작업을 하면 view에 바로 반영된다.
insert into cp_emp4(empno, ename, deptno, job, hiredate)
values (1234,'박기범',10,'사원',sysdate);

update	cp_emp4
set     deptno=20, job='대리'
where   empno=1234;

delete from cp_emp4 where empno=1234;

select * from view_emp;

-- 단순 view 작업
-- insert
insert into view_emp(empno, ename, deptno, job, hiredate)
values (1234,'박기범',10,'사원',sysdate);

-- update
update	view_emp
set     deptno=20, job='대리'
where   empno=1234;

--delete
delete from view_emp where empno=1234;

-- view 삭제
drop view view_emp;

-- 실제 테이블에서 조회.
select * from cp_emp4;
select * from view_emp;


-- 복합뷰 : 여러개의 테이블로 도출된 뷰.
create table cp_dept as select * from dept;
select * from cp_dept;

--cp_dept 테이블의 부서번호컬럼에 PK설정.
alter table cp_dept add constraint pk_cp_dept primary key (deptno);

-- cp_emp4 테이블의 deptno 컬럼에 FK를 설정.
alter table cp_emp4 add constraint fk_cp_emp4_deptno
			foreign key (deptno) references cp_dept(deptno);

select * from user_constraints where table_name in ('CP_DEPT','CP_EMP4');


-- join을 사용한 복합 뷰의 생성.
create view emp_data as
select  cd.deptno, cd.dname, cd.loc, ce4.empno, ce4.ename, ce4.job, ce4.hiredate
from 		cp_dept cd, cp_emp4 ce4
where   ce4.deptno(+)=cd.deptno;


select * from user_views;

-- view의 조회 : 단순 쿼리로 join의 결과를 사용할 수 있다.
select * from emp_data;

select  deptno, dname, empno, job
from    emp_data
where		deptno in(30,20);  /*단순 결과지만 난 join된 채로 쓰고 있음.*/

-- 부서 정보 추가
insert into cp_dept(deptno, dname, loc) values(50,'개발부','서울');--하나의 테이블에 값을 넣었지만 바로바로 업데이트됨
commit;

insert into cp_emp4(empno, ename, deptno, job, hiredate) values (1111,'곽범수',50,'대리',sysdate);
-- view 조회
select * from emp_data;

-- 복합뷰에 insert, update, delete 작업수행. -> 안됨.
-- insert 안됨.
insert into emp_data(deptno, dname, loc, empno, ename, job, hiredate)
values (60,'유지보수','대구',1212,'김덕영','사장',sysdate);

-- update 안됨.
update  emp_data
set  		job='대표'
where   empno=1111;

--delete
delete from emp_data where empno=1111;

--
drop view emp_data;

select * from user_views;