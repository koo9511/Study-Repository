-- DAY7 : SET OPERATOR, SUBQUERY

-- 집합 연산자 (SET OPERATOR)
-- UNION, UNION ALL, INTERSECT, MINUS
-- UNION, UNION ALL, : 합집합 => 여러 SELECT 문의 결과를 하나로 합침
-- INTERSECT : 교집합
--          => 여러 SELECT 문의 결과 중 중복된 행만 선택함
-- MINUS : 차집합
--          => 첫 번째 SELECT 문의 결과에서 두 번째 SELECT 문의 결과와 중복되는 행을 제외함

-- UNION ALL
SELECT EMP_ID, ROLE_NAME
FROM EMPLOYEE_ROLE
UNION ALL
SELECT EMP_ID, ROLE_NAME
FROM ROLE_HISTORY;

-- UNION -- 합쳐서 조회
SELECT EMP_ID, ROLE_NAME
FROM EMPLOYEE_ROLE
UNION ALL
SELECT EMP_ID, ROLE_NAME
FROM ROLE_HISTORY;

-- INTERSECT -- 중복된 값만 조회
SELECT EMP_ID, ROLE_NAME
FROM EMPLOYEE_ROLE
INTERSECT
SELECT EMP_ID, ROLE_NAME
FROM ROLE_HISTORY;

-- MINUS -- 중복된 값 빼고
SELECT EMP_ID, ROLE_NAME
FROM EMPLOYEE_ROLE
MINUS
SELECT EMP_ID, ROLE_NAME
FROM ROLE_HISTORY;

-- SET 연산자 사용시 주의사항
-- 각 SELECT 절의 컬럼의 갯수가 같아야 함 : 더미(DUMMY) 컬럼 이용하여 맞출 수 있음 ( NULL)
-- 컬럼별 자료형이 같아야함

SELECT EMP_NAME, JOB_ID, HIRE_DATE
FROM EMPLOYEE
WHERE DEPT_ID = '20'
UNION
SELECT DEPT_NAME, DEPT_ID, NULL
FROM DEPARTMENT
WHERE DEPT_ID = '20';

-- 나열된 컬럼의 자료형이 다르면 아래와 같이 에러가 발
SELECT EMP_NAME, JOB_ID, HIRE_DATE
FROM EMPLOYEE
WHERE DEPT_ID = '20'
UNION
SELECT DEPT_NAME, NULL, DEPT_ID
FROM DEPARTMENT
WHERE DEPT_ID = '20';

-- 50번 부서에 소속된 직원에 대해 관리자와 직원을 따로 조회해서 하나로 합친다
SELECT *
FROM EMPLOYEE
WHERE DEPT_ID = '50';

SELECT EMP_ID, EMP_NAME, '관리자' 구분
FROM EMPLOYEE
WHERE DEPT_ID = '50' AND EMP_ID = '141'
UNION
SELECT EMP_ID, EMP_NAME, '직원' 구분
FROM EMPLOYEE
WHERE DEPT_ID = '50' AND EMP_ID <> '141'
ORDER BY 3,1; -- 컬럼 나열 순번만 사용할 수 있음 (만약 같은 컬럼명 또는 별칭을 갖고 있을 때에는 사용 가능)

-- 활용 예
SELECT 'SQL을 공부하고 있습니다.' 문장, 3 순서 FROM DUAL
UNION
SELECT '우리는 지금 ', 1 FROM DUAL
UNION
SELECT '아주 재미있게 ', 2 FROM DUAL
ORDER BY 2;

-- 집합연산자와 JOIN의 관계
-- INTERSECT
SELECT EMP_ID, ROLE_NAME
FROM EMPLOYEE_ROLE
INTERSECT
SELECT EMP_ID, ROLE_NAME
FROM ROLE_HISTORY;

-- JOIN
SELECT EMP_ID, ROLE_NAME
FROM EMPLOYEE_ROLE
JOIN ROLE_HISTORY USING (EMP_ID, ROLE_NAME);

-- USING (EMP_ID, ROLE_NAME)
-- 두 컬럼의 값을 하나의 값으로 생각하고 일치하는 행을 찾음
-- (104 SE) = (104 SE) : 같은 값
-- (104 SE) != (104 SE-ANLY)  : 다른 값

