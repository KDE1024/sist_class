-- primary_column 테이블의 자식 테이블을 생성.
-- id를 사용하여 부가적인 정보를 더 저장할 때.
-- 자식테이블의 컬럼명과 데이터형의 크기는 달라도 된다.
select * from PRIMARY_TABLE;
select * from FOREIGN_COLUMN;

create table foreign_column(
	id varchar2(20) constraint fk_id references primary_column(id) on delete cascade,
	subject varchar2(30),
	score number(3)
);

select * from user_constraints
where	constraint_type = 'R';

------- 1. 추가성공.
--(1) 부모테이블에 존재하는 값으로 레코드가 추가될 때.

insert into foreign_column (id, subject, score) values ('han','자바','90');
insert into foreign_column (id, subject, score) values ('han','오라클','95');

select * from foreign_column;

-- (2) null 입력 허용.
insert into foreign_column(id, subject, score) values ('','오라클','95');


------- 2. 추가 실패.
-- (1) 부모테이블에 존재하지 않는 값으로 추가할 때.
insert into foreign_column(id, subject, score) values('han2','오라클','95');


------- 3. 레코드 삭제.
-- 자식 테이블의 레코드는 그냥 삭제된다.
-- 부모 테이블의 레코드는 자식 테이블의 레코드가 존재하는 경우엔 삭제되지 않는다.

-- han1 아이디는 참조하는 레코드가 존재하지 않으므로 바로 삭제된다.
delete from primary_column where id='han1';

-- han 아이디는 참조하는 레코드가 존재하므로 삭제되지 않는다.
delete from primary_column where id='han';
-- 삭제하려면 자식 레코드를 모두 삭제 후 부모테이블의 레코드를 삭제한다.
delete from foreign_column where id='han';
delete from primary_column where id='han';

select * from PRIMARY_COLUMN;
select * from FOREIGN_COLUMN;
rollback;

----------------------------- 테이블 단위 제약 사항------------------------------
-- 자식테이블이 컬럼명과 데이터형의 크기는 달라도 된다.

create table foreign_table(
	r_id varchar2(30),
	subject varchar2(20),
	score number(3),
	constraints fk_r_id foreign key(r_id) references primary_table(id)
);

select * from user_constraints;
select * from FOREIGN_TABLE;
select * from PRIMARY_TABLE;
