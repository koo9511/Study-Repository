-- DAY8 수업내용 : 서브쿼리 중 상[호연]관[서브]쿼리, 무결성 제약조건
-- DDL  : CREATE, ALTER, DROP
-- DML : INSERT,  UPDATE, DELETE, TRUNCATE
--  : COMMINT, ROLLBACK, SAVEPINT

-- FROM 절에서도 서브쿼리 사용할 수 있음
 -- FROM  절에 사용된 서브쿼리의 검사뷰를 '인라인 뷰' 라고함
-- 인라인 뷰에는 별칭이 사용됨 => 테이블 명

-- 짜기 직급의 평균급여와 같은 급여를 받고 있는 직원 조회
-- 이름, 직급명, 급여
SELECT EMP_NAME ,JOB_TITLE, SALARY
FROM (SELECT JOB_ID, TRUNC(AVG(SALARY), -5) JABAVG
            FROM EMPLOYEE
            GROUP BY JOB_ID)  V
LEFT JOIN EMPLOYEE E ON (V.JABAVG = E.SALARY AND NVL(V.JOB_ID, ' ') = NVL(E.JOB_ID,' ' ))
LEFT JOIN  JOB J ON (E.JOB_ID = J.JOB_ID)
ORDER BY 3,2;


-- 상호연관 서브쿼리
-- 일반적으로는 서브쿼리가 만들 결과값을 메인쿼리가 사용하는 구조임
-- 상관쿼리는 서브쿼리가 메인쿼리의 컬럼값을 이용함
-- 메인쿼리의 테이블 컬럼값이 변경되면, 서브쿼리의 결과가 달라짐

-- 자기 직급의 평균 급여와 같은 급여를 받는 직원 조회
-- 상관쿼리를 사용한 경우
SELECT EMP_NAME, JOB_TITLE, SALARY
FROM EMPLOYEE E
LEFT JOIN JOB J ON (E.JOB_ID = J.JOB_ID)
WHERE SALARY =(SELECT TRUNC(AVG(SALARY),-5)
                                FROM EMPLOYEE
                                WHERE NVL(JOB_ID, ' ') = NVL(E.JOB_ID, ' '))
ORDER BY 3, 2;
                                
-- 다중행 다중열 서브쿼리
-- 서브쿼리가 SELECT 한 컬럼수가 여러 개이고, 결과행의 갯수도 여러 개일 때
-- 서브쿼리와 비교할 항목은 반드시 서브쿼리 SELECT 절의 항목 갯수와 같아야 함.
-- 비교할 항목은 반드시 ()로 묶어주어야 함

-- 자기 직급에 평균 급여를 받는 직원 조회
-- 다중열 다중행 서브쿼리 사용
SELECT EMP_NAME, JOB_TITLE, SALARY
FROM EMPLOYEE
LEFT JOIN JOB USING (JOB_ID)
WHERE (NVL(JOB_ID,' '),SALARY) IN (SELECT NVL(JOB_ID,' '),TRUNC(AVG(SALARY),-5)
                        FROM EMPLOYEE
                        GROUP BY NVL(JOB_ID,' '))
ORDER BY 3,2;

-- EXISTS / NOT EXISTS 연산자
-- 서브쿼리가 만든 결과가 메인쿼리에 존재하는지 물어보는 연산자

-- 관리자인 직원 정보 조회
SELECT EMP_ID, EMP_NAME, '관리자' 구분
FROM EMPLOYEE E
WHERE EXISTS (SELECT NULL
                            FROM EMPLOYEE
                            WHERE E.EMP_ID = MGR_ID);
-- 서브쿼리의 조건을 만족하는 행이 존재하면 골라냄

-- NOT EXISTS
SELECT EMP_ID, EMP_NAME, '직원' 구분
FROM EMPLOYEE E
WHERE NOT EXISTS (SELECT NULL
                                    FROM EMPLOYEE
                                    WHERE E.EMP_ID = MGR_ID);
-- 서브쿼리의 조건절과 일치하지 않는 행을 골라냄

-- 스칼라 서브쿼리
-- 단일행 서브쿼리 + 상관쿼리

-- 사원명, 부서코드, 급여, 해당 직원이 소속된 부서의 급여평균 조회
-- select 절에서 서브쿼리 사용한 경우
SELECT EMP_NAME, DEPT_ID, SALARY,
            (SELECT TRUNC(AVG(SALARY),-5)
                FROM EMPLOYEE
                WHERE DEPT_ID = E.DEPT_ID) AVGSAL
