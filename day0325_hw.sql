/*1. CP_EMP2테이블에 아래의 값으로 레코드를 추가하세요.
   사원번호,사원명,직무,연봉,매니저번호,입사일.
   1111,강인섭,사원,2800,7902,추가시점의 일자
   1112,김덕영,사원,2800,7902,추가시점의 일자
   1113,박기범,대리,3200,7893,추가시점의 일자 */
select * from CP_EMP2;

insert into cp_emp2 (empno, ename, job, sal, mgr, hiredate)
values (1111,'강인섭','사원',2800,7902,sysdate);

insert into cp_emp2 (empno, ename, job, sal, mgr, hiredate)
values (1112,'김덕영','사원',2800,7902,sysdate);

insert into cp_emp2 (empno, ename, job, sal, mgr, hiredate)
values (1113,'박기범','대리',3200,7893,sysdate);

/*2. EMP테이블은 본사, CP_ EMP2테이블은 지사 사원정보를 저장하고 있습니다.
  본사의 모든 사원과 지사의 모든 사원을 대상으로 마지막에 입사한 사원부터
   정렬했을때 3~10번째 레코드를 조회하세요.

	조회컬럼은 사원번호 사원명,직무,연봉,입사일을 조회합니다.
  단, 입사일은 년-월-일 분기의 형식으로 출력하고, 연봉은 9자리로 맞추되 3자리마다,를 넣어 출력합니다.
*/
select  e_num, EMPNO, ENAME, JOB, SAL, HIREDATE
from (select   EMPNO, ENAME, JOB, SAL, HIREDATE,
							 row_number() over(order by hiredate desc)as e_num
			from 	(select	EMPNO, ENAME, JOB, SAL, HIREDATE
							from		(select	 EMPNO, ENAME, JOB, to_char(SAL,'9,999')SAL, to_char(HIREDATE,'yyyy-mm-dd')HIREDATE
											 from		EMP )

					    union all

							select	EMPNO, ENAME, JOB, SAL, HIREDATE
							from	 	(select	EMPNO, ENAME, JOB, to_char(SAL,'9,999')SAL, to_char(HIREDATE,'yyyy-mm-dd')HIREDATE
											 from		CP_EMP2 )))

where	e_num between 3 and 10



/*   rownum 안됨~~~~~~~~~~~~~~~~~~~~~~~
select  e_num, EMPNO, ENAME, JOB, SAL, HIREDATE
from (select  rownum e_num, EMPNO, ENAME, JOB, SAL, HIREDATE
			from 	(select	EMPNO, ENAME, JOB, SAL, HIREDATE
							from		(select	 EMPNO, ENAME, JOB, to_char(SAL,'9,999')SAL, to_char(HIREDATE,'yyyy-mm-dd')HIREDATE
											 from		EMP )

					    union all

							select	EMPNO, ENAME, JOB, SAL, HIREDATE
							from	 	(select	EMPNO, ENAME, JOB, to_char(SAL,'9,999')SAL, to_char(HIREDATE,'yyyy-mm-dd')HIREDATE
											 from		CP_EMP2 )))

where	e_num between 3 and 10
order by hiredate desc;*/


