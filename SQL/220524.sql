-- 데이터 추가
INSERT INTO customer(id, pwd, name, address, status) VALUES ('id1', 'p1', 'n1', 'a1', 1);
INSERT INTO customer VALUES ('id2', 'p2', 'n2', 'a2', 1);
INSERT INTO customer(id, pwd, name) VALUES('id3', 'p3', 'n3');    -- address는 자동 null이 된다, status는 자동 1이 됨
SELECT * FROM customer;

INSERT INTO product(prod_no, prod_name, prod_price) VALUES ('C0001', '아메리카노', 1000);
INSERT INTO product			        VALUES ('C0002', '아이스아메리카노', 1000, null, '');
INSERT INTO product(prod_no, prod_name, prod_price, prod_mfd) VALUES ('G0001', '텀블러', 3000, '22/01/01');
INSERT INTO product(prod_no, prod_name, prod_price, prod_mfd) VALUES ('G0002', '다이러리', 4000, SYSDATE);
SELECT * FROM product;

------------------------------------
-- 데이터 수정
UPDATE customer SET name = '김현호' WHERE id = 'id1';
UPDATE customer SET pwd='p22', name='홍길동' WHERE id='id2';
UPDATE customer SET status=1;
SELECT * FROM customer;

-- 모든 행의 상품 가격을 10% 인상
UPDATE product SET prod_price = prod_price+(prod_price*0.1);
SELECT * FROM product;

-------------------------------------
-- 데이터 삭제
DELETE FROM customer;
SELECT * FROM customer;



-------------------------------------
-- 복잡한 SQL 구문을 뷰로 저장
CREATE VIEW a_view
AS
SELECT d.department_id, d.department_name, j.job_id, j.job_title, count(employee_id) employee_cnt
FROM employees e JOIN departments d ON (e.department_id = d.department_id)
		JOIN jobs j ON (e.job_id = j.job_id)
WHERE salary >= 3000
GROUP BY d.department_id, d.department_name, j.job_id, j.job_title
HAVING count(employee_id) >= 2
ORDER BY count(employee_id);

SELECT * FROM a_view;  -- 뷰 보기

-- 뷰 내용 변경
CREATE OR REPLACE VIEW a_view
AS
SELECT employee_id, first_name
FROM employees;

DROP VIEW a_view;


-- 시퀀스
CREATE SEQUENCE b_seq
START WITH 4  -- 4부터 시작(MINVALUE보다 반드시 커야한다)
INCREMENT BY 2  -- 2씩 증가한다
MAXVALUE 50 -- 50까지 증가
CYCLE -- 최대값에서 최소값으로 돌아가게 함
MINVALUE 3; -- 돌아갈 최소값 3

-- 시퀀스 일련번호값 얻기
SELECT b_seq.NEXTVAL FROM dual;

-- 주문용 시퀀스 객체
CREATE SEQUENCE order_seq;
INSERT INTO
order_info(order_no, 	order_id, order_dt)
VALUES (order_seq.NEXTVAL, 'id1', 	SYSDATE);

-- 시퀀스 일련번호값 확인
SELECT b_seq.CURRVAL FROM dual;

-- 주문용 시퀀스 객체
INSERT INTO order_line(order_no, order_prod_no, order_quantity) VALUES(order_seq.CURRVAL, 'C0002', 7);
SELECT * from order_info;
SELECT * from order_line;

-----------------------------------------------
-- 트랜잭션
CREATE TABLE ACCOUNT(no CHAR(3) primary key, balance number(10));
INSERT INTO account(no, balance) VALUES ('101', 1000);
INSERT INTO account(no, balance) VALUES ('102', 1000);
commit;

UPDATE account SET balance = balance-100 WHERE no = '101';
UPDATE account SET balance = balance+100 WHERE no = '102';
SELECT * fROM account;

-- 999계좌(없는 계좌) 입금
UPDATE account SET balance = balance-100 WHERE no = '101';
UPDATE account SET balance = balance+100 WHERE no = '999';

-- 원상태로 복구
ROLLBACK;


-- 프로시져
CREATE OR REPLACE PROCEDURE a_proc(num number)
IS
BEGIN
  DBMS_OUTPUT.PUT_LINE('숫자 :' || num);
END;
-- 실행
EXEC a_proc(123);
EXEC a_proc(567890);

-- 프로시저 합
CREATE OR REPLACE PROCEDURE a_proc(num1 number, num2 number)
IS num3 number := 0;
BEGIN
  num3 := num1 + num2;
  DBMS_OUTPUT.PUT_LINE('숫자합 :' || num3);
END;
-- 실행
EXEC a_proc(1, 2);
EXEC a_proc(5, 6);

-- IF 구문 사용해보기
CREATE OR REPLACE PROCEDURE b_proc(num number)
IS
BEGIN
  IF MOD(num, 2) = 1 THEN
    DBMS_OUTPUT.PUT_LINE('홀수입니다');
  ELSE
    DBMS_OUTPUT.PUT_LINE('짝수입니다');
  END IF;

  IF num > 10 THEN
        DBMS_OUTPUT.PUT_LINE('10보다 큽니다');
  ELSIF num > 5 THEN
        DBMS_OUTPUT.PUT_LINE('5보다 큽니다');
  ELSE
        DBMS_OUTPUT.PUT_LINE('5이하입니다');
  END IF;
END;
-- 실행
EXEC b_proc(15);
EXEC b_proc(8);
EXEC b_proc(0);

-- 반복문 for문
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
    DBMS_OUTPUT.PUT_LINE(v_department_id || '부서의 급여합은' || v_sum);

    SELECT department_name INTO v_department_name
    FROM departments 
    WHERE department_id = v_department_id;
    DBMS_OUTPUT.PUT_LINE(v_department_id || '부서이름은 ' || v_department_name);

    INSERT INTO a_tbl(a) VALUES (v_department_id);
END;
/
EXEC d_proc(50);
SELECT * FROM a_tbl;

-- 여러행을 반환하는 SELECT구문을 갖고 있는 SQL?은 커서를 지정해줘야 된다
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
EXEC e_proc(5000);  -- 5000보다 급여가 높은 사원 출력