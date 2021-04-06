create table test_trigger1(
	name varchar2(30),
	age number
);

create table test_trigger2(
	name varchar2(30),
	age number
);

select * from user_triggers;


drop trigger test_trigger1;
