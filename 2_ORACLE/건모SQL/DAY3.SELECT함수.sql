-- DAY3 : SELECT SQL 함수

-- 함수(FUNCTION)
-- 단일행 함수 : 컬럼에 기록된 값 갯수만큼의 결과를 반환함
-- 그룹 함수 : 컬럼에 기록된 값들을 계산에 사용하고 결과는 1개를 반환함
-- SELECT 절에서는 단일행 함수와 그룹함수 함께 사용 못함 : 결과행의 갯수가 다름
-- 오라클은 관계형 데이터베이스임 : 조회결과(Result Set)가 2차원 테이블 구조여야 함.
-- 결과가 사각형 모양이어야 함


SELECT LENGTH(EMAIL), SUM(SALARY)
FROM EMPLOYEE; -- 불가능

-- 단일행은 컬럼에 기록된 N개의 값들을 하나씩 처리해서 N개의 결과를 만듦
-- 직원 테이블에서 이메일 컬럼에 기록된 각 이메일과 각 이메일의 글자 갯수 조회
SELECT EMAIL, LENGTH(EMAIL) -- 단일행함수
FROM EMPLOYEE;

-- 그룹함수는 컬럼에 기록된 N개의 값을 계산에 사용하고 결과는 1개를 반환함
-- 전체 직원들의 급여의 평균과 총 합계를 조회
-- ROUND = 정수로 바꾸기
SELECT ROUND(AVG(SALARY)) "급여 평균", SUM(SALARY) "급여 총합" -- 그룹함수
FROM EMPLOYEE;

-- WHERE 절에서는 단일행 함수만 비교값 위치에 사용할 수 있음
-- 그룹함수는 사용할 수 없음.

-- EX : 급여의 평균보다 급여를 많이 받는 직원 조회
SELECT EMP_ID, EMP_NAME, SALARY, DEPT_ID, JOB_ID
FROM EMPLOYEE
WHERE SALARY > AVG(SALARY); -- 불가능

-- *****************************************************************
-- 문자열 관련 함수

-- LENGTH('문자열값' | 문자열이 기록된 컬럼명) => 문자열의 글자갯수를 반환함
SELECT LENGTH('ORACLE')
FROM DUAL;

SELECT LENGTH(EMAIL)
FROM EMPLOYEE;

-- LENGTH() 함수를 이용해서, CHAR 자료형과 VARCHAR2 자료형의 차이 비교
SELECT LENGTH(CHARTYPE),LENGTH(VARCHARTYPE)
FROM COLUMN_LENGTH;

-- LENGTHB('문자열값' | 문자열이 기록된 컬렴명) => 기록된 문자열의 바이트수가 반환됨
SELECT LENGTH('ORACLE'), LENGTHB('ORACLE'), LENGTH('오라클'), LENGTHB('오라클')
FROM DUAL;

-- LENGTHB() 함수로 CHAR 자료형과 VARCHAR2 자료형 비교
SELECT LENGTHB(CHARTYPE), LENGTHB(VARCHARTYPE)
FROM COLUMN_LENGTH;

-- INSTR('문자열값' | 문자열이 기록된 컬럼명, '찾을 문자', 찾을 시작위치, 중복되는 문자 중 몇번째 위치) 
-- 문자의 위치가 반환됨
-- 데이터베이스에서는 시작값이 1부터임.

-- 이메일 값에서 '@'문자의 위치 조회
-- 이메일과 조회된 위치
SELECT EMAIL, INSTR(EMAIL,'@')
FROM EMPLOYEE;

-- 이메일 값에서 '@' 바로 뒤에 있는 'k' 문자의 위치를 조회
-- 단, 뒤에서부터 검색
SELECT EMAIL, INSTR(EMAIL,'k',-1,3)
FROM EMPLOYEE;

-- 이메일에서 '.' 바로 뒤 문자의 위치 조회
-- 단, '.' 문자 바로 앞 글자부터 검색을 시작하도록 처리함
SELECT EMAIL, INSTR(EMAIL,'c',INSTR(EMAIL, '.', -1))
FROM EMPLOYEE;

