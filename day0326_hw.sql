/*1. 배기량이 1500~3000 사이인 차량의 제조국,제조사,모델명,년식,가격,
    이미지,입력일,배기량, 옵션을 조회
   단. 출력은 배기량의 내림차순 정렬했을때 3~6번째 레코드만 조회하고,
     옵션은 처음 ',' 까지만 출력 할것. 가격과 연식은 3자리마다 ,를 넣어출력,
     입력일은 월-일-년 의 형식으로 출력 할것.*/
select  rnum, country, maker, model, car_year, price, car_img, hiredate, cc, car_option
from		(select country, maker, model, car_year, price,
							car_img, hiredate, cc, car_option, row_number()over(order by cc desc) rnum
				from	(select cco.country, cco.maker, cmk.model, cmd.car_year, cmd.price,
											cmd.car_img, cmd.hiredate, cmd.cc, cmd.car_option
							from    car_country cco, car_maker cmk, car_model cmd
							where  (cmk.maker(+)=cco.maker and cmd.model(+)=cmk.model) and cmd.cc between 1500 and 3000))
where		rnum between 3 and 6;

/*2. 부서번호가 10, 30,40번인 모든 부서의 사원번호,사원명,입사일,
   연봉,연봉순위,부서명,부서번호,위치, 우편번호,시도, 구군,동,번지 를 조회.
  단,출력은 사원번호의 오름차순으로 정렬했을 때 2~5번째 레코드만 출력,
   우편번호는 '-' 뒤부터 끝까지 출력, 번지가 없다면 '번지없음'으로 대체
  하여 출력 ,입사일은 월-일-년 요일까지 출력*/
select	rnum, ename, to_char(hiredate,'mm-dd-yyyy-day')hiredate, sal, rank_sal, dname, deptno, loc,
				zipcode, sido, gugun, dong, nvl(bunji,'번지없음')bunji
from		(select   row_number()over(order by empno)rnum, ename, hiredate, sal, rank_sal, dname,deptno, loc,
												 zipcode, sido, gugun, dong, bunji
				from		(select  e.empno, e.ename, e.hiredate, e.sal, rank()over(order by e.sal)rank_sal,
												 d.dname,d.deptno, d.loc,
												 z.zipcode, z.sido, z.gugun, z.dong, z.bunji
								from    dept d, emp e, zipcode z
								where		(e.deptno(+)=d.deptno and z.seq(+)=e.empno) and d.deptno in (10,30,40)))
where		rnum between 2 and 5;

/*3. 차량의 제조사가 '현대','기아','삼성','BMW','AUDI'이고 옵션에 'ABS','TCS'가
 있는 차량의  제조국, 제조사,모델명, 연식,가격, 옵션, 이미지, 배기량 조회
  --단, 연식의 내림차순 정렬하고, 연식이 같다면 가격의 내림차순으로 정렬
   하여 출력, 이미지는 이미지명과 확장자를 구분하여 출력할것,
   제조사명이 영어라면 Bmw, Audi 의 형식으로 출력 .
*/
select * from CAR_COUNTRY;
select * from CAR_MAKER;
select * from CAR_MODEL;

select  	cco.country, initcap(cco.maker), cma.model, cmo.car_year, cmo.price,
					cmo.car_option,substr(cmo.car_img,1,instr(cmo.car_img,'.')-1)car_img, cmo.cc
from      car_country cco, car_maker cma, car_model cmo
where     (cma.maker=cco.maker and cmo.model(+)=cma.model)
					and cma.maker in ('현대','기아','삼성','BMW','AUDI')
					and (car_option like '%ABS%' or car_option like '%TCS%')
order by  cmo.car_year desc, cmo.price desc;

/*4. 모델명이 'K5','아반테', '소렌토','A8','SM3' 인 차량의 번호, 모델명, 제조국,
  제조사,가격,연식을 아래와 같은 형식의 문장으로 출력.
  단,번호는 1번부터 출력하고,
   출력 가격의 오름차순을 정렬했을 때 2~7 사이의 레코드만 출력,
   [모델명] 차량의 연식은 [ xxxx ]이고, 제조국은 [국산|수입]이며, 
   [XX]사가 제조사입니다. 가격은 [0,000,000]원 입니다.
*/









