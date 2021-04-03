-- 주민번호를 입력받아  유효성 검증한 후 유효하면 sist_num 을 반환하고,
-- 유효하지 않으면 SIST_ 0000000000 을 반환하는 함수를 작성.
-- 각 자리에 2,3,4,5,6,7,8,9,2,3,4,5를 곱한 값을 더한 후, 11로 나눈 나머지를 구하고
-- 11에서 뺸 후, 10으로 나눈 나머지가 주민번호의 마지막 자리와 같다면 유효, 그렇지 않다면 무효.
create or replace function chk_ssn ( ssn char )
return char
is

temp_num number := 0;
flag_num number := 2;
result_num varchar2(15):= 'SIST_0000000000';

begin

	if instr(ssn,'-') = 7 then

		for i in 1 .. length(ssn)-1 loop -- 주민번호의 마지막 자리를 제외한 바복
		  if i != 7 then -- -을 제외한 숫자만 연산에 참여
				temp_num := temp_num + substr(ssn,i,1)*flag_num;
			-- 연산해야 하는 숫자를 1씩 증가
				flag_num := flag_num+1;

				if flag_num = 10 then -- 연산해야하는 숫자가 9를 넘어갔을 때 2 부터 다시 시작
					flag_num := 2;
				end if;
			end if;

		end loop;
		-- 주민번호의 checksum code 의 연산이 종료된 후

		temp_num := mod(11-mod(temp_num,11),10); -- 0~9 까지 10자리의 수가 나온다.

		-- 연산된 결과값이 주민번호의 끝자리와 같다면
		if temp_num = substr(ssn, 14) then     --변수를 잘못 바꾸셨오요
		-- 시퀀스를 사용한 다음 번호를 얻기.
			result_num  := sist_num();

		end if;
	end if;

	return result_num;
end;
/

