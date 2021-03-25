-- check, notnull, default
-- 나이는 20~30대만 입력, 이름은 반드시 입력되어야 한다.
-- 입력일이 생략되면 레코드가 추가되는 시점의 날짜 정보로 추가 되어야 한다.

create table other_constraint(
	num number(5),
	name varchar2(30byte) not null,
	age number(2) check (age between 20 and 39),
	input_date date default sysdate
);

-- 제약사항 확인.
-- check, not null -> 제약사항이니까 여기서 확인 가능.
select * from user_constraints
where table_name ='OTHER_CONSTRAINT';


-- default
select * from user_tab_cols
where table_name='OTHER_CONSTRAINT';   -- ㅎㅎㅎ 꼬마워  ㅎ3ㅎ
select * from OTHER_CONSTRAINT;

-- 1. 추가성공
-- (1) 이름이 입력되면서, 나이가 20~30대, 입력일은 누락되어도도 된다.
insert into other_constraint(num, name, age, input_date)
values(1,'박기범', 25, sysdate);
-- 이름이 입력되면서, 나이가 20~30대, 입력일은 누락되어도 된다.(default)
insert into other_constraint(num, name, age)
values(2,'강인섭', 26);


-- 2. 추가 실패
-- (1) check 조건에 위배.
insert into other_constraint(num, name, age)
values(3,'곽범수', 19);

insert into other_constraint(num, name, age)
values(3,'곽범수', 40);

-- (2) not null 조건에 위배. --컬럼에 값을 반드시 입력해야 할 때
insert into other_constraint(num, age)
values(3, 40);

insert into other_constraint(num,name ,age)
values(3,'',40);



select * from OTHER_CONSTRAINT;


          
            