 -- �����簡 '����','���','BMW'�� ��� ������ ������, ������, �𵨸�, ����, ����,
 -- �ɼ��� ��ȸ�ϼ���.

 -- Oracle
 select * from CAR_COUNTRY;
 select * from CAR_MAKER;
 select * from CAR_MODEL;

 select  cc.country, cc.maker,cma.model, cmo.car_year, cmo.price, cmo.car_option
 from    car_country cc, car_maker cma, car_model cmo
 where   (cma.maker=cc.maker and cmo.model(+)=cma.model)
				 and cma.maker in ('����','���','BNW');

-- ANSI
select     cc.country, cc.maker,cma.model, cmo.car_year, cmo.price, cmo.car_option
from       car_country cc
inner join  car_maker cma
on         cma.maker=cc.maker
left join  car_model cmo
on         cmo.model=cma.model
where				cma.maker in ('����','���','BNW');


---------------------------------------------- ��������� ----------------------------------------------
select * from user_constraints;
--drop table zipcode;
--drop table emp;
--drop table hw_column;
--drop table dept;
--
--purge recyclebin;

