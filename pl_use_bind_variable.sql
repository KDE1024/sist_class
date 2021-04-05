-- bind 변수 선언
var age number;
var name varchar2(30);

-- PL/SQL 작성
declare

begin
	-- bind 변수는 외부에서 만들어진 변수로 PL/SQL 내부에서 변수를 선언하지 않고
	-- :변수명 으로 사용할 수 있다.
	:age := 26;
	:name := '이학민';
end;
/

-- bind 변수 출력
print age
print name
