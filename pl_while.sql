-- 1~10���� �ݺ� ����ϴ� while //while�� ������ �־�� �Ѵ�.
set serveroutput on

declare
	i number;
begin

	i:=1; --�ʱⰪ

  while i < 11 loop    -- ���ǽ�
  	dbms_output.put_line( i||' ');
  	i := i+1;              -- �������ҽ�
  end loop;

  dbms_output.put_line(' ');

	-- 1 ~ 100 ���� ����ϴµ�. 1 2 ¦ 4 5 ¦
	i := 1; -- i �ʱ�ȭ

	while i < 101 loop
	 if mod(i,3)=0 then
  	dbms_output.put( '¦');
	 else
		dbms_output.put(i|| ' ');
		end if;
		i := i +1;   -- �������ҽ�
	end loop;

    dbms_output.put_line(' ');

end;
/
