-- DAY9 : SELECT 기타기능, 분석함수, DDL, DML, TCL


/*WITH : 이름 AS (쿼리문)
    SELECT :* FROM 이름
    => 서브쿼리에 이름을 붙여주고, 사용 시 서브쿼리 대신에 이름을 사용함.
    => 같은 서브쿼리가 여러번 반복되는 경우 이용
    => 쿼리문 실행속도도 빨라짐
    
-*/

-- NATURAL JOIN
-- 조인할 테이블의 기본키를 이용한  EQUAL JOIN + INNER JOIN
-- INNER JOIN 의 USING 사용과 결과가 동일함
SELECT *
FROM EMPLOYEE
NATURAL JOIN DEPARTMENT;

-- 부서 중 급여 총합의 20% 이상에 해당되는 급여를 수령하는
-- 부서명, 부서급여합계 조회
WITH TOTAL_SAL AS (SELECT DEPT_NAME, SUM(SALARY) SSAL
                                    FROM EMPLOYEE 
                                    NATURAL JOIN DEPARTMENT
                                    GROUP BY DEPT_NAME)
SELECT DEPT_NAME, SSAL
FROM TOTAL_SAL
WHERE SSAL > (SELECT SUM(SALARY) * 0.2
                            FROM EMPLOYEE);

--  분석함수
/*
분석함수의 정의 : 데이터를 분석하는 함수
분석함수를 사용하면, 쿼리 실행의 결과인 Result Set 을 대상으로
전체 그룹별이 아닌 소그룹별로 각 행에 대한 계산값을 리턴한다.

일반 그룹함수들과 다른 점 : 분석함수는 분석함수용 그룹을 별도로 지정하여
그 그룹을 대상으로 계산을 수행한다는 점이다.
일반 그룹함수는 그룹별로 계산을 수행한다

이때 분석함수룔 그룹을 오라클에서는 윈도우라고 부른다.
그래서 분석함수를 윈도우함수라고도 함.

*/
-- 사용형식
/*
분석함수명 () OVER ()
fROM 테이블명

-- 전달인자 : 분석함수에 따라 0개~3개 까지 사용할 수 있음.
-- 쿼리 PARTITION : PARTITION BY 표현식
                                        PARTITION BY 로 시작하며, 표현식에 따라 그룹별로 단일 결과셋(Result Set)을 분리하는 역할을 함.
                                        즉, 분석함수의 계산대상 그룹을 지정함.
                                        (Group by 와 비슷함)
-- ORDER BY : PARTITION 절 뒤에 위치하며, 계산 대상 그룹에 대해 정렬처리함

-- WINDOW 절 : 분석함수 대상이 되는 데이터를 행 기준으로 범위를 더 세부적으로 정의하는데,
                                PARTITION BY 에 의해 나누어진 기준 그룹에 또 다른 소그룹을 만듦
*/

-- 등수 매기는 함수 : RANK()
-- 같은 등수가 있을 때에는 다음 등수를 건너뜀
--- 예 1등이 2명일 경우 1, 1, 3, 4, 5 ...

-- 급여에 등수를 매긴다면
SELECT EMP_ID, EMP_NAME, SALARY, RANK() OVER(ORDER BY SALARY DESC) 급여순위
FROM EMPLOYEE;

-- 특정 값의 순위를 조회하고 싶다면
-- RANK(특정값) 사용
-- 급여 230만이 전체 급여에서 몇등인지
SELECT RANK(2300000) WITHIN GROUP (ORDER BY SALARY DESC)
FROM EMPLOYEE;

-- DENSE_RANK()
-- 같은 순위일 때도 다음 순위가 건너뛰지 않음
-- 예 : 1,  2, 2, 3, 4, 5 ...

