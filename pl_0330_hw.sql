/*���� 1.
�Ϸ� �뵷, �����, ���ɰ��� ������ �����ϰ� �Ʒ��� ������������ ����ϴ� PL/SQL�ۼ��ϼ���.
�Ϸ�뵷 XX��, ������� : xx ��, �պ������ : xx��, ���ɰ� : xx�� ���� �뵷xx ���Դϴ�.
*/
/*���� 2.
���̸� accept���� �Է¹޾� �¾ �ظ� ���ؼ� ����ϴ� PL/SQL�� �ۼ��ϼ���.
*/
set serveroutput on
set verify off

accept name prompt '�̸� �Է� : '

declare
-- ��������.
	pay number(7);
	sub_cost number(7);
	lunch number(7);

	birth_year char(4);


begin
--�� �Ҵ�.
		pay := 20000;
		sub_cost := 2500;
		lunch :=10000;

-- ���.
    dbms_output.put_line('�Ϸ� �뵷 : '||pay||'��, �� ����� :'||sub_cost||'��, �պ� ����� : '|| (sub_cost)*2||
													'��, ���ɰ� : '||lunch||'��, ���� �뵷'||(pay- sub_cost*2 - lunch)||'�� �Դϴ�.');
		dbms_output.put_line('&name');
end;
/
/*
���� 3.
 ������̺��� �ټӳ���� 35�� �̻��� ��� ���� �����ȣ,�����, �Ի���, �ټӳ��, ������ ��ȸ�ϼ���.
 ��, �Ի����� ������������ �����Ͽ� ����ϰ�, �Ի����� ����-��-�� ���ϡ� �� �������� ����ϼ���*/
select  	empno, ename, to_char(hiredate,'mm-dd-yy day'),
					trunc(trunc(months_between (sysdate,hiredate),0)/12,0) continuous_years, sal
from			emp
where			trunc(months_between (sysdate,hiredate),0)/12 > 35
order by	hiredate desc;
