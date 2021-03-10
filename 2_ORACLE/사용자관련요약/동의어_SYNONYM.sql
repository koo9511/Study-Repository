-- *********************************************
-- ���Ǿ�(SYNONYM)
-- : �ٸ� �����ͺ��̽��� ���� ��ü�� ���� ������.
-- ���� ����ڰ� ���̺��� ������ ���, �ٸ� ����ڰ� ���̺�
-- ������ ��� [����ڸ�.���̺��]���� ǥ����.
-- �̶� ���Ǿ �����ϸ� �����ϰ� ����� �� �ְ� ��

-- ���� ���
CREATE SYNONYM ���Ӹ� FOR ����ڸ�.��ü��;

-- �� : ���̺�� ���Ӹ� ����� ---------------------------
CREATE SYNONYM EP FOR EMPLOYEE;

SELECT * FROM EP;

-- ��
SELECT * FROM SCOTT.EMP;

SELECT * FROM SYS.DUAL;

-- ���Ǿ�� ��� ����ڸ� ������� �ϴ� ����(PUBLIC) ���Ǿ��
-- ���� ����ڸ� ������� �ϴ� ����� ���Ǿ ����.
-- ���� ���Ǿ�� system �������� ������.
/*
   �������
   CREATE [PUBLIC] SYNONYM synonym_name
   FOR user_name.object_name;
*/

-- �ǽ� *****************************************
-- 1. system �������� �α����ϱ�
CONN system/��ȣ(����)

SHOW USER(����)

-- 2. ���̺��� ������
DROP TABLE SYSTBL;

CREATE TABLE SYSTBL
(
       SNAME VARCHAR2(20)
);

-- 3. 2���� ���� �߰���
INSERT INTO SYSTBL
VALUES ('ȫ�浿');

INSERT INTO SYSTBL
VALUES ('����ġ');

SELECT * FROM SYSTBL;

-- 4. student ����ڿ��� SYSTBL ���̺��� SELECT �� �� �ִ�
-- ������ �ο���
SHOW USER     -- system
GRANT SELECT ON SYSTBL TO student;
GRANT CREATE SYNONYM TO student;

-- 5. student �������� ������
CONN student/��ȣ

-- 6. ���̺� ������ ��
SELECT * FROM system.SYSTBL;

-- 7. ���Ǿ� �����ϱ�
SHOW USER -- student

CREATE SYNONYM STB
FOR system.SYSTBL;

SELECT * FROM STB;

-- ���Ǿ� �����ϱ�
-- ����� ���Ǿ� : �ش� ����� �������� ������
-- DROP SYNONYM �̸�;
DROP SYNONYM EP;

-- ���� ���Ǿ� : system �������� ������
-- DROP PUBLIC SYNONYM �̸�;