-- 급여 전체의 순위를 매긴다면
SELECT EMP_NAME, DEPT_ID, SALARY, RANK() OVER(ORDER BY SALARY DESC) 순위1, 
                                                                        DENSE_RANK() OVER(ORDER BY SALARY DESC) 순위2,
                                                                        DENSE_RANK() OVER(PARTITION BY DEPT_ID ORDER BY SALARY DESC) 순위3 -- 그룹 안에서의 순서
FROM EMPLOYEE
ORDER BY 2 DESC;

-- RANK() 를 이용한 TOP-N 분석 방법
-- 예 : 급여 많은순 순위 5개 조회
SELECT *
FROM (SELECT EMP_NAME,SALARY, RANK() OVER(ORDER BY SALARY DESC) 순위
                FROM EMPLOYEE)
WHERE 순위 <= 5;

-- 급여 내림차순 정렬한 다음 11순위에 해당하는 직원 정보 조회
SELECT *
FROM (SELECT EMP_NAME,SALARY, RANK() OVER(ORDER BY SALARY DESC) 순위
                FROM EMPLOYEE)
WHERE 순위 = 11;

-- CUME_DIST() 
-- PARTITION BY 에 의해 나누어진 그룹별로 각 행을 ORDER BY 절에 명시된 순서로 졍렬한 후, 그룹별 누적된 분산정도(상대적인 위치)를 구하는 함수
-- 분산정도(상대적인 위치)는 구하고자 하는 값보다 작거나 같은 값을 가진 행 수를 그룹내의 총   행 수로 나눈 것을 의미하며, 
-- 0 < 결과값 <= 1 범위의 값이 됨

-- 부서코드가 '50'인 직원의 이름, 급여, 누적분산 
SELECT EMP_NAME, SALARY,
            ROUND(CUME_DIST() OVER(ORDER BY SALARY ), 1)
FROM EMPLOYEE
WHERE DEPT_ID = '50';

-- NTILE() 
/*
PARTITION 을 BUCKET 이라 불리는 소그룹별로 나누고, PARTITION 내의 각 행을 BUCKET에 나누어 배치하는 방식
예를 들어 PARTITION 안에 100개의 행이 있다면, BUCKET을 4개로  정하면 1개의 BUCKET 당 25개의 행이 배분됨
정확한=게 배분되지 않으 경우에는 근사치로 배분한 후, 남는 값에 대해 최초 BUCKET 부터 한 개씩 배분함.
*/

-- 급여를 4등급으로 분류
SELECT EMP_NAME, SALARY , NTILE(4) OVER (ORDER BY SALARY) 등급
FROM EMPLOYEE;

-- ROW_NUMBER() 함수
/*
ROWNUM 과는 관계 없음
각 PARTITION 내의 값들을 ORDER BY 절에 의해 정렬한 후
그 순서대로 순번을 부여함.
*/

-- 사번, 이름, 급여, 입사일, 순번
-- 단, 순번은 급여가 많은 순으로, 같은 급여는 입사일이 빠른 순으로 조회
SELECT EMP_ID, EMP_NAME, SALARY, HIRE_DATE, ROW_NUMBER() OVER(ORDER BY SALARY DESC, HIRE_DATE ASC)
FROM EMPLOYEE;

-- 집계함수
-- 직원 테이블에서 부서코드가 '60'인 직원들의 사번,급여,해당부서그룹(윈도우)의 사번을 오름차순 정렬하고,
-- 급여의 합계를 첫 행부터 마지막 행까지 구하여 win1 에 표시,
-- 윈도우의 시작행에서 현재 위치(current row) 까지의 합계를 구해서 win2에 표시
-- 현재 위치에서 윈도우의 마지막 행 까지의 합계를 구해서 win3에 표시
SELECT EMP_ID, SALARY, 
            -- 급여의 합계를 첫 행부터 마지막 행까지 구하여 win1 에 표시
           SUM(SALARY) OVER( PARTITION BY DEPT_ID ORDER BY EMP_ID ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)"win1",