-- 집합연산자와 IN 연산자의 관계
-- UNION 이 IN 과 동일한 결과를 만들 수 있음

-- 직급이 대리 또는 사원인 직원의 이름과 직급명 조회
-- 직급 오름차순 정렬, 직급이 같으면 이름 오름차순 정렬

-- UNION 사용
SELECT EMP_NAME, JOB_TITLE
FROM EMPLOYEE
JOIN JOB USING (JOB_ID)
WHERE JOB_TITLE = '대리'
UNION
SELECT EMP_NAME, JOB_TITLE
FROM EMPLOYEE
JOIN JOB USING (JOB_ID)
WHERE JOB_TITLE = '사원'
ORDER BY  2, 1;  

-- 서브쿼리 **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** 
/*
    메소드(리턴값이 있는 메소드) 와 같은 개념
    컬럼명 연산자 비교값 <= 비교값을 알아내기 위한 SELECT 문을 값 위치에 바로 사용할 수 있음
    컬럼명 연산자 (SELECT .....)
*/
-- 쿼리문 안에 사용된 쿼리문 : 서브쿼리

-- 나승원과 같은 부서에 근무하는 직원 정보 조회
SELECT DEPT_ID
FROM EMPLOYEE
WHERE EMP_NAME= '나승원';

SELECT EMP_NAME
FROM EMPLOYEE
WHERE DEPT_ID = '50';

-- 서브쿼리를 사용하면
SELECT EMP_NAME
FROM EMPLOYEE
WHERE DEPT_ID = (SELECT DEPT_ID 
                                    FROM EMPLOYEE
                                    WHERE EMP_NAME = '나승원');
                                    
-- 서브쿼리의 유형은 (단일행, 다중행, 다중열 )
-- 다중행 다중열 서브퀄, 스칼라 서브쿼리 등으로 구분됨
-- 서브쿼리가 만드는 결과값의 갯수에 따라 구분됨
-- 서브쿼리 유형에 따라 서브퀄 ㅣ앞에 사용할 수 있는 연산자가 달라짐

-- 단일행 서브쿼리(SINGLE ROW SUBQUERY)
-- 서브쿼리가 선택한 결과값이 한 개인 경우
-- 일반비교연산자 사용 가능
-- = , != | <> | ^= , > , < , >= , <=

-- 나승원과 직급이 같으면서, 나승원 보다 급여를 많이 받는 직원 조회
SELECT EMP_NAME, JOB_ID, SALARY
FROM EMPLOYEE
WHERE JOB_ID = (SELECT JOB_ID
                                FROM EMPLOYEE
                                WHERE EMP_NAME = '나승원')
AND SALARY > (SELECT SALARY
                            FROM EMPLOYEE
                            WHERE EMP_NAME = '나승원');

-- 부서별 급여의 합계 중 가장 큰 값 조회
SELECT DEPT_NAME 부서명, SUM(SALARY) 급여합계
FROM EMPLOYEE
LEFT OUTER JOIN DEPARTMENT USING (DEPT_ID)
GROUP BY  DEPT_NAME
HAVING SUM(SALARY)  = (SELECT MAX(SUM(SALARY))
                                                        FROM EMPLOYEE
                                                        GROUP BY DEPT_ID); -- 단일행 서브쿼리
                                                        
-- 서브쿼리는 SELECT, FROM, WHERE, HAVING 에서 사용할 수 있음.

--- 직원 중 가장 작은 급여를 받는 직원 조회
SELECT  EMP_ID, EMP_NAME, JOB_TITLE, DEPT_NAME, SALARY
FROM EMPLOYEE
LEFT JOIN JOB USING (JOB_ID)
LEFT JOIN DEPARTMENT USING (DEPT_ID)
WHERE SALARY  = (SELECT MIN(SALARY)
                                    FROM EMPLOYEE);

-- 다중행 서브쿼리 ( MULPLE ROW SUBQUERY) 
-- 서브쿼리가 선택한 값의 갯수가 여러 개인 경우

