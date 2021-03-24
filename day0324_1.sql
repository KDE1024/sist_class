
/*유일한 값을 가져야돼 -------->> primary key를 넣으세용~~~~~*/

-- 컬럼 단위 제약사항 primary key를 설정.
-- 이름, 전화번호, 아이디를 저장하는 테이블 생성.

-- 컬럼명 데이터형(크기) primary key - 제약사항명이 자동으로 생성됨.
-- sys_00939, 제약사항명으로 어떤 제약을 위배하였는지 알 수 없다.
drop table  primary_column;

create table primary_column(
	name varchar2(20),
	phone varchar2(13),
	id varchar2(20) constraint pk_primary_column primary key
);

-- 제약사항을 조회하기.
select * from user_constraints
where	table_name='PRIMARY_COLUMN';

-- < primary key가 들어갔을 때 추가성공하는 경우. >
-- 1. 최초 입력하는 경우 (성공)
insert into primary_column(name, phone, id) values ('한상민','010-1234-5678','han');
-- 2. 아이디가 다를 때. (성공) - 다 같아도, 프라이머리 키만 다르면 됨.
insert into primary_column(name, phone, id) values ('한상민','010-1234-5678','han1');



-- < 추가 실패하는 경우. >
-- 1. null이 입력될 때.
--   (1)컬럼명이 생략되는 경우. (Error)
insert into primary_column(name, phone) values ('한상민','010-1234-5678');
--   (2)' '가 입력되는 경우 (Error)
insert into primary_column(name, phone, id) values ('한상민','010-1234-5678','');

-- 2. 같은 값이 입력되는 경우 (Error)
insert into primary_column(name, phone, id) values ('이상철','010-2222-3333','han1');

select * from primary_column;




-- 테이블 단위 제약사항. (컬럼의 정의와 제약사항의 정의를 분리하여 작성할 수 있다.)
create table primary_table (
	name varchar2(20),
	phone varchar2(13),
	id varchar2(20),
	constraint pk_primary_table primary key(id)  --alter 문법
	);
select * from primary_table;


-- 추가 성공.
insert into primary_table (name, phone, id)
						values ('진재혁','010-1234-4321','jin');  /*2번  실행하면 에러.*/

select * from primary_table;

select * from user_constraints;

----------------------- 여러개의 컬럼이 하나의 PK로 구성  -------------------------------------
-- 아이템번호, 아이템명, 생산일자, 설명
-- (아이템은 하루에 한번만 생산가능)   -- date가 들어가면 초가 들어가서 안됨.

create table primary_multi(
	item_num number(4),
	name varchar(60),
	item_date char(8),
	item_info clob,
	constraint pk_primary_multi primary key (item_num, item_date)
);

select * from user_constraints
where table_name='PRIMARY_MULTI';

-- alter table primary_multi rename colum info_info to item_info; // 컬럼명 바꾸기


-- 1. 추가성공.
-- (1) 최초데이터 입력.
select * from primary_multi;

insert into primary_multi(item_num, name, item_date, item_info)
values (1000,'키보드','20210301',
				'멤브레인 방식으로 저렴이 키보드. 반발력이 떨어짐.');

--(2) 아이템 번호와 제작일이 다르면 입력 성공.
insert into primary_multi(item_num, name, item_date, item_info)
values (1000,'키보드','20210302',
				'멤브레인 방식으로 저렴이 키보드. 반발력이 떨어짐.');

insert into primary_multi(item_num, name, item_date, item_info)
values (1000,'키보드','20210303',
				'멤브레인 방식으로 저렴이 키보드. 반발력이 떨어짐.');

-- (3) 아이템 번호와 날짜가 다르면 입력 가능.
insert into primary_multi(item_num, name, item_date, item_info)
values (1001,'키보드','20210301',
				'기계식 키보드로 청축, 흑축, 적축, 갈축이 있으며, 취향에 따라 원하는 키를 선택할 수 있다.');


-- 2. Error
-- (1) 아이템 번호와 생산일자가 같은 경우.
insert into primary_multi(item_num, name, item_date, item_info)
values (1000,'마우스','20210301', /*3월1일엔 1000번 마우스밖에 없음.*/
				'손목을 보호하기 위해 손의 각도를 계산하여 제작한 제품으로 어짜피 insert 안됨.');

-- (2) null이 입력되면 error.
insert into primary_multi(name, item_date, item_info)
values ('키보드','20210303',
				'멤브레인 방식으로 저렴이 키보드. 반발력이 떨어짐.');

insert into primary_multi(item_num, name, item_date, item_info)
values (1000,'키보드','',
				'멤브레인 방식으로 저렴이 키보드. 반발력이 떨어짐.');

select * from PRIMARY_MULTI;
/*유일한 값을 가져야 돼 -------->> primary key를 넣으세용~~~~~*/

-- primary key를 설정하면, unique index가 자동생성됨.
-- index를 확인하는 Data Dictionary 는 user_indexes
select * from user_indexes;



