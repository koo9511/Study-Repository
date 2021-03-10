-- DAY8 �������� : �������� �� ��[ȣ��]��[����]����, ���Ἲ ��������
-- DDL  : CREATE, ALTER, DROP
-- DML : INSERT,  UPDATE, DELETE, TRUNCATE
--  : COMMINT, ROLLBACK, SAVEPINT

-- FROM �������� �������� ����� �� ����
 -- FROM  ���� ���� ���������� �˻�並 '�ζ��� ��' �����
-- �ζ��� �信�� ��Ī�� ���� => ���̺� ��

-- ¥�� ������ ��ձ޿��� ���� �޿��� �ް� �ִ� ���� ��ȸ
-- �̸�, ���޸�, �޿�
SELECT EMP_NAME ,JOB_TITLE, SALARY
FROM (SELECT JOB_ID, TRUNC(AVG(SALARY), -5) JABAVG
            FROM EMPLOYEE
            GROUP BY JOB_ID)  V
LEFT JOIN EMPLOYEE E ON (V.JABAVG = E.SALARY AND NVL(V.JOB_ID, ' ') = NVL(E.JOB_ID,' ' ))
LEFT JOIN  JOB J ON (E.JOB_ID = J.JOB_ID)
ORDER BY 3,2;


-- ��ȣ���� ��������
-- �Ϲ������δ� ���������� ���� ������� ���������� ����ϴ� ������
-- ��������� ���������� ���������� �÷����� �̿���
-- ���������� ���̺� �÷����� ����Ǹ�, ���������� ����� �޶���

-- �ڱ� ������ ��� �޿��� ���� �޿��� �޴� ���� ��ȸ
-- ��������� ����� ���
SELECT EMP_NAME, JOB_TITLE, SALARY
FROM EMPLOYEE E
LEFT JOIN JOB J ON (E.JOB_ID = J.JOB_ID)
WHERE SALARY =(SELECT TRUNC(AVG(SALARY),-5)
                                FROM EMPLOYEE
                                WHERE NVL(JOB_ID, ' ') = NVL(E.JOB_ID, ' '))
ORDER BY 3, 2;
                                
-- ������ ���߿� ��������
-- ���������� SELECT �� �÷����� ���� ���̰�, ������� ������ ���� ���� ��
-- ���������� ���� �׸��� �ݵ�� �������� SELECT ���� �׸� ������ ���ƾ� ��.
-- ���� �׸��� �ݵ�� ()�� �����־�� ��

-- �ڱ� ���޿� ��� �޿��� �޴� ���� ��ȸ
-- ���߿� ������ �������� ���
SELECT EMP_NAME, JOB_TITLE, SALARY
FROM EMPLOYEE
LEFT JOIN JOB USING (JOB_ID)
WHERE (NVL(JOB_ID,' '),SALARY) IN (SELECT NVL(JOB_ID,' '),TRUNC(AVG(SALARY),-5)
                        FROM EMPLOYEE
                        GROUP BY NVL(JOB_ID,' '))
ORDER BY 3,2;

-- EXISTS / NOT EXISTS ������
-- ���������� ���� ����� ���������� �����ϴ��� ����� ������

-- �������� ���� ���� ��ȸ
SELECT EMP_ID, EMP_NAME, '������' ����
FROM EMPLOYEE E
WHERE EXISTS (SELECT NULL
                            FROM EMPLOYEE
                            WHERE E.EMP_ID = MGR_ID);
-- ���������� ������ �����ϴ� ���� �����ϸ� ���

-- NOT EXISTS
SELECT EMP_ID, EMP_NAME, '����' ����
FROM EMPLOYEE E
WHERE NOT EXISTS (SELECT NULL
                                    FROM EMPLOYEE
                                    WHERE E.EMP_ID = MGR_ID);
-- ���������� �������� ��ġ���� �ʴ� ���� ���

-- ��Į�� ��������
-- ������ �������� + �������

-- �����, �μ��ڵ�, �޿�, �ش� ������ �Ҽӵ� �μ��� �޿���� ��ȸ
-- select ������ �������� ����� ���
SELECT EMP_NAME, DEPT_ID, SALARY,
            (SELECT TRUNC(AVG(SALARY),-5)
                FROM EMPLOYEE
                WHERE DEPT_ID = E.DEPT_ID) AVGSAL
FROM EMPLOYEE E;

-- CASE ǥ���Ŀ��� ��Į�� �������� ����� ���
-- �μ��� �ٹ������� 'OT' �̸� '������', �ƴϸ� '������'
-- ������ �ٹ������� ���� �Ҽ��� ��ȸ
SELECT EMP_ID, EMP_NAME, (
                CASE WHEN DEPT_ID = (SELECT DEPT_ID
                                                            FROM DEPARTMENT
                                                            WHERE LOC_ID = 'OT')
                          THEN '������'
                          ELSE '������'
                          END ) �Ҽ�
FROM EMPLOYEE
ORDER BY �Ҽ� DESC;

-- ORDER BY ������ �������� ��� ������
-- ��, ��Į�� ���������� ����� �� ����

