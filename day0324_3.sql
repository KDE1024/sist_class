-- unique 사용.
-- 번호, 이름, 전화번호를 저장.
																		/*반드시 있고 유일하면 프라이머리
																		 있을수도 있고 unique
																		 참조할거야 foreign*/
---------------------------------------- 컬럼 단위 제약사항. ---------------------------------------
select * from UNIQUE_COLUMN;

create table unique_column(
	num number,
	name varchar2(30),
	phone varchar2(13) constraints uk_phone unique
);

-- 제약사항 확인.
select * from user_constraints; -- constraint_name 에 uk_phone 만들어져있는거 확인 가능.
-- 생성된 인덱스 확인.
select * from user_indexes; -- index_name 에 uk_phone 만들어져있는거 확인 가능.

--  1. 추가성공.
-- (1) 최초입력.
insert into unique_column(num, name, phone) values (1,'테스트','010-1234-5678');

-- (2) 다른 전화 번호가 입력되는 경우.
insert into unique_column(num, name, phone) values (2,'테스트','010-1234-5679');

-- (3) 전화번호에 null이 입력되는 경우. -- 모든 사람이 핸드폰을 갖고있진 않잖아?
insert into unique_column(num, name, phone) values (3,'테스트','');

insert into unique_column(num, name) values (4,'테스트');


--  2. Error
-- (1) 같은 전화번호가 입력되면 에러.     /*전화번호는 유니크 안됨. 이메일은 ok.*/
insert into unique_column(num, name, phone) values (5,'이하늘','010-1234-5679');

select * from unique_column;

---------------------------------------- 테이블 단위  제약사항. ---------------------------------------
create table unique_table(
	num number,
	name varchar2(30),
	email varchar2(50),
	card_num char(4),
	constraint uk_email unique( email ),
	constraint uk_card_num unique(card_num));

-- 제약사항 확인.
select * from user_constraints where constraint_type='U';

select * from user_indexes where table_name='UNIQUE_TABLE';




select * from UNIQUE_TABLE;










