-- procedure ����.
select * from user_procedures;

-- ���ε� ������ ����
var r number;
var m varchar2(100);

-- ���ν����� ���� ����
execute proc_plus(11, 26, :r, :m);
-- ���ε� ������ ���
print r
print m

------------------------------------------------------------
-- �� ���
var msg varchar2(300);
exec proc_zodiac('���й�', 1997, :msg);
print msg

------------------------------------------------------------
-- �� ��ȸ
-- Ŀ���� �����Ҽ��ִ� ���������� ����Ͽ� bind ���� ����.
var cur_zip refcursor;

-- ����
exec proc_zipcode( '', :cur_zip);

-- ���
print cur_zip;
-------------------------------------------------------------
-- insert
var row_cnt number;
var msg varchar2(600);

-- procedure ����
exec proc_insert (1235, '���μ�', 10, '����', :row_cnt, :msg);
-- out parameter �� �����ϴ� ���� ���.
print row_cnt;
print msg;

select * from cp_emp4;
-------------------------------------------------------------
-- update
-- bind ��������
var row_cnt number;
var msg varchar2(600);

--
exec proc_update (1235,'���',20, :row_cnt, :msg);

print row_cnt;
print msg;

select * from cp_emp4;
--------------------------------------------------------------
-- delete
-- bind ��������
var row_cnt number;
var msg varchar2(600);

-- ���ν��� ����
exec proc_delete (1235, :row_cnt, :msg);

print row_cnt;
print msg;


select * from cp_emp4;
rollback;
--------------------------------------------------------------
-- ���ν��� ����
drop procedure proc_plus;   