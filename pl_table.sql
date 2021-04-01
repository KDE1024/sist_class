-- table 사용
set serveroutput on

declare

-- 1. 테이블 선언) 문자열을 저장할 수 있는 테이블 선언.
type name_tab is table of varchar2(30) index by binary_integer;
type age_tab is table of number index by binary_integer;
-- 2. 선언된 테이블로 테이블 변수 선언.
names name_tab;
ages 	age_tab;

cnt number := 0;

begin

-- 3. 값 할당. 변수명(인덱스) := 값;
names(1) := '강인섭';
names(2) := '곽범수';
names(3) := '박기범';
names(4) := '강호동';
names(5) := '강감찬';
names(6) := '박지성';
dbms_output.put_line('테이블 방의 수 '||names.count);

---- 4. 값 사용. 변수명 (인덱스)
--dbms_output.put_line(names(3));

for i in 1 .. names.count loop
	dbms_output.put_line( names(i) );

--	if substr (names(i),1,1)='강' then
 if names(i) like '강%' then
		cnt := cnt+1;
	end if;
end loop;

-- '강'씨의 인원수룰 출력해보세요.
	dbms_output.put_line('강씨는 '||cnt||'명');

------------------number 로 구성된 테이블 사용----------------
-- 값 할당
ages(1) := 26;
ages(2) := 25;
ages(3) := 28;
ages(4) := 30;
ages(5) := 24;

-- 값 사용
for i in 1 .. ages.count loop
	dbms_output.put_line(ages(i)||'살');
end loop;

end;
/
