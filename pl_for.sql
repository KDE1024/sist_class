-- 1~100���� �ݺ��ϴ� for
set serveroutput on


declare
	j number;
	total number:=0;
	msg varchar2(40);
	msg_len number;

begin

	for i in 1 .. 100 loop
		dbms_output.put(i||' ');
	end loop;

	dbms_output.put_line(' ');



	for j1 in 0 .. 10 loop
		j:=j1;
	dbms_output.put(j||' ');
	end loop;

	dbms_output.put_line('-----'||j||' ');

	-- 1~100 ���� ¦���� ���.
		for i in 1 .. 100 loop
			if mod(i,2)=0  then
				dbms_output.put_line(i||' ');
			end if;
			total := total +i;
	 end loop;

	dbms_output.put(' ');

	-- 1~100���� ����  ���Ͽ� ���.
	dbms_output.put_line(total);

	-- msg�� ����� ���ڿ��� �ѱ��ھ� �߶� ���.
	msg := 'Java Oracle';

	msg_len := length(msg);
--	dbms_output.put_line(msg_len);  //����غ��� ���ڼ� �˱�.

	for i in 1 .. msg_len loop
		dbms_output.put_line( substr(msg,i,1) );
	end loop;

  dbms_output.put_line(' ');

	-- �ݺ��� ����������
	for i in 1 .. 100 loop
		dbms_output.put_line(i);

--    if i = 10 then
--	  	exit; -- ���� ����� �ݺ����� ��������.
--	  end if; -- 1. if ������ exit.
		exit when ( i=10);  --2. when ���� exit.


	end loop;


end;
/
