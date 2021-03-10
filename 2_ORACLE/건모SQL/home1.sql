-- 1. 2001 년에 입학 핚 사학과 학생이 몇 명인지 학생수를 조회하시오. 사학과 코드는 TB_DEPARTMENT 에서 검색핚다. (Join 을 사용하지 않는다.)
SELECT COUNT(*) 학생수
FROM TB_DEPARTMENT
JOIN TB_STUDENT USING (DEPARTMENT_NO)
WHERE DEPARTMENT_NO = (SELECT DEPARTMENT_NO 
                                                    FROM TB_DEPARTMENT
                                                    WHERE DEPARTMENT_NAME = '사학과')
AND SUBSTR(ENTRANCE_DATE,1,2) = '01';

-- 2. 계열이 ‘공학’인 학과 중 입학정원이 20 명 이상, 30 명 이하인 학과의 계열, 학과이름, 정원을 조회하시오. 단 학과이름을 기준으로 오름차순 정렬하시오.”
SELECT CATEGORY 계열, DEPARTMENT_NAME 학과이름, CAPACITY 정원
FROM TB_DEPARTMENT
WHERE CATEGORY = '공학' AND CAPACITY BETWEEN 20 AND 30
ORDER BY 2;

-- 3. ‘학’자가 들어간 계열의 소속 학과가 몇 개 있는지 계열, 학과수를 출력하시오. 단 학과수가 많은 순으로 정렬하시오.
SELECT CATEGORY 계열,  COUNT(*) 학과수
FROM TB_DEPARTMENT
WHERE DEPARTMENT_NAME LIKE '%학%' 
GROUP BY CATEGORY
ORDER BY 2 DESC;

-- 4. ‘영어영문학과’ 교수이름, 출생년도, 주소를 조회하고 나이가 많은 순으로 정렬하시오. 영어영문학과 코드는 TB_DEPARTMENT 에서 검색핚다. (Join 을 사용하지 않는다.)
SELECT PROFESSOR_NAME 교수이름, SUBSTR(PROFESSOR_SSN,1,2) 출생년도, PROFESSOR_ADDRESS 교수주소
FROM TB_PROFESSOR
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
WHERE DEPARTMENT_NO = (SELECT DEPARTMENT_NO
                                                    FROM TB_DEPARTMENT
                                                    WHERE DEPARTMENT_NAME = '영어영문학과');
                                                    
-- 5. 국어국문학과 학생 중 서울에 거주하는 학생의 학과번호, 학생이름, 휴학여부를 조회하고 학생이름으로 오름차순 정렬하시오. 
-- 단 휴학여부는 값이 ‘Y’이면 ‘휴학’으로 ‘N’이면 ‘정상’으로 출력핚다. 
-- 국어국문학과 코드는 TB_DEPARTMENT 에서 찾는다. (Join 을 사용하지 않는다)
SELECT DEPARTMENT_NO 학과번호, STUDENT_NAME 학생이름, DECODE(ABSENCE_YN,'Y','휴학','N','정상') 휴학여부
FROM TB_STUDENT
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
WHERE DEPARTMENT_NAME = '국어국문학과' AND STUDENT_ADDRESS LIKE '%서울%';

--6. 80 년생인 여학생 중 성이 ‘김’씨인 학생의 주민번호, 학생이름을 조회하시오. 단 학생이름으로 오름차순 정렬하시오.

SELECT STUDENT_SSN 주민번호, STUDENT_NAME 학생이름
FROM TB_STUDENT
WHERE SUBSTR(STUDENT_SSN,1,2) = '80' AND STUDENT_NAME LIKE '김%'
ORDER BY 2;

--7. 계열이 ‘예체능’인 학과의 정원을 기준으로 40 명 이상이면 ‘대강의실’, 30 명 이상이면 ‘중강의실’, 30 명 미만이면 ‘소강의실’로 출력핚다. 단, 정원이 많은 순으로 정렬 핚다.
SELECT DEPARTMENT_NAME 학과이름, CAPACITY 정원, 
CASE
WHEN CAPACITY >= 40 THEN '대강의실'
WHEN CAPACITY >= 30 THEN '중강의실'
ELSE '소강의실'
END 강의실크기
FROM TB_DEPARTMENT;

-- 8.주소지가 ‘경기’ 또는 ‘인천’인 학생 중 1900년대에 입학 핚 학생들을 조회 하고자 핚다. 
-- 오늘날짜를 기준 으로 입학 후 기간을 계산하여 입학 후 기간이 오래된 순으로 정렬 핚다.
-- (단 입학 후 기간의 단위는 년(年)으 로 하고, 소수점 이하 자리는 버린다. 또핚 입학 후 기간이 같을 경우 이름으로 오름차순 정렬핚다.)
SELECT STUDENT_NAME 학과이름, TO_CHAR(ENTRANCE_DATE,'YY"년" MM"월" DD"일"') 입학일자,
                  (EXTRACT (YEAR FROM SYSDATE) - EXTRACT(YEAR FROM ENTRANCE_DATE)) || '년'  "입학후기간(년)"
