SELECT TO_NUMBER('1,234,567.8', '9,999,999,999.999')	FROM dual;

SELECT TO_CHAR(1234.5, '99,999.9')  FROM dual;
SELECT TO_CHAR(123.4, '9,999.990')  FROM dual;
SELECT TO_CHAR(123.45, '0,000.990')  FROM dual;
SELECT TO_CHAR(1234.5, 'L99,999.9')  FROM dual;

SELECT NVL(commission_pct, 0) FROM employees;

SELECT NVL2(commission_pct, '수당있음', '수당없음')  FROM employees;

SELECT employee_id, commission_pct
FROM employees
WHERE commission_pct is not null;

SELECT NULLIF(10, 10) FROM dual;

SELECT DECODE(commission_pct, null, '수당없음', TO_CHAR(commission_pct))
  -- commission_pct가 null이면 '수당없음' 출력, 그게 아니면 commission_pct 출력
  -- '수당없음'과 같은 자료형인 문자형으로 만들어주기 위해 TO_CHAR 사용
FROM employees;

SELECT DECODE(commission_pct, null, '수당없음', 0.1, 'A등급', TO_CHAR(commission_pct))
  -- 수당이 없으면 '수당 없음' 출력
  -- 수당이 있고 0.1이라면 A등급 출력 수당은 있지만 0.1이 아니라면 commision_pct 출력
FROM employees;

SELECT DECODE(TRUNC(commission_pct,1), null, '수당없음',
0.1, 'A등급',
0.2, 'B등급',
0.3, 'C등급',
0.4, 'D등급',
0.5, 'E등급',
'F등급')
FROM employees;

SELECT commission_pct, CASE
  WHEN commission_pct IS NULL THEN '수당없음'
  WHEN commission_pct >= 0.6 THEN 'F'
  WHEN commission_pct >= 0.5 THEN 'E'
  WHEN commission_pct >= 0.4 THEN 'D'
  WHEN commission_pct >= 0.3 THEN 'C'
  WHEN commission_pct >= 0.2 THEN 'B'
  WHEN commission_pct >= 0.1 THEN 'A'
END
FROM employees;

-- 1. 급여가 10000이거나  14000인 사원들의 사번, 이름(first_name), 급여를 검색하시오.
SELECT employee_id 사번, first_name 이름, salary 급여
FROM employees
WHERE salary IN (10000, 14000);

-- 2. first_name에 대소문자구별없이('e', 'E')를 포함하는 모든 사원을 검색하시오
SELECT first_name
FROM employees
WHERE UPPER(first_name) LIKE '%E%';

-- 3. first_name이 'J’로 시작하고 n문자를 포함하는 사원의 사번, 이름을 검색하시오.
SELECT employee_id, first_name
FROM employees
WHERE first_name LIKE 'J%n%';

-- 4.사원의 사번, 이름, 관리자번호(manager_id),  관리자여부를 출력하시오.
SELECT employee_id, first_name, manager_id, NVL2(manager_id, '관리자있음', '관리자없음')
FROM employees;

-- 5.급여가 10000이상인 사원의 사번, 부서번호, 이름, 급여, 수당을 출력하시오.단, 부서번호가 30번부서이거나 90번인 사원만 검색한다.
SELECT employee_id, department_id, first_name, salary, commission_pct
FROM employees
WHERE salary >= 10000 and department_id IN(30, 90);

--6. 급여가 10000이상인 사원의 사번, 부서번호, 이름, 급여, 수당을 출력하시오. 단, 부서번호가 30번,60번, 90번인 부서는 제외하고 사원을 검색한다.
SELECT employee_id, department_id, first_name, salary, commission_pct
FROM employees
WHERE salary >= 10000 and department_id NOT IN(30, 60, 90);