FROM EMPLOYEE E;

-- CASE 표현식에서 스칼라 서브쿼리 사용한 경우
-- 부서의 근무지역이 'OT' 이면 '지역팀', 아니면 '본사팀'
-- 직원의 근무지역에 대한 소속을 조회
SELECT EMP_ID, EMP_NAME, (
                CASE WHEN DEPT_ID = (SELECT DEPT_ID
                                                            FROM DEPARTMENT
                                                            WHERE LOC_ID = 'OT')
                          THEN '지역팀'
                          ELSE '본사팀'
                          END ) 소속
FROM EMPLOYEE
ORDER BY 소속 DESC;

-- ORDER BY 절에서 서브쿼리 사용 가능함
-- 단, 스칼라 서브쿼리만 사용할 수 있음

-- 직원이 소속된 부서의 부서명이 큰 값부터 정렬된 직원 정보 조회
SELECT EMP_ID, EMP_NAME, E.DEPT_ID, HIRE_DATE, DEPT_NAME
FROM EMPLOYEE E
LEFT JOIN DEPARTMENT D ON (E.DEPT_ID = D.DEPT_ID)
ORDER BY (SELECT DEPT_NAME
                    FROM DEPARTMENT
                    WHERE DEPT_ID = E.DEPT_ID) DESC;
                    

-- TOP-N 분석 *****************************************************************
-- 상위 몇개, 하위 몇개를 조회할 때

-- 인라인 뷰와 RANK() 함수를 이용한 TOP-N 분석의 예
-- 직원 정보에서 급여를 많이 받는 직원 3명 조회
SELECT *
FROM (SELECT EMP_NAME, SALARY, 
                        RANK() OVER  (ORDER BY SALARY DESC) 순위
            FROM EMPLOYEE)
WHERE 순위 <= 3;

-- ROWNUM 을 이용한 TOP-N 분석
-- SELECT 한 결과행에 행번호(ROWNUM)가 부여됨

SELECT ROWNUM, EMP_NAME, SALARY
FROM (SELECT EMP_NAME, SALARY
            FROM EMPLOYEE
            WHERE EMP_NAME LIKE '%성%');
            
-- 급여를 많이 받는 직원 3명 조회
SELECT ROWNUM, EMP_NAME, SALARY
FROM (SELECT EMP_NAME, SALARY
                FROM EMPLOYEE
                ORDER BY SALARY DESC)
WHERE ROWNUM <= 3;

-- DDL (Data Definition Language) ********************
-- 데이터 정의의
-- 데이터베이스 객체 생성/수정/삭제 처리에 사용하는 구문암
-- CREATE : 생성
-- ALTER : 수정
-- DROP : 삭제

-- 테이블 만들기 : CREATE TABLE 테이블명 (컬럼명 자료형 DEFAULT 기본값 제약조건);
-- 뷰(VIEW) 만들기 : CREATE VIEW 뷰이름 AS 서브쿼리;
-- 인덱스 만들기 : CREATE INDEX 이름;
-- 시퀀스 만들기 : CREATE SEQUENCE 시퀀스이름 설정내용;
-- 사용자 만들기 : CREATE USER 아이디 IDENTIFIED BY 암호;

-- 테이블 수정 : ALTER TABLE 테이블명 수정내용;
-- 시퀀스 수정 : ALTER SEQUENCE 시퀀스이름 수정내용;
-- 사용자 수정 : ALTER USER 아이디 IDENTIFIED BY 암호 락설정/해제;

-- 테이블 삭제 : DROP TABLE 테이블명 CASCADE CONSTAINTS;
-- 시퀀스 삭제 : DROP SEQUENCE 시퀀스이름 ;
-- 사용자 삭제 : DROP USER 아이디;
-- 뷰(VIEW)삭제 : DROP VIEW 뷰이름;

-- 테이블 만들기
CREATE TABLE TEST (
    ID      VARCHAR2(15),
    NAME    VARCHAR2(20),
    PWD  VARCHAR2(15));

-- 테이블 삭제
DROP TABLE TEST;

-- 테이블 만들기 할 때 컬럼에 제약조건(CONSTRAINT)을 설정할 수 있다.
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
-- 컬럼에 반드시 값이 기록되어야 함, NULL 사용못함
-- 필술입력항목임
-- 컬럼레벨에서만 설정할 수 있는 제약조건임

