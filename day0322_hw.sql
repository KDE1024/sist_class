/*숙제1.
emp테이블을 사용하여 아래와 같이 조회 하세요.
  xxx번 Xxxx사원입 입사일은 yyyy-mm-dd 요일 일 입니다. 연봉은 xxx $입니다.
 단. 입사요일이 월,화,목에 입사한 사원에 대해서만 조회합니다.
     사원명은 첫글자만 대문자로 조회하고, 입사일의 오름차순 정렬하여 출력하되
     입사일이 같다면 연봉의 내림차순으로 정렬하여 출력하세요.
      연봉은 3자리마다 ,를 넣어서출력하세요.*/

select * from emp;   --월 :2,화:3, 목:5

select  	empno, initcap(ename)as ename, to_char(hiredate,'yyyy-mm-dd')as hiredate, to_char(sal,'9,999')as sal
from			emp
where			to_char(hiredate, 'd')=2 or to_char(hiredate,'d')=3 or to_char(hiredate,'d')=5
order by  hiredate, sal desc;


--2. dept테이블에서 '딸'이 많은 지역에 있는 부서의 부서번호, 부서명을조회하세요.
select * from dept;

select		DEPTNO, DNAME
from			dept
where			LOC = 'DALLAS';


/*3. 사원 테이블에서 직무별 , 사원수, 연봉합, 총합을 조회하세요.
  (총합은 직무별합이 조회되어야합니다.) */

select    JOB, count(empno),sum(sal)
from			emp
group by	rollup(JOB);

/*4.  사원테이블에서 3,4분기에 입사한 사원들의  부서별 연봉합,
    연봉평균, 최고연봉, 최저연봉, 사원수를 조회하여 부서별 오름차순으로 정렬하여
    아래와 같이 출력하세요.
    출력예 )  xx번부서 사원수는 [x]명, 연봉평균 : [xx],
	   최고연봉 [xx], 최저연봉[xx]*/

select   		deptno ||'번 부사의 사원수는 ['||count(empno)||'] 명, '||
						'연봉평균 : ['|| trunc(avg(sal),0) ||'] 최고연봉: ['|| max(sal)||
						'], 최저연봉 : ['|| min(sal)||']'as total
from		    emp
where				to_char(hiredate, 'q') in(3,4)
group by	 	deptno
order by		deptno;








