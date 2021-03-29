--------------------------------증가하는 번호를 관리하는 객체---------------------------------
-- Data Dictionary : user_sequcences
select *
from user_sequences;

-- 1~9999999 까지 1씩 증가하는 시퀸스 생성
create sequence seq_test
increment by 1
start with 1
maxvalue 9999999;

-- nextval을 사용하지 않으면 접속자 세션에 시퀀스 객체가 올라오지 않는다.
-- nextval이 사용되기 전에 currval을 사용하면 Error.
select  seq_test.currval
from		dual;

-- 번호 얻기 : 설정한 cache의 번호를 소진할 때까지는 HDD를 접속하지 않는다.
-- cache가 20으로 설정되어 있다면 20개를 모두 사용하면 HDD를 변경한다.
select  seq_test.nextval
from		dual;
select * from user_sequences;--LAST_NUMBER 가 21로 바뀜. 21로 바뀌기전까진 hdd에서 안건드림 -> 41로 바뀜..

-- 시퀀스 삭제.
drop sequence seq_test;



-- 번호, 이름, 나이를 저장하는 테이블을 생성하세요.
-- 번호는 레코드를 insert할 때마다 1씩 자동 증가하는 번호로 추가되어야 한다.
create table use_seq(
num number,
name varchar2(30),
age number(3)
);

alter table use_seq add num1 char(10);

-- 시퀀스를 사용한 번호 추가
insert into use_seq(num, name, age) values (seq_test.nextval,'이하늘',20);
insert into use_seq(num, name, age) values (seq_test.nextval,'한상민',21);
insert into use_seq(num, name, age) values (seq_test.nextval,'이학민',23);

-- 쿼리문이 실패하면 시퀀스의 번호는 사라진다.
select * from USE_SEQ;
insert into use_seq(num, name, age) values (seq_test.nextval,'진재혁',2300);
insert into use_seq(num, name, age) values (seq_test.nextval,'이예림',23);


-- 시퀀스를 사용하지 않고, 가장 마지막 번호 다음 번호를 사용하여 레코드를 추가해보세요.
-- 이름 : 진재혁, 나이 :  26 --insert 실패해도 연속적인 번호 쓸 수 있음.

insert into use_seq(num, name, age) values ((select max(num)+1 from use_seq),'진재혁',26);

--

-- 10 ~ 9000000 까지 10씩 증가하는 시퀀스를 생성.
create sequence seq_test1
increment by 10
start with 10
maxvalue 9000000
cache 100
cycle;

select * from user_sequences;

select seq_test1.nextval from dual;

-- num1 컬럼에는 insert 할 때 마다  'I_00000001', 'I_00000002' 처럼 고정길이에
-- 1씩 증가하는 문자열 값으로 추가.
-- concat은 select의 subquery로 사용할 수 없다.
insert into use_seq(num, name, age, num1) values ((select max(num)+1 from use_seq), '강인섭',26,
concat('I_',lpad(seq_test.nextval,8,0)));

select * from USE_SEQ;

drop sequence seq_test1;


select * from user_sequences;

select * from user_objects;