-- ������ �Ҽӵ� �μ��� �μ����� ū ������ ���ĵ� ���� ���� ��ȸ
SELECT EMP_ID, EMP_NAME, E.DEPT_ID, HIRE_DATE, DEPT_NAME
FROM EMPLOYEE E
LEFT JOIN DEPARTMENT D ON (E.DEPT_ID = D.DEPT_ID)
ORDER BY (SELECT DEPT_NAME
                    FROM DEPARTMENT
                    WHERE DEPT_ID = E.DEPT_ID) DESC;
                    

-- TOP-N �м� *****************************************************************
-- ���� �, ���� ��� ��ȸ�� ��

-- �ζ��� ��� RANK() �Լ��� �̿��� TOP-N �м��� ��
-- ���� �������� �޿��� ���� �޴� ���� 3�� ��ȸ
SELECT *
FROM (SELECT EMP_NAME, SALARY, 
                        RANK() OVER  (ORDER BY SALARY DESC) ����
            FROM EMPLOYEE)
WHERE ���� <= 3;

-- ROWNUM �� �̿��� TOP-N �м�
-- SELECT �� ����࿡ ���ȣ(ROWNUM)�� �ο���

SELECT ROWNUM, EMP_NAME, SALARY
FROM (SELECT EMP_NAME, SALARY
            FROM EMPLOYEE
            WHERE EMP_NAME LIKE '%��%');
            
-- �޿��� ���� �޴� ���� 3�� ��ȸ
SELECT ROWNUM, EMP_NAME, SALARY
FROM (SELECT EMP_NAME, SALARY
                FROM EMPLOYEE
                ORDER BY SALARY DESC)
WHERE ROWNUM <= 3;

-- DDL (Data Definition Language) ********************
-- ������ ������
-- �����ͺ��̽� ��ü ����/����/���� ó���� ����ϴ� ������
-- CREATE : ����
-- ALTER : ����
-- DROP : ����

-- ���̺� ����� : CREATE TABLE ���̺�� (�÷��� �ڷ��� DEFAULT �⺻�� ��������);
-- ��(VIEW) ����� : CREATE VIEW ���̸� AS ��������;
-- �ε��� ����� : CREATE INDEX �̸�;
-- ������ ����� : CREATE SEQUENCE �������̸� ��������;
-- ����� ����� : CREATE USER ���̵� IDENTIFIED BY ��ȣ;

-- ���̺� ���� : ALTER TABLE ���̺�� ��������;
-- ������ ���� : ALTER SEQUENCE �������̸� ��������;
-- ����� ���� : ALTER USER ���̵� IDENTIFIED BY ��ȣ ������/����;

-- ���̺� ���� : DROP TABLE ���̺�� CASCADE CONSTAINTS;
-- ������ ���� : DROP SEQUENCE �������̸� ;
-- ����� ���� : DROP USER ���̵�;
-- ��(VIEW)���� : DROP VIEW ���̸�;

-- ���̺� �����
CREATE TABLE TEST (
    ID      VARCHAR2(15),
    NAME    VARCHAR2(20),
    PWD  VARCHAR2(15));

-- ���̺� ����
DROP TABLE TEST;

-- ���̺� ����� �� �� �÷��� ��������(CONSTRAINT)�� ������ �� �ִ�.
CREATE TABLE TEST (
    ID      VARCHAR2(15) PRIMARY KEY,
    NAME    VARCHAR2(20) NOT NULL,
    PWD  VARCHAR2(15) NOT NULL);
    
CREATE TABLE TEST(
ID      VARCHAR2(15)    CONSTRAINT  PK_TEST PRIMARY KEY,
NAME VARCHAR2(20) CONSTRAINT NN_TEST_NAME NOT NULL,
PWD VARCHAR2(15)    CONSTRAINT NN_TEST_PWD NOT NULL
);

DELETE FROM DEPARTMENT
WHERE DEPT_ID = '90';

CREATE TABLE CONSTRAINT_EMP
( EID       CHAR(3) CONSTRAINT PKEID PRIMARY KEY,
ENANE   VARCHAR2(20) CONSTRAINT NENAME NOT NULL,
ENO         CHAR(14) CONSTRAINT NENO NOT NULL CONSTRAINT UENO UNIQUE,
EMAIL   VARCHAR2(25)    CONSTRAINT UEMAIL UNIQUE,
PHONE   VARCHAR2(12),
HIRE_DATE   DATE DEFAULT SYSDATE,
JID     CHAR(2) CONSTRAINT FKJID REFERENCES JOB ON DELETE SET NULL,
SALARY NUMBER,
BONUS_PCT NUMBER,
MARRIAGE CHAR(1) DEFAULT 'N' CONSTRAINT CHK CHECK (MARRIAGE IN ('Y','N')),
MID CHAR(3) CONSTRAINT FKMID REFERENCES CONSTRAINT_EMP ON DELETE SET NULL,
DID CHAR(2),
CONSTRAINT FKDID FOREIGN KEY (DID) REFERENCES DEPARTMENT ON DELETE CASCADE
);

