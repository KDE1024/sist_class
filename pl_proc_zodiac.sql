-- 이름, 태어난 해를 입력 받아서 print output을 하면 '홍길동님 태어난해 2021년
-- 띠는 xx띠'를 출력하는 pl/sql을 작성하세요.
create or replace procedure proc_zodiac (name varchar2, birth number,
										output_msg out varchar2)
is

	type zodiac_tab is table of varchar2(9) index by binary_integer;

	zodiac_text zodiac_tab;

begin

	zodiac_text(0) :='원숭이';
	zodiac_text(1) :='닭';
	zodiac_text(2) :='개';
	zodiac_text(3) :='돼지';
	zodiac_text(4) :='쥐';
	zodiac_text(5) :='소';
	zodiac_text(6) :='호랑이';
	zodiac_text(7) :='토끼';
	zodiac_text(8) :='용';
	zodiac_text(9) :='뱀';
	zodiac_text(10) :='말';
	zodiac_text(11) :='양';

	output_msg := name||'님 태어난 해는 '||birth||'년, 띠는 '||zodiac_text( mod(birth,12))||'띠 입니다.';

end;
/

-- 2. 컴파일
-- 3. 바인드 변수 선언
-- var msg varchar2(1000)
-- 4. 실행기를 사용하여 실행
-- exec proc_zodiac('이름', 태어난해, :msg)
-- 5. bind 변수에 할당된 값을 출력한다.
--	print msg

