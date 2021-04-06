-- package body ����.
create or replace package body test_pack
is
	----------------------- birth ����--------------------------
	function birth(age number) return number
	is
		birth_year number;
	begin

	  birth_year := to_char(sysdate,'yyyy')-age+1;

	  return birth_year;
	end birth;
  ----------------------- birth �� ---------------------------

 ----------------------- ���� ��ȸ ����-------------------------
	procedure car_list (num number, car_data out sys_refcursor)
	is
		start_num number := num;
		end_num number := 0;
	begin
/* ���ν��� : ��ȣ�� �Է¹޾� ������, ������, �𵨸�, ����, ����,
 �ɼ��� ��ȸ�Ͽ� sys_refcursor�� �����ϰ� ����ϴ� Procedure�� �ۼ��ϼ���.
 ��, ��ȸ�� �Է����� ������������ ��ȸ�ϴ� �� ��ȣ�� 1���� �ԷµǸ� 1~10������ ���ڵ尡 ��ȸ�ǰ�
 2���� �ԷµǸ� 11~20 ������ ���ڵ尡 ��ȸ�ǰ�, 3�� �ԷµǸ� 21~30 ������ ���ڵ尡
 ��ȸ�Ǿ�� �Ѵ�.*/

	 if num < 1 then
	 	-- �Է°��� 1���� ���� ��� ���� ��ȣ�� 1�� �����Ѵ�.
	 	start_num := 1;
	 end if;

	 start_num := (start_num*10-10)+1; --1,  11,  21   /*�̷� ���� ���� ��������...�̤�*/
	 end_num := start_num + 9;         --10, 20,  30
   
	 open car_data for
			select	country, maker, model, car_year, price, car_option, r_num
			from		(select  cc.country, cc.maker, cma.model, cmo.car_year, cmo.price, cmo.car_option,
					 						row_number()over(order by cmo.hiredate desc)r_num
			 				from		car_country cc, car_maker cma, car_model cmo
			 				where   (cma.maker=cc.maker and cmo.model=cma.model))
			where   r_num between start_num and end_num;
	end car_list;
 	------------------------- ���� ��ȸ �� --------------------------
end;
/