-- ROWS : 부분그룹인 윈도우의 크기를 물리적인 단위로 행집합을 지정함.
            -- 윈도우의 시작행에서 현재 위치(current row) 까지의 합계를 구해서 win2에 표시
            SUM(SALARY) OVER( PARTITION BY DEPT_ID ORDER BY EMP_ID ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)"win2",
            -- 현재 위치에서 윈도우의 마지막 행 까지의 합계를 구해서 win3에 표시
            SUM(SALARY) OVER( PARTITION BY DEPT_ID ORDER BY EMP_ID ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING)"win3"
FROM EMPLOYEE
WHERE DEPT_ID = '60';

SELECT EMP_ID, SALARY, 
           SUM(SALARY) OVER( PARTITION BY DEPT_ID ORDER BY EMP_ID ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING)"win1", 
-- 1 PRECEDING AND 1 FOLLOWING =  현재 행을 기준으로 이전행과 다음행의 급여합계
            SUM(SALARY) OVER( PARTITION BY DEPT_ID ORDER BY EMP_ID ROWS BETWEEN 1 PRECEDING AND CURRENT ROW)"win2",
-- 1 PRECEDING ANG CURRENT ROW = 이전 행과 현재 행까지의 급여 합계
            SUM(SALARY) OVER( PARTITION BY DEPT_ID ORDER BY EMP_ID ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING)"win3"
-- CURRENT ROW AND 1 FOLLOWING = 현재행과 다음 행 까지의 급여 합계
FROM EMPLOYEE
WHERE DEPT_ID = '60';

-- RATIO_TO_REPORT   
-- 해당 구간에서 차지하는 비율을 리턴하는 함수

-- 직원들의 총 급여를 2천만원 증가시키려면, 기존 월급비율을 적용해서 각 직원들의 급여증가액을 조회
SELECT EMP_NAME, SALARY, 
            LPAD(TRUNC(RATIO_TO_REPORT(SALARY) OVER () * 100, 0), 5) || '%' 비율, 
           TO_CHAR(TRUNC(RATIO_TO_REPORT(SALARY) OVER () * 20000000, 0) , 'L00,999,999')  "급여 증가액"
FROM EMPLOYEE;

-- LAG(조회할 범위, 이전위치, 기준현재위치)
-- 지정하는 컬럼의 현재 행을 기준으로 이전행의 값을 조회하는 함수
SELECT EMP_NAME, DEPT_ID, SALARY,
            LAG(SALARY, 1, 0) OVER (ORDER BY SALARY) 이전값,
            -- 1 : 위의 행 값, 0: 이전행이 없으면 0 처리함
            LAG(SALARY, 1, SALARY) OVER (ORDER BY SALARY) 조회2,
            -- 이전 행이 없으면 형재 행의 값 출력
            LAG(SALARY, 1, SALARY) OVER (PARTITION BY DEPT_ID ORDER BY SALARY) "조회3"
FROM EMPLOYEE;

-- LEAD(조회할 범위, 다음위치, 0 또는 컬럼명)
-- 다음(아래)행의 값 조회
SELECT EMP_NAME, DEPT_ID, SALARY,
            LEAD(SALARY, 1, 0) OVER (ORDER BY SALARY) 이전값,
            -- 1 : 위의 행 값, 0: 이전행이 없으면 0 처리함
            LEAD(SALARY, 1, SALARY) OVER (ORDER BY SALARY) 조회2,
            -- 이전 행이 없으면 형재 행의 값 출력
            LEAD(SALARY, 1, SALARY) OVER (PARTITION BY DEPT_ID ORDER BY SALARY) "조회3"
FROM EMPLOYEE;

-- DDL ***
-- 데이터 무결성 제약조건

-- 외래/외부 키 (FOREIGN KEY) 제약조건 관련 삭제 룰 옵션
-- 부모키(PARENT KEY : 값 제공자)에 해당하는 컬럼값은 기본 삭제 불가능임.
-- 부모키가 제공하는 값을 사용하는 자식 레코드(CHILD RECORD) 가 존재하면
-- 해당 부모키의 값은 삭제할 수 없음( 기본값 : ON DELETE RESTRICTED)

