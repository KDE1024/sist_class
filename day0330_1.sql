select * from user_indexes;

select * from user_ind_columns
where table_name='EMP';

select rowid,empno,ename,job from emp;


-- index 설정할 테이블 생성.
create table zipcode_idx as select * from zipcode;

-- unique index 설정
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

-- index를 사용한 문자열의 정렬.
select    zipcode, sido, gugun, dong, bunji
from			zipcode
where			dong='흑석동'
order by	dong desc;

-- index 설정
create index dong_idx on zipcode_idx ( dong );

select * from user_indexes
where table_name='ZIPCODE_IDX';

select * from user_ind_columns
where table_name = 'ZIPCODE_IDX';

-- hint 설정
select /*+ index_asc( zipcode_idx dong_idx )*/zipcode, sido, gugun, dong, bunji
from  zipcode_idx
where dong >='A' and dong='흑석동';

-- 날짜 합수.
-- date 형은 +, - 로 연산하면 일자에 대한 연산을 수행한다.
-- 쿼리가 실행되는 시점의 날짜와 내일의 날짜를 구하기.
select  sysdate, sysdate+1, sysdate+2, sysdate+3
from		dual;


-- 현재 월에서 월 더하기 연산
-- add_months(날짜, 더할 개월 수)
select	add_months(sysdate, 3), add_months(sysdate, -3)
from    dual;

-- 두 날짜간의 개월 차이 : months_between(큰 날짜, 작은 날짜 )
select  months_between('2021-03-30','2021-01-30'),
        months_between(sysdate,'2021-01-30')
from		dual;

select  trunc(months_between (sysdate,hiredate),0), trunc(months_between (sysdate,hiredate),0)/12
/*고마웡ㅎㅎ누구얏 혜원이~!! ㅎㅇ3ㅕㄱㅎ시역시 헤원잏ㅎ*/
from		emp;

 







