-- 점수를 입력 받아 점수에 대한 판정.
-- 점수가 0 보다 작다면'0보다 작아서 실패', 점수가 100보다 크다면 '100보다 커서 실패'
-- 그렇지 않으면 '입력 성공'을 출력하는 프로그램. PL/SQL 작성.
set serveroutput on
set verify off

accept score prompt '점수입력 : ';
accept birth prompt '태어난 해 입력 :';

	-- 태어난 해를 입력 받아

declare

	score number := &score;

	-- 태어난 해를 저장할 수를 만들고
	birth number := 0;
	flag number;
	zodiac varchar2(9);

begin

	dbms_output.put(score||'점');

	if score < 0 then
		dbms_output.put_line('은 0 보다 작아서 실패');
	elsif score > 100 then
	  dbms_output.put_line('은 100 보다 커서 실패');
	else
	  dbms_output.put_line('입력 성공');
	end if;

	-- 입력값이 1890~2021년 사이인 경우 변수에 할당하고, 그렇지 않으면
	-- '띠를 계산하지 않는 년도입니다.' 를 보여준다.
	  if &birth between 1890 and 2021 then
	  	birth := &birth;

	  else
	 	 dbms_output.put_line('띠를 계산하지 않는 년도입니다.');
	  end if;

	  if birth !=0 then
	-- 변수에 할당된 경우 띠를 구하여 출력
	-- 원숭이-0, 닭-1, 개-2, 돼지-3, 쥐-4, 소-5, 호랑이-6, 토끼-7, 용-8, 뱀-9, 말-10, 양-11
		flag := mod(birth, 12);

			if flag = 0 then
			 zodiac := '원숭이';
			elsif flag = 1 then
			 zodiac := '닭';
			elsif flag = 2 then
			 zodiac := '개';
			elsif flag = 3 then
			 zodiac := '돼지';
			elsif flag = 4 then
			 zodiac := '쥐';
			elsif flag = 5 then
			 zodiac := '소';
			elsif flag = 6 then
			 zodiac := '호랑이';
			elsif flag = 7 then
			 zodiac := '토끼';
			elsif flag = 8 then
			 zodiac := '용';
			elsif flag = 9 then
			 zodiac := '뱀';
			elsif flag = 10 then
			 zodiac := '말';
			else
			 zodiac := '양';
			 end if;

	  dbms_output.put_line(birth||'년도의 띠는 '|| zodiac ||'띠  입니다.');

	end if;

end;
/
