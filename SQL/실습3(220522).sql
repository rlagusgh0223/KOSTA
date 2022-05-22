-- 1. �޿��� 4000 ���� ���� ������� �μ��� �޿���ո� ����Ͻÿ�. �� �޿������
-- �Ҽ������� 2 �ڸ����� �ݿø��մϴ�.
SELECT ROUND(AVG(salary), 1)
FROM employees
WHERE salary > 4000
GROUP BY department_id;

-- 2. �μ���ġ�� ���� ���� ����� �����ϰ� �μ��� �޿������ ����Ͻÿ�.�� �޿������
-- �Ҽ������� 2 �ڸ����� �ݿø��մϴ�.
SELECT ROUND(AVG(salary), 1)
FROM employees
WHERE salary > 4000 and department_id is not null
GROUP BY department_id;

-- 3. �μ���ġ�� ���� ���� ����� �����ϰ� �޿������ 10000 �̻��� �μ��� �޿������
-- ����Ͻÿ�.�� �޿������ �Ҽ������� 2 �ڸ����� �ݿø��մϴ�.
SELECT ROUND(AVG(salary), 1)
FROM employees
WHERE department_id is not null
GROUP BY department_id
HAVING AVG(salary) >= 10000;

-- 4. ��å(job_title)�� 'President'�� ����� ���, �̸��� ����Ͻÿ�: (NaturalJOIN ���� ǥ��)
SELECT employee_id, first_name
FROM employees NATURAL JOIN jobs
WHERE job_title = 'President';

-- 5. ��å(job_title)�� 'President'�� �ƴ� ����� ���, �̸��� ����Ͻÿ�(JOIN USING ���� ǥ��)
SELECT employee_id, first_name
FROM employees JOIN jobs USING(job_id)
WHERE job_title <> 'President';

-- 6. ��å(job_title)�� 'President'�� �ƴ� ����� ���, �̸��� ����Ͻÿ� (SubQuery ���)
SELECT employee_id, first_name
FROM employees
WHERE job_id IN (SELECT job_id FROM jobs WHERE job_title <> 'President'); 

-- 7. �μ���ȣ, �μ���, �μ��� �޿��Ѿװ� ��ձ޿��� ����Ͻÿ�.
-- �μ����� ����� ��� ����Ͻÿ�.
-- ��, �޿��Ѿ��� ���� ������ �����ϰ�,
-- ��ձ޿��� �Ҽ��� ���� 1 �ڸ����� ��Ÿ������ �ݿø��ؾ� �Ѵ� (JOIN ���)
SELECT e.department_id �μ���ȣ, d.department_name �μ���, SUM(salary) �޿��Ѿ�, ROUND(AVG(salary), 1) ��ձ޿�
FROM employees e LEFT JOIN departments d ON (e.department_id = d.department_id)
GROUP BY e.department_id, d.department_name
ORDER BY SUM(salary);

-- 8. �μ���ȣ, �μ���, �μ��� �޿��Ѿװ� ��ձ޿��� ����Ͻÿ�. (Scalar Query ���)
-- ��, �޿��Ѿ��� ���� ������ �����ϰ�,
-- ��ձ޿��� �Ҽ��� ���� 1 �ڸ����� ��Ÿ������ �ݿø��ؾ� �Ѵ�.
SELECT department_id �μ���ȣ,
    (SELECT department_name 
    FROM departments
    WHERE departments.department_id = employees.department_id) �μ���,
    sum(salary) �޿��Ѿ�, ROUND(AVG(salary), 1) ��ձ޿�
FROM employees
GROUP BY department_id
ORDER BY SUM(salary);

-- 9. 'Seattle'�� 'Toronto'���ÿ�  �ٹ��ϴ�
-- ������� ���, �̸�, �μ�ID, �μ����� ����Ͻÿ�
SELECT e.employee_id ���, e.first_name �̸�, e.department_id �μ�ID, d.department_name �μ���
FROM departments d JOIN locations l ON (l.location_id = d.location_id)
            JOIN employees e ON (d.department_id = e.department_id)
WHERE l.city = 'Seattle' or l.city='Toronto';

-- 10.���� 'Davies'�� ����� ���� �μ��� �ٹ��ϴ� ������� ���, ��, �̸��� ����Ͻÿ�(SUBQUERY)
SELECT employee_id ���, first_name ��, last_name �̸�
FROM employees
WHERE department_id = (SELECT department_id FROM employees WHERE first_name = 'Davies');

SELECT first_name
FROM employees;

-- 11.���� 'Davies'�� ����� ���� �μ��� �ٹ��ϸ鼭 �μ���ձ޿�����
-- ���� �޿��� �޴� ����� ���, ��, �̸�, �޿��� ����Ͻÿ�(SUBQUERY)
SELECT employee_id ���, first_name ��, last_name �̸�, salary �޿�
FROM employees
WHERE salary >ANY (SELECT AVG(salary) FROM employees WHERE first_name = 'Davies' GROUP BY department_id);
