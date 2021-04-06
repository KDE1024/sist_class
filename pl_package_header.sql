-- 패키지 header 선언.
-- 함수 : 나이를 입력 받아서 태어난 해를 반환하는 함수.
-- 프로시져 : 번호를 입력받아 제조국, 제조사, 모델명, 연식, 가격,
-- 옵션을 조회하여 sys_refcursor에 저장하고 출력하는 Procedure를 작성하세요.
-- 단, 조회는 입력일의 내림차순으로 조회하는 데 번호가 1번이 입력되면 1~10사이의 레코드가 조회되고
-- 2번이 입력되면 11~20 사이의 레코드가 조회되고, 3이 입력되면 21~30 사이의 레코드가
-- 조회되어야 한다.
create or replace package test_pack
as
	-- 나이를 입력받아 태어난 해를 반환하는 함수.
	function birth(age number) return number;
	-- 위에 정의된 일을 하는 프로시저.
	procedure car_list (num number, car_data out sys_refcursor);
end;
/   