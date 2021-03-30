-- ������ ���
set serveroutput on

declare
-- ���� ���� : ���������� �����Ͽ� ������ ����.
	name varchar2(15);
	age number(3) := 25;

	-- ��¥�� ������ �� �ִ� ���� ����.
	now_date date;

	-- ���� ���̺� �����ϴ� �÷��� ��������, ũ�⸦ �����Ͽ� ������ ������ �� �ִ�.
	ename emp.ename%type := '�ڱ��';
	sal emp.sal%type;

	-- rowtype�� �������� �÷��� �ϳ��� ������ �����ϱ� ������ �ʱ�ȭ�� �� �� ����.
	dept_row dept%rowtype;

begin
-- �� �Ҵ�.
	name := '���μ�'||'��';
	-- ���� ��¥ �Է�.
	now_date := sysdate;
-- ���� ���.
-- ��� : dbms_output.put(); �Լ��θ� �����ϸ� ����� ���� �ʴ´�.
	dbms_output.put(name);
	dbms_output.put_line(age);

	-- ���� ��¥ ���.
	dbms_output.put_line(to_char(now_date,'yyyy-mm-dd q"�б�" day'));

	-- %type�� ����� ������ �� �Ҵ�.
	sal := 2021;
	--	ename := '�ڱ����'; -- ���� �÷��� ũ�⺸�� ū ���������� �Է��Ͽ� ���� �߻�.
	dbms_output.put_line(ename||' / '||sal );

	-- %rowtype�� ����� ������ �� �Ҵ�.
	dept_row.deptno:=10;
	dept_row.dname:='���ߺ�';
	dept_row.loc:='����';

	dbms_output.put_line(dept_row.deptno ||' / '||dept_row.dname||' / '
	|| dept_row.loc);
 
end;
/