 -- ����� ���, �̸�, �޿�, �μ���ȣ, �μ����� ����Ͻÿ�
SELECT employee_id, first_name, salary, department_id
FROM employees;

SELECT department_id, department_name
FROM departments;

-- īƼ�� ������Ʈ
SELECT employee_id, department_name
FROM employees, departments;

-- ����Ŭ ���� JOIN ����
SELECT employee_id, department_name
FROM employees, departments
WHERE employees.department_id = departments.department_id
ORDER BY employee_id;

-- ǥ��ȭ�� ANSI JOIN ����
SELECT employee_id, department_name
FROM employees JOIN departments ON employees.department_id = departments.department_id
ORDER BY employee_id;

 -- ����� ���, �̸�, �޿�, �μ���ȣ, �μ����� ����Ͻÿ�(���̺� ��Ī �ֱ���� ���� ����)
SELECT employee_id, first_name, salary,
       e.department_id, d.department_id,  -- �� ���̺��� ��Ī��.~�� ���°� ����
       department_name
FROM employees e JOIN departments d ON (e.department_id = d.department_id)
ORDER BY employee_id;

-- ����� ���, �μ���ȣ, �μ����� ����Ͻÿ�(������ JOIN ON���� ����� NATURAL JOIN���� �����)
SELECT employee_id, department_id, department_name
FROM employees NATURAL JOIN departments;

-- ����� ���, ������ȣ, �������� ����Ͻÿ�
SELECT employee_id, department_id, department_name
FROM employees JOIN departments USING (department_id);

-- �μ��� �μ���ȣ, �μ���, �μ��� ���, �μ��� �̸��� ����Ͻÿ�
SELECT d.department_id, department_name, manager_id, first_name
FROM departments d JOIN employees e USING (manager_id);

-- �μ��� �μ���ȣ, �μ��� ���� ������ ���ø�(city), ������(country_name)�� ����Ͻÿ�
SELECT d.department_id, l.city, c.country_name
FROM departments d JOIN locations l ON (d.location_id = l.location_id)
                JOIN countries c ON (l.country_id = c.country_id);

        -- ����� ���, �μ���ȣ, �μ���, ������ȣ, �������� ����Ͻÿ�
        -- ��, ������ 'Manager'�� ������ ����鸸 ����Ͻÿ�
        -- ������ȣ��, �μ������� ���������Ͻÿ�(����ǥ������� ����Ѵ�)
SELECT e.employee_id, e.first_name,
                  e.department_id, d.department_name,
                  j.job_id, job_title
FROM employees e JOIN departments d ON (e.department_id = d.department_id)
		        JOIN jobs j ON (e.job_id = j.job_id)
WHERE job_title LIKE '%Manager%'
ORDER BY 5, 4;

-- �μ��� �μ���ȣ, �μ���, �μ��� �����, ��ձ޿��� ����Ͻÿ�
SELECT d.department_id �μ���ȣ, d.department_name �μ���, count(e.employee_id) �μ��������, ROUND(AVG(e.salary),2) ��ձ޿�
FROM employees e JOIN  departments d ON (e.department_id = d.department_id)
GROUP BY d.department_id, d.department_name;

-- �μ��� ������� 10�� �̻��� �μ����� �μ��� �μ���ȣ, �μ���, �μ��� �����, ��ձ޿��� ����Ͻÿ�
SELECT d.department_id �μ���ȣ, d.department_name �μ���, count(e.employee_id) �μ��������, ROUND(AVG(e.salary),2) ��ձ޿�
FROM employees e JOIN  departments d ON (e.department_id = d.department_id)
GROUP BY d.department_id, d.department_name
HAVING COUNT(e.employee_id) >= 10;

-- ����� ���, �̸�, �����ڹ�ȣ, �������̸��� ����Ͻÿ�
 -- self JOIN�� �ؼ� �� ���̺��� �ڷḦ �� ���� ���̺� �ڷ�ó�� ���
SELECT e.employee_id ���, e.first_name �̸�,
          m.employee_id �����ڹ�ȣ, m.first_name �������̸�
FROM employees e JOIN employees m ON (e.manager_id = m.employee_id);

-- ����� �μ���ȣ�� �������� �μ���ȣ�� ��ġ���� �ʴ�
-- ������� ���, �μ���ȣ�� ����Ͻÿ�
-- ��������� ����
SELECT e.employee_id, e.department_id
FROM employees e JOIN employees m ON (e.manager_id = m.employee_id)
WHERE e.department_id <> m.department_id
ORDER BY e.employee_id;

--OUTER JOIN
SELECT employee_id, first_name, salary, e.department_id, d.department_name
FROM employees e LEFT OUTER JOIN departments d ON (e.department_id = d.department_id);

