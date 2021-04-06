/*1. 모델명, 번호를 입력받아  제조국, 제조사, 모델명, 연식, 가격, 옵션을 조회하여 sys_refcursor에 저장하고
출력하는 Procedure를 작성하세요.

단, 조회는 입력일의 내림차순으로 조회하는 데 번호가 1번이 입력되면 1~10사이의 레코드가 조회되고
2번이 입력되면 11~20 사이의 레코드가 조회되고, 3이 입력되면 21~30 사이의 레코드가
조회되어야 한다.
*/
create or replace procedure proc_car (i_model varchar2, num number,
																			cur_car out sys_refcursor, msg out varchar2)
is

begin
-- open
if num = 1 then
	open cur_car for
		select rnum, country, maker, model, car_year, price, car_option
		from	(select  cco.country, cco.maker, cma.model, cmo.car_year, cmo.price, cmo.car_option,
									row_number()over(order by hiredate desc) rnum
					from		car_maker cma, car_country cco, car_model cmo
					where   (cma.maker(+)=cco.maker and cmo.model(+)=cma.model))
		where rnum between 1 and 10;

elsif num = 2 then
	open cur_car for
			select rnum, country, maker, model, car_year, price, car_option
			from	(select  cco.country, cco.maker, cma.model, cmo.car_year, cmo.price, cmo.car_option,
										row_number()over(order by hiredate desc) rnum
						from		car_maker cma, car_country cco, car_model cmo
						where   (cma.maker(+)=cco.maker and cmo.model(+)=cma.model))
			where rnum between 11 and 20;

elsif num =3 then
	open cur_car for
			select rnum, country, maker, model, car_year, price, car_option
			from	(select  cco.country, cco.maker, cma.model, cmo.car_year, cmo.price, cmo.car_option,
										row_number()over(order by hiredate desc) rnum
						from		car_maker cma, car_country cco, car_model cmo
						where   (cma.maker(+)=cco.maker and cmo.model(+)=cma.model))
			where rnum between 21 and 30;
else
	msg:='잘못 입력된 숫자입니다.';
end if;

-- 인출
	loop
		fetch car_cur into cr;
		exit when(car_cur%notfound);

			dbms_output.put_line(cr.country||'/'||cr.maker||cr.model||'/'
																||cr.car_year||'/'||cr.car_year||'/'||cr.car_option);
	end loop;

		close emp_cur;

exception
when invalid_cursor then
	dbms_output.put_line('앗! 잘못된 커서 연산');
when others then
	dbms_output.put_line('앗! 알수없는 예외'||sqlerrm);




end;
/