ALTER USER hr account unlock;
ALTER USER hr identified by hr;

-- 스키마 새로 만들기
CREATE USER test IDENTIFIED BY test;
GRANT CONNECT, RESOURCE, CREATE VIEW TO test;

DROP TABLE a_tbl;

