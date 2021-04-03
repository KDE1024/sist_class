select * from user_procedures
where object_type = 'FUNCTION';



-- ��������.
select  plus(1,2)
from		dual;

select  big_num(3,4)
from		dual;


-- 1�������� 9999999999 ���� 1�� �����ϴ� ������ ����.
create sequence seq_func
increment by 1
start with 1
maxvalue 999999999999
cache 25
nocycle;

select * from user_sequences;

-- �Ű������� ���� �Լ��� ȣ���� �� �Լ����� �ᵵ �ǰ�, �Լ���()�� �ٿ��� �ȴ�.
select	sist_num --sist_num() �� ����.
from		dual;

-- �ڵ尪�� ��ȯ�ϴ� �Լ��� insert �� �� �ַ� ����Ѵ�.
create table function_insert(
	num char(15) constraint pk_function_insert primary key,
	name varchar2(15)
);

-- �Լ��� () �ְ� �׽�Ʈ
insert into function_insert(num, name)values( sist_num(), '���μ�' );

-- �Լ��� () ���� �׽�Ʈ
insert into function_insert(num, name)values( sist_num, '������' );

select * from function_insert;


-- �Լ� ����.
drop function plus;
drop function big_num;



select * from user_procedures;

select  chk_ssn('121212-1234567')
from		dual;


-- ���� �̱� : ��Ű���� ����� �Լ�. DBMS_RANDOM.value(����, ����)
select	trunc(dbms_random.value(1,10),0), trunc(dbms_random.value(1,999),0)
from		dual;