-- 부서별 최저 급여 조회
SELECT MIN(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_ID;

-- 부서별 최저 급여를 받고 있는 직원 조회
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY = (SELECT MIN(SALARY)
                                FROM EMPLOYEE
                                GROUP BY DEPT_ID);
                                
                                -- 에러 : 컬럼값을 일반 비교 연산자로 여러 값과 비교할수 없음
-- 다중행 서브쿼리 앞에는 일반 비교 연산자 사용 불가
-- 사용 가능한 연산자 : IN, NOT IN,  > ANY,  < ANY, > ALL, < ALL
-- 컬럼명 IN (다중행 서브쿼리)
-- 여러 개의 값들 중 한개라도 같은 값이 있는지
-- 컬럼명 NOT IN (다중행 서브쿼리)
--              : 여러 개의 값들 중 일치하는 값이 없는지 
-- 컬럼명 > ANY (다중행 서브쿼리)
--              : 여러 개의 값들 중 한개라도 큰 값이 있는지 ( 서브쿼리의 가장 작은 값보다 크냐)
-- 컬럼명 < ANY(다중행 서브쿼리)
--              : 여러 개의 값들 중 한개라도 작은 값이 있는지 ( 서브쿼리의 가작 큰 값보다 작으냐)
-- 컬렴명 > ALL (다중행 서브쿼리)
--              : 컬럼값이 모두와 비교해서 큰지 ( 서브쿼리의 최대값보다 크냐)
-- 컬럼명 < ALL (다중행 서브쿼리)
--              : 컬럾값이 모두와 비교해서 작은지 (서브쿼리의 최소값보다 작으냐)

SELECT EMP_ID, DEPT_ID, SALARY
FROM EMPLOYEE
WHERE SALARY IN (SELECT MIN(SALARY)
                                FROM EMPLOYEE
                                GROUP BY DEPT_ID);
                                
-- IN / NOT IN
-- 컬럼값을 서브쿼리의 여러 개의 값들과 하나씩 비교해서 같은 값인지 아닌지 확인하고 선택함

-- 다중행인지 확인
SELECT MGR_ID
FROM EMPLOYEE
WHERE MGR_ID IS NOT NULL ;

-- 직원 정보에서 관리자만 추출 조회
SELECT EMP_ID, EMP_NAME, '관리자' 구분
FROM EMPLOYEE
WHERE EMP_ID IN (SELECT MGR_ID 
                                    FROM EMPLOYEE)
UNION        
-- 관리자가 아닌 직원 추출
SELECT EMP_ID, EMP_NAME, '직원' 구분
FROM EMPLOYEE
WHERE EMP_ID NOT IN (SELECT MGR_ID 
                                            FROM EMPLOYEE
                                            WHERE MGR_ID IS NOT NULL)
ORDER BY 3, 1;

-- SELECT 절에서도 서브쿼리 사용할 수 있음
SELECT emp_id, emp_name,
                case
                when emp_id in (select mgr_id from employee) then '관리자'
                else '직원'
                end AS  구분
from employee
order by 3, 1;

-- > ANY (값들) : 가장 작은 값보다 큰
-- < ANY (값들) : 가장 큰 값보다 작은

-- 대리 직급의 직원 중에서 과장 직급의 급여 최소값보다 많이 받는 직원 조회
-- 사번, 이름, 직급명, 급여
select emp_id, emp_name, job_title, salary
from employee
left outer join job using (job_id)
where  job_title = '대리' and salary > any (select salary
                                                                                    from employee
                                                                                    join job using (job_id  )
                                                                                    where job_title = '과장');

-- 서브쿼리의 사용위치는 SELECT 절 , FROM 절, WHERE 절, GROUP BY 절,
-- HAVING 절, ORDER BY 절 모두 사용 가능
-- INSERT 문, UPDATE 문, CREATE TABLE 문, CREATE VIEW 문

-- 자기 직급의 평균 급여를 받는 직원 조회
select job_id, trunc(avg(salary), -4)
from employee
group by job_id;

select emp_id, emp_name, job_title, salary
from employee
left outer join job using(job_id)
where salary in (select trunc(avg(salary) , -4)
                                from employee
                                group by job_id);



