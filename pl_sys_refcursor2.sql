-- sys_refcursor 를 사용하여 조회.
-- 제조국을 입력받아  제조사, 제조국, 모델명, 연식, 옵션을 조회하는 pl/sql을 작성하세요.
set serveroutput on
set verify off

accept country prompt '제조국 : ';

declare
	type car_rec is record (maker car_country.maker%type, country car_country.country%type,
													model car_model.model%type, car_year car_model.car_year%type,
													car_option car_model.car_option%type );
	-- 레코드 변수 선언.
	crd car_rec;

	-- 제조국.
	car_country varchar2(6) := &car_country;

	--sys_refcursor 선언
	car_cur sys_refcursor;
	

begin

	if car_country = '국산' then
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
