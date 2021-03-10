--DAY10 : DML(INSERT, DELETE), TCL(COMMIT, ROLLBACK, SAVEPOINT)
-- DDL (VIEW, SEQUENCE, INDEX), PL/SQL(PROCEDURE, FUNCTION, TRIGGER)

-- DML : INSERT 문 *************************
-- 테이블에 새 행을 추가할 때 사용하는 구문.
/*
INSERT INTO 테이블명 ( 값 기록에 사용될 컬럼명, ....)
VALUES (나열된 컬ㄹ머에 기록할 값....,)
테이블 이름 옆의 컬럼 나열을 생략할 수 있다

*/

CREATE TABLE DEPT (
    DEPTID CHAR(2),
    DEPTNAME VARCHAR2(20)
    );
    
    SELECT COUNT(*) FROM DEPT;
    
    INSERT INTO DEPT (DEPTID,DEPTNAME)
    VALUES ('10','회계팀');
    
    INSERT INTO DEPT
    VALUES ('20','인사팀');
    
    COMMIT;
    
    -- INSERT 시에 값 대신에 NULL과 DEFAULT를 사용할 ㅅ ㅜ있다.
INSERT INTO EMPLOYEE
VALUES ('900','하지인','871220-2253478','jieon@kh.org',NULL,'07/06/15','J7',NULL,NULL,DEFAULT,NULL,NULL);

SELECT *
FROM EMPLOYEE;

ROLLBACK;
    
    INSERT INTO EMPLOYEE
VALUES ('900','하지인','871220-2253478','jieon@kh.org',NULL,'07/06/15','J7',NULL,NULL,DEFAULT,DEFAULT,DEFAULT);
-- DEFAULT 가 설정되지 않은 컬럼에 DEFAULT 사용하면 NULL 처리됨.

-- 서브쿼리를 이용해서 INSERT 할 수 있다.
-- VALUES 키워드 사용하지 않음.

CREATE TABLE EMP (
EMP_ID CHAR(3),
EMP_NAME VARCHAR2(20),
DEPT_NAME VARCHAR2(20)
);

INSERT INTO EMP
(SELECT EMP_ID,  EMP_NAME, DEPT_NAME
FROM EMPLOYEE
LEFT JOIN DEPARTMENT USING(DEPT_ID)
);

SELECT *
FROM EMP;

-- DELETE 문 : 행을 삭제하는 구문. 행 갯수가 줄어듬
/*
DELETE FROM 테이블명
WHERE 컬럼명 비교연산자 비교값;
*/

-- WHERE 절 사용하지 않으면 모든 행이 삭제된다.
SELECT * FROM EMP;

DELETE FROM EMP;

ROLLBACK;

-- ************************************************
-- TCL (Transaction Controll Languege)
-- MOMMIT, ROLLBACK, SAVEPOINT

-- 트랜잭션의 시작
-- DDL 구문이 실행시 :  이전 트랜잭션 자동 커밋하고, 새 트랜잭션 시작함.
-- 처음 또는 커밋 후 DML 구문 시작 시

ALTER TABLE EMPLOYEE
DISABLE CONSTRAINT FK_MGRID; -- 트랜잭션 시작됨

SAVEPOINT S0;
INSERT INTO DEPARTMENT 
VALUES ('40','기획개발팀','A1');

SAVEPOINT S1;

UPDATE EMPLOYEE
SET DEPT_ID = '40'
WHERE DEPT_ID IS NULL;

SAVEPOINT S2;

DELETE FROM EMPLOYEE;
SELECT * FROM EMPLOYEE;

ROLLBACK TO S2;

SELECT COUNT(*) FROM EMPLOYEE;

SELECT COUNT(*) FROM EMPLOYEE
WHERE DEPT_ID = '40'; -- 3

ROLLBACK TO S1; -- UPDATE 취소

SELECT COUNT(*) FROM EMPLOYEE
WHERE DEPT_ID = '40';  -- 0

ROLLBACK; -- 트랜잭션 시작 위치까지의 모든 작업 내용이 취소됨.

SELECT * FROM DEPARTMENT; -- 40번 부서 없음

-- *********************************************************
-- DDL의 SEQUENCE 객체
-- 자동 숫자 발생기
CREATE SEQUENCE SEQ_EMPID
START WITH 300
INCREMENT BY 5
MAXVALUE 310
NOCYCLE
NOCACHE;

