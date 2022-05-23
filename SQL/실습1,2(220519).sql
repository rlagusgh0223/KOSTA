-- �ǽ�1

-- 1. �޿��� 10000�̰ų�  14000�� ������� ���, �̸�(first_name), �޿��� �˻��Ͻÿ�.
SELECT employee_id ���, first_name �̸�, salary �޿�
FROM employees
WHERE salary IN (10000, 14000);


-- 2. first_name�� ��ҹ��ڱ�������('e', 'E')�� �����ϴ� ��� ����� �˻��Ͻÿ�
SELECT first_name
FROM employees
WHERE UPPER(first_name) LIKE '%E%';
-- WHERE INSTR(UPPER(first_name), 'E') >0;  -- LIKE�� �� ���°� ����. INSTR�� E�� ������ �ִ� ��ŭ ���� ���


-- 3. first_name�� 'J���� �����ϰ� n���ڸ� �����ϴ� ����� ���, �̸��� �˻��Ͻÿ�.
SELECT employee_id, first_name
FROM employees
WHERE first_name LIKE 'J%n%';


-- 4.����� ���, �̸�, �����ڹ�ȣ(manager_id),  �����ڿ��θ� ����Ͻÿ�.
SELECT employee_id, first_name, manager_id, NVL2(manager_id, '����������', '�����ھ���')
-- NVL2 ��� DECODE(manager_id, null, '����', '����') �� ������
FROM employees;


-- 5.�޿��� 10000�̻��� ����� ���, �μ���ȣ, �̸�, �޿�, ������ ����Ͻÿ�.��, �μ���ȣ�� 30���μ��̰ų� 90���� ����� �˻��Ѵ�.
SELECT employee_id, department_id, first_name, salary, commission_pct
FROM employees
WHERE salary >= 10000 and department_id IN(30, 90);


-- 6.�޿��� 10000�̻��� ����� ���, �μ���ȣ, �̸�, �޿�, ������ ����Ͻÿ�.��, �μ���ȣ�� 30��,60��, 90���� �μ��� �����ϰ� ����� �˻��Ѵ�.
SELECT employee_id, department_id, first_name, salary, commission_pct
FROM employees
WHERE salary >= 10000 and department_id NOT IN(30, 60, 90);


-- 7. �� ����� ����� �ٹ������ ����Ͻÿ�. ��, �ٹ������ �Ҽ��������ڸ��� ������ ��� �ټ��ں��� ����Ͻÿ�.
SELECT employee_id, TRUNC((SYSDATE-hire_date)/365)||'��'
-- 365�� ������ ���
-- TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date)/12)
-- MONTH_BETWEEN�� �������� ��Ÿ����
FROM employees
ORDER BY hire_date;
-- ORDER BY 2 DESC;

========================================
-- �ǽ�2

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

-- �̷� ����� �ִ�(���� NOT IN �ȿ� null�� �ְ� �ʹٸ�)
-- WHERE NVL(department_id, 0) NOT IN (0, 30, 50)


-- 3. ������ ����  20���μ� �ѱ޿�, 50���μ� �ѱ޿�, 80���μ� �ѱ޿�, 90���μ� �ѱ޿�, ����� �ѱ޿���  ��Ÿ������ �׷��Լ��� DECODE�Լ��� ����Ͻÿ�.

-- 20���μ� �޿�  50���μ��ѱ޿� 80���μ��ѱ޿�  90���μ� �ѱ޿� ����� �ѱ޿�
---------------    ---------------   ---------------     ---------------     -------------
--   19000          156400            304500             58000              691416


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
HAVING COUNT(department_id) >= 10;


-- 5.�⵵�� �Ի��ڼ��� ����Ͻÿ�, �� �ֱٳ⵵���� ����Ѵ�
SELECT TO_CHAR(hire_date, 'yyyy')||'��' "�Ի�⵵", COUNT(*)
FROM employees
GROUP BY TO_CHAR(hire_date, 'yyyy')||'��'
ORDER BY TO_CHAR(hire_date, 'yyyy')||'��' DESC;

-- ����Ŭ ���� �Լ��� EXTRACT �ִ�
-- EXTRACT(�ٲ� ��/��/�� FROM ��¥)  (year/month/day)
-- ex) EXTRACT(year FROM hire_date)


-- 6. �Ϲݱ�(7~12��) ���� �Ի��ڼ��� ����Ͻÿ�.�Ի��ڼ��� 5���̻��� ��츸 ����Ѵ�
SELECT TO_CHAR(hire_date, 'MM')||'��', COUNT(*)
FROM employees
WHERE TO_NUMBER(TO_CHAR(hire_date, 'MM')) BETWEEN 7 AND 12
GROUP BY TO_CHAR(hire_date, 'MM')||'��'
HAVING count(*) >= 5
ORDER BY TO_CHAR(hire_date, 'MM')||'��';

-- ���ڿ��� ���Ϸ��� 07 ���� �ȴ�(���ڿ��� ���ڵ� ũ�� �� ����)
-- WHERE TO_CHAR(hire_date, 'MM') >= 07