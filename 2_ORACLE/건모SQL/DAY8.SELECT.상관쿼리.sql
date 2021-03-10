-- DAY8 수업내용 : 서브쿼리 중 상[호연]관[서브]쿼리, 무결성 제약조건
-- DDL  : CREATE, ALTER, DROP
-- DML : INSERT,  UPDATE, DELETE, TRUNCATE
--  : COMMINT, ROLLBACK, SAVEPINT

-- FROM 절에서도 서브쿼리 사용할 수 있음
 -- FROM  절에 사용된 서브쿼리의 검사뷰를 '인라인 뷰' 라고함
-- 인라인 뷰에는 별칭이 사용됨 => 테이블 명

-- 짜기 직급의 평균급여와 같은 급여를 받고 있는 직원 조회
-- 이름, 직급명, 급여
select emp_name ,job_title, salary
from (select job_id, trunc(avg(salary), -5) JABAVG
            from employee
            group by job_ID)  V
left join employee E ON (V.jabavg = E.salary and nvl(v.job_id, ' ') = nvl(E.job_id,' ' ))
left join  JOB J on (E.job_id = J.job_id)
order by 3,2;


-- 상호연관 서브쿼리
-- 일반적으로는 서브쿼리가 만들 결과값을 메인쿼리가 사용하는 구조임
-- 상관쿼리는 서브쿼리가 메인쿼리의 컬럼값을 이용함
-- 메인쿼리의 테이블 컬럼값이 변경되면, 서브쿼리의 결과가 달라짐

-- 자기 직급의 평균 급여와 같은 급여를 받는 직원 조회
-- 상관쿼리를 사용한 경우
select emp_name, job_title, salary
from employee E
left join job J on (E.job_id = J.job_id)
where salary =(select trunc(avg(salary),-5)
                                from employee
                                where NVL(JOB_ID, ' ') = nvl(E.job_id, ' '))
order by 3, 2;
                                
-- 다중행 다중열 서브쿼리
-- 서브쿼리가 SELECT 한 컬럼수가 여러 개이고, 결과행의 갯수도 여러 개일 때
-- 서브쿼리와 비교할 항목은 반드시 서브쿼리 SELECT 절의 항목 갯수와 같아야 함.
-- 비교할 항목은 반드시 ()로 묶어주어야 함

-- 자기 직급에 평균 급여를 받는 직원 조회
-- 다중열 다중행 서브쿼리 사용
select emp_name, job_title, salary
from employee
left join job using (job_id)
where (nvl(job_id,' '),salary) IN (select nvl(job_id,' '),trunc(avg(salary),-5)
                        from employee
                        group by nvl(job_id,' '))
order by 3,2;

-- EXISTS / NOT EXISTS 연산자
-- 서브쿼리가 만든 결과가 메인쿼리에 존재하는지 물어보는 연산자

-- 관리자인 직원 정보 조회
select emp_id, emp_name, '관리자' 구분
from employee E
where exists (select null
                            from employee
                            where E.emp_id = mgr_id);
-- 서브쿼리의 조건을 만족하는 행이 존재하면 골라냄

-- NOT EXISTS
select emp_id, emp_name, '직원' 구분
from employee E
where not exists (select null
                                    from employee
                                    where E.emp_id = mgr_id);
-- 서브쿼리의 조건절과 일치하지 않는 행을 골라냄

-- 스칼라 서브쿼리
-- 단일행 서브쿼리 + 상관쿼리

-- 사원명, 부서코드, 급여, 해당 직원이 소속된 부서의 급여평균 조회
-- select 절에서 서브쿼리 사용한 경우
select emp_name, dept_id, salary,
            (select trunc(avg(salary),-5)
                from Employee
                where dept_id = E.dept_id) AVGSAL
from employee E;

-- CASE 표현식에서 스칼라 서브쿼리 사용한 경우
-- 부서의 근무지역이 'OT' 이면 '지역팀', 아니면 '본사팀'
-- 직원의 근무지역에 대한 소속을 조회
select emp_id, emp_name, (
                case when dept_id = (select dept_id
                                                            from department
                                                            where loc_id = 'OT')
                          then '지역팀'
                          else '본사팀'
                          end ) 소속
from employee
order by 소속 desc;

-- ORDER BY 절에서 서브쿼리 사용 가능함
-- 단, 스칼라 서브쿼리만 사용할 수 있음

-- 직원이 소속된 부서의 부서명이 큰 값부터 정렬된 직원 정보 조회
select emp_id, emp_name, E.dept_id, hire_date, dept_name
from employee E
left join department D on (E.dept_id = D.dept_id)
order by (select dept_name
                    from department
                    where dept_id = E.dept_id) desc;
                    

-- TOP-N 분석 *****************************************************************
-- 상위 몇개, 하위 몇개를 조회할 때

-- 인라인 뷰와 RANK() 함수를 이용한 TOP-N 분석의 예
-- 직원 정보에서 급여를 많이 받는 직원 3명 조회
select *
from (select emp_name, salary, 
                        rank() over  (order by salary desc) 순위
            from employee)
where 순위 <= 3;

-- ROWNUM 을 이용한 TOP-N 분석
-- SELECT 한 결과행에 행번호(ROWNUM)가 부여됨

select ROWNUM, emp_name, salary
from (select emp_name, salary
            from employee
            where emp_name like '%성%');
            
-- 급여를 많이 받는 직원 3명 조회
select rownum, emp_name, salary
from (select emp_name, salary
                from employee
                order by salary desc)
where rownum <= 3;

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