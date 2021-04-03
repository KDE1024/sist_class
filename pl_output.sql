select * from user_procedures
where object_type = 'FUNCTION';



-- 간접실행.
select  plus(1,2)
from		dual;

select  big_num(3,4)
from		dual;


-- 1에서부터 9999999999 까지 1씩 증가하는 시퀀스 생성.
create sequence seq_func
increment by 1
start with 1
maxvalue 999999999999
cache 25
nocycle;

select * from user_sequences;

-- 매개변수가 없는 함수는 호출할 때 함수명만 써도 되고, 함수명()를 붙여도 된다.
select	sist_num --sist_num() 도 가능.
from		dual;

-- 코드값을 반환하는 함수는 insert 할 때 주로 사용한다.
create table function_insert(
	num char(15) constraint pk_function_insert primary key,
	name varchar2(15)
);

-- 함수에 () 넣고 테스트
insert into function_insert(num, name)values( sist_num(), '강인섭' );

-- 함수에 () 뺴고 테스트
insert into function_insert(num, name)values( sist_num, '조혜원' );

select * from function_insert;


-- 함수 삭제.
drop function plus;
drop function big_num;



select * from user_procedures;

select  chk_ssn('121212-1234567')
from		dual;


-- 난수 뽑기 : 패키지를 사용한 함수. DBMS_RANDOM.value(시작, 개수)
select	trunc(dbms_random.value(1,10),0), trunc(dbms_random.value(1,999),0)
from		dual;
