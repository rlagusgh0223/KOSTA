SELECT TO_NUMBER('1,234,567.8', '9,999,999,999.999')	FROM dual;

SELECT TO_CHAR(1234.5, '99,999.9')  FROM dual;
SELECT TO_CHAR(123.4, '9,999.990')  FROM dual;
SELECT TO_CHAR(123.45, '0,000.990')  FROM dual;
SELECT TO_CHAR(1234.5, 'L99,999.9')  FROM dual;

SELECT NVL(commission_pct, 0) FROM employees;

SELECT NVL2(commission_pct, '��������', '�������')  FROM employees;

SELECT employee_id, commission_pct
FROM employees
WHERE commission_pct is not null;

SELECT NULLIF(10, 10) FROM dual;

SELECT DECODE(commission_pct, null, '�������', TO_CHAR(commission_pct))
  -- commission_pct�� null�̸� '�������' ���, �װ� �ƴϸ� commission_pct ���
  -- '�������'�� ���� �ڷ����� ���������� ������ֱ� ���� TO_CHAR ���
FROM employees;

SELECT DECODE(commission_pct, null, '�������', 0.1, 'A���', TO_CHAR(commission_pct))
  -- ������ ������ '���� ����' ���
  -- ������ �ְ� 0.1�̶�� A��� ��� ������ ������ 0.1�� �ƴ϶�� commision_pct ���
FROM employees;

SELECT DECODE(TRUNC(commission_pct,1), null, '�������',
0.1, 'A���',
0.2, 'B���',
0.3, 'C���',
0.4, 'D���',
0.5, 'E���',
'F���')
FROM employees;

SELECT commission_pct, CASE
  WHEN commission_pct IS NULL THEN '�������'
  WHEN commission_pct >= 0.6 THEN 'F'
  WHEN commission_pct >= 0.5 THEN 'E'
  WHEN commission_pct >= 0.4 THEN 'D'
  WHEN commission_pct >= 0.3 THEN 'C'
  WHEN commission_pct >= 0.2 THEN 'B'
  WHEN commission_pct >= 0.1 THEN 'A'
END
FROM employees;

-- 1. �޿��� 10000�̰ų�  14000�� ������� ���, �̸�(first_name), �޿��� �˻��Ͻÿ�.
SELECT employee_id ���, first_name �̸�, salary �޿�
FROM employees
WHERE salary IN (10000, 14000);

-- 2. first_name�� ��ҹ��ڱ�������('e', 'E')�� �����ϴ� ��� ����� �˻��Ͻÿ�
SELECT first_name
FROM employees
WHERE UPPER(first_name) LIKE '%E%';

-- 3. first_name�� 'J���� �����ϰ� n���ڸ� �����ϴ� ����� ���, �̸��� �˻��Ͻÿ�.
SELECT employee_id, first_name
FROM employees
WHERE first_name LIKE 'J%n%';

-- 4.����� ���, �̸�, �����ڹ�ȣ(manager_id),  �����ڿ��θ� ����Ͻÿ�.
SELECT employee_id, first_name, manager_id, NVL2(manager_id, '����������', '�����ھ���')
FROM employees;

-- 5.�޿��� 10000�̻��� ����� ���, �μ���ȣ, �̸�, �޿�, ������ ����Ͻÿ�.��, �μ���ȣ�� 30���μ��̰ų� 90���� ����� �˻��Ѵ�.
SELECT employee_id, department_id, first_name, salary, commission_pct
FROM employees
WHERE salary >= 10000 and department_id IN(30, 90);

--6. �޿��� 10000�̻��� ����� ���, �μ���ȣ, �̸�, �޿�, ������ ����Ͻÿ�. ��, �μ���ȣ�� 30��,60��, 90���� �μ��� �����ϰ� ����� �˻��Ѵ�.
SELECT employee_id, department_id, first_name, salary, commission_pct
FROM employees
WHERE salary >= 10000 and department_id NOT IN(30, 60, 90);

--7. �� ����� ����� �ٹ������ ����Ͻÿ�. ��, �ٹ������ �Ҽ��������ڸ��� ������ ��� �ټ��ں��� ����Ͻÿ�.
SELECT employee_id, TRUNC((SYSDATE-hire_date)/365)||'��'
FROM employees
ORDER BY hire_date;