-- 확인 : EMPLOYOEE 의 DEPT_ID 컬럼에 '90' 사용되고 있음
SELECT *
FROM EMPLOYEE
WHERE DEPT_ID = '90';

-- 제공자인 DEPARTMENT 의 '90'번 부서는 삭제 불가능.
DELETE FROM DEPARTMENT
WHERE DEPT_ID = '90';

-- 사용되지 않은 (자식 레코드가 없는) 부모키는 삭제 가능
DELETE FROM DEPARTMENT
WHERE DEPT_ID = '30';

SELECT * FROM DEPARTMENT;

ROLLBACK;

-- 외래키에 대한 삭제 옵션은 테이블을 만들 때, 컬럼 제약조건 설정시에 지정함.
-- 제약조건 수정을 원하면, 해당 제약조건을 삭제하고, 다시 컬럼에 새 제약조
-- 추가하면서 삭제 옵션도 함께 지정함

-- ON DELETE SET NULL
-- 부모키 삭제시 자식 레코드의 값을 NULL 로 바꿈
CREATE TABLE PRODUCT_STATE (
    PSTATE CHAR(1) PRIMARY KEY,
    PCOMMENT VARCHAR2(20)
    );

INSERT INTO PRODUCT_STATE VALUES ('A','최고급 사양');
INSERT INTO PRODUCT_STATE VALUES ('B','중급 사양');
INSERT INTO PRODUCT_STATE VALUES('C','하급 사양');

COMMIT;

SELECT * FROM PRODUCT_STATE;

CREATE TABLE PRODUCT(
    PNAME VARCHAR2(20) PRIMARY KEY,
    PPRICE NUMBER CHECK (PPRICE > 0),
    PSTATE CHAR(1)  REFERENCES PRODUCT_STATE ON DELETE SET NULL
    );

INSERT INTO PRODUCT VALUES ('갤럭시', 654000, 'A');
INSERT INTO PRODUCT VALUES ('G7',565000,'B');
INSERT INTO PRODUCT VALUES ('MAC AIR',580000,'C');

SELECT * FROM PRODUCT;

SELECT * FROM PRODUCT JOIN PRODUCT_STATE USING (PSTATE);

--삭제 확인
DELETE FROM PRODUCT _STATE
WHERE PSTATE = 'A';

-- ON DELETE CASCADE
-- 부모키 삭제시 연결된 자식 레코드(해당 값이 기록된 행)도 함께 삭제함

-- 외래키 제약조건으로 연결된 테이블도 기본 삭제 못함.
DROP TABLE PRODUCT_STATE; -- error

-- 테이블에 설정된 제약조건도 함께 삭제처리하면 삭제됨.
DROP TABLE PRODUCT_STATE CASCADE CONSTRAINTS;
DROP TABLE PRODUCT CASCADE CONSTRAINTS;

-- 위의 구문 사용 다시 테이블 만들고 데이터 기록함.
-- 삭제옵션은 ON DELETE ㅊㅁㄴㅊㅁㅇㄸ fh 변경하고 실행함.
CREATE TABLE PRODUCT_STATE (
    PSTATE CHAR(1) PRIMARY KEY,
    PCOMMENT VARCHAR2(20)
    );

INSERT INTO PRODUCT_STATE VALUES ('A','최고급 사양');
INSERT INTO PRODUCT_STATE VALUES ('B','중급 사양');
INSERT INTO PRODUCT_STATE VALUES('C','하급 사양');

CREATE TABLE PRODUCT(
    PNAME VARCHAR2(20) PRIMARY KEY,
    PPRICE NUMBER CHECK (PPRICE > 0),
    PSTATE CHAR(1)  REFERENCES PRODUCT_STATE ON DELETE CASCADE
    );

INSERT INTO PRODUCT VALUES ('갤럭시', 654000, 'A');
INSERT INTO PRODUCT VALUES ('G7',565000,'B');
INSERT INTO PRODUCT VALUES ('MAC AIR',580000,'C');