-- 숫자 발생시 : 시퀀스이름,NEXTVAL
-- INSERT, UPDATE 시 값 기록할 때 사용함.
SELECT SEQ_EMPID.NEXTVAL FROM DUAL;

-- 현재 발생된 마지막 숫자 확인할 때 : 시퀀스이름.CURRVAL
-- 시퀀스 객체 생성 후 NEXTVAL 한 번 사용 후에 조회할 수 있음.
SELECT SEQ_EMPID.CURRVAL FROM DUAL;

CREATE SEQUENCE SEQ.BNO
NOCYCLE
NOCACHE;

SELECT SEQ_BNO.NEXTVAL FROM DUAL;
SELECT SEQ.BNO.CURRVAL FROM DUAL;

-- CYCLE 적용시의 순환되는 시작값은 무조건 1부터임.
CREATE SEQUENCE SEQ_EMPID2
START WITH 5
INCREMENT BY 5
MAXVALUE 15
CYCLE
NOCACHE;

SELECT SEQ_EMPID2.NEXTVAL FROM DUAL;

ALTER SEQUENCE SEQID2
INCREMENT BY 5;

--  뷰(VIEW) ****************************
/*
SELECT 문의 실행겨로가 화면을 가상테이블처럼 저장해 두고 사용할 수 있음.
마치 결과화면을 사진찍어서 보관한다는 개념
사용목적 :
    1. 보안에 유리 : 보관된 결과 화면만 재생해 봄으로서 쿼리문은 안 보이게 함
    2. 복잡하고 긴 쿼리문을 뷰를 통해 봄으로서 매번 쿼리문을 실행시키지 않아도 됨
    
-- 구문 작성 방법
CREATE [OR REPLACE VIEW] [FORCE | NOFORCE] VIEW 뷰이름 (ALIAS, ALIAS, ...)
AS 서브쿼리
[WITH CHECK OPTION CONSTRAINT 저장이름]
[WITH READ ONLY CONSTRAINT 저장이름];

-- CREATE OR REPLACE 
     : 뷰가 존재하지 않으면 새로 만들고, 존재하면 덮어쓰기.
        뷰는 수정(ALTER)  기능이 존재하지 않음.

-- FORCE | NOFORCE 
        NOFORCE : 베이스테이블이 존재하는 경우에만 뷰 생성. 기본값임.
        FORCE : 베이스테이블이 없어도 뷰 생성.
        
-- ALIAS
        : 뷰에서 사용할 표현식 이름 (테이블의 컬럼명 개념)
        생략하면 서브쿼리 SELECT 절의 컬럼명 그대로 ㅏㅅ용함.
        따로 뷰에서 별칭 적용시에는 서브쿼리 SELECT 절의 컬럼 항목 수와 일치해야함.
        
-- 서브쿼리
        : 뷰에서 저장될 SELECT 문
        
-- WITH CHECK OPTION
        : 뷰를 이용해서 DML 구문을 베이스테이블에 적용할 수 있다.
        기본값임
        베이스 테이블이 1개일 때만 가능.

-- WITH READ ONLY
        : 뷰를 통한 DML 작업 수행 못함.
        제약조건으로 간주되므로, 별도 이름으로 설정 내용을 저장할 수 있음.
*/

CREATE VIEW V_EMP
AS
SELECT * FROM EMPLOYEE;

-- CREATE VIEW 권한이 필요함
-- 관리자계정에서 GRANT 사용해서 권한 부여받고 사용함.
GRANT CREATE VIEW TO STUDENT;

-- 90번 부서에 소속된 직원의 이름, 부서명, 직급명, 급여를 조회한 결과를
-- v_emp_dept90 뷰로 저장 처리

CREATE OR REPLACE VIEW V_EMP_DEPT90
AS
SELECT EMP_NAME, DEPT_NAME, JOB_TITLE, SALARY
FROM EMPLOYEE
LEFT JOIN JOB USING (JOB_ID)
LEFT JOIN DEPARTMENT USING (DEPT_ID)
WHERE DEPT_ID = '90';

-- 실제 뷰 객체는 SELECT 쿼리문을 저장하는 객체임.
SELECT * FROM V_EMP_DEPT90;

--  데이터 딕셔너리에서 뷰 정보 확인
SELECT * FROM USER_VIEWS;

-- VIEW_NAME : 저장된 뷰이름
-- TEXT : 서브쿼리 SELECT 문

