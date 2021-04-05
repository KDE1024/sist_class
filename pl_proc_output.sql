-- procedure 생성.
select * from user_procedures;

-- 바인드 변수의 선언
var r number;
var m varchar2(100);

-- 프로시저의 직접 실행
execute proc_plus(11, 26, :r, :m);
-- 바인드 변수의 출력
print r
print m

------------------------------------------------------------
-- 띠 출력
var msg varchar2(300);
exec proc_zodiac('이학민', 1997, :msg);
print msg

------------------------------------------------------------
-- 동 조회
-- 커서를 저장할수있는 데이터형을 사용하여 bind 변수 선언.
var cur_zip refcursor;

-- 실행
exec proc_zipcode( '', :cur_zip);

-- 출력
print cur_zip;
-------------------------------------------------------------
-- insert
var row_cnt number;
var msg varchar2(600);

-- procedure 실행
exec proc_insert (1235, '강인섭', 10, '주임', :row_cnt, :msg);
-- out parameter 에 존재하는 값을 출력.
print row_cnt;
print msg;

select * from cp_emp4;
-------------------------------------------------------------
-- update
-- bind 변수선언
var row_cnt number;
var msg varchar2(600);

--
exec proc_update (1235,'사원',20, :row_cnt, :msg);

print row_cnt;
print msg;

select * from cp_emp4;
--------------------------------------------------------------
-- delete
-- bind 변수선언
var row_cnt number;
var msg varchar2(600);

-- 프로시져 실행
exec proc_delete (1235, :row_cnt, :msg);

print row_cnt;
print msg;


select * from cp_emp4;
rollback;
--------------------------------------------------------------
-- 프로시저 삭제
drop procedure proc_plus;   