-- sys_refcursor ��� :  Ŀ���� ����� �������� �и��� �� �ִ�.
-- �μ���ȣ�� �Է¹޾� emp ���̺��� ������� ��ȸ.
-- ��ȸ �÷� : �����ȣ, �����, �μ���ȣ, ������ ��ȸ.
-- ��, �μ���ȣ�� 10��, 20��, 30���� ����� �� �ְ� �ش� ��ȣ�� �ƴϸ� '�μ���ȣ��
-- 10, 20, 30���� �Է����ּ���.'�� ����Ѵ�.
set serveroutput on
set verify off

accept deptno prompt '�μ���ȣ : ';

declare

	-- ���ڵ� ����
	type emp_rec is record (empno number, ename varchar2(30), deptno number, sal number);
	-- ���ڵ带 ����� ���� ����.
	er emp_rec;


  -- �μ���ȣ
	d_no number := &deptno;

  -- sys_refcursor ���� :  Ŀ���� ������������� �и��� �� �ִ�.
  -- Ŀ���� sys_refcursor
	emp_cur sys_refcursor;

begin

	if d_no in (10, 20, 30) then
	-- 2. open
	open emp_cur for
		select	empno, ename, deptno, sal
		from		emp
		where   deptno = d_no;

	-- 3. ����
	loop
		fetch emp_cur into er;
		exit when(emp_cur%notfound);

		dbms_output.put_line(er.empno||' / '||er.ename||' / '||er.deptno||' / '||er.sal);
	end loop;

	else
		dbms_output.put_line('�μ���ȣ�� 10, 20, 30���� �Է����ּ���.');
	end if;

	-- 4. �ݱ�
	close emp_cur;




exception
when invalid_cursor then
	dbms_output.put_line('��! �߸��� Ŀ�� ����');
when others then
	dbms_output.put_line('��! �˼����� ����'||sqlerrm);


end;
/
