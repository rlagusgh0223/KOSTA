-- ������ �߰�
INSERT INTO customer(id, pwd, name, address, status) VALUES ('id1', 'p1', 'n1', 'a1', 1);
INSERT INTO customer VALUES ('id2', 'p2', 'n2', 'a2', 1);
INSERT INTO customer(id, pwd, name) VALUES('id3', 'p3', 'n3');    -- address�� �ڵ� null�� �ȴ�, status�� �ڵ� 1�� ��
SELECT * FROM customer;

INSERT INTO product(prod_no, prod_name, prod_price) VALUES ('C0001', '�Ƹ޸�ī��', 1000);
INSERT INTO product			        VALUES ('C0002', '���̽��Ƹ޸�ī��', 1000, null, '');
INSERT INTO product(prod_no, prod_name, prod_price, prod_mfd) VALUES ('G0001', '�Һ�', 3000, '22/01/01');
INSERT INTO product(prod_no, prod_name, prod_price, prod_mfd) VALUES ('G0002', '���̷���', 4000, SYSDATE);
SELECT * FROM product;

------------------------------------
-- ������ ����
UPDATE customer SET name = '����ȣ' WHERE id = 'id1';
UPDATE customer SET pwd='p22', name='ȫ�浿' WHERE id='id2';
UPDATE customer SET status=1;
SELECT * FROM customer;

-- ��� ���� ��ǰ ������ 10% �λ�
UPDATE product SET prod_price = prod_price+(prod_price*0.1);
SELECT * FROM product;

-------------------------------------
-- ������ ����
DELETE FROM customer;
SELECT * FROM customer;



-------------------------------------
-- ������ SQL ������ ��� ����
CREATE VIEW a_view
AS
SELECT d.department_id, d.department_name, j.job_id, j.job_title, count(employee_id) employee_cnt
FROM employees e JOIN departments d ON (e.department_id = d.department_id)
		JOIN jobs j ON (e.job_id = j.job_id)
WHERE salary >= 3000
GROUP BY d.department_id, d.department_name, j.job_id, j.job_title
HAVING count(employee_id) >= 2
ORDER BY count(employee_id);

SELECT * FROM a_view;  -- �� ����

-- �� ���� ����
CREATE OR REPLACE VIEW a_view
AS
SELECT employee_id, first_name
FROM employees;

DROP VIEW a_view;


-- ������
CREATE SEQUENCE b_seq
START WITH 4  -- 4���� ����(MINVALUE���� �ݵ�� Ŀ���Ѵ�)
INCREMENT BY 2  -- 2�� �����Ѵ�
MAXVALUE 50 -- 50���� ����
CYCLE -- �ִ밪���� �ּҰ����� ���ư��� ��
MINVALUE 3; -- ���ư� �ּҰ� 3

-- ������ �Ϸù�ȣ�� ���
SELECT b_seq.NEXTVAL FROM dual;

-- �ֹ��� ������ ��ü
CREATE SEQUENCE order_seq;
INSERT INTO
order_info(order_no, 	order_id, order_dt)
VALUES (order_seq.NEXTVAL, 'id1', 	SYSDATE);

-- ������ �Ϸù�ȣ�� Ȯ��
SELECT b_seq.CURRVAL FROM dual;

-- �ֹ��� ������ ��ü
INSERT INTO order_line(order_no, order_prod_no, order_quantity) VALUES(order_seq.CURRVAL, 'C0002', 7);
SELECT * from order_info;
SELECT * from order_line;

-----------------------------------------------
-- Ʈ�����
CREATE TABLE ACCOUNT(no CHAR(3) primary key, balance number(10));
INSERT INTO account(no, balance) VALUES ('101', 1000);
INSERT INTO account(no, balance) VALUES ('102', 1000);
commit;

UPDATE account SET balance = balance-100 WHERE no = '101';
UPDATE account SET balance = balance+100 WHERE no = '102';
SELECT * fROM account;

-- 999����(���� ����) �Ա�
UPDATE account SET balance = balance-100 WHERE no = '101';
UPDATE account SET balance = balance+100 WHERE no = '999';

-- �����·� ����
ROLLBACK;


-- ���ν���
CREATE OR REPLACE PROCEDURE a_proc(num number)
IS
BEGIN
  DBMS_OUTPUT.PUT_LINE('���� :' || num);
END;
-- ����
EXEC a_proc(123);
EXEC a_proc(567890);

-- ���ν��� ��
CREATE OR REPLACE PROCEDURE a_proc(num1 number, num2 number)
IS num3 number := 0;
BEGIN
  num3 := num1 + num2;
  DBMS_OUTPUT.PUT_LINE('������ :' || num3);
END;
-- ����
EXEC a_proc(1, 2);
EXEC a_proc(5, 6);

-- IF ���� ����غ���
CREATE OR REPLACE PROCEDURE b_proc(num number)
IS
BEGIN
  IF MOD(num, 2) = 1 THEN
    DBMS_OUTPUT.PUT_LINE('Ȧ���Դϴ�');
  ELSE
    DBMS_OUTPUT.PUT_LINE('¦���Դϴ�');
  END IF;

  IF num > 10 THEN
        DBMS_OUTPUT.PUT_LINE('10���� Ů�ϴ�');
  ELSIF num > 5 THEN
        DBMS_OUTPUT.PUT_LINE('5���� Ů�ϴ�');
  ELSE
        DBMS_OUTPUT.PUT_LINE('5�����Դϴ�');
  END IF;
END;
-- ����
EXEC b_proc(15);
EXEC b_proc(8);
EXEC b_proc(0);

-- �ݺ��� for��
CREATE OR REPLACE PROCEDURE c_proc
IS
BEGIN
  FOR i IN 1..10 LOOP
    DBMS_OUTPUT.PUT_LINE(i);
  END LOOP;
END;
EXEC c_proc;


CREATE OR REPLACE PROCEDURE d_proc(v_department_id employees.department_id%TYPE)
IS v_sum NUMBER;
   v_department_name departments.department_name%TYPE;
BEGIN
    SELECT SUM(salary) INTO v_sum
    FROM employees
    WHERE department_id = v_department_id;
    DBMS_OUTPUT.PUT_LINE(v_department_id || '�μ��� �޿�����' || v_sum);

    SELECT department_name INTO v_department_name
    FROM departments 
    WHERE department_id = v_department_id;
    DBMS_OUTPUT.PUT_LINE(v_department_id || '�μ��̸��� ' || v_department_name);

    INSERT INTO a_tbl(a) VALUES (v_department_id);
END;
/
EXEC d_proc(50);
SELECT * FROM a_tbl;

-- �������� ��ȯ�ϴ� SELECT������ ���� �ִ� SQL?�� Ŀ���� ��������� �ȴ�
CREATE OR REPLACE PROCEDURE e_proc(v_salary employees.salary%TYPE)
IS
  CURSOR c1 IS
    SELECT *
    FROM employees
    WHERE salary > v_salary;
BEGIN
  FOR e IN c1 LOOP
    DBMS_OUTPUT.PUT_LINE(e.employee_id || '-' || e.salary);
  END LOOP;
END;
/
EXEC e_proc(5000);  -- 5000���� �޿��� ���� ��� ���