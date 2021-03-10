-- 1일차
/*
데이터베이스에서 사용하는 데이터 조회용 구문 작성방법
: SELECT문 사용
DQL(Data Query Language) : 데이터 조회용 언어라고도
*/

-- 오라클 EXPRESS EFITION 에서의 한글의 크기는 한 글자가 3바이트
SELECT LENGTH('김치'), LENGTHB('김치') FROM DUAL;

-- 날짜데이터도 컴퓨터 내부에서는 숫자로 처리되므로, 계산할 수 있음
SELECT SYSDATE, SYSDATE + 100, SYSDATE - 225, SYSDATE + 48/24
FROM DUAL;

-- 3장. 3페이지의 데이터 조회결과 예
-- 첫 번째 예 :
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE;
-- 두 번째 예 :
SELECT *
FROM EMPLOYEE
WHERE DEPT_ID = '90';
-- 세 번째 예
SELECT EMP_ID, EMP_NAME, JOB_ID, HIRE_DATE
FROM EMPLOYEE
WHERE DEPT_ID = '50';
-- 네 번째 예
SELECT EMP_ID, EMP_NAME, DEPT_ID, DEPT_NAME
FROM EMPLOYEE
JOIN DEPARTMENT USING(DEPT_ID)
ORDER BY DEPT_NAME ASC; -- 결과집합(RESULT SET)은 정렬할 수 있다.


-- SELECT 구문 작성 형식
/*
5. SELECT *(컬럼 모두 다) | 컬럼명, 컬럼명, 계산식, 함수
1. FROM 테이블명
2. WHERE 컬럼명 비교연산자 비교값 -- 조건절                           -|  선택사항
3. GROUP BY 컬럼명 | 계산식                                      -|
4. HAVING 그룹함수 비교연산자 비교값 -- GROUP BY 에 대한 조건절         -|
6. ORDER BY 컬럼명 정렬방식(ASC,DESC);                            -|
*/

-- 직원 테이블에서 직원의 사번, 이름 조회
SELECT EMP_ID, EMP_NAME
FROM EMPLOYEE;

-- 전체 직원정보 조회
SELECT *
FROM EMPLOYEE;
-- OR
SELECT EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, HIRE_DATE, JOB_ID,
       SALARY, BONUS_PCT, MARRIAGE, MGR_ID, DEPT_ID
FROM EMPLOYEE;

-- 직원 테이블에서 사번, 이름, 급여, 연봉, 보너스가 적용된 연봉 조회
SELECT EMP_ID, EMP_NAME, SALARY, SALARY*12, 
        (SALARY + (SALARY * NVL(BONUS_PCT,0)))*12
FROM EMPLOYEE;
-- 계산갑세 NULL이 있으면, 결과는 무조건 NULL이 됨
-- 해결방법 : NULL인 항목은 0으로 바꿔서 계산에 사용
--          함술ㄹ 사용해야 함 = JVP(켤렴ㅁ8ㅇ)ㅔ
SELECT EMP_ID AS 사번, EMP_NAME 이름, SALARY 급여,
        SALARY * 12 "연봉",
        (SALARY + (SALARY * NVL(BONUS_PCT,0)))*12 "보너스가 적용된 연봉"
FROM EMPLOYEE;

-- SELECT 절에 임의의 문자열 값(LITERAL) 을 사용할 수 있음
SELECT EMP_ID 사번, EMP_NAME 이름, '재직중' 근무여부
FROM EMPLOYEE;

-- DISTINCT : SELECT 절에 딱 한 번 사용할 수 있음
-- 컬럼명 앞에 사용함 : 컬럼된 사용된 값 한 개씩만 선택하라는 의미임
-- 현재 직원 테이블에 사용된 직급코드 현황은?
SELECT DISTINCT JOB_ID
FROM EMPLOYEE
ORDER BY JOB_ID;

-- 현재 직원 테이블에 사용된 부서코드 현황은?
SELECT DISTINCT DEPT_ID
FROM EMPLOYEE
ORDER BY DEPT_ID DESC; -- ASC는 생략 가능

-- 2개의 컬럼에 DISTINCT 가 적용된 경우
-- 'J1 90' 두 컬럼값을 연결해서 한 개의 값으로 보고 중복을 판단함
-- 'J1 90' 과 'J2 90' 은 서로 다른 값이 됨
SELECT DISTINCT JOB_ID, DEPT_ID
FROM EMPLOYEE
ORDER BY JOB_ID;

-- WHERE 절 : 조건절이라고 함
-- 실행순서는 첫 번째 FROM 절 다음 두 번째로 실행
-- 조건을 만족하는 값이 기록된 행들을 골라내는 기능
-- WHERE 컬럼명 비교연산자 비교값 << 작성법

-- 90번 부서에 소속된 직원정보 조회
SELECT *
FROM EMPLOYEE
WHERE DEPT_ID = '90' -- 해당 값이 기록된 행 전체가 추출
ORDER BY DEPT_ID;
-- 원하는 컬럼 추출
select EMP_NAME, PHONE, JOB_ID, SALARY -- 3. 골라낸 행에서 컬럼 선택
from EMPLOYEE   -- 1. 테이블 확인
where DEPT_ID = '90'; -- 2. 테이블에서 행 골라내기

