ALTER USER hr account unlock;
ALTER USER hr identified by hr;

-- ��Ű�� ���� �����
CREATE USER test IDENTIFIED BY test;
GRANT CONNECT, RESOURCE, CREATE VIEW TO test;

DROP TABLE a_tbl;

