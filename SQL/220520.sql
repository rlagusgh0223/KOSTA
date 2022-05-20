 -- 사원의 사번, 이름, 급여, 부서번호, 부서명을 출력하시오
SELECT employee_id, first_name, salary, department_id
FROM employees;

SELECT department_id, department_name
FROM departments;

-- 카티션 프러덕트
SELECT employee_id, department_name
FROM employees, departments;

-- 오라클 전용 JOIN 문법
SELECT employee_id, department_name
FROM employees, departments
WHERE employees.department_id = departments.department_id
ORDER BY employee_id;

-- 표준화된 ANSI JOIN 문법
SELECT employee_id, department_name
FROM employees JOIN departments ON employees.department_id = departments.department_id
ORDER BY employee_id;

 -- 사원의 사번, 이름, 급여, 부서번호, 부서명을 출력하시오(테이블 별칭 주기까지 내용 포함)
SELECT employee_id, first_name, salary,
       e.department_id, d.department_id,  -- 각 테이블의 별칭명.~로 쓰는거 권장
       department_name
FROM employees e JOIN departments d ON (e.department_id = d.department_id)
ORDER BY employee_id;

-- 사원의 사번, 부서번호, 부서명을 출력하시오(위에서 JOIN ON절로 만든거 NATURAL JOIN으로 만들기)
SELECT employee_id, department_id, department_name
FROM employees NATURAL JOIN departments;

-- 사원의 사번, 직무번호, 직무명을 출력하시오
SELECT employee_id, department_id, department_name
FROM employees JOIN departments USING (department_id);

-- 부서의 부서번호, 부서명, 부서장 사번, 부서장 이름을 출력하시오
SELECT d.department_id, department_name, manager_id, first_name
FROM departments d JOIN employees e USING (manager_id);

-- 부서의 부서번호, 부서가 속한 지역의 도시명(city), 국가명(country_name)을 출력하시오
SELECT d.department_id, l.city, c.country_name
FROM departments d JOIN locations l ON (d.location_id = l.location_id)
                JOIN countries c ON (l.country_id = c.country_id);

        -- 사원의 사번, 부서번호, 부서명, 직무번호, 직무명을 출력하시오
        -- 단, 직무명에 'Manager'를 포함한 사원들만 출력하시오
        -- 직무번호순, 부서명으로 오름차순하시오(사전표기법으로 출력한다)
SELECT e.employee_id, e.first_name,
                  e.department_id, d.department_name,
                  j.job_id, job_title
FROM employees e JOIN departments d ON (e.department_id = d.department_id)
		        JOIN jobs j ON (e.job_id = j.job_id)
WHERE job_title LIKE '%Manager%'
ORDER BY 5, 4;

-- 부서별 부서번호, 부서명, 부서별 사원수, 평균급여를 출력하시오
SELECT d.department_id 부서번호, d.department_name 부서명, count(e.employee_id) 부서별사원수, ROUND(AVG(e.salary),2) 평균급여
FROM employees e JOIN  departments d ON (e.department_id = d.department_id)
GROUP BY d.department_id, d.department_name;

-- 부서별 사원수가 10명 이상인 부서들의 부서별 부서번호, 부서명, 부서별 사원수, 평균급여를 출력하시오
SELECT d.department_id 부서번호, d.department_name 부서명, count(e.employee_id) 부서별사원수, ROUND(AVG(e.salary),2) 평균급여
FROM employees e JOIN  departments d ON (e.department_id = d.department_id)
GROUP BY d.department_id, d.department_name
HAVING COUNT(e.employee_id) >= 10;

-- 사원의 사번, 이름, 관리자번호, 관리자이름을 출력하시오
 -- self JOIN을 해서 한 테이블의 자료를 두 개의 테이블 자료처럼 사용
SELECT e.employee_id 사번, e.first_name 이름,
          m.employee_id 관리자번호, m.first_name 관리자이름
FROM employees e JOIN employees m ON (e.manager_id = m.employee_id);

-- 사원의 부서번호와 관리자의 부서번호가 일치하지 않는
-- 사원들의 사번, 부서번호를 출력하시오
-- 사번순으로 정렬
SELECT e.employee_id, e.department_id
FROM employees e JOIN employees m ON (e.manager_id = m.employee_id)
WHERE e.department_id <> m.department_id
ORDER BY e.employee_id;

--OUTER JOIN
SELECT employee_id, first_name, salary, e.department_id, d.department_name
FROM employees e LEFT OUTER JOIN departments d ON (e.department_id = d.department_id);

