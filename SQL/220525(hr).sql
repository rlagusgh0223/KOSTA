-- Function
CREATE OR REPLACE FUNCTION a_func(num1 number, num2 number)  -- �Ű������� �ʿ������ ()�ϸ� �ȵȴ�
RETURN number  -- ���⼭�� ;���̸� �ȵȴ�
IS
  num3 number;
BEGIN
  num3 := num1 + num2;
  RETURN num3;
END;
/
-- function ȣ��
SELECT a_func(1, 2)
FROM dual;
/

-- ������ ����ؼ� �� �Լ�
CREATE OR REPLACE FUNCTION start_row(current_page number, cnt_per_page number)  -- ���� ������ ��ȣ, �� ������ �� ������ �Ǽ�
RETURN number
IS
  num number;
BEGIN
  num := ((current_page-1)*cnt_per_page)+1;
  RETURN num;
END;
/
CREATE OR REPLACE FUNCTION end_row(current_page number, cnt_per_page number)  -- ���� ������ ��ȣ, �� ������ �� ������ �Ǽ�
RETURN number
IS
  num number;
BEGIN
  num := current_page*cnt_per_page;
  RETURN num;
END;
/
SELECT start_row(1, 10),
       end_row(1, 10),
       start_row(2, 10),
       end_row(2, 10),
       start_row(2, 4),
       end_row(2, 4),
       start_row(3, 4),
       end_row(3, 4)
FROM dual;
/



-- Ʈ����
CREATE TABLE point(
  point_id VARCHAR2(5) primary key,
  point_score NUMBER(3),
  CONSTRAINT point_id_fk FOREIGN KEY(point_id) REFERENCES customer(id)
);
/

-- �� 1���� �߰��� �� ����Ʈ 1�� �ڵ� �߰�
CREATE OR REPLACE TRIGGER point_trig
AFTER insert ON customer
FOR EACH ROW
BEGIN
  INSERT INTO point(point_id, point_score) VALUES(:NEW.id, 1);
END;
/
DELETE FROM order_line;
DELETE FROM order_info;
DELETE FROM customer;

INSERT INTO customer(id, pwd, name, address,status) VALUES ('id1', 'p1', 'n1', 'a1', 1);
SELECT * FROM customer;
SELECT * FROM point;
/
-- �ֹ� 1���� �߰��� �� ����Ʈ 1���� ������ 1���� ����
CREATE OR REPLACE TRIGGER point1_trig
AFTER insert ON order_info
FOR EACH ROW
BEGIN
  UPDATE point SET point_score = point_score + 1 WHERE point_id = :NEW.order_id;
END;
/
INSERT INTO order_info(order_no, order_id, order_dt) VALUES (order_seq.NEXTVAL, 'id1', SYSDATE);
SELECT * FROM order_info;
SELECT * FROM point;

/
-- ���� �����Ǳ� ���� ����Ʈ�൵ �ڵ�����
CREATE OR REPLACE TRIGGER point2_trig
BEFORE delete ON customer
FOR EACH ROW
BEGIN
  DELETE point WHERE point_id = :OLD.id;
END;
/
DELETE FROM order_info;
DELETE FROM customer WHERE id='id1';
SELECT * FROM customer;
SELECT * FROM point;
commit;

-- Ʈ���� ������
INSERT INTO customer(id, pwd, name, address,status) VALUES ('id1', 'p1', 'n1', 'a1', 1);
commit;