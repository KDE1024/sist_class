-- alter 의 사용 
create table test_alter(
	num number,
	neam varchar2(30),
	age number(2),
	addr number
);

-- 컬럼명 변경
-- neam -> name
alter table test_alter rename column neam to name;

-- 컬럼의 데이터형 변경
-- addr 컬럼의 데이터형을 number -> varchar2(300) 변경.
-- 레코드가 존재하면 동일 데이터형에서 크기만 변경되고 ,
-- 레코드가 존재하지 않으면 데이터 형 자체도 변경 가능하다.
alter table test_alter modify addr varchar(300);

-- 레코드 추가
insert into test_alter ( num, name, age, addr)
values(1,'박기범',27,'서울시 강남구 역삼동');

commit;

-- 레코드가 존재하면 데이터형을 변경할 수 없다.
alter table test_alter modify addr number;

-- age 를 number(2) -> number(22)로 변경.
alter table test_alter modify age number(22);


-- 컬럼 삭제
-- age 컬럼 삭제.
alter table test_alter drop column age;

truncate table test_alter;-- 테이블 절삭!(레코드 삭제)

-- 컬럼 추가(컬럼 단위 제약사항을 추가할 수 있다.)
-- id 컬럼 추가(PK)
alter table test_alter add id varchar2(20) constraint pk_test_alter primary key;

-- DD에서 제약사항 조회
select * from user_constraints where table_name ='TEST_ALTER';

-- 컬럼을 변경할떄도 제약사항을 설정할 수 있다.
-- name varchar2(15)로 필수입력 제약을 설정. -> not null
alter table test_alter modify name varchar2(15) not null; -- 이름을 반드시 입력해야 합니당.

-- 제약사항 변경.
-- PK가 활성화 되어있으므로 같은 id는 추가될 수 없다.
insert into test_alter (id, name) values ('kim','김덕영');
--insert into test_alter (id, name) values ('kim','곽범수'); -- 여기선insert 안됨. 제약사항 걸려있으니까.

-- 제약사항의 비활성화.
alter table test_alter disable constraint pk_test_alter;
select * from user_constraints where table_name ='TEST_ALTER'; /*statusdp disable 된 거 확인.*/

insert into test_alter (id, name) values ('kim','곽범수');

-- 제약사항을 활성화. (제약사항에 위배되는 레코드가 존재하면 제약사항이 활성화되지 않는다.)
--alter table test_alter enable constraint pk_test_alter; -- 여기선 변경 안됨. 위배되는 레코드 있어서.
delete from test_alter where name='곽범수';
commit;

alter table test_alter enable constraint pk_test_alter;
select * from user_constraints where table_name ='TEST_ALTER';  /*statusdp enable 된 거 확인.*/

-- 제약사항 삭제.
-- primary key를 삭제하면 not null은 삭제되지 않는다.
-- DBA가 부여한 제약사항명으로 삭제.
alter table test_alter drop constraint pk_test_alter;
select * from user_constraints where table_name ='TEST_ALTER'; -- p 지워진거 확인....

-- 자동으로 부여된 제약사항명으로 삭제.
alter table test_alter drop constraint SYS_C007533;

-- 제약사항 추가. (테이블 단위 제약사항 문법)
-- id 컬럼에 PK제약 추가.
alter table test_alter add constraint pk_test_altet primary key(id);
select * from user_constraints where table_name ='TEST_ALTER'; -- pk 생김.


                                                  
select * from TEST_ALTER;  