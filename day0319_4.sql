truncate table test1;
alter table test1 add ssn char(14);

insert into test1 (name, age, ssn, input_date) values('���Լ�',26,'961103-1234567', sysdate);
insert into test1 (name, age, ssn, input_date) values('��Ƽ����',45,'880403-5234567', sysdate);
insert into test1 (name, age, ssn, input_date) values('������',26,'960812-2234567', sysdate);
insert into test1 (name, age, ssn, input_date) values('������',27,'951103-1234567', sysdate);
insert into test1 (name, age, ssn, input_date) values('������',24,'011103-4334567', sysdate);
insert into test1 (name, age, ssn, input_date) values('������',25,'911103-2334567', sysdate);




select * from TEST1;