--7. 각 사원의 사번과 근무년수를 출력하시오. 단, 근무년수는 소숫점이하자리는 버리고 장기 근속자부터 출력하시오.
SELECT employee_id, TRUNC((SYSDATE-hire_date)/365)||'년'
FROM employees
ORDER BY hire_date;



-- 집계함수
SELECT SUM(salary)  -- 모든 직원의 급여 합 출력
FROM employees;

SELECT SUM(commission_pct), COUNT(commission_pct), COUNT(*)
FROM employees;

SELECT SUM(commission_pct), COUNT(commission_pct), COUNT(*), AVG(commission_pct)
FROM employees;

SELECT SUM(commission_pct), COUNT(commission_pct), COUNT(*), AVG(commission_pct), MIN(commission_pct), MAX(commission_pct)
FROM employees;

SELECT department_id, COUNT(*)
FROM employees
GROUP BY department_id;

SELECT employee_id, department_id, COUNT(*)
FROM employees
GROUP BY department_id;

SELECT AVG(salary), MAX(salary), MIN(salary)
FROM employees
GROUP BY department_id;

SELECT department_id, AVG(salary), MAX(salary), MIN(salary)
FROM employees
WHERE department_id is NOT NULL
GROUP BY department_id;

SELECT department_id, AVG(salary), MAX(salary), MIN(salary)
FROM employees
WHERE department_id IN(30, 50)
GROUP BY department_id;

SELECT department_id, AVG(salary), MAX(salary), MIN(salary)
FROM employees
WHERE 2 >= 10000
GROUP BY department_id;

SELECT department_id, AVG(salary), MAX(salary), MIN(salary)
FROM employees
GROUP BY department_id
HAVING AVG(salary) >= 10000;

SELECT department_id, job_id, AVG(salary)
FROM employees
GROUP BY department_id, job_id;

-- 부서별 직무별 부서번호, 직무번호, 평균급여를 출력하시오
-- 부서번호순으로 출력, 부서번호가 같으면 평균급여가 많은 직무부터 출력
SELECT department_id, job_id, AVG(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id, AVG(salary) DESC;

-- ROLLUP함수
SELECT department_id, job_id, SUM(salary)
FROM employees
GROUP BY ROLLUP(department_id, job_id);

-- CUBE함수
SELECT department_id, job_id, SUM(salary)
FROM employees
GROUP BY CUBE(department_id, job_id);
-- CUBE 함수 + department_id에 대한 오름차순
SELECT department_id, job_id, SUM(salary)
FROM employees
GROUP BY CUBE(department_id, job_id)
ORDER BY department_id;

-- ROLLUP함수
SELECT department_id 부서번호, 
           NVL2(job_id, ''||job_id, '소계') 직무번호,  -- job_id가 있으면 job_id가, 없으면 '소계'가 출력
           SUM(salary) 급여합
FROM employees
GROUP BY  ROLLUP(department_id, job_id);



-- 실습
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



-- 3. 다음과 같은  20번부서 총급여, 50번부서 총급여, 80번부서 총급여, 90번부서 총급여, 전사원 총급여가  나타나도록 그룹함수와 DECODE함수를 사용하시오.
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
HAVING COUNT(department_id) > 10;

-- 5.년도별 입사자수를 출력하시오, 단 최근년도부터 출력한다
SELECT TO_CHAR(hire_date, 'yyyy')||'년' 입사년도, COUNT(*)
FROM employees
GROUP BY TO_CHAR(hire_date, 'yyyy')||'년'
ORDER BY 입사년도 DESC;


-- 6. 하반기(7~12월) 월별 입사자수를 출력하시오.입사자수가 5명이상인 경우만 출력한다
SELECT TO_CHAR(hire_date, 'MM')||'월' 월, COUNT(*)
FROM employees
WHERE TO_NUMBER(TO_CHAR(hire_date, 'MM')) BETWEEN 7 AND 12
GROUP BY TO_CHAR(hire_date, 'MM')||'월'
HAVING count(*) >= 5
ORDER BY 월 ASC;