-- �����ȣ, �����, �μ���ȣ, ����, �Ի����� �Է¹޾� cp_emp4 ���̺� �߰��ϴ�
-- PL/SQL�� �ۼ��ϼ���.
set serveroutput on
set verify off

accept empno prompt '�����ȣ : ';
accept ename prompt '����� : ';
accept job prompt '���� : ';
accept deptno prompt '�μ���ȣ : ';

declare

	row_cnt number;

	empno 	cp_emp4.empno%type := &empno;
	ename 	cp_emp4.ename%type :='&ename';
	job			cp_emp4.job%type := '&job';
	deptno  cp_emp4.deptno%type := &deptno;

begin
	-- �÷��� ���� �Ǵ� �κа� ������ ���ǵǴ� �κ��� �޶� �÷���� �������� ���Ƶ� �ȴ�.
	insert into cp_emp4(empno, ename, deptno, job, hiredate)
	values (empno, ename, deptno, job, sysdate);

	row_cnt := sql%rowcount;

	if row_cnt = 1 then
		dbms_output.put_line(sql%rowcount||'�� �߰�');
		commit; -- commit�� ������ �޾� �� �� if�� �ʿ��ϴ�.
	end if;
end;
/