-- 부서번호, 부서명, 부서가 속한 도시를 출력하시오
SELECT department_id, department_name, city
FROM departments d JOIN locations l ON (d.location_id = l.location_id);

-- 각 도시에 있는 부서수를 출력하시오
SELECT city, COUNT(department_id)
FROM locations l JOIN departments d ON (l.location_id = d.location_id)
GROUP BY city;  -- 도시별

-- 각 도시에 있는 부서수를 출력하시오
-- 단, 부서가 없는 도시도 모두 출력
SELECT city, COUNT(department_id)
FROM locations l LEFT JOIN departments d ON (l.location_id = d.location_id)
GROUP BY city;  -- 도시별

SELECT city, COUNT(department_id)
FROM departments d RIGHT JOIN locations l ON (l.location_id = d.location_id)
GROUP BY city;

-- 사원의 사번, 이름, 관리자번호, 관리자이름을 출력하시오
-- 단, 관리자 없는 사원도 모두 출력
SELECT e.employee_id 사번, e.first_name 이름, m.employee_id 관리자번호, m.first_name 관리자이름
FROM employees e LEFT OUTER JOIN employees m ON (e.manager_id = m.employee_id);

-- 사번, 이름, 부서번호, 부서명을 출력하시오
-- 단, 사원이 없는 부서도 모두 출력
SELECT e.employee_id 사번, e.first_name 이름, d.department_id 부서번호, d.department_name 부서명
FROM employees e RIGHT OUTER JOIN departments d ON (e.department_id = d.department_id);

-- FULL OUTER JOIN
SELECT e.employee_id 사번, e.first_name 이름, d.department_id 부서번호, d.department_name 부서명
FROM employees e FULL JOIN departments d ON (e.department_id = d.department_id);

-- 오라클 전용 OUTER JOIN
SELECT employee_id, first_name, salary, e.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+);  -- 기준이 되지 못하는 쪽에 (+)표시



-- 서브쿼리
SELECT employee_id, salary
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);

-- 여러행 서브쿼리
-- 부서별 최대급여를 출력하시오
SELECT MAX(salary) FROM employees GROUP BY department_id;

-- 여러행을 반환하는 서브쿼리
SELECT employee_id, salary
FROM employees
WHERE salary IN (SELECT MAX(salary) FROM employees GROUP BY department_id);

--IN 연산자와 =ANY 연산자는 같은 의미다
SELECT employee_id, salary
FROM employees
WHERE salary =ANY (SELECT MAX(salary) FROM employees GROUP BY department_id)
ORDER BY salary;

-- 여러행의 값들 중 하나라도 더 크다면(최솟값보다 크다면)
SELECT employee_id, salary
FROM employees
WHERE salary >ANY (SELECT MAX(salary) FROM employees GROUP BY department_id)
ORDER BY salary;

-- 여러행의 값들 중 하나라도 작다면(최댓값보다 작다면)
SELECT employee_id, salary
FROM employees
WHERE salary <ANY (SELECT MAX(salary) FROM employees GROUP BY department_id)
ORDER BY salary;

-- 부서별 최대급여를 받는 사원의 부서번호, 사번, 급여출력하시오
SELECT employee_id, department_id, salary
FROM employees
WHERE (department_id, salary) IN (SELECT department_id, MAX(salary) FROM employees GROUP BY department_id)
-- 페어와이징 : 메인쿼리에서의 컬럼과 서브쿼리에서의 컬럼 맞춘다(쌍을 맞춘다)
ORDER BY department_id, salary;

--Inline View
SELECT rownum, employee_id, salary
FROM employees
ORDER BY salary;

-- 급여가 적은 사원부터 사번, 급여를 출력합니다
-- 급여가 적은 사원들을 5명까지만 출력
SELECT rownum, employee_id, salary
FROM (SELECT *
         FROM employees
         ORDER BY salary)  -- ()를 쳐서 우선순위가 올라갔다
WHERE rownum <= 5;  -- 정렬부터 하고 WHERE조건으로 비교

-- 급여가 적은 사원부터 사번, 급여를 출력합니다
-- 급여적은 사원들 11번째 사원부터 20번째 사원까지만 출력
SELECT *
FROM(SELECT rownum r, employee_id, salary
         FROM (SELECT *
                  FROM employees
                  ORDER BY salary)
         )
WHERE r BETWEEN 11 AND 20;

-- 스칼라쿼리
SELECT employee_id, department_id,
          (SELECT department_name
           FROM departments
           WHERE departments.department_id = employees.department_id)
FROM employees;