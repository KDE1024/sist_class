select * from user_indexes;

select * from user_ind_columns
where table_name='EMP';

select rowid,empno,ename,job from emp;


-- index ������ ���̺� ����.
create table zipcode_idx as select * from zipcode;

-- unique index ����
create unique index idx_zipcode on zipcode_idx (seq);

drop index idx_zipcode;

select * from user_indexes
where table_name='ZIPCODE_IDX';

select * from user_ind_columns
where table_name = 'ZIPCODE_IDX';

--
select	zipcode, sido, gugun, dong, bunji
from		zipcode
where		seq=50000;

select	zipcode, sido, gugun, dong, bunji
from		zipcode_idx
where		seq=50000;

-- index�� ����� ���ڿ��� ����.
select    zipcode, sido, gugun, dong, bunji
from			zipcode
where			dong='�漮��'
order by	dong desc;

-- index ����
create index dong_idx on zipcode_idx ( dong );

select * from user_indexes
where table_name='ZIPCODE_IDX';

select * from user_ind_columns
where table_name = 'ZIPCODE_IDX';

-- hint ����
select /*+ index_asc( zipcode_idx dong_idx )*/zipcode, sido, gugun, dong, bunji
from  zipcode_idx
where dong >='A' and dong='�漮��';

-- ��¥ �ռ�.
-- date ���� +, - �� �����ϸ� ���ڿ� ���� ������ �����Ѵ�.
-- ������ ����Ǵ� ������ ��¥�� ������ ��¥�� ���ϱ�.
select  sysdate, sysdate+1, sysdate+2, sysdate+3
from		dual;


-- ���� ������ �� ���ϱ� ����
-- add_months(��¥, ���� ���� ��)
select	add_months(sysdate, 3), add_months(sysdate, -3)
from    dual;

-- �� ��¥���� ���� ���� : months_between(ū ��¥, ���� ��¥ )
select  months_between('2021-03-30','2021-01-30'),
        months_between(sysdate,'2021-01-30')
from		dual;

select  trunc(months_between (sysdate,hiredate),0), trunc(months_between (sysdate,hiredate),0)/12
/*�������������� ������~!! ����3�Ť����ÿ��� ����社*/
from		emp;

 