COMMIT;

-- 삭제 확인 : 자식 레코드 같이 삭제됨
DELETE FROM PRODUCT_STATE
WHERE PSTATE = 'B';
COMMIT;

--자식 레코드 삭제 확인
SELECT * FROM PRODUCT;

-- *********************************************
-- 서브쿼리를 사용해서 테이블 새로 만들 수 있음.
CREATE TABLE EMP_DEPT90
AS
SELECT * FROM EMPLOYEE
WHERE DEPT_ID = '90';

SELECT * FROM EMP_DEPT90;

--테이블의 구조 확인 명령어 : DESCRIBE 테이블명; 또는 DESC 테이블명;
DESC EMP_DEPT90;

--서브쿼리를 이용해서 기존 테이블을 복사한 경우
-- 컬럼명, 자료형, NOT NULL 제약조건은 복사됨.
-- 나머지 제약조건은 복사 안 됨.
s
-- 사번, 이름, 급여, 직급명, 부서명, 근무지역명, 소속국가명 조회하여
-- EMP_LIST 테이블에 저장함.
CREATE TABLE EMP_LIST 
AS
SELECT EMP_ID, EMP_NAME, SALARY, JOB_TITLE, DEPT_NAME, LOC_DESCRIBE, COUNTRY_NAME
FROM EMPLOYEE
LEFT JOIN JOB USING(JOB_ID)
LEFT JOIN DEPARTMENT USING (DEPT_ID)
LEFT JOIN LOCATION ON (LOC_ID = LOCATION_ID)
LEFT JOIN COUNTRY USING (COUNTRY_ID);

SELECT *
FROM EMP_LIST;

-- EMPLOYEE 에서 남자 직원만 골라내서 새 테이블에 저장
-- 테이블명 : EMP_MAN
CREATE TABLE EMP_MAN
AS
SELECT *
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8, 1) IN ('1','3');

SELECT * FROM EMP_MAN;
-- 여자직원의 정보만 골라서 EMP_FEMAIL 테이블에 저장
CREATE TABLE EMP_FEMAIL
AS
SELECT *
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO,8,1)IN('2','4');

SELECT * FROM EMP_FEMAIL;

-- 부서별 직원 명단을 PART_LIST 테이블에 저장함
-- DEPT_NAME, JOB_TITLE, EMP_NAME, EMP_ID 로 구성함
-- 각 컬럼에 주석달기 : 부서명, 직급명, 이름, 사번
CREATE TABLE PART_LIST
AS
SELECT DEPT_NAME 부서명, JOB_TITLE 직급명, EMP_NAME 이름, EMP_ID 사번
FROM EMPLOYEE
LEFT JOIN JOB USING(JOB_ID)
LEFT JOIN DEPARTMENT USING (DEPT_ID)
ORDER BY DEPT_NAME;
SELECT  * FROM PART_LIST;

-- 컬럼에 주석 달기
COMMENT ON COLUMN PART_LIST.부서명 IS '부서명';
COMMENT ON COLUMN PART_LIST.직급명 IS '직급명';
COMMENT ON COLUMN PART_LIST.이름 IS '사원명';
COMMENT ON COLUMN PART_LIST.사번 IS '사번';

-- 데이터 딕셔너리 ( 사전)
-- 사용자가 생성한 모든 객체 정보는 테이블 단위로 데이터사전 영역에 저장되고 있음.
-- 제약 조건도 저장됨 : USER_CONSTRAINTS 
DESC USER_CONSTRAINTS;

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS;

-- 서브쿼리 결과를 테이블에 저장하기 위해 새 테이블을 만들었음.
-- 서브쿼리 결과에 대한 데이터는 제외하고, 구조만 복사할 경우
-- 서브쿼리 WHERE 1 = 0  으로 표시하면 됨
CREATE TABLE DEPT_COPY
AS
SELECT * FROM DEPARTMENT
WHERE 1 = 0;

