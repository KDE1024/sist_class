-- package body 생성.
create or replace package body test_pack
is
	----------------------- birth 시작--------------------------
	function birth(age number) return number
	is
		birth_year number;
	begin

	  birth_year := to_char(sysdate,'yyyy')-age+1;

	  return birth_year;
	end birth;
  ----------------------- birth 끝 ---------------------------

 ----------------------- 차량 조회 시작-------------------------
	procedure car_list (num number, car_data out sys_refcursor)
	is
		start_num number := num;
		end_num number := 0;
	begin
/* 프로시져 : 번호를 입력받아 제조국, 제조사, 모델명, 연식, 가격,
 옵션을 조회하여 sys_refcursor에 저장하고 출력하는 Procedure를 작성하세요.
 단, 조회는 입력일의 내림차순으로 조회하는 데 번호가 1번이 입력되면 1~10사이의 레코드가 조회되고
 2번이 입력되면 11~20 사이의 레코드가 조회되고, 3이 입력되면 21~30 사이의 레코드가
 조회되어야 한다.*/

	 if num < 1 then
	 	-- 입력값이 1보다 작은 경우 시작 번호는 1로 시작한다.
	 	start_num := 1;
	 end if;

	 start_num := (start_num*10-10)+1; --1,  11,  21   /*이런 로직 어케 생각하지...ㅜㅜ*/
	 end_num := start_num + 9;         --10, 20,  30
   
	 open car_data for
			select	country, maker, model, car_year, price, car_option, r_num
			from		(select  cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.car_option,
					 						row_number()over(order by cmo.hiredate desc)r_num
			 				from		car_country cc, car_maker cma, car_model cmo
			 				where   (cma.maker=cc.maker and cmo.model=cma.model))
			where   r_num between start_num and end_num;
	end car_list;
 	------------------------- 차량 조회 끝 --------------------------
end;
/
