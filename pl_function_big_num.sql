-- �ΰ��� ���� �Է� �޾� �� �� ū ���� ��ȯ�ϴ� �Լ��� ������.
create or replace function big_num(num1 number, num2 number)
return number
is
	big_num number;

begin

	big_num := num1;

	if num1 < num2 then
	big_num := num2;
	end if;

	return big_num;

end;
/
