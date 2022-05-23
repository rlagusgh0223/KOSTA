-- ���տ�����
-- ������������
SELECT *
FROM job_history
ORDER BY employee_id, start_date;

-- ������������
SELECT employee_id, job_id
FROM employees
ORDER BY employee_id;

-- ����� ���������� ���������� ��� ����Ͻÿ�(115��)
SELECT employee_id, job_id
FROM job_history
UNION
SELECT employee_id, job_id
FROM employees;

-- ����� ���������� ���������� ��� ����Ͻÿ�(117��)
SELECT employee_id ���, job_id, start_date, end_date
FROM job_history
UNION ALL  -- �ߺ��� ��쵵 ����Ѵ� (A, B, A)
SELECT employee_id, job_id, null, null  -- ������ �Ϸ��� �÷� ���� ����� �ϴµ�, employees�� ���� �÷��̴ϱ� null�� ����Ѵ�
FROM employees
ORDER BY ���;  -- ORDER BY�� ù��° SELECT�� �÷������� �ش�

SELECT employee_id ���, job_id, TO_CHAR(start_date), end_date
FROM job_history
UNION ALL
SELECT employee_id, job_id, '��������', null  -- �÷����� �����
FROM employees
ORDER BY ���, 3;


-- ������
SELECT employee_id, job_id
FROM job_history
INTERSECT
SELECT employee_id, job_id
FROM employees;


-- ������
SELECT employee_id, job_id
FROM employees
MINUS
SELECT employee_id, job_id
FROM job_history;


-- ����� ���� �μ���ȣ�� ����Ͻÿ�
SELECT department_id
FROM departments
MINUS
SELECT department_id
FROM employees;

SELECT * 
FROM departments
WHERE NOT EXISTS
(SELECT * FROM employees
 WHERE department_id = departments.department_id);
 
 
-------------------------------------
-- DDL
-- ���̺� ����
CREATE TABLE product(
  prod_no VARCHAR2(5),
  prod_name VARCHAR2(30),
  prod_price NUMBER(6),
  prod_info VARCHAR2(100),
  prod_mfd DATE
);

-- ���̺� ����
DROP TABLE product;

-- ���̺� ����
ALTER TABLE product
ADD a VARCHAR2(3);

-- �÷� �̸� ����
ALTER TABLE product
RENAME COLUMN a TO b;

-- �÷� �ڷ���/�ڸ��� ����
ALTER TABLE product
MODIFY b VARCHAR2(4);

-- �÷�����
ALTER TABLE product
DROP COLUMN b;

-- ���̺� ���� ����
DESC product;


INSERT INTO product(prod_no, prod_name, prod_price) VALUES ('C0001', '�Ƹ޸�ī��', 1000);
INSERT INTO product(prod_no, prod_name, prod_price) VALUES ('C0001', 'A', 2000);

SELECT *
FROM product;

DROP TABLE a_tbl;
-- ���Ἲ ��������(�÷��� �ùٸ� ���� ����ǵ��� ����)
-- NOT NULL
CREATE TABLE a_tbl(a NUMBER NOT NULL);
INSERT INTO a_tbl(a) VALUES (null);  -- �������� ���Ѵ�
INSERT INTO a_tbl(a) VALUES ('');  -- �������� ���Ѵ�


-- UNIQUE
-- �ߺ��� ���� �������� ���ϰ�
CREATE TABLE b_tbl(a NUMBER CONSTRAINT btbl_a_uq UNIQUE, b NUMBER);
INSERT INTO b_tbl(a, b) VALUES (1, 1);
INSERT INTO b_tbl(a, b) VALUES (1, 11111);
INSERT INTO b_tbl(a, b) VALUES (null, 1);
INSERT INTO b_tbl(a, b) VALUES (null, 2); 
SELECT * FROM b_tbl;


-- PRIMARY KEY  -- NOT NULL + UNIQUE
CREATE TABLE c_tbl(a NUMBER CONSTRAINT ctbl_a_pk PRIMARY KEY, b number);
INSERT INTO c_tbl(a, b) VALUES(1, 1);
INSERT INTO c_tbl(a, b) VALUES(1, 11111);
INSERT INTO c_tbl(a, b) VALUES(null, 1);
SELECT * FROM c_tbl;


-- CHECK
CREATE TABLE d_tbl(
  a NUMBER CONSTRAINT dtbl_a_ck CHECK( MOD(a,2) = 1),
	  -- a���� �ݵ�� Ȧ������ ����
  b CHAR(1) CHECK (b IN ('M', 'F'))
);

INSERT INTO d_tbl(a, b) VALUES(1, 'F');
INSERT INTO d_tbl(a, b) VALUES(0, 'F');  -- Ȧ���� �ƴϹǷ� �Է� �Ұ�
INSERT INTO d_tbl(a, b) VALUES(2, 'X');
INSERT INTO d_tbl(a, b) VALUES(NULL, 'M');
SELECT * FROM d_tbl;

CREATE TABLE e_tbl(
  a NUMBER CONSTRAINT etbl_a_ck CHECK( MOD(a,2) = 1 )
			NOT NULL,
  b CHAR(1) CHECK ( b IN ('M', 'F') )
);
INSERT INTO e_tbl(a, b) VALUES(1, 'F');
INSERT INTO e_tbl(a, b) VALUES(NULL, 'M'); 
SELECT * FROM e_tbl;


-- FOREIGN KEY
CREATE TABLE parent_tbl(a VARCHAR2(2) primary key,
		       b NUMBER);
CREATE TABLE child_tbl(c NUMBER primary key,
		     d VARCHAR2(2) CONSTRAINT childtbl_d_fk REFERENCES parent_tbl(a));
             
INSERT INTO parent_tbl(a, b) VALUES ('fi', 1);
INSERT INTO parent_tbl(a, b) VALUES('se', 2);
INSERT INTO parent_tbl(a, b) VALUES('th', 3);
SELECT * FROM parent_tbl;

INSERT INTO child_tbl(c, d) VALUES(10, 'se');
INSERT INTO child_tbl(c, d) VALUES(20, 'se');
INSERT INTO child_tbl(c, d) VALUES(30, 'fi');
INSERT INTO child_tbl(c, d) VALUES(40, 'si');
INSERT INTO child_tbl(c, d) VALUES(50, '');
SELECT * FROM child_tbl;

-- �������� �߰�
DELETE FROM product;  -- product ���̺��� �ڷ� ����
SELECT * FROM product;  -- product ���̺� Ȯ��
ALTER TABLE product
ADD CONSTRAINT prod_no_pk PRIMARY KEY(prod_no);
INSERT INTO product(prod_no, prod_name, prod_price) VALUES ('C0001', '�Ƹ޸�ī��', 1000);
INSERT INTO product(prod_no, prod_name, prod_price) VALUES ('C0001', '�ߺ�', 2000);  -- �ߺ��� ���̶� �Է� �ȵȴ�

-- ��ǰ�� NOT NULL ����
ALTER TABLE product
MODIFY prod_name NOT NULL;

-- �������� ����
ALTER TABLE product
DROP CONSTRAINT prod_no_pk;

--��ųʸ�
SELECT * FROM user_tables;
SELECT * FROM user_constraints;
SELECT * FROM user_constraints WHERE table_name='PRODUCT';

ALTER TABLE product
DROP CONSTRAINT SYS_C007019;  -- �������� SYS_C007019 ����