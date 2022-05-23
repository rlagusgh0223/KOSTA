-- 실습1

-- 1. 급여가 10000이거나  14000인 사원들의 사번, 이름(first_name), 급여를 검색하시오.
SELECT employee_id 사번, first_name 이름, salary 급여
FROM employees
WHERE salary IN (10000, 14000);


-- 2. first_name에 대소문자구별없이('e', 'E')를 포함하는 모든 사원을 검색하시오
SELECT first_name
FROM employees
WHERE UPPER(first_name) LIKE '%E%';
-- WHERE INSTR(UPPER(first_name), 'E') >0;  -- LIKE는 안 쓰는게 좋다. INSTR은 E가 있으면 있는 만큼 숫자 출력


-- 3. first_name이 'J’로 시작하고 n문자를 포함하는 사원의 사번, 이름을 검색하시오.
SELECT employee_id, first_name
FROM employees
WHERE first_name LIKE 'J%n%';


-- 4.사원의 사번, 이름, 관리자번호(manager_id),  관리자여부를 출력하시오.
SELECT employee_id, first_name, manager_id, NVL2(manager_id, '관리자있음', '관리자없음')
-- NVL2 대신 DECODE(manager_id, null, '없음', '있음') 도 괜찮다
FROM employees;


-- 5.급여가 10000이상인 사원의 사번, 부서번호, 이름, 급여, 수당을 출력하시오.단, 부서번호가 30번부서이거나 90번인 사원만 검색한다.
SELECT employee_id, department_id, first_name, salary, commission_pct
FROM employees
WHERE salary >= 10000 and department_id IN(30, 90);


-- 6.급여가 10000이상인 사원의 사번, 부서번호, 이름, 급여, 수당을 출력하시오.단, 부서번호가 30번,60번, 90번인 부서는 제외하고 사원을 검색한다.
SELECT employee_id, department_id, first_name, salary, commission_pct
FROM employees
WHERE salary >= 10000 and department_id NOT IN(30, 60, 90);


-- 7. 각 사원의 사번과 근무년수를 출력하시오. 단, 근무년수는 소숫점이하자리는 버리고 장기 근속자부터 출력하시오.
SELECT employee_id, TRUNC((SYSDATE-hire_date)/365)||'년'
-- 365로 나누는 대신
-- TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date)/12)
-- MONTH_BETWEEN은 개월수를 나타낸다
FROM employees
ORDER BY hire_date;
-- ORDER BY 2 DESC;

========================================
-- 실습2

-- 1. 급여가 4000보다 많은 사원들의 부서별 급여평균를 출력하시오. 단 급여평균은 소숫점이하2자리에서 반올림합니다.
SELECT ROUND(AVG(salary),1)
FROM employees
WHERE salary >= 4000
GROUP BY department_id;


-- 2. 부서들의 부서번호, 평균급여, 최대급여, 최소급여를 출력하시오
-- 단 부서없는 사원과 30번부서사원, 50번부서사원은 제외한다
SELECT department_id 부서번호, ROUND(AVG(salary),1) 평균급여, MAX(salary) 최대급여, MIN(salary) 최소급여
FROM employees
WHERE department_id NOT IN (30, 50) and department_id is NOT NULL
GROUP BY department_id;

-- 이런 방법도 있다(굳이 NOT IN 안에 null을 넣고 싶다면)
-- WHERE NVL(department_id, 0) NOT IN (0, 30, 50)


-- 3. 다음과 같은  20번부서 총급여, 50번부서 총급여, 80번부서 총급여, 90번부서 총급여, 전사원 총급여가  나타나도록 그룹함수와 DECODE함수를 사용하시오.

-- 20번부서 급여  50번부서총급여 80번부서총급여  90번부서 총급여 전사원 총급여
---------------    ---------------   ---------------     ---------------     -------------
--   19000          156400            304500             58000              691416


SELECT sum(DECODE(department_id, 20, salary)) "20번부서총급여",
          sum(DECODE(department_id, 50, salary)) "50번부서총급여",
          sum(DECODE(department_id, 80, salary)) "80번부서총급여",
          sum(DECODE(department_id, 90, salary)) "90번부서총급여",
          sum(salary) "전사원총급여"
FROM employees;


-- 4.지역별 지역번호(location_id), 부서수를 출력하시오. 부서수가 10개 이상인 지역만 출력한다
SELECT location_id, COUNT(department_id)
FROM departments
GROUP BY location_id
HAVING COUNT(department_id) >= 10;


-- 5.년도별 입사자수를 출력하시오, 단 최근년도부터 출력한다
SELECT TO_CHAR(hire_date, 'yyyy')||'년' "입사년도", COUNT(*)
FROM employees
GROUP BY TO_CHAR(hire_date, 'yyyy')||'년'
ORDER BY TO_CHAR(hire_date, 'yyyy')||'년' DESC;

-- 오라클 제공 함수로 EXTRACT 있다
-- EXTRACT(바꿀 연/월/일 FROM 날짜)  (year/month/day)
-- ex) EXTRACT(year FROM hire_date)


-- 6. 하반기(7~12월) 월별 입사자수를 출력하시오.입사자수가 5명이상인 경우만 출력한다
SELECT TO_CHAR(hire_date, 'MM')||'월', COUNT(*)
FROM employees
WHERE TO_NUMBER(TO_CHAR(hire_date, 'MM')) BETWEEN 7 AND 12
GROUP BY TO_CHAR(hire_date, 'MM')||'월'
HAVING count(*) >= 5
ORDER BY TO_CHAR(hire_date, 'MM')||'월';

-- 문자열로 비교하려면 07 쓰면 된다(문자열로 숫자도 크기 비교 가능)
-- WHERE TO_CHAR(hire_date, 'MM') >= 07