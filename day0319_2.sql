--------------------���ڿ� �Լ�----------------------------
-- ���ڿ��� ����
select  length('test'), length('Today is friday.')
from		dual;

-- ������̺��� ������� 4������ ����� �����, �����ȣ, �Ի��� ��ȸ
select  ename, empno, hiredate
from		emp
where		length(ename)=4;

-- �빮��, �ҹ��� ��ȯ
select  upper('abcd'), upper('AbCd'), lower('ABCD'), lower('AbCd')
from		dual;

-- ������̺��� ������� 'scott'�� ����� �����, ����, ����, �Ի����� ��ȸ
select  Ename, job, sal, hiredate
from		Emp
where		lower(ename) = 'scott';
--where		ename=upper('scott');

select*from emp;

-- ù���ڸ� �빮�ڷ�, ���� ������ ù���ڵ� �빮�ڷθ����.
select  initcap('java'), initcap('orcale'), initcap('i am a girl.')
from		dual;


-- ���ڿ� ���� Ư�� ���ڿ��� �ε��� ���.
-- select	instr('test','t') --1 ����. �ڹٴ� 0 ����.
select 	instr('test','e'), instr('test','k')
from    dual;

-- ������̺��� �����  'A'�� �ִ� ����� �����, �����ȣ, ������ ��ȸ
select  ENAME, EMPNO, SAL
from		emp
where		instr(ename,'A') <>0; /*>0 �� ����*/
--where		instr(ename, 'A') !=0;

-- ���ڿ� �ڸ���
-- ���� ���ڷκ��� �ڸ� �� ���� �ε����� 0 �Ǵ� 1�� ����� �� �ִ�.
select		substr('abcdefg',3,4), substr ('acdefg',3),substr ('acdefg',0/*1*/,4)
from			dual;

-- ���ڿ� ��ġ��
select 'ABC'||'DEF'||'HIJ',concat( concat('abc','def'), 'hij')
from    dual;

-- ���� ����
select		'['||trim('   A BC   ')||']', '['||ltrim('   A BC   ')||']',
					'['||rtrim('   A BC   ')||']'
from      dual;

-- ���ڿ��� Ư�� ���ڿ��� ������ ���� �� ���ڿ��� ������ �� �ִ�.
-- trim (���� ���ڿ� from ���ڿ�)
select		trim('a' from'aaaaaOracleaaaa')
from      dual;

-- ���ڿ� ġȯ
select		replace('abcabcabc','bc','a')
from      dual;

-- ������̺��� ������� ��ȸ.
-- ��, ����� 'A'�� 'a'�� �����Ͽ� ��ȸ.
select		ename, replace(ename, 'A','a'), initcap (ename)-- ���簣�� ù���ڸ� �빮�ڷ�.
from			emp;


-- ���� ������ ���ڿ� �����. //�ѱ۸� 2byte
-- ���� ä���.
select		lpad('test',10,'a'), lpad('test',15,'/'), lpad('test',10, 1)
from			dual;

-- ������ ä���.
select		rpad('test',10,'a'), rpad('test',15,'#')
from			dual;

-- ������̺��� �����ȣ, �����, �Ի����� ��ȸ.
-- ��, �����ȣ�� sist_0000001111�� �������� ����� ��.
select  empno,concat('SIST_', lpad(empno,10,0)) as format_empno, ename, hiredate
from		emp;