CREATE TABLE TESTNN (
    NNID NUMBER(5) NOT NULL,
    NN_NAME VARCHAR2(20)
);

-- DML(Data Manipulate Language)
-- 데이터 조작어
-- INSERT, UPDATE, DELETE / TRUNCATE (모두 삭제, 롤백 불가능)

INSERT INTO TESTNN (NNID, NN_NAME)
VALUES (1, '홍길동');

CREATE TABLE TESTFK (
    EMP_ID      CHAR(3)     REFERENCES EMPLOYEE,
    DEPT_ID     CHAR(2)     CONSTRAINT FK_TFK_DID REFERENCES DEPARTMENT (DEPT_ID),
    JOB_ID CHAR(2),
    -- 테이블 레벨
    CONSTRAINT TFK_JID FOREIGN KEY (JOB_ID) REFERENCES JOB (JOB_ID)
    );
    
INSERT INTO TESTFK
VALUES ('100',NULL,NULL);

INSERT INTO TESTFK
VALUES ('200','77','J1'); -- 제공되지 않는 부서코드 사용, 에러

INSERT INTO TESTFK
VALUES ('200','90','J4');

COMMIT;

SELECT * FROM TESTFK

-- 데이터 딕셔너리 (사전)
-- 조회만 가능함, 수정은 못 함

-- 사용자가 소유한 테이블 정보 조회  : USER_TABLES
SELECT * FROM USER_TABLES;

-- 사용자가 만든 제약조건 정보 조회 : USER_CONSTRAINTS
SELECT * FROM USER_CONSTRAINTS;

-- 사용자가 만든 시퀀스 객체 정보 조회 : USER_SEQUENCES
SELECT * FROM USER_SEQUENCES;

-- 사용자가 만든 뷰(VIEW) 객체 정보 조회 : USER_VIEWS
SELECT * FROM USER_VIEWS;

-- 현재 사용자가 접근할 수 있는 모든 테이블 정보 조회 : ALL_TABLES
SELECT * FROM ALL_TABLES;

-- DBA (데이터베이스 관리자)가 접근할 수 있는 테이블들 조회 : DBA_TABLES
SELECT * FROM DBA_TABLES; -- SYSTEM 계정에서 접근 가능


-- 서브쿼리를 이용한 테이블 생성 구문
-- SELECT 문의 
CREATE TABLE EMP_COPY90
AS
SELECT * FROM EMPLOYEE
WHERE DEPT_ID = '90';

SELECT * FROM EMP_COPY90;

-- SELECT 쿼리문을 저장하려면, VIEW 객체를 사용함
CREATE OR REPLACE VIEW VEMP
AS
SELECT * FROM EMPLOYEE;
-- 데이터사전에서 생성 조회
SELECT * FROM USER_VIEWS;

-- 뷰 사용
SELECT * FROM VEMP;

-- DML : 테이블에 새로운 행을 추가(INSERT), 기존 데이터 수정(UPDATE), 행을 삭제(DELETE)

-- INSERT 문
/*
INSERT INTO 테이블명 (컬럼명, 컬럼명, ...)
VALUES (기록할 값, NULL, DEFAULT);
*/

-- UPDATE 문
/*
UPDATE 테이블명
SET 컬럼명 = 수정할 값, 컬럼명 = (단일행 서브쿼리)
WHERE 조건 처리;
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
SET LOC_DESCRIBE = '서울';

ROLLBACK;

UPDATE EMPDEPT90
SET LOC_DESCRIBE = '서울'
WHERE EMP_NAME = '한선기';

SELECT * FROM EMPDEPT90;

-- DELETE 문
/*
DELETE [FROM] 테이블명
WHERE 조건처리;
-- WHERE 절이 없으면 모든 행이 삭제됨. ROLLBACK 으로 취소 가능
*/
DELETE EMPDEPT90;

SELECT * FROM EMPDEPT90;
ROLLBACK;

DELETE FROM EMPDEPT90
WHERE EMP_NAME = '강종훈';

-- 모든 행 삭제 : TRUNCATE 테이블명 ; 사용할 수도 있음
-- 취소 안 됨
TRUNCATE EMPDEPT90;
SELECT * FROM EMPDEPT90;
ROLLBACK;

--DDL
-- 객체 제거 : DROP

-- 테이블 제거 : DROP TABLE 테이블명;
DROP TABLE EMPDEPT90;