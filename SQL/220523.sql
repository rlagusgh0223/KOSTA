-- 집합연산자
-- 이전직무정보
SELECT *
FROM job_history
ORDER BY employee_id, start_date;

-- 현재직무정보
SELECT employee_id, job_id
FROM employees
ORDER BY employee_id;

-- 사원의 이전직무와 현재직무를 모두 출력하시오(115건)
SELECT employee_id, job_id
FROM job_history
UNION
SELECT employee_id, job_id
FROM employees;

-- 사원의 이전직무와 현재직무를 모두 출력하시오(117건)
SELECT employee_id 사번, job_id, start_date, end_date
FROM job_history
UNION ALL  -- 중복된 경우도 출력한다 (A, B, A)
SELECT employee_id, job_id, null, null  -- 집합을 하려면 컬럼 수를 맞춰야 하는데, employees에 없는 컬럼이니까 null로 대신한다
FROM employees
ORDER BY 사번;  -- ORDER BY는 첫번째 SELECT의 컬럼명으로 준다

SELECT employee_id 사번, job_id, TO_CHAR(start_date), end_date
FROM job_history
UNION ALL
SELECT employee_id, job_id, '현재직무', null  -- 컬럼값을 맞춘다
FROM employees
ORDER BY 사번, 3;


-- 교집합
SELECT employee_id, job_id
FROM job_history
INTERSECT
SELECT employee_id, job_id
FROM employees;


-- 차집합
SELECT employee_id, job_id
FROM employees
MINUS
SELECT employee_id, job_id
FROM job_history;


-- 사원이 없는 부서번호를 출력하시오
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
-- 테이블 생성
CREATE TABLE product(
  prod_no VARCHAR2(5),
  prod_name VARCHAR2(30),
  prod_price NUMBER(6),
  prod_info VARCHAR2(100),
  prod_mfd DATE
);

-- 테이블 제거
DROP TABLE product;

-- 테이블 변경
ALTER TABLE product
ADD a VARCHAR2(3);

-- 컬럼 이름 변경
ALTER TABLE product
RENAME COLUMN a TO b;

-- 컬럼 자료형/자릿수 변경
ALTER TABLE product
MODIFY b VARCHAR2(4);

-- 컬럼제거
ALTER TABLE product
DROP COLUMN b;

-- 테이블 구조 보기
DESC product;


INSERT INTO product(prod_no, prod_name, prod_price) VALUES ('C0001', '아메리카노', 1000);
INSERT INTO product(prod_no, prod_name, prod_price) VALUES ('C0001', 'A', 2000);

SELECT *
FROM product;

DROP TABLE a_tbl;
-- 무결성 제약조건(컬럼에 올바른 값만 저장되도록 설정)
-- NOT NULL
CREATE TABLE a_tbl(a NUMBER NOT NULL);
INSERT INTO a_tbl(a) VALUES (null);  -- 수행하지 못한다
INSERT INTO a_tbl(a) VALUES ('');  -- 수행하지 못한다


-- UNIQUE
-- 중복된 값은 저장하지 못하게
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
	  -- a에는 반드시 홀수값만 들어간다
  b CHAR(1) CHECK (b IN ('M', 'F'))
);

INSERT INTO d_tbl(a, b) VALUES(1, 'F');
INSERT INTO d_tbl(a, b) VALUES(0, 'F');  -- 홀수가 아니므로 입력 불가
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

-- 제약조건 추가
DELETE FROM product;  -- product 테이블의 자료 삭제
SELECT * FROM product;  -- product 테이블 확인
ALTER TABLE product
ADD CONSTRAINT prod_no_pk PRIMARY KEY(prod_no);
INSERT INTO product(prod_no, prod_name, prod_price) VALUES ('C0001', '아메리카노', 1000);
INSERT INTO product(prod_no, prod_name, prod_price) VALUES ('C0001', '중복', 2000);  -- 중복된 값이라 입력 안된다

-- 상품명에 NOT NULL 설정
ALTER TABLE product
MODIFY prod_name NOT NULL;

-- 제약조건 삭제
ALTER TABLE product
DROP CONSTRAINT prod_no_pk;

--딕셔너리
SELECT * FROM user_tables;
SELECT * FROM user_constraints;
SELECT * FROM user_constraints WHERE table_name='PRODUCT';

ALTER TABLE product
DROP CONSTRAINT SYS_C007019;  -- 제약조건 SYS_C007019 삭제