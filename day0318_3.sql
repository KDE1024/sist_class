-- �����ּҸ� �����ϴ� ���̺��� ����.
-- �����ȣ, �õ�, ����, ��, ����, seq�� �̷�����ִ�.
create table zipcode(
	zipcode char(7),
	sido char(6),
	gugun varchar2(25),--�ѱ� 8��,���� 1��
	dong varchar2(300),
	bunji varchar2(25),
	seq number(5)
);

truncate table zipcode;

-- count(*) : �����Լ�
select count(*) from ZIPCODE;-- ���⿡ ; �������־ ��������.

-- ���̸����� �����ȣ �˻�.
select  zipcode, sido, gugun, dong, bunji
from  	zipcode
where   dong like '�󵵵�%';