-- LPAD / RPAD ('문자열값' | 문자열이 기록된 컬럼명, 출려시킬 너비 바이트 수, '남는 공간에 채울 문자열')
-- 채울 문자의 기본값은 공백문자임
SELECT EMAIL 원본, LENGTHB(EMAIL) 원본길이, 
            LPAD(EMAIL, 20, '*') 채우기결과1,
            LENGTHB(LPAD(EMAIL, 20, '*')) 결과길이1,
            RPAD(EMAIL, 20, '*') 채우기결과2,
            LENGTHB(RPAD(EMAIL, 20, '*')) 결과길이2
FROM EMPLOYEE;

-- LTRIM / RRTRIM ('문자열값'|문자열이 기록된 컬럼명, '삭제할 문자들')\
SELECT '    001123XXXYYZZZZORACLEZZZXXXYYY1123322    ',
        LTRIM ('    001123XXXYYZZZZORACLEZZZXXXYYY1123322    '),
        LTRIM('    001123XXXYYZZZZORACLEZZZXXXYYY1123322    ',' '),
        LTRIM('    001123XXXYYZZZZORACLEZZZXXXYYY1123322    ', ' 0123'),
        LTRIM('    001123XXXYYZZZZORACLEZZZXXXYYY1123322    ', ' 0123XYZ'),
        RTRIM ('    001123XXXYYZZZZORACLEZZZXXXYYY1123322    '),
        RTRIM('    001123XXXYYZZZZORACLEZZZXXXYYY1123322    ',' '),
        RTRIM('    001123XXXYYZZZZORACLEZZZXXXYYY1123322    ', ' 0123'),
        RTRIM('    001123XXXYYZZZZORACLEZZZXXXYYY1123322    ', ' 0123XYZ')
        
FROM DUAL;

