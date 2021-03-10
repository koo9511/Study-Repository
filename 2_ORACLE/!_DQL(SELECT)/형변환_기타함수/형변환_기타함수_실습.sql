-- 형변환, 기타함수 실습
       
-- 실습 : 사원병, 급여 조회함. 급여에 출력서식 적용 : to_char
-- 앞에 통화단위 표시하고, 천단위 구분기호 사용
SELECT EMP_NAME 사원명, TO_CHAR(SALARY, 'L999,999,999') 급여
FROM EMPLOYEE;


-- 직급이 'J7'인 직원들의 사원명, 입사일 조회
-- 입사일은 '2014년 8월 22일'의 형태로 출력 처리함.
SELECT EMP_NAME 사원명, TO_CHAR(HIRE_DATE,'YYYY"년" FMMM"월" DD"일"') 입사일
FROM EMPLOYEE
WHERE JOB_ID = 'J7';

-- 직급이 'J7'인 직원들의 생년월일, 나이 조회
SELECT EMP_NAME 사원명, SUBSTR(EMP_NO,1,6) 생년월일, 
        EXTRACT(YEAR FROM SYSDATE)-EXTRACT(YEAR FROM TO_DATE(SUBSTR(EMP_NO,1,2),'RR'))||'세' 나이
FROM EMPLOYEE
WHERE JOB_ID = 'J7';

-- 주민번호 앞 6자리 값과 뒤 7자리값을 더한 결과 조회
SELECT EMP_NAME 사원명, EMP_NO 주민번호, (TO_NUMBER(SUBSTR(EMP_NO,1,6))+TO_NUMBER(SUBSTR(EMP_NO,8,7))) 더한값
FROM EMPLOYEE;

-- 보너스 포인트, 보너스 포인트가 널이면 0으로 바꾼 결과, 
-- 보너스 포인트가 널이면 1로 널이 아니면 0.5로 바꾼 결과 조회
SELECT BONUS_PCT 보너스포인트, NVL2(BONUS_PCT,0.5,1) 보너스포인트가NULL
FROM EMPLOYEE;

-- 사원명, 성별 조회
-- 주민번호 - 다음인 8번째 값이 1, 3 이면 '남', 아니면 '여' 로 출력 처리
SELECT EMP_NAME 사원명, 
case SUBSTR(EMP_NO,8,1)
    WHEN '1' THEN '남'
    WHEN '3' THEN '남'
    ELSE '여'
    END
FROM EMPLOYEE;

-- 직원의 관리자사번(MGR_ID)이 널이면 '관리자없음'을 선택하고,
--  널이 아니면 기록된값을 그대로 사용함.
SELECT case
    WHEN MGR_ID IS NULL THEN '관리자없음'
    ELSE MGR_ID
    END 관리자사번
FROM EMPLOYEE;


-- 직급별 급여 인상분이 다를 때 
-- 사번, 직급코드, 급여, 급여 인상분이 적용된 급여 조회
-- 별칭은 인상급여
-- 직급코드가 'J7'이면 급여의 1.2, 'J6'이면 1.15, 'J5'이면 1.1,
-- 나머지는 1.05 적용
-- CASE 표현식 사용
SELECT EMP_NAME 사원명, JOB_ID 직급코드, SALARY 급여, 
CASE
    WHEN JOB_ID = 'J7' THEN SALARY*1.2
    WHEN JOB_ID = 'J6' THEN SALARY*1.15
    WHEN JOB_ID = 'J5' THEN SALARY*1.1
    ELSE SALARY*1.05
    END 인상급여
FROM EMPLOYEE;


-- 또는


-- 실습 : 사번, 급여, 급여가 500만원 이상이면 '고급', 
-- 300~500 이면 '중급',
-- 그 이하는 '초급' 으로 출력 처리 : 별칭 '구분'
SELECT EMP_ID 사번, SALARY 급여, 
CASE
    WHEN SALARY >= 5000000 THEN '고급'
    WHEN SALARY >= 3000000 THEN '중급'
    ELSE '초급'
    END 구분
FROM EMPLOYEE;


