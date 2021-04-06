-- 숫자로된 난수.
select  trunc(dbms_random.value(1,10),0),trunc(dbms_random.value(1,46),0)
from		dual;

-- 여러가지 문자가 혼합된 난수.
select  dbms_random.string('u',5), dbms_random.string('l',5),
				dbms_random.string('a',5), dbms_random.string('x',5), 
				dbms_random.string('p',5)
from		dual;
