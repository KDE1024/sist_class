select * from user_procedures;

-- 패키지 선언된 함수를 사용.
-- 함수는 간접 실행.
select  test_pack.birth(26)
from		dual;

-- 패키지 선언된 프로시저를 사용.
var		cur_car refcursor;

exec  test_pack.car_list(3, :cur_car);

print cur_car;   