-- NOT NULL
-- �÷��� �ݵ�� ���� ��ϵǾ�� ��, NULL ������
-- �ʼ��Է��׸���
-- �÷����������� ������ �� �ִ� ����������

CREATE TABLE TESTNN (
    NNID NUMBER(5) NOT NULL,
    NN_NAME VARCHAR2(20)
);

-- DML(Data Manipulate Language)
-- ������ ���۾�
-- INSERT, UPDATE, DELETE / TRUNCATE (��� ����, �ѹ� �Ұ���)

INSERT INTO TESTNN (NNID, NN_NAME)
VALUES (1, 'ȫ�浿');

CREATE TABLE TESTFK (
    EMP_ID      CHAR(3)     REFERENCES EMPLOYEE,
    DEPT_ID     CHAR(2)     CONSTRAINT FK_TFK_DID REFERENCES DEPARTMENT (DEPT_ID),
    JOB_ID CHAR(2),
    -- ���̺� ����
    CONSTRAINT TFK_JID FOREIGN KEY (JOB_ID) REFERENCES JOB (JOB_ID)
    );
    
INSERT INTO TESTFK
VALUES ('100',NULL,NULL);

INSERT INTO TESTFK
VALUES ('200','77','J1'); -- �������� �ʴ� �μ��ڵ� ���, ����

INSERT INTO TESTFK
VALUES ('200','90','J4');

COMMIT;

SELECT * FROM TESTFK

-- ������ ��ųʸ� (����)
-- ��ȸ�� ������, ������ �� ��

-- ����ڰ� ������ ���̺� ���� ��ȸ  : USER_TABLES
SELECT * FROM USER_TABLES;

-- ����ڰ� ���� �������� ���� ��ȸ : USER_CONSTRAINTS
SELECT * FROM USER_CONSTRAINTS;

-- ����ڰ� ���� ������ ��ü ���� ��ȸ : USER_SEQUENCES
SELECT * FROM USER_SEQUENCES;

-- ����ڰ� ���� ��(VIEW) ��ü ���� ��ȸ : USER_VIEWS
SELECT * FROM USER_VIEWS;

-- ���� ����ڰ� ������ �� �ִ� ��� ���̺� ���� ��ȸ : ALL_TABLES
SELECT * FROM ALL_TABLES;

-- DBA (�����ͺ��̽� ������)�� ������ �� �ִ� ���̺�� ��ȸ : DBA_TABLES
SELECT * FROM DBA_TABLES; -- SYSTEM �������� ���� ����


-- ���������� �̿��� ���̺� ���� ����
-- SELECT ���� 
CREATE TABLE EMP_COPY90
AS
SELECT * FROM EMPLOYEE
WHERE DEPT_ID = '90';

SELECT * FROM EMP_COPY90;

-- SELECT �������� �����Ϸ���, VIEW ��ü�� �����
CREATE OR REPLACE VIEW VEMP
AS
SELECT * FROM EMPLOYEE;
-- �����ͻ������� ���� ��ȸ
SELECT * FROM USER_VIEWS;

-- �� ���
SELECT * FROM VEMP;

-- DML : ���̺� ���ο� ���� �߰�(INSERT), ���� ������ ����(UPDATE), ���� ����(DELETE)

-- INSERT ��
/*
INSERT INTO ���̺�� (�÷���, �÷���, ...)
VALUES (����� ��, NULL, DEFAULT);
*/

-- UPDATE ��
/*
UPDATE ���̺��
SET �÷��� = ������ ��, �÷��� = (������ ��������)
WHERE ���� ó��;
*/

CREATE TABLE EMPDEPT90
AS 
SELECT EMP_NAME, DEPT_NAME, LOC_DESCRIBE
FROM EMPLOYEE
JOIN DEPARTMENT USING (DEPT_ID)
JOIN LOCATION( LOC_ID = LOCATION_ID)
WHERE DEPT_ID = '90';

SELECT * FROM EMPDEPT90;

UPDATE EMPDEPT90
SET LOC_DESCRIBE = '����';

ROLLBACK;

UPDATE EMPDEPT90
SET LOC_DESCRIBE = '����'
WHERE EMP_NAME = '�Ѽ���';

SELECT * FROM EMPDEPT90;

-- DELETE ��
/*
DELETE [FROM] ���̺��
WHERE ����ó��;
-- WHERE ���� ������ ��� ���� ������. ROLLBACK ���� ��� ����
*/
DELETE EMPDEPT90;

SELECT * FROM EMPDEPT90;
ROLLBACK;

DELETE FROM EMPDEPT90
WHERE EMP_NAME = '������';

-- ��� �� ���� : TRUNCATE ���̺�� ; ����� ���� ����
-- ��� �� ��
TRUNCATE EMPDEPT90;
SELECT * FROM EMPDEPT90;
ROLLBACK;

--DDL
-- ��ü ���� : DROP

-- ���̺� ���� : DROP TABLE ���̺��;
DROP TABLE EMPDEPT90;