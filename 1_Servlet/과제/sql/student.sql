





















CREATE TABLE USERS(
  USERID  VARCHAR2(15) PRIMARY KEY,
  USERPWD VARCHAR2(15) NOT NULL,
  USERNAME VARCHAR2(30) NOT NULL
);

INSERT INTO USERS VALUES ('user01', 'pass01', 'ȫ�浿');
INSERT INTO USERS VALUES ('user02', 'pass02', '�ڹ���');
INSERT INTO USERS VALUES ('admin', 'admin', '������');

COMMIT;

SELECT * FROM USERS;