SELECT * FROM DEPT_COPY;

DESC DEPT_COPY;

-- 서브쿼리로 새 테이블 만들 때, 서브쿼리의 컬럼명을 사용하지 않고
-- 새 테이블에서 컬럼명으 다르게 구성할 수도 있음
CREATE TABLE JOB_COPY (직급코드, 직급명, 최저급여, 최고급여)
AS
SELECT *
FROM JOB;

-- 서브쿼리로 새 테이블 만들 때, 컬럼명을 바꾸면서 제약조건도 추가할 수 있음
-- 외부키 제약조건을 추가할 수 없음.
-- 제약조건 추가시 복사 저장되는 데이터와 제약조건이 맞아야 함.

CREATE TABLE TB_SUBQUERY (
    EID PRIMARY KEY,
    ENAME,
    SALARY CHECK (SALARY > 2000000),
    DID ,
    JTITLE NOT NULL 
    )
AS
SELECT EMP_ID, EMP_NAME, SALARY, DEPT_ID, NVL(JOB_TITLE,'미지정')
FROM EMPLOYEE
LEFT JOIN DEPARTMENT USING (DEPT_ID)
LEFT JOIN JOB USING (JOB_ID)
WHERE SALARY > 2000000;

-- DDL : CREATE , ALTER , DROP
-- 테이블 관련 : CREATE TABLE, ALTER TABLE, DROP TABLE
-- 뷰 관련 : CREATE VIEW, DROP VIEW 2가지밖에없음.
-- 시퀀스 관련 : CREATE SEQUENCE, ALTER SEQUENCE, DROP SEQUENCE

-- 테이블 수정 : ALTER TABLE 테이블명 수정할 내용처리;
-- 컬럼 추가, 컬럼 삭제, 제약조건 추가, 제약조건 삭제
-- 컬럼 자료형 변경
-- 테이블명, 컬럼명, 제약조건 이름 변경이 가능하다. (RENAME)

-- 컬럼 추가 : 테이블 생성시 컬럼 지정과 동일하게 하면 됨.
CREATE TABLE DCOPY
AS
SELECT * FROM DEPARTMENT;

SELECT * FROM DCOPY;

ALTER TABLE DCOPY
ADD (LANME VARCHAR2(40));  -- ADD 는 추가 하겠다 라는 의미
-- ADD [생성하겠다] (컬럼명 자료형(바이트));

-- 컬럼 추가시 DEFAULT 사용할 수 있다
ALTER TABLE DCOPY
ADD (CNAME VARCHAR2(30) DEFAULT('한국'));
-- ADD [생성하겠다] (컬럼명 자료형(바이트) DEFAULT [앞에 컬럼명] (내용)

-- 제약조건 추가
ALTER TABLE DCOPY
ADD PRIMARY KEY(DEPT)_ID);

ALTER TABLE DCOPY
ADD CONSTRAINT UN_DCOPY UNIQUE (DEPT_NAME);

-- 주의 : NOT NULL 제약조건은 ADD로 추가 못 함
-- MODIFY 사용함
ALTER TABLE DCOPY
MODIFY(CNAME NOT NULL);

-- 컬럼 자료형 바꾸기
DESC DCOPY;

ALTER TABLE DCOPY
MODIFY (DEPT_ID VARCHAR2(5), 
                LOC_ID VARCHAR2(10));

-- 컬럼 삭제
ALTER TABLE DCOPY
DROP COLUMN CNAME;

DESC DCOPY;

ALTER TABLE DCOPY
DROP (LOC_ID, LANME);

DESC DCOPY;

-- 제약조건이 설정된 컬럼은 삭제할 수 없다.
CREATE TABLE TB1 (
    PK NUMBER PRIMARY KEY,
    FK NUMBER REFERENCES TB1 (PK),
    COL1 NUMBER,
    CHECK (PK > 0 AND COL1 > 0)
);

