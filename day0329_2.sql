select * from dba_sys_privs
where grantee='SCOTT';

--scott ������ �ó�� ���� �ο�
grant create synonym to scott;

--scott ������ �ó�� ���� ȸ��
revoke create synonym from scott;

-- �ó�� ����
-- car_model ���̺�  'cmo' ��� �̸��� synonym �� �ο��ϱ�.
create synonym cmo for car_model;


-- synonym �� ��ȸ�ϴ� Data Dictionary
select * from user_synonyms;

-- synonym�� ���
select * from cmo;

-- ���� ���̺�� ���
select * from car_model;


-- �ó�� ����
drop synonym cmo;


----------------------------------------  View   ---------------------------------------------
select * from user_views;

grant create view to scott;
revoke create view from scott;


select * from dba_sys_privs
where	grantee = 'SCOTT';


-- �ܼ���. cp_emp4 table�� ����� �ܼ� �� ���� : ���̸�  view_emp
create view view_emp
as select * from cp_emp4;

select * from user_views;

-- view�� ����� ��ȸ
select * from view_emp;
-- ���� ���̺� ��ȸ
select * from cp_emp4;

-- ���� ���ڵ忡 �۾��� �ϸ� view�� �ٷ� �ݿ��ȴ�.
insert into cp_emp4(empno, ename, deptno, job, hiredate)
values (1234,'�ڱ��',10,'���',sysdate);

update	cp_emp4
set     deptno=20, job='�븮'
where   empno=1234;

delete from cp_emp4 where empno=1234;

select * from view_emp;

-- �ܼ� view �۾�
-- insert
insert into view_emp(empno, ename, deptno, job, hiredate)
values (1234,'�ڱ��',10,'���',sysdate);

-- update
update	view_emp
set     deptno=20, job='�븮'
where   empno=1234;

--delete
delete from view_emp where empno=1234;

-- view ����
drop view view_emp;

-- ���� ���̺��� ��ȸ.
select * from cp_emp4;
select * from view_emp;


-- ���պ� : �������� ���̺�� ����� ��.
create table cp_dept as select * from dept;
select * from cp_dept;

--cp_dept ���̺��� �μ���ȣ�÷��� PK����.
alter table cp_dept add constraint pk_cp_dept primary key (deptno);

-- cp_emp4 ���̺��� deptno �÷��� FK�� ����.
alter table cp_emp4 add constraint fk_cp_emp4_deptno
			foreign key (deptno) references cp_dept(deptno);

select * from user_constraints where table_name in ('CP_DEPT','CP_EMP4');


-- join�� ����� ���� ���� ����.
create view emp_data as
select  cd.deptno, cd.dname, cd.loc, ce4.empno, ce4.ename, ce4.job, ce4.hiredate
from 		cp_dept cd, cp_emp4 ce4
where   ce4.deptno(+)=cd.deptno;


select * from user_views;

-- view�� ��ȸ : �ܼ� ������ join�� ����� ����� �� �ִ�.
select * from emp_data;

select  deptno, dname, empno, job
from    emp_data
where		deptno in(30,20);  /*�ܼ� ������� �� join�� ä�� ���� ����.*/

-- �μ� ���� �߰�
insert into cp_dept(deptno, dname, loc) values(50,'���ߺ�','����');--�ϳ��� ���̺� ���� �־����� �ٷιٷ� ������Ʈ��
commit;

insert into cp_emp4(empno, ename, deptno, job, hiredate) values (1111,'������',50,'�븮',sysdate);
-- view ��ȸ
select * from emp_data;

-- ���պ信 insert, update, delete �۾�����. -> �ȵ�.
-- insert �ȵ�.
insert into emp_data(deptno, dname, loc, empno, ename, job, hiredate)
values (60,'��������','�뱸',1212,'�����','����',sysdate);

-- update �ȵ�.
update  emp_data
set  		job='��ǥ'
where   empno=1111;

--delete
delete from emp_data where empno=1111;

--
drop view emp_data;

select * from user_views;