FROM TB_STUDENT
WHERE SUBSTR(ENTRANCE_DATE,1,2) BETWEEN '90'  AND '99' AND( STUDENT_ADDRESS LIKE '%경기%' OR STUDENT_ADDRESS LIKE '%인천%' )
ORDER BY 3 DESC, 1 ASC;

-- 9. 학과별 서울에 거주하는 교수 중 나이가 가장 적은 교수의 나이를 조회핚다. 단, 나이가 적은 순으로 정렬 핚다.
SELECT DISTINCT DEPARTMENT_NO 학과번호, MIN(EXTRACT(YEAR FROM SYSDATE)  -( TO_NUMBER(SUBSTR(PROFESSOR_SSN,1,2))+1900)) 나이
FROM TB_PROFESSOR
WHERE PROFESSOR_ADDRESS LIKE '%서울%'
GROUP BY DEPARTMENT_NO
ORDER BY 2;

-- 10. 2005년1월1일부터 2006년12월31일까지의 기간에 입학핚 학생 중 주소가 등록되지 않은 남학생의 학과번 호, 학생이름, 지도교수번호, 입학년도를 조회하시오.
-- 입학년도를 기준으로 오름차순 정렬핚다.
SELECT DEPARTMENT_NO 학과번호, STUDENT_NAME 학생이름, COACH_PROFESSOR_NO 지도교수번호, EXTRACT(YEAR FROM ENTRANCE_DATE) 입학년도
FROM TB_STUDENT
WHERE SUBSTR(STUDENT_SSN,8,1) IN ('1','3')
AND TO_CHAR(ENTRANCE_DATE ,'yyyy/mm/dd') BETWEEN '2005/01/01' AND '2006/12/31'
ORDER BY 4;


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 1. 
SELECT SUBSTR(TERM_NO,1,4) 년도, ROUND(AVG(POINT),1)"학점"
FROM TB_GRADE
WHERE CLASS_NO =  (SELECT CLASS_NO
                                    FROM TB_PROFESSOR
                                    WHERE PROFESSOR_NO = (SELECT COACH_PROFESSOR_NO
                                                                                    FROM TB_STUDENT
                                                                                    WHERE STUDENT_NAME = '서가람')
                                                                                    ) 
GROUP BY SUBSTR(TERM_NO,1,4)
ORDER BY 1 DESC;

-- 2.
SELECT DEPARTMENT_NAME 학과명,  STUDENT_NAME 학생명, ENTRANCE_DATE 입학일자
FROM TB_STUDENT
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
WHERE SUBSTR(STUDENT_SSN,8,1) IN ('1','3') AND ABSENCE_YN = 'Y'
AND TO_CHAR(ENTRANCE_DATE, 'YYYY/MM/DD') BETWEEN '2001/01/01' AND TO_CHAR(SYSDATE, 'YYYY/MM/DD');

-- 3.
SELECT PROFESSOR_NAME 지도교수, COUNT(STUDENT_NO) 학생수
FROM TB_PROFESSOR
LEFT JOIN TB_CLASS_PROFESSOR USING (PROFESSOR_NO)
JOIN TB_STUDENT ON (COACH_PROFESSOR_NO = PROFESSOR_NO)
WHERE CLASS_NO IS NULL
GROUP BY PROFESSOR_NAME;

-- 4.
SELECT STUDENT_NAME 학생명, SUBSTR(TERM_NO, 1, 6) 학기, ROUND(AVG(POINT),1) 평점
FROM TB_STUDENT
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
JOIN TB_GRADE USING (STUDENT_NO)
WHERE SUBSTR(TERM_NO, 1, 4) IN ('2009') AND CATEGORY = '공학'
GROUP BY STUDENT_NAME, DEPARTMENT_NAME, SUBSTR(TERM_NO, 1, 6)
HAVING ROUND(AVG(POINT),1) >= 4.0
ORDER BY 3 DESC, 1 ASC;

-- 5.
SELECT SUBSTR(TERM_NO, 1, 4) 년도,
       SUBSTR(TERM_NO, 5, 2) 학기,
       ROUND(AVG(POINT), 1) 평점
FROM TB_GRADE
JOIN TB_STUDENT S USING (STUDENT_NO)
JOIN TB_DEPARTMENT D ON (S.DEPARTMENT_NO = D.DEPARTMENT_NO)
WHERE D.DEPARTMENT_NO = (
                        SELECT DEPARTMENT_NO
                        FROM TB_STUDENT
                        WHERE STUDENT_NAME='김고운'
                        )
     AND SUBSTR(TERM_NO, 1, 4) < 2009
     AND SUBSTR(TERM_NO, 1, 4) > 2006
GROUP BY ROLLUP(SUBSTR(TERM_NO, 1, 4)),
         ROLLUP(SUBSTR(TERM_NO, 5, 2))
ORDER BY 1, 2;

-- 6.
select substr(term_no,1,4) 년도,  substr(term_no,5,6) 학기, point 평점
from tb_grade
where class_no = (select class_no
                                        from tb_class
                                        where class_name = '문학과생태학') 
and term_no like '2004%'
order by 1 , 2;