-- 컬럼 삭제 확인 
ALTER TABLE TB1
DROP (PK); -- error

ALTER TABLE TB1
DROP (COL1); -- error

-- 설정된 제약조건도 함께 삭제하면 컬럼 삭제 가능함
ALTER TABLE TB1
DROP (COL1) CASCADE CONSTRAINTS;

DESC TB1;

-- 이름 바꾸기 : 컬럼명, 제약조건 이름, 테이블명
-- 컬럼명 바꾸기
ALTER TABLE TB1
RENAME COLUMN FK TO TBKF;

-- 제약조건 이름 바꾸기
-- 데이터딕셔너리에서 제약조건 이름 확인
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'TB1';

ALTER TABLE TB1
RENAME CONSTRAINTS SYS_C007350 TO PK_TB1;

-- 테이블명 바꾸기
ALTER TABLE TB1 RENAME TO DTEST_TABLE;
-- OR
RENAME TB1  TO TEST_TABLE;

-- DML ************************************
-- INSERT, UPDATE, DELETE
-- INSERT : 행 추가, 행 갯수 증가
-- UPDATE : 기록된 값 수정, 행 갯수 변화 없음
-- DELETE : 행 삭제, 행 갯수 감소
-- TRUNCATE : 테이블의 행 전체 삭제, ROLLBACK(복구) 안됨.

-- UPDATE 문
/*
UPDATE 테이블명
SET 컬럼명 = 바꿀값, 컬럼명 = 바꿀값 -- SET 절에서의 = 은 대입을 의미함
WHERE 컬럼명 비교연산자 비교값;
*/

DROP TABLE DCOPY CASCADE CONSTRAINTS;

CREATE TABLE DCOPY (DID, DNAME, LID)
AS
SELECT * FROM DEPARTMENT;

SELECT * FROM DCOPY;

-- 부서명 변경
UPDATE DCOPY
SET DNAME = '인사팀';
-- where 절을 사용하지 않으면 해당 컬럼값을 모두 변경함.

ROLLBACK;

UPDATE DCOPY
SET DNAME = '인사팀'
WHERE DID = '10';

SELECT * FROM DCOPY;

-- UPDATE 문에 서브쿼리 사용할 수 있음
-- SET절에 바꿀값, 조건절에 비교값 찾기 위해 사용할 수 있음
CREATE TABLE ECOPY AS SELECT * FROM EMPLOYEE;

SELECT * FROM ECOPY;

SELECT EMP_NAME, JOB_ID, SALARY
FROM ECOPY
WHERE  EMP_NAME IN ('심하균','성해교');

UPDATE ECOPY
SET JOB_ID = (SELECT JOB_ID FROM ECOPY
                        WHERE EMP_NAME = '성해교'),
        SALARY = (SELECT SALARY FROM ECOPY
                        WHERE EMP_NAME = '성해교')
WHERE EMP_NAME = '심하균';

ROLLBACK;
-- 또는
UPDATE ECOPY
SET (JOB_ID, SALARY) = (SELECT JOB_ID, SALARY
                                            FROM ECOPY
                                            WHERE EMP_NAME = '성해교') -- 다중열 서브쿼리
WHERE EMP_NAME = '심하균';

-- 해외영업2팀 직원들의 보너스포인트를 모두 0.3으로 변경
UPDATE ECOPY
SET BONUS_PCT = 0.3
WHERE DEPT_ID = (SELECT DEPT_ID
                                    FROM DEPARTMENT
                                    WHERE DEPT_NAME = '해외영업2팀');


-- DEFAULT 설정이 되어 있는 컬럼값 변경시에 DEFAULT 값으로 바꿀 경우
-- 변경값 자리에 DEFAULT 키워드 사용해도 됨

select emp_name, marriage
from employee
where emp_id = '210';

-- MARRIAGE 컬럼값을 'N'으로 바꿀 때
update employee
set marriage  = default--'N'
where emp_id = '210';














