/*1. �𵨸�, ��ȣ�� �Է¹޾�  ������, ������, �𵨸�, ����, ����, �ɼ��� ��ȸ�Ͽ� sys_refcursor�� �����ϰ�
����ϴ� Procedure�� �ۼ��ϼ���.

��, ��ȸ�� �Է����� ������������ ��ȸ�ϴ� �� ��ȣ�� 1���� �ԷµǸ� 1~10������ ���ڵ尡 ��ȸ�ǰ�
2���� �ԷµǸ� 11~20 ������ ���ڵ尡 ��ȸ�ǰ�, 3�� �ԷµǸ� 21~30 ������ ���ڵ尡
��ȸ�Ǿ�� �Ѵ�.
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
	msg:='�߸� �Էµ� �����Դϴ�.';
end if;

-- ����
	loop
		fetch car_cur into cr;
		exit when(car_cur%notfound);

			dbms_output.put_line(cr.country||'/'||cr.maker||cr.model||'/'
																||cr.car_year||'/'||cr.car_year||'/'||cr.car_option);
	end loop;

		close emp_cur;

exception
when invalid_cursor then
	dbms_output.put_line('��! �߸��� Ŀ�� ����');
when others then
	dbms_output.put_line('��! �˼����� ����'||sqlerrm);




end;
/