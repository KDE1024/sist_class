-- 계정관리.

--계정 생성.
-- orcle 12c 부터는 계정명 앞에 ##이 붙어서 만들어 진다.
-- ##을 사용하지 않는 계정을 생성하려면 _ORACLE_SCRIPT를 사용하면 된다.
/*session : 컴퓨터끼리의 연결.*/
alter session set "_ORACLE_SCRIPT"=true;

create user kde identified by 1234;

-- 생성된 계정정보를 확인하는 Data Dictionary
select * from dba_users; /*이런 종류의 테이블을 DD라고 함.*/

--생성된 계정에 권한 부여
-- 접속권한 : connect, 테이블 사용 권한 : resource, DBA 권한 : dba
-- 뷰 생성 권한 : create view, 시노님 생성권한 : create synonym ,,,

-- 권한 부여는 : grant
-- 접속권한
grant connect to kde;

-- tablespace 사용권한 : table 생성, 사용가능. Oracle 11g
grant resource to kde;

-- 특정 tablespace의 사용설정. Oracle 12c~
alter user kde default tablespace users quota unlimited on users;


-- 계정에 부여된 권한 조회 :  dba_role_privs
select * from dba_role_privs where grantee = 'KDE';

-- 권한 회수
-- 생성된 계정에 접속 권한을 회수.
revoke connect from kde;

-- 계정 잠그기
select * from dba_users; /**account_status 에서open과 locked 있음*/
alter user kde account unlock;

select * from user_objects;

-- 계정삭제
drop user kde cascade;






