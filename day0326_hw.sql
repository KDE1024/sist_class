/*1. ��ⷮ�� 1500~3000 ������ ������ ������,������,�𵨸�,���,����,
    �̹���,�Է���,��ⷮ, �ɼ��� ��ȸ
   ��. ����� ��ⷮ�� �������� ���������� 3~6��° ���ڵ常 ��ȸ�ϰ�,
     �ɼ��� ó�� ',' ������ ��� �Ұ�. ���ݰ� ������ 3�ڸ����� ,�� �־����,
     �Է����� ��-��-�� �� �������� ��� �Ұ�.*/
select  rnum, country, maker, model, car_year, price, car_img, hiredate, cc, car_option
from		(select country, maker, model, car_year, price,
							car_img, hiredate, cc, car_option, row_number()over(order by cc desc) rnum
				from	(select cco.country, cco.maker, cmk.model, cmd.car_year, cmd.price,
											cmd.car_img, cmd.hiredate, cmd.cc, cmd.car_option
							from    car_country cco, car_maker cmk, car_model cmd
							where  (cmk.maker(+)=cco.maker and cmd.model(+)=cmk.model) and cmd.cc between 1500 and 3000))
where		rnum between 3 and 6;

/*2. �μ���ȣ�� 10, 30,40���� ��� �μ��� �����ȣ,�����,�Ի���,
   ����,��������,�μ���,�μ���ȣ,��ġ, �����ȣ,�õ�, ����,��,���� �� ��ȸ.
  ��,����� �����ȣ�� ������������ �������� �� 2~5��° ���ڵ常 ���,
   �����ȣ�� '-' �ں��� ������ ���, ������ ���ٸ� '��������'���� ��ü
  �Ͽ� ��� ,�Ի����� ��-��-�� ���ϱ��� ���*/
select	rnum, ename, to_char(hiredate,'mm-dd-yyyy-day')hiredate, sal, rank_sal, dname, deptno, loc,
				zipcode, sido, gugun, dong, nvl(bunji,'��������')bunji
from		(select   row_number()over(order by empno)rnum, ename, hiredate, sal, rank_sal, dname,deptno, loc,
												 zipcode, sido, gugun, dong, bunji
				from		(select  e.empno, e.ename, e.hiredate, e.sal, rank()over(order by e.sal)rank_sal,
												 d.dname,d.deptno, d.loc,
												 z.zipcode, z.sido, z.gugun, z.dong, z.bunji
								from    dept d, emp e, zipcode z
								where		(e.deptno(+)=d.deptno and z.seq(+)=e.empno) and d.deptno in (10,30,40)))
where		rnum between 2 and 5;

/*3. ������ �����簡 '����','���','�Ｚ','BMW','AUDI'�̰� �ɼǿ� 'ABS','TCS'��
 �ִ� ������  ������, ������,�𵨸�, ����,����, �ɼ�, �̹���, ��ⷮ ��ȸ
  --��, ������ �������� �����ϰ�, ������ ���ٸ� ������ ������������ ����
   �Ͽ� ���, �̹����� �̹������ Ȯ���ڸ� �����Ͽ� ����Ұ�,
   ��������� ������ Bmw, Audi �� �������� ��� .
*/
select * from CAR_COUNTRY;
select * from CAR_MAKER;
select * from CAR_MODEL;

select  	cco.country, initcap(cco.maker), cma.model, cmo.car_year, cmo.price,
					cmo.car_option,substr(cmo.car_img,1,instr(cmo.car_img,'.')-1)car_img, cmo.cc
from      car_country cco, car_maker cma, car_model cmo
where     (cma.maker=cco.maker and cmo.model(+)=cma.model)
					and cma.maker in ('����','���','�Ｚ','BMW','AUDI')
					and (car_option like '%ABS%' or car_option like '%TCS%')
order by  cmo.car_year desc, cmo.price desc;

/*4. �𵨸��� 'K5','�ƹ���', '�ҷ���','A8','SM3' �� ������ ��ȣ, �𵨸�, ������,
  ������,����,������ �Ʒ��� ���� ������ �������� ���.
  ��,��ȣ�� 1������ ����ϰ�,
   ��� ������ ���������� �������� �� 2~7 ������ ���ڵ常 ���,
   [�𵨸�] ������ ������ [ xxxx ]�̰�, �������� [����|����]�̸�, 
   [XX]�簡 �������Դϴ�. ������ [0,000,000]�� �Դϴ�.
*/









