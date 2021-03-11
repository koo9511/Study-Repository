





















CREATE TABLE USERS(
  USERID  VARCHAR2(15) PRIMARY KEY,
  USERPWD VARCHAR2(15) NOT NULL,
  USERNAME VARCHAR2(30) NOT NULL
);

INSERT INTO USERS VALUES ('user01', 'pass01', '홍길동');
INSERT INTO USERS VALUES ('user02', 'pass02', '박문수');
INSERT INTO USERS VALUES ('admin', 'admin', '관리자');

COMMIT;

SELECT * FROM USERS;

