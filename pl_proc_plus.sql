-- procedure 생성 : 두 수를 입력 받아서 더하기 연산 결과를 out parameter에 할당하는 일.
-- in parameter 의 in은 생략할 수 있다.
create or replace procedure proc_plus(num1 number, num2 number,  -- num1 in number, num2 in number
																			result out number, msg out varchar2)
is

begin

	-- out parameter 는 procedure 안에서 처리한 결과를 procedure 외부로 내보내기 위해 존재하는 변수로
	-- 호출할 때 bind 변수를 할당하고, procedure 안에서는 PL/SQL 과 다르게 :(콜론)없이 사용한다.
	result := num1 + num2;

	msg :='오늘은 월요일 입니다.';

end;
/

/*
	컴파일 : @파일명.sql
	에러확인 : show error

	바인드 변수 선언
	var result number
	var msg varchar2(100)

	실행 :
	exec [execute] 프로시저명(값, , , , );

	exec proc_plus(1, 2 : result, :msg)

	출력
	print result
	print msg

*/