-- �����Լ�
SELECT SUM(salary)  -- ��� ������ �޿� �� ���
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

-- �μ��� ������ �μ���ȣ, ������ȣ, ��ձ޿��� ����Ͻÿ�
-- �μ���ȣ������ ���, �μ���ȣ�� ������ ��ձ޿��� ���� �������� ���
SELECT department_id, job_id, AVG(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id, AVG(salary) DESC;

-- ROLLUP�Լ�
SELECT department_id, job_id, SUM(salary)
FROM employees
GROUP BY ROLLUP(department_id, job_id);

-- CUBE�Լ�
SELECT department_id, job_id, SUM(salary)
FROM employees
GROUP BY CUBE(department_id, job_id);
-- CUBE �Լ� + department_id�� ���� ��������
SELECT department_id, job_id, SUM(salary)
FROM employees
GROUP BY CUBE(department_id, job_id)
ORDER BY department_id;

-- ROLLUP�Լ�
SELECT department_id �μ���ȣ, 
           NVL2(job_id, ''||job_id, '�Ұ�') ������ȣ,  -- job_id�� ������ job_id��, ������ '�Ұ�'�� ���
           SUM(salary) �޿���
FROM employees
GROUP BY  ROLLUP(department_id, job_id);



-- �ǽ�
-- 1. �޿��� 4000���� ���� ������� �μ��� �޿���ո� ����Ͻÿ�. �� �޿������ �Ҽ�������2�ڸ����� �ݿø��մϴ�.
SELECT ROUND(AVG(salary),1)
FROM employees
WHERE salary >= 4000
GROUP BY department_id;

-- 2. �μ����� �μ���ȣ, ��ձ޿�, �ִ�޿�, �ּұ޿��� ����Ͻÿ�
-- �� �μ����� ����� 30���μ����, 50���μ������ �����Ѵ�
SELECT department_id �μ���ȣ, ROUND(AVG(salary),1) ��ձ޿�, MAX(salary) �ִ�޿�, MIN(salary) �ּұ޿�
FROM employees
WHERE department_id NOT IN (30, 50) and department_id is NOT NULL
GROUP BY department_id;



-- 3. ������ ����  20���μ� �ѱ޿�, 50���μ� �ѱ޿�, 80���μ� �ѱ޿�, 90���μ� �ѱ޿�, ����� �ѱ޿���  ��Ÿ������ �׷��Լ��� DECODE�Լ��� ����Ͻÿ�.
SELECT sum(DECODE(department_id, 20, salary)) "20���μ��ѱ޿�",
sum(DECODE(department_id, 50, salary)) "50���μ��ѱ޿�",
sum(DECODE(department_id, 80, salary)) "80���μ��ѱ޿�",
sum(DECODE(department_id, 90, salary)) "90���μ��ѱ޿�",
sum(salary) "������ѱ޿�"

FROM employees;


-- 4.������ ������ȣ(location_id), �μ����� ����Ͻÿ�. �μ����� 10�� �̻��� ������ ����Ѵ�
SELECT location_id, COUNT(department_id)
FROM departments
GROUP BY location_id
HAVING COUNT(department_id) > 10;

-- 5.�⵵�� �Ի��ڼ��� ����Ͻÿ�, �� �ֱٳ⵵���� ����Ѵ�
SELECT TO_CHAR(hire_date, 'yyyy')||'��' �Ի�⵵, COUNT(*)
FROM employees
GROUP BY TO_CHAR(hire_date, 'yyyy')||'��'
ORDER BY �Ի�⵵ DESC;


-- 6. �Ϲݱ�(7~12��) ���� �Ի��ڼ��� ����Ͻÿ�.�Ի��ڼ��� 5���̻��� ��츸 ����Ѵ�
SELECT TO_CHAR(hire_date, 'MM')||'��' ��, COUNT(*)
FROM employees
WHERE TO_NUMBER(TO_CHAR(hire_date, 'MM')) BETWEEN 7 AND 12
GROUP BY TO_CHAR(hire_date, 'MM')||'��'
HAVING count(*) >= 5
ORDER BY �� ASC;