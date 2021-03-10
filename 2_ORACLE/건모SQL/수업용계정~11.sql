-- 1. 2020년 12월 25일이 무슨 요일인지 조회하시오.
SELECT TO_CHAR ( TO_DATE ('2020/12/25'), 'YYYYMMDD DAY')
FROM DUAL;

-- 2. 주민번호가 60년대 생이면서 성별이 여자이고, 성이 김씨인 직원들의 
-- 사원명, 주민번호, 부서명, 직급명을 조회하시오.
SELECT EMP_NAME, EMP_NO,JOB_TITLE, DEPT_NAME
FROM EMPLOYEE 
JOIN JOB USING (JOB_ID)
JOIN DEPARTMENT USING (DEPT_ID)
WHERE SUBSTR(EMP_NO, 1, 1) = '6' AND SUBSTR(EMP_NO, 8, 1) = '2'  AND EMP_NAME LIKE '김%';

select emp_name 사원명, emp_no 주민번호, dept_name 부서명, job_title 직급명
from employee a, department b, job c
where a.dept_id = b.dept_id
and a.job_id = c.job_id
and substr(emp_no,1,1) = '6' and substr(emp_no,8,1) = '2' and emp_name like '김%';


-- 3. 가장 나이가 적은 직원의 사번, 사원명, 나이, 부서명, 직급명을 조회하시오.
-- 나이의 최소값 조회
SELECT EMP_ID, EMP_NAME, MIN(TRUNC(MONTHS_BETWEEN(TO_DATE(SUBSTR(EMP_NO, 1, 2), 'yy'),SYSDATE)/12)) AS 나이,
       DEPT_NAME, JOB_TITLE
FROM EMPLOYEE
LEFT JOIN DEPARTMENT USING (DEPT_ID) -- inner join 하면서 null은 제외함 --> outer join을 해줘야 함
LEFT JOIN JOB USING (JOB_ID)
GROUP BY EMP_ID, EMP_NAME, DEPT_NAME, JOB_TITLE
HAVING MIN(TRUNC(MONTHS_BETWEEN(TO_DATE(SUBSTR(EMP_NO, 1, 2), 'yy'),SYSDATE)/12)) =
       (SELECT MIN(TRUNC(MONTHS_BETWEEN(TO_DATE(SUBSTR(EMP_NO, 1, 2), 'yy'),SYSDATE)/12)) 나이 FROM EMPLOYEE);
       
select a.emp_id 사번, a.emp_name 사원명, to_date(substr(a.emp_no,1,2),'yy')-substr(sysdate,1,2) 나이, b.dept_name 부서명, c.job_title 직급명
from employee a, department b, job c
where a.dept_id = b.dept_id 
and a.job_id = c.job_id
order by 나이 desc;

-- 4. 이름에 '성'자가 들어가는 직원들의 사번, 사원명, 부서명을 조회하시오.

SELECT EMP_ID, EMP_NAME, DEPT_NAME
FROM EMPLOYEE, DEPARTMENT
WHERE EMP_NAME LIKE '%성%' AND EMPLOYEE.DEPT_ID = DEPARTMENT.DEPT_ID;

-- 5. 해외영업팀에 근무하는 사원명, 직급명, 부서코드, 부서명을 조회하시오.

SELECT EMP_NAME, JOB_TITLE, DEPT_ID, DEPT_NAME
FROM EMPLOYEE
JOIN JOB USING (JOB_ID)
JOIN DEPARTMENT USING (DEPT_ID)
WHERE DEPT_NAME LIKE '해외영업%'
ORDER BY DEPT_NAME;


-- 6. 보너스포인트를 받는 직원들의 사원명, 보너스포인트, 부서명, 근무지역명을 조회하시오.
SELECT EMP_NAME, 
       BONUS_PCT, 
       DEPT_NAME, 
       LOC_DESCRIBE
FROM EMPLOYEE
JOIN DEPARTMENT USING (DEPT_ID)
JOIN LOCATION ON (LOCATION_ID = LOC_ID)
WHERE BONUS_PCT IS NOT NULL AND BONUS_PCT <> 0.0;


-- 7. 부서코드가 20인 직원들의 사원명, 직급명, 부서명, 근무지역명을 조회하시오.
SELECT EMP_NAME, JOB_TITLE, DEPT_NAME, LOC_DESCRIBE
FROM EMPLOYEE
JOIN JOB USING (JOB_ID)
JOIN DEPARTMENT USING (DEPT_ID)
JOIN LOCATION ON (LOCATION_ID = LOC_ID)
WHERE DEPT_ID = '20';

-- 8. 직급별 연봉의 최소급여(MIN_SAL)보다 많이 받는 직원들의
-- 사원명, 직급명, 급여, 연봉을 조회하시오.
-- 연봉은 보너스포인트를 적용하시오.

SELECT EMP_NAME, 
       JOB_TITLE, 
       SALARY, 
       (SALARY + SALARY * NVL(BONUS_PCT, 0)) * 12 "연봉(원)"
FROM EMPLOYEE
JOIN JOB USING (JOB_ID)
WHERE (SALARY + NVL(BONUS_PCT, 0)*SALARY ) * 12 > MIN_SAL;

-- 9. 한국(KO)과 일본(JP)에 근무하는 직원들의 
-- 사원명(emp_name), 부서명(dept_name), 지역명(loc_describe), 국가명(country_name)을 조회하시오.
SELECT EMP_NAME, DEPT_NAME, LOC_DESCRIBE, COUNTRY_NAME
FROM EMPLOYEE
JOIN DEPARTMENT USING (DEPT_ID)
JOIN LOCATION ON (LOCATION_ID = LOC_ID)
JOIN COUNTRY USING (COUNTRY_ID)
WHERE COUNTRY_ID IN ( 'KO', 'JP')
ORDER BY 4;

-- 10. 같은 부서에 근무하는 직원들의 사원명, 부서코드, 동료이름을 조회하시오.
-- self join 사용
SELECT E.EMP_NAME, E.DEPT_ID 부서코드, C.EMP_NAME 동료이름, C.DEPT_ID 부서코드
FROM EMPLOYEE E, EMPLOYEE C
WHERE E.EMP_NAME <> C. EMP_NAME -- 같은인물 제외
      AND E.DEPT_ID = C.DEPT_ID -- 부서가 같은 사람끼리 
ORDER BY E.EMP_NAME;

-- 11. 보너스포인트가 없는 직원들 중에서 직급코드가 J4와 J7인 직원들의 사원명, 직급명, 급여를 조회하시오.
-- 단, join과 set operator 사용할 것
SELECT EMP_NAME, JOB_TITLE, SALARY
FROM EMPLOYEE
JOIN JOB  USING (JOB_ID)
WHERE JOB_ID = 'J4' AND BONUS_PCT IS NULL
UNION 
SELECT EMP_NAME, JOB_TITLE, SALARY
FROM EMPLOYEE
JOIN JOB USING (JOB_ID)
WHERE JOB_ID = 'J7' AND BONUS_PCT IS NULL;

-- 12. 기혼인 직원과 미혼인 직원의 수를 조회하시오.
SELECT DECODE(MARRIAGE, 'Y', '기혼', 'N', '미혼') 결혼유무,
       COUNT(*) 직원수
FROM EMPLOYEE
WHERE DEPT_ID IN ('50', '90')
GROUP BY DECODE(MARRIAGE, 'Y', '기혼', 'N', '미혼')
ORDER BY 1;

