-- *********************************************
-- 동의어(SYNONYM)
-- : 다른 데이터베이스가 가진 객체에 대한 별명임.
-- 여러 사용자가 테이블을 공유할 경우, 다른 사용자가 테이블에
-- 접근할 경우 [사용자명.테이블명]으로 표현함.
-- 이때 동의어를 적용하면 간단하게 기술할 수 있게 됨

-- 생성 방법
CREATE SYNONYM 줄임말 FOR 사용자명.객체명;

-- 예 : 테이블명 줄임말 만들기 ---------------------------
CREATE SYNONYM EP FOR EMPLOYEE;

SELECT * FROM EP;

-- 예
SELECT * FROM SCOTT.EMP;

SELECT * FROM SYS.DUAL;

-- 동의어는 모든 사용자를 대상으로 하는 공개(PUBLIC) 동의어와
-- 개별 사용자를 대상으로 하는 비공개 동의어가 있음.
-- 공개 동의어는 system 계정에서 생성함.
/*
   사용형식
   CREATE [PUBLIC] SYNONYM synonym_name
   FOR user_name.object_name;
*/

-- 실습 *****************************************
-- 1. system 계정으로 로그인하기
CONN system/암호(엔터)

SHOW USER(엔터)

-- 2. 테이블을 생성함
DROP TABLE SYSTBL;

CREATE TABLE SYSTBL
(
       SNAME VARCHAR2(20)
);

-- 3. 2개의 행을 추가함
INSERT INTO SYSTBL
VALUES ('홍길동');

INSERT INTO SYSTBL
VALUES ('전우치');

SELECT * FROM SYSTBL;

-- 4. student 사용자에게 SYSTBL 테이블을 SELECT 할 수 있는
-- 권한을 부여함
SHOW USER     -- system
GRANT SELECT ON SYSTBL TO student;
GRANT CREATE SYNONYM TO student;

-- 5. student 계정으로 연결함
CONN student/암호

-- 6. 테이블에 접근해 봄
SELECT * FROM system.SYSTBL;

-- 7. 동의어 생성하기
SHOW USER -- student

CREATE SYNONYM STB
FOR system.SYSTBL;

SELECT * FROM STB;

-- 동의어 제거하기
-- 비공개 동의어 : 해당 사용자 계정에서 제거함
-- DROP SYNONYM 이름;
DROP SYNONYM EP;

-- 공개 동의어 : system 계정에서 제거함
-- DROP PUBLIC SYNONYM 이름;

