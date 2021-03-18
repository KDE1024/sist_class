-- 지번주소를 저장하는 테이블을 생성.
-- 우편번호, 시도, 구분, 동, 번지, seq로 이루어져있다.
create table zipcode(
	zipcode char(7),
	sido char(6),
	gugun varchar2(25),--한글 8자,공백 1자
	dong varchar2(300),
	bunji varchar2(25),
	seq number(5)
);

truncate table zipcode;

-- count(*) : 집계함수
select count(*) from ZIPCODE;-- 여기에 ; 안찍혀있어서 오류났음.

-- 동이름으로 우편번호 검색.
select  zipcode, sido, gugun, dong, bunji
from  	zipcode
where   dong like '상도동%';

