-- �¾ �ظ� �����ϰ�, ������ ����Ͽ� ���� ���ϱ�.
--select  months_between(trunc(sysdate,'YEAR'),trunc(to_date('19961024','YYYYMMDD'),'YEAR'))/12+1 as age
--from		dual;

--set�ε� select�� ���̾��
set serveroutput on

declare
		-- ������ ����
		birth_year char(4);
		now_year char(4);
begin
		-- �� �Ҵ�
		birth_year := 1988;
		now_year := to_char(sysdate, 'yyyy');

		dbms_output.put_line('�׾ �� '||birth_year||'�� ����'||
													(now_year - birth_year +1)||'��');

-- Error :  ���� �����ڴ� ����� �� ����.
--		dbms_output.put_line( 3 > 2 );

end;
/
