-- sys_refcursor �� ����Ͽ� ��ȸ.
-- �������� �Է¹޾�  ������, ������, �𵨸�, ����, �ɼ��� ��ȸ�ϴ� pl/sql�� �ۼ��ϼ���.
set serveroutput on
set verify off

accept country prompt '������ : ';

declare
	type car_rec is record (maker car_country.maker%type, country car_country.country%type,
													model car_model.model%type, car_year car_model.car_year%type,
													car_option car_model.car_option%type );
	-- ���ڵ� ���� ����.
	crd car_rec;

	-- ������.
	car_country varchar2(6) := &car_country;

	--sys_refcursor ����
	car_cur sys_refcursor;
	

begin

	if car_country = '����' then
		open car_cur for
		select
		from		car_model		
		where
	
		dbms_oputput.put_line();
	
	end if;




end;
/
select * from CAR_MODEL;
select * from CAR_MAKER;
select * from CAR_COUNTRY;
