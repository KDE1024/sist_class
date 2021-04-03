/*���� 1. �Ŵ��� ��ȣ�� �Է¹޾� �Ŵ����� �����ϴ� ��� ������ emp���̺���
       ��ȸ�ϴ� PL/SQL�� �ۼ��ϼ���.

     ��ȸ �÷��� �����ȣ,�����,�μ���ȣ, �Ի���, ������ ��ȸ�ϼ���.

     ��, ��ȸ�ϴ� �ڵ�� ����ó�� �ڵ带 �����Ͽ� �ڵ��մϴ�.
        �ݺ��� �ϳ������� Ŀ������ ������ �����͸� table�� �����ϴ� �۾��� �����ϰ�,
        ���̺� ����� �����͸� ����ϱ����ؼ�  �ݺ����� �ϳ� �� �����մϴ�.
        table�� ����Ͽ� ����ϴ� �ڵ忡���� '�����ȣ,�����,�μ���ȣ, �μ���, �Ի���,����'��  ����մϴ�.
       �μ����� 10���μ����� �� ���ߺ�, 20 - ��������, 30 - ���� �׿ܴ� ������� ���� ����մϴ�.
*/
set serveroutput on
set verify off

accept  mgr prompt '�Ŵ��� ��ȣ �Է� : ';

declare
	--�����ȣ,�����,�μ���ȣ, �Ի���, ������ ������ �� �ִ� record ����
	type emp_rec is record (empno emp.empno%type, ename emp.ename%type, deptno emp.deptno%type,
													hiredate emp.hiredate%type, sal emp.sal%type);
	-- ��ȸ�� ���ڵ带 �����Ҽ��ִ� table�� ����. (���ϳ��� ��ȸ�� �� �ϳ��� ����)
	type emp_tab is table of emp_rec index by binary_integer;

	-- �� �ϳ��� ��ȸ�� �� �ϳ��� ������ �� �ִ� emp_table �� ����Ͽ� table ������ ����.
	emp_data emp_tab;
	-- record���� ����
	ed emp_rec;

	-- 1. Ŀ�� ����
	cursor cur_emp is
		select 	empno, ename, deptno, hiredate, sal
		from		emp
		where 	mgr=&mgr;

	-- �ε�����
	idx number :=0;

	-- �μ��� �����.
	dname varchar2(30) := '�������';

begin
---------------------------------------------- ������ ó�� ����-----------------------------------------------
	-- 2. Ŀ�� ����
	if cur_emp%isopen then  -- Ŀ����  �����ִٸ� �ݾƾ���. Ŀ�� 2�� ������ ��������.
		close cur_emp;
	end if;

	open cur_emp;

	-- 3. ���� : ����� ���ڵ带 table�� �濡 ��´�.
	loop
    idx := idx+1;
		fetch cur_emp into emp_data(idx);
		exit when (cur_emp%notfound);

 	end loop;

	-- 4. �ݱ�
	close cur_emp;
------------------------------------------------- ������ ó�� ��-------------------------------------------------

------------------------------------------------- �� ó�� ���� --------------------------------------------------
	if idx = 1 then
		dbms_output.put_line(&mgr||'�Ŵ����� �����ϴ� ����� ���ų�, �Ŵ����� �ƴմϴ�.');
	end if;

	for i in 1 .. emp_data.count loop
		ed := emp_data(i);

	if ed.deptno =10  then
		dname := '���ߺ�';
	elsif ed.deptno =20  then
		dname := '��������';
	elsif ed.deptno =30 then
		dname :='������';
	else
		dname :='�������';
	end if;

		dbms_output.put_line(ed.empno||', '||ed.ename||', '||ed.deptno||', '||dname||', '||
													to_char(ed.hiredate,'yyyy-mm-dd day'));
		-- decode �Լ��� sql������ ����� �� �ִ�.
--		dbms_output.put_line(decode(de.deptno, 10, '���ߺ�', 20,'��������','���'));

	--�μ����� 10���μ����� �� ���ߺ�, 20 - ��������, 30 - ���� �׿ܴ� �������
	end loop;

------------------------------------------------- �� ó�� ��  ---------------------------------------------------

exception
when invalid_cursor then
dbms_output.put_line('Ŀ���� �߸��� ������ �����Ͽ����ϴ�.');
when others then
dbms_output.put_line('�����ڰ��������� ���� : '||sqlerrm);

end;
/