-- 직급명이 '사원'인 모든 직원의 사원명, 부서명, 직급명을 조회한 결과를   뷰로 저장함.
-- 뷰 이름 : V_EMP_사원

CREATE OR REPLACE VIEW V_EMP_사원
AS
SELECT EMP_NAME, DEPT_NAME, JOB_TITLE
FROM EMPLOYEE
LEFT JOIN JOB USING (JOB_ID)
LEFT JOIN DEPARTMENT USING(DEPT_ID)
WHERE JOB_TITLE = '사원';

SELECT * FROM V_EMP_사원;

--뷰도 테이블처럼 객체로 취급됨. 데이터 딕셔너리에서 확인
SELECT COLUMN_NAME, DATA_TYPE, NULLABLE
FROM USER_TAB_COLS
WHERE TABLE_NAME = 'V_EMP_사원';

-- ALIAS 사용
-- 뷰 생성시 별칭(ALIAS) 사용할 수 있음.
-- 1. 뷰 이름 앞에 정의하는 방법
-- 2. 서브쿼리 SELECT 절에서 지정하는 방법

CREATE OR REPLACE VIEW V_EMP_사원 (ENM, DNM, JTITLE)
AS
SELECT EMP_NAME, DEPT_NAME, JOB_TITLE
FROM EMPLOYEE
LEFT JOIN JOB USING (JOB_ID)
LEFT JOIN DEPARTMENT USING(DEPT_ID)
WHERE JOB_TITLE = '사원';

SELECT * FROM V_EMP_사원;

-- 뷰 생성시 반드시 ALIAS 사용해야 하는 경우
-- 서브쿼리 SELECT 절에 함수식 | 계산식은 반드시 별칭 사용해야 함
CREATE OR REPLACE VIEW V_EMP
AS
SELECT EMP_NAME,
            DECODE(SUBSTR(EMP_NO,8,1),'1','남자','3','남자','여자'),
            ROUND(MONTHS_BETWEEN(SYSDATE, HIRE_DATE) / 12, 0)
FROM EMPLOYEE;

-- 뷰 생성자 제약조건
-- 뷰의 원래 목적은 아니지만, 뷰를 통한 DML wkrdjq rksmdgka
-- DML 작업의 결과는 베이스 테이블에 적용됨.
-- COMMIT / ROLLBACK 필요함
-- 뷰를 통한 DML 작업에는 제한이 없음
-- 뷰에 보여지는 컬럼에만 INSERT / UPDATE 할 수 있음.

-- WITH READ ONLY
CREATE OR REPLACE VIEW V_EMP
AS
SELECT * FROM EMPLOYEE
WITH READ ONLY;

-- DML 허용하지 않는다.
UPDATE V_EMP
SET PHONE = NULL; -- error

INSERT INTO V_EMP (EMP_ID, EMP_NAME, EMP_NO)
VALUES ('777','오현정','771025-2123456'); -- error

-- WITH CHECK OPTION
-- 뷰를 통해 INSERT / UPDATE 에 제한이 있음
-- DELETE 문은 제한없이 사용할 수 있음

CREATE OR REPLACE VIEW V_EMP
AS
SELECT EMP_ID, EMP_NAME, EMP_NO, MARRIAGE
FROM EMPLOYEE
WHERE MARRIAGE = 'N'
WITH CHECK OPTION;

-- 뷰를 생성할 때 사용한 WHERE 조건에 적용되는 범위에서만 DML 허용됨.


-- FORCE 옵션 : 베이스 테이블이 없어도 뷰 생성함


-- NOFORCE : 기본값. 베이스 테이블이 존재해야 뷰 생성됨.
CREATE OR REPLACE VIEW V_EMP
AS
SELECT TCODE, TNAME, TCONTENT
FROM TTT; --error

-- 인라인 뷰 
-- 일반적으로 FROM 절에 사용된 서브쿼리에 별칭을 붙인 것
SELECT EMP_NAME, SALARY
FROM (SELECT NVL(DEPT_ID, 'NO') AS "did",
                        ROUND(AVG(SALARY), -3) AS "davg"
          FROM EMPLOYEE
          GROUP BY DEPT_ID) INLV -- 인라인 뷰
JOIN EMPLOYEE ON (NVL(DEPT_ID,'NO') = INLV."did")
-- 별칭에 "" 사용되면 별칭 사용시에도 "" 표시
WHERE SALARY > INLV."davg"
ORDER BY 2 DESC;

