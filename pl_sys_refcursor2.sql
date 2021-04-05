--sys_refcursor를 사용하여 조회
--제조국을 입력받아 제조사,제조국,모델명 연식,옵션을 조회하여 출력하는 pl/sql작성
set serveroutput on
set verify off

accept country prompt '제조국 입력:';

declare

-- 레코드 선언
type car_rec is record(MAKER car_country.maker%type, COUNTRY car_country.country%type,
MODEL car_maker.model%type, CAR_YEAR car_model.car_year%type, CAR_OPTION car_model.car_option%type);
-- 레코드를 사용한 변수 선언
cr car_rec;

-- 제조국
c_ctr varchar(10):='&country';

-- 커서명 sys_refcursor
car_cur sys_refcursor;

begin

if c_ctr in ('국산','수입') then
	-- 2. open
	open car_cur for
	select cc.maker,cc.country,cma.model,cmo.car_year,cmo.car_option
	from  car_maker cma,car_country cc,car_model cmo
	where (cma.maker(+)=cc.maker and cmo.model(+)=cma.model) and cc.country=c_ctr;
	-- 3. 인출
	loop
fetch car_cur into cr;
exit when(car_cur%notfound);

dbms_output.put_line(cr.maker||'/'||cr.country||'/'||cr.model||'/'||cr.car_year||'/'||cr.car_option);

-- 4. 닫기 
end loop;


close car_cur;

else
dbms_output.put_line('국산과 수입만 입력');
end if;


exception
when invalid_cursor then
dbms_output.put_line('잘못된 커서 연산');
when others then
dbms_output.put_line('알수 없는 예외'||sqlerrm);
end;
/