-- TRIM(LEADING | TRAILING | BOTH '제거할문자' FROM '문자열값' | 컬럼명

SELECT 'aaaORACLEaaa', TRIM('a' FROM 'aaaORACLEaaa'),
        TRIM(LEADING 'a' FROM 'aaaORACLEaaa'),
        TRIM(TRAILING 'a' FROM 'aaaORACLEaaa'),
        TRIM(BOTH 'a' FROM 'aaaORACLEaaa')
FROM DUAL;

-- SUBSTR('문자열값'|문자열이 기록된 컬럼명, 추출할 시작위치, 추출할 글자갯숱)
-- 추출할 시작위치 : 양수(앞에서부터의 위치), 음수(뒤에서부터의 위치)
SELECT 'ORACLE 11G', 
        SUBSTR('ORACLE 11G', 5),
        SUBSTR('ORACLE 11G', 8, 2),
        SUBSTR('ORACLE 11G', -7, 3)
FROM DUAL;

-- 직원들이 주민번호에서 생년, 생월, 생일, 성별을 분리 조회
SELECT EMP_NO 주민번호,
        SUBSTR(EMP_NO,1, 2) 생년,
        SUBSTR(EMP_NO,3, 2) 생월,
        SUBSTR(EMP_NO,5, 2) 생일,
        SUBSTR(EMP_NO,8, 1) 성별
FROM EMPLOYEE;

-- SUBSTR() 함수는 날짜데이터에도 사용할 수 있음
-- 직원들의 입사일에서 입사년도, 입사월, 입사일을 분리 조회
SELECT EMP_NAME 사원명,
        SUBSTR(HIRE_DATE,1,2) 입사년도,
        SUBSTR(HIRE_DATE,4,2) 입사월,
        SUBSTR(HIRE_DATE,7,2) 입사일
FROM EMPLOYEE;

-- SUBSTRB('문자열값'|컬럼명, 추출할 바이트 위치, 추출할 바이트크) 
SELECT SUBSTR('ORACLE',3,2), SUBSTRB('ORACLE',3,2),
        SUBSTR('오라클',2,2), SUBSTRB('오라클',4,6)
FROM DUAL;

--  UPPER('문자열값'|컬럼명) : 영문자일 때, 대문자로 바꾸는 함수
--  LOWER('문자열값'|컬럼명) : 영문자일 때, 소문자로 바꾸는 함수
-- INITCAP('문자열값'|컬럼명) : 영문자일 때, 첫 글자만 대문자로 바꿈
SELECT UPPER('ORACLE'), UPPER('oracle'),
        LOWER('ORACLE'), LOWER('oracle'),
        INITCAP('ORACLE'), INITCAP('oracle')
FROM DUAL;

-- 함수의 중첩 사용 : 함수 안에 값 사용 위치에 함수 사용함
-- 안쪽 함수가 반환한 값을 바깥 함수가 사용한다.

-- 직원 정보에서 이름, 아이디 조회
--ub(in str)
SELECT EMP_NAME 이름,
        SUBSTR(EMAIL,1,INSTR(EMAIL,'@')-1) 아이디
FROM EMPLOYEE;

-- 직원 정보에서 사원명과 주민번호 조회
-- 주민번호는 '81225-1******' 의 형식으로 출력되게 함
SELECT EMP_NAME 사원명,
        RPAD(SUBSTR(EMP_NO, 1, 8), 14, '*') 주민번호
FROM EMPLOYEE;

--************************************************
-- 숫자처리함수
-- ROUND, TRUNC, FLOOR, ABS, MOD

-- ROUND(숫자값|숫자가 기록된 컬럼명|계산식, 반올림할 자릿수)
-- 반올림할 자릿수가 생략되면, 기본값 0 적용됨. 정수로 바꾼다는 의미
-- 버려지는 값이 5 이상이면 자동 반올림 됨
-- 자릿수가 양수이면, 소숫점 아래 자리를 의미함. 표시할 자릿수임.
-- 반올림은 자릿수 +1 한 위치의 값에 따라 반올림/내림 처리됨
-- 자릿수가 음수이면, 정수부 자리를 의미함, 자릿수가 반올리할 자리를 의미함
-- 출력값은 자릿수 -1  한 위치까지 출력
SELECT 123.456,
        ROUND(123.456), ROUND(123.456, 0),
        ROUND(123.456, 1), ROUND(123.456, -1)
FROM DUAL;

-- 직원 정보에서 사번, 이름, 급여, 보너스포인트, 보너스포인트가 적용된 연봉 조회
-- 연봉은 별칭 사용 : 1년급여
-- 연봉은 천단위에서 반올림함.
SELECT EMP_ID 사번, EMP_NAME 이름, BONUS_PCT 보너스포인트, ROUND(((SALARY + (SALARY * NVL(BONUS_PCT,0)))*12),-4) "1년급여"
FROM EMPLOYEE;

-- TRUNC(숫자값|컬럼명|계산식, 자릿수)
-- 지정한 자리 이후 값을 버리는 함수 (반올림 없음)
SELECT 145.789,
        TRUNC(145.789), TRUNC(145.789, 0), -- 같음
        TRUNC(145.789, 1), TRUNC(145.789, -1)
FROM DUAL;

-- 직원 정보에서 급여의 평균을 구함
-- 10단위에서 절삭함
SELECT AVG(SALARY), TRUNC(AVG(SALARY),-2) "급여의 평균", FLOOR(AVG(SALARY))
FROM EMPLOYEE;

-- ABS(숫자|컬럼명|계산식) : 절대값 반환, 음수가 양수로 전환됨
SELECT ABS(123), ABS(-123)
FROM DUAL;

-- 직원 정보에서 입사일 - 오늘, 오늘 - 입사일
-- 별칭은 "총 근무 일수", 모두 양수로 처리
SELECT EMP_NAME 이름,
        ABS(FLOOR(HIRE_DATE - SYSDATE)) "총 근무 일수",
            SYSDATE - HIRE_DATE "총 근무 일수"
FROM EMPLOYEE;

-- FLOOR(숫자값|컬럼명|계산식)
-- 소숫점 아래값 버리는 함수, 정수 만드는 함수 (반올림 없음)