-- 서브쿼리에 대한 뷰 생성
CREATE OR REPLACE VIEW V_DEPT_SALAVG
AS
SELECT NVL(DEPT_ID, 'NO') AS "did",
                        ROUND(AVG(SALARY), -3) AS "davg"
          FROM EMPLOYEE
          GROUP BY DEPT_ID;
        
        
-- 인덱스 (INDEX) ***********************
/*
SQL SELECT 명령문의 처리 속도를 향상시키기 위해서 사용하는 객체
인덱스 내부 구조는 B 트리 구조
컬럼에 인덱스 설정하면 이에 대한 이진트리가 구성되면서 인덱스 객체가 생성됨
인덱스를 생성하기 위한 시간이 필요하고, 인덱스를 위한 추가 저장공간도 필요함.
(반드시 좋은 것만은 아님)
인덱스 생성 후에 DML 수행하면, 인덱스가 사용한 컬럼값이 변경되므로
이진 트리도 새로 구성되어야 함. => DML 작업이 훨씬 더 무거워지게 됨.

인덱스 구조 : 키와 키의 값이 기록된 행 위치(ROWID)로 구성됨.

인덱스 생성 구문
CREATE INDEX 인덱스이름
ON 테이블명 (컬럼리스트 | 함수식 | 계산식);

인덱스의 종류
1. 고유 인덱스(UNIQUE INDEX)
2. 비고유 인덱스(NON-UNIQUE INDEX)
3. 단일 인덱스 (SINGLE INDEX)
4. 결합 인덱스 (COMPOSITE INDEX)
5. 함수 기반 인덱스 (FUNCTION BASED INDEX)
*/

-- UNIQUE INDEX
-- UNIQUE 제약조건과 같은 의미를 가짐
-- 중복값이 기록되지 않은 컬럼에 사용되는 인덱스
CREATE UNIQUE INDEX IDX_DNM
ON DEPARTMENT (DEPT_NAME);

-- NON-UNIQUE INDEX
-- 
create index idx_jid
on employee (job_id);

-- 인덱스 생성 실습
-- 1. EMPLOYEE 테이블의 EMP_NAME 컬럼에 IDX_ENM 이름의 UNIQUE INDEX 생성하시오
create  unique index idx_enm
on employee (emp_name);
--2. 아래와 같은 새로운 데이트를 입력해보고, 오류 원인을 생각해보시오.
INSERT INTO EMPLOYEE (EMP_ID, EMP_NO, EMP_NAME)
VALUES ('400','871120-123456','감우섭');
 -- UNIQUE INDEX 가 컬럼에 설정되면, UNIQUE 제약조건 설정한 것과 동일함.
 
 -- 3. EMPLOEE 테이블의 DEPT_ID 컬럼에 IDX_DID 라는 이름의 UNIQUE INDEX 생성해보고 오류 원인을 생각해보시오.
 CREATE UNIQUE INDEX IDX_DID
 ON EMPLOYEE(DEPT_ID); -- UNIQUE 는 중복허용을 하지 않는데 DEPT_ID에는 이미 중복값이 들어있기 때문에 error
 
 -- INDEX 삭제
 drop index idx_jid;

-- 인덱스와 관련된 데이터 딕셔너리 확인
desc user_indexes;
desc user_ind_columns;

-- EMPLOYEE 테이블에 생성된 인덱스 현황 조회
select index_name, column_name, index_type, uniqueness
from user_indexes
join user_ind_columns using (index_name, table_name)
where table_name = 'EMPLOYEE';

-- 결합 인덱스
-- 한 개의 컬럼으로 구성한 인덱스 : 단일 인덱스라고 함
-- 두 개 이상의 컬럼으로 인덱스를 구성하는 것

-- 부서 번호와 부서명을 결합하여 인덱스 생성하기
create table dept01
as
select * from department;
CREATE INDEX IDX_DEPT01_COMP
ON DEPT01 (DEPT_ID, DEPT_NAME);


-- 함수 기반 인덱스
-- SELECT 절이나 WHERE 절에 산술계산식이나 함수식이 사용된 경우
-- 계산식은 인덱스 생성을 할 수 없음
-- 함수식으로 검색하는 경우가 많다면, 인덱스 만들 수 있음

create table emp01
as
select * from employee;

create index idx_emp01_salcalc
on emp01 ((salary + (salary * nvl(bonus_pct,0)) * 12));

-- 데이터 딕셔너리에서 확인
select index_name, column_name
from user_ind_columns
where table_name = 'EMP01';






