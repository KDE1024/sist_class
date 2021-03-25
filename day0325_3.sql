-- ��������.

--���� ����.
-- orcle 12c ���ʹ� ������ �տ� ##�� �پ ����� ����.
-- ##�� ������� �ʴ� ������ �����Ϸ��� _ORACLE_SCRIPT�� ����ϸ� �ȴ�.
/*session : ��ǻ�ͳ����� ����.*/
alter session set "_ORACLE_SCRIPT"=true;

create user kde identified by 1234;

-- ������ ���������� Ȯ���ϴ� Data Dictionary
select * from dba_users; /*�̷� ������ ���̺��� DD��� ��.*/

--������ ������ ���� �ο�
-- ���ӱ��� : connect, ���̺� ��� ���� : resource, DBA ���� : dba
-- �� ���� ���� : create view, �ó�� �������� : create synonym ,,,

-- ���� �ο��� : grant
-- ���ӱ���
grant connect to kde;

-- tablespace ������ : table ����, ��밡��. Oracle 11g
grant resource to kde;

-- Ư�� tablespace�� ��뼳��. Oracle 12c~
alter user kde default tablespace users quota unlimited on users;


-- ������ �ο��� ���� ��ȸ :  dba_role_privs
select * from dba_role_privs where grantee = 'KDE';

-- ���� ȸ��
-- ������ ������ ���� ������ ȸ��.
revoke connect from kde;

-- ���� ��ױ�
select * from dba_users; /**account_status ����open�� locked ����*/
alter user kde account unlock;

select * from user_objects;

-- ��������
drop user kde cascade;