-- �μ���ȣ, �μ���, �μ��� ���� ���ø� ����Ͻÿ�
SELECT department_id, department_name, city
FROM departments d JOIN locations l ON (d.location_id = l.location_id);

-- �� ���ÿ� �ִ� �μ����� ����Ͻÿ�
SELECT city, COUNT(department_id)
FROM locations l JOIN departments d ON (l.location_id = d.location_id)
GROUP BY city;  -- ���ú�

-- �� ���ÿ� �ִ� �μ����� ����Ͻÿ�
-- ��, �μ��� ���� ���õ� ��� ���
SELECT city, COUNT(department_id)
FROM locations l LEFT JOIN departments d ON (l.location_id = d.location_id)
GROUP BY city;  -- ���ú�

SELECT city, COUNT(department_id)
FROM departments d RIGHT JOIN locations l ON (l.location_id = d.location_id)
GROUP BY city;

-- ����� ���, �̸�, �����ڹ�ȣ, �������̸��� ����Ͻÿ�
-- ��, ������ ���� ����� ��� ���
SELECT e.employee_id ���, e.first_name �̸�, m.employee_id �����ڹ�ȣ, m.first_name �������̸�
FROM employees e LEFT OUTER JOIN employees m ON (e.manager_id = m.employee_id);

-- ���, �̸�, �μ���ȣ, �μ����� ����Ͻÿ�
-- ��, ����� ���� �μ��� ��� ���
SELECT e.employee_id ���, e.first_name �̸�, d.department_id �μ���ȣ, d.department_name �μ���
FROM employees e RIGHT OUTER JOIN departments d ON (e.department_id = d.department_id);

-- FULL OUTER JOIN
SELECT e.employee_id ���, e.first_name �̸�, d.department_id �μ���ȣ, d.department_name �μ���
FROM employees e FULL JOIN departments d ON (e.department_id = d.department_id);

-- ����Ŭ ���� OUTER JOIN
SELECT employee_id, first_name, salary, e.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+);  -- ������ ���� ���ϴ� �ʿ� (+)ǥ��



-- ��������
SELECT employee_id, salary
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);

-- ������ ��������
-- �μ��� �ִ�޿��� ����Ͻÿ�
SELECT MAX(salary) FROM employees GROUP BY department_id;

-- �������� ��ȯ�ϴ� ��������
SELECT employee_id, salary
FROM employees
WHERE salary IN (SELECT MAX(salary) FROM employees GROUP BY department_id);

--IN �����ڿ� =ANY �����ڴ� ���� �ǹ̴�
SELECT employee_id, salary
FROM employees
WHERE salary =ANY (SELECT MAX(salary) FROM employees GROUP BY department_id)
ORDER BY salary;

-- �������� ���� �� �ϳ��� �� ũ�ٸ�(�ּڰ����� ũ�ٸ�)
SELECT employee_id, salary
FROM employees
WHERE salary >ANY (SELECT MAX(salary) FROM employees GROUP BY department_id)
ORDER BY salary;

-- �������� ���� �� �ϳ��� �۴ٸ�(�ִ񰪺��� �۴ٸ�)
SELECT employee_id, salary
FROM employees
WHERE salary <ANY (SELECT MAX(salary) FROM employees GROUP BY department_id)
ORDER BY salary;

-- �μ��� �ִ�޿��� �޴� ����� �μ���ȣ, ���, �޿�����Ͻÿ�
SELECT employee_id, department_id, salary
FROM employees
WHERE (department_id, salary) IN (SELECT department_id, MAX(salary) FROM employees GROUP BY department_id)
-- ������¡ : �������������� �÷��� �������������� �÷� �����(���� �����)
ORDER BY department_id, salary;

--Inline View
SELECT rownum, employee_id, salary
FROM employees
ORDER BY salary;

-- �޿��� ���� ������� ���, �޿��� ����մϴ�
-- �޿��� ���� ������� 5������� ���
SELECT rownum, employee_id, salary
FROM (SELECT *
         FROM employees
         ORDER BY salary)  -- ()�� �ļ� �켱������ �ö󰬴�
WHERE rownum <= 5;  -- ���ĺ��� �ϰ� WHERE�������� ��

-- �޿��� ���� ������� ���, �޿��� ����մϴ�
-- �޿����� ����� 11��° ������� 20��° ��������� ���
SELECT *
FROM(SELECT rownum r, employee_id, salary
         FROM (SELECT *
                  FROM employees
                  ORDER BY salary)
         )
WHERE r BETWEEN 11 AND 20;

-- ��Į������
SELECT employee_id, department_id,
          (SELECT department_name
           FROM departments
           WHERE departments.department_id = employees.department_id)
FROM employees;