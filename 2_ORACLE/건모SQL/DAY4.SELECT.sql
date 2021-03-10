-- DAY4 : SELECT 함수 2일차

-- 날짜 처리 함수 ******************************

-- SYSDATE 함수
-- 시스템으로부터 현재 날짜와 시간을 조회할 때 사용함
SELECT SYSDATE
FROM DUAL;

-- 오라클에서는 환경설정, 객체 권한 정보들을 자동 저장 관리되고 있음.
-- 데이터 딕셔너리(데이터 사전) 영역에서 테이블의 형태로 각각 저장되고 있음
-- 데이터 딕셔너리는 DB 시스템이 관리. 사용자(USER)는 손댈 수 없음
-- 데이터 사전 영역에 저장된 정보는 조회할 수는 있음

-- 단, 환경설정에 대한 부분은 셋팅정보를 변경할 수 있다.
SELECT * FROM SYS.NLS_SESSION_PARAMETERS;

-- 원하는 변수(PARAMETER)만 조회한다면
SELECT VALUE
FROM SYS.nls_session_parameters
WHERE PARAMETER = 'NLS_DATE_FORMAT';

-- 날짜 포맷 수정
ALTER SESSION
SET NLS_DATE_FORMAT = 'DD-MON-RR';

-- 확인
SELECT SYSDATE
FROM DUAL;

-- 날짜수정 2
ALTER SESSION
SET NLS_DATE_FORMAT = 'RRRR"년" MM"월" DD"일"';

-- 확인 2
SELECT SYSDATE
FROM DUAL; 

-- 원래 포맷으로 변경
ALTER SESSION
SET NLS_DATE_FORMAT = 'RR/MM/DD';

COMMIT; -- 저장 완료 처리

-- 확인 3
SELECT SYSDATE
FROM DUAL;

-- ADD_MONTHS(기준날짜, 더할 개월 수)
-- 더한 개월 수에 대한 날짜를 반환함.

-- 오늘 날짜에서 10년 뒤의 날짜는?
SELECT SYSDATE 오늘날짜, ADD_MONTHS(SYSDATE, 120)
FROM DUAL;

-- 직원정보에서 입사일이 20년되는 날짜 조회
SELECT EMP_NAME 사원명, ADD_MONTHS(HIRE_DATE,240) "20년 되는 날짜"
FROM EMPLOYEE;

-- 직원들 중 근무년수가 20년 이상인 직원 조회
-- 사번, 이름, 부서코드, 직급코드, 입사일
SELECT EMP_ID 사번, EMP_NAME 이름, DEPT_ID 부서코드, JOB_ID 직급코드, HIRE_DATE 입사일
FROM EMPLOYEE
WHERE ADD_MONTHS(HIRE_DATE,240) < SYSDATE
ORDER BY HIRE_DATE;

-- MONTHS_BETWEEN(날짜1, 날짜2)
-- 두 날짜의 차이난 개월수를 반환함

-- 직원정보에서 이름, 입사일, 현재까지의 근무일수, 근무개월수, 근무년수 조회
SELECT EMP_NAME 이름, HIRE_DATE 입사일,
        FLOOR(SYSDATE-HIRE_DATE) 근무일수,
        FLOOR(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)) 근무개월수,
        FLOOR(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)/12) 근무년수
FROM EMPLOYEE;

-- 2010년 1월 1일 기준으로 입사한지 10년이 넘은 직원들의 정보 조회
SELECT *
FROM EMPLOYEE
WHERE FLOOR(MONTHS_BETWEEN('10/01/01',HIRE_DATE)) > 120;

-- NEXT_DAY(날짜데이터|컬럼명, '요일이름')
-- 지정한 날짜 뒤쪽 날짜에서 가장 가까운 지정한 요일의 날짜가 반환됨
SELECT SYSDATE, NEXT_DAY(SYSDATE,'일요일')
FROM DUAL;

-- 데이터베이스의 사용 언어가 한국어로 지정이 되어 있기 때문에 
-- 요일이름은 한글 사용함.
SELECT SYSDATE, NEXT_DAY(SYSDATE,'SUNDAY') -- Error
FROM DUAL;

-- 요일이름을 영어로 사용을 원하면
-- 데이터베이스 사용 언어를 변경해야 함
ALTER SESSION
SET NLS_LANGUAGE = KOREAN;

-- 확인
SELECT SYSDATE, NEXT_DAY(SYSDATE,'일요일')
FROM DUAL;

-- LAST_DAY(날짜데이터|컬럼명)
-- 지정한 날짜의 월에 대한 마지막 날짜가 반환.
SELECT LAST_DAY(SYSDATE)
FROM DUAL;

-- 직원정보에서 이름, 입사일, 입사한 월의 마지막 날짜
SELECT EMP_NAME 이름, HIRE_DATE 입사일, LAST_DAY(HIRE_DATE) "입사월의 마지막 날짜", LAST_DAY(HIRE_DATE)-HIRE_DATE "입사월의 근무일수"
FROM EMPLOYEE;

-- EXTRACT(추출할 정보 FROM 날짜)
-- 날짜 데이터에서 원하는 정봔 추출할 때 사용함.

-- 오늘 날짜에서 년도, 월, 날짜를 각각만 추출하기를 원한다면
SELECT EXTRACT(YEAR FROM SYSDATE) 년도,
        EXTRACT(MONTH FROM SYSDATE) 월,
        EXTRACT(DAY FROM SYSDATE) 날짜
FROM DUAL;

-- 직원정보에서 이름, 주민번호, 나이, 입사일, 근무년수 조회
SELECT EMP_NAME 이름, EMP_NO 주민번호, ((EXTRACT(YEAR FROM SYSDATE)-1900) - SUBSTR(EMP_NO,1,2)) || '세' 나이,
        HIRE_DATE 입사일, (EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HIRE_DATE)) || '년' 근무년수
FROM EMPLOYEE;

-- *********************************************
-- (자료)형 변환함수
-- TO_CHAR : 숫자 | 날짜 => 문자 : 출력 포맷 적용 용도
-- TO_NUMBER : 문자 => 숫자 : 자바의 Parsing 개념
-- TO_DATE : 문자 => 날짜 : 자바의 Parsing 개념

-- 자동 형변환의 경우
SELECT 20 + '10'
FROM DUAL;

-- 형변환이 안 되는 경우
SELECT SYSDATE - '15/03/17' -- Error
FROM DUAL; 
-- 해결 : 형변환해야 함, 문자 => 날짜 로 변환
SELECT SYSDATE - TO_DATE('15/03/17', 'YY/MM/DD')
FROM DUAL;

-- TO_CHAR(숫자|날짜|컬럼명, '포맷문자열')
-- 숫자 또는 날짜를 문자로 변환
-- 숫자와 날짜에 포맷을 적용할 때 사용함

-- 직원정보에서 이름, 급여, 보너스포인트 조회
-- 급여는 '₩5,400,000' 형식으로 출력 처리함
-- 보너스 포인트는 소숫점 아래 둘째 자리까지 출력
SELECT EMP_NAME 이름, TO_CHAR(SALARY,'L999,999,999') 급여, TO_CHAR(NVL(BONUS_PCT,0),'90.00') 보너스포인트
FROM EMPLOYEE;

-- 년도에 대한 포맷문자 : R, Y, Year
SELECT sysdate,
        to_char(sysdate,'yyyy'), to_char(sysdate,'rrrr'),
        to_char(sysdate,'yy'), to_char(sysdate,'rr'),
        to_char(sysdate,'year')
from dual;

select hire_date,
        to_char(hire_date, 'yyyy "년"'), to_char(hire_date, 'rrrr "년"'),
        to_char(hire_date, 'yy'), to_char(hire_date,'rr'),
        to_char(hire_date,'year')
from employee;

-- 월에 대한 포맷문자 : MM, fmMM, MON, MONTH, RM
SELECT sysdate,
        to_char(sysdate, 'yyyy "년" mm "월"'),
        to_char(sysdate, 'mm'), to_char(sysdate,'month'),
        to_char(sysdate,'mon'),to_char(sysdate,'rm')
from dual;


-- 일에 대한 포맷문자 : DDD,DD,D
SELECT SYSDATE,
        TO_CHAR(SYSDATE,'"1년 기준" DDD "일쨰"'), TO_CHAR(SYSDATE,'"1달 기준" DD "일째"'),
        TO_CHAR(SYSDATE,'"1주 기준" D "일째"')
FROM DUAL;

-- 분기 : Q, 요일 : DAY, DY
SELECT TO_CHAR(SYSDATE,'Q "사분기"'),
        TO_CHAR(SYSDATE, 'DAY'),
        TO_CHAR(SYSDATE, 'DY')
FROM DUAL;

-- 직원정보에서 사번, 이름, 입사일 조회
-- 입사일은 '2016년 7월 15일 (목)' 형식으로 출력
SELECT EMP_NO 사번, EMP_NAME 이름, TO_CHAR(HIRE_DATE, 'yyyy"년" fmmm"월" dd"일 ("dy")"') 입사일
FROM EMPLOYEE;

-- 직원정보에서 이름, 입사일 조회
-- 입사일은 '2018년 06월 27일 오후 13:25:30' 형식으로 출력 처리
SELECT EMP_NAME 이름,
        TO_CHAR(HIRE_DATE, 'yyyy"년" mm"월" dd"일" am hh24:mi:ss') 입사일,
        to_char(hire_date, 'yyyy-mm-dd am hh:mi:ss') 입사일
from employee;

-- 날짜데이터 비교 연산시 시간을 가진 값에 대해서는 날짜만 비교 연산할 수 없음
select emp_name, hire_date
from employee
where hire_date = '90/04/01'; -- 시간도 기록되어 있음

-- 해결 
select emp_name, hire_date
from employee
where to_char(hire_date, 'yy/mm/dd') =  '90/04/01';
-- 또는
select emp_name, hire_date
from employee
where hire_date like '90/04/01';

-- 날짜만 기록되어 있으면, 날짜로 비교 연산할 수 있음
select emp_name, hire_date
from employee
where hire_Date = '04/04/30';

-- 년도 2자리를 4자리로 바꿀 경우, YYYY 와 RRRR 의 차이
-- 현재 년도(19년도, 50보다 작음)가 50미만일 때, 
-- 바꿀 년도가 50 미만일 때, 'YYYY' 적용시 2000년도가 적용됨
-- 바꿀 년도가 50 이상일 때, 'RRRR' 적용시 1900년도가 적용됨
select hire_date,
        to_char(hire_date,'rrrr'),
        to_char(hire_date, 'yyyy')
From employee;

-- 현재 년도와 바꿀 년도 둘 다 50 미만일 대는 Y, R 아무거나 사용가능
select to_char(to_date(hire_date),'yyyy-mm-dd')
from employee;

-- 현재 년도가 50미만, 바꿀 년도가 50이상일 때
-- TO_DATE() 로 문자를 년도로 바꿀 때 Y 사용시 현재 세기(2000년), 
-- TO_DATE() 로 문자를 년도로 바꿀 때 R 사용시 이전 세기(1999년)
select to_char(to_date('990101','yymmdd'), 'yyyy-mm-dd'),
    to_char(to_date('990101','rrmmdd'), 'rrrr-mm-dd'),
    to_char(to_date('990101','rrmmdd'), 'yyyy-mm-dd'),
    to_char(to_date('990101','yymmdd'), 'rrrr-mm-dd')
from dual;
-- 비꿀 년도가 50 이상일 때


--NVL(컬럼명, 컬럼값이 NULL일 때 바꿀 값)
select emp_name, bonus_pct, dept_id, job_id
from employee;

select emp_name, nvl(bonus_pct, 0.0),
        nvl(dept_id, '00'),
        nvl(job_id, 'J0')
from employee;

-- NVL2(컬럼명, 바꿀값1, 바꿀값2)
-- 해당 컬럼에 값이 있으면 바꿀값1로 바꾸고,
-- 컬럼값이 NULL 이면, 바꿀값2로 바꿈

-- 직원정보에서 보너스포인트가 0.2 미만이거나 NULL 인 직원들을 조회
-- 사번, 이름, 보너스포인트, 변경보너스포인트
-- 변경 보너스 포인트는 값이 있으면 0.15로 바꾸고, NULL 이면 0.05로 바꿈
select emp_id, emp_name, bonus_pct, NVL2(BONUS_pct,bonus_pct,0.05)
from employee
where bonus_pct > 0.2 or bonus_pct is null;

-- DECODE(함수식 | 컬럼명, 제시값1, 선택값1, 제시값2, 선택값2, 모든 제시값이 아닐 떼 선택할 값)
-- 프로그램의 SWITCH문의 형식을 갖는 함수임.
select emp_name,
        decode(substr(emp_no,8,1),'1','남','3','남','여') 성별
from employee
where dept_id = '50'
ORDER BY 성별;

-- CASE 표현식 : 다중 IF문의 형식을 갖는 구문임
-- 직급별 급여 인상분이 다를 때
select emp_id, emp_name, salary,
        case job_id
            when 'j7' then salary*1.1
            when 'j6' then salary*1.15
            when 'j5' then salary*1.2
            else salary*1.05
        end 구분
from employee
order by 구분 asc;

-- CASE 표현식은 WHEN 에 조건식 사용할 수도 있음
SELECT emp_id, emp_name, salary,
    case 
    when salary <= 3000000 then '초급'
    when salary <= 4000000 then '중급'
    else '고급'
    end 구분
FROM EMPLOYEE
ORDER BY 구분;