--1. 학생이름과 주소지를 표시하시오. 단, 출력 헤더는 "학생 이름", "주소지"로 하고, 정렬은 이름으로 오름차순 표시하도록 핚다.
SELECT STUDENT_NAME "학생 이름", STUDENT_ADDRESS 주소지
FROM TB_STUDENT
ORDER BY STUDENT_NAME;

--2. 휴학중인 학생들의 이름과 주민번호를 나이가 적은 순서로 화면에 출력하시오.
SELECT STUDENT_NAME, STUDENT_SSN
FROM TB_STUDENT
WHERE ABSENCE_YN = 'Y'
ORDER BY TO_DATE(SUBSTR(STUDENT_SSN,1,6),'RR/MM/DD') DESC;

--3. 주소지가 강원도나 경기도인 학생들 중 1900 년대 학번을 가진 학생들의 이름과 학번, 주소를 이름의 오름차순으로 화면에 출력하시오. 
--단, 출력헤더에는 "학생이름","학번", "거주지 주소" 가 출력되도록 한다.
SELECT STUDENT_NAME 학생이름, STUDENT_NO 학번, STUDENT_ADDRESS "거주지 주소"
FROM TB_STUDENT
WHERE (STUDENT_ADDRESS LIKE '%경기도%' OR STUDENT_ADDRESS LIKE '%강원도%') AND SUBSTR(STUDENT_NO,1,1) = '9'
ORDER BY STUDENT_NAME;

-- 4. 현재 법학과 교수 중 가장 나이가 맋은 사람부터 이름을 확인핛 수 있는 SQL 문장을 작성하시오. 
--(법학과의 '학과코드'는 학과 테이블(TB_DEPARTMENT)을 조회해서 찾아 내도록 하자)
SELECT PROFESSOR_NAME, PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO = '005'
ORDER BY TO_DATE(SUBSTR(PROFESSOR_SSN,1,2),'RR') ASC;

--5. 2004 년 2 학기에 'C3118100' 과목을 수강핚 학생들의 학점을 조회하려고 핚다. 
-- 학점이 높은 학생부터 표시하고, 학점이 같으면 학번이 낮은 학생부터 표시하는 구문을 작성해보시오.

SELECT STUDENT_NO, "POINT"
FROM TB_GRADE
WHERE TERM_NO = 200402
AND CLASS_NO = 'C3118100'
ORDER BY 2 DESC, 1 ASC;

--6. 학생 번호, 학생 이름, 학과 이름을 이름 가나다 순서로 정렬하여 출력하는 SQL 문을 작성하시오.
SELECT A.STUDENT_NO, A.STUDENT_NAME, B.DEPARTMENT_NAME
FROM TB_STUDENT A, TB_DEPARTMENT B
WHERE A.DEPARTMENT_NO = B.DEPARTMENT_NO
ORDER BY STUDENT_NAME ASC;

--7. 춘 기술대학교의 과목 이름과 과목의 학과 이름을 학과 이름 가나다 순서로 출력하는 SQL 문장을 작성하시오.
SELECT B.CLASS_NAME, A.DEPARTMENT_NAME
FROM TB_DEPARTMENT A, TB_CLASS B
WHERE A.DEPARTMENT_NO = B.DEPARTMENT_NO
ORDER BY A.DEPARTMENT_NAME;

--8. 과목별 교수 이름을 찾으려고 핚다. 과목 이름과 교수 이름을 출력하는 SQL 문을 작성하시오.
SELECT A.CLASS_NAME "과목 이름", B.PROFESSOR_NAME "교수 이름"
FROM TB_CLASS A, TB_PROFESSOR B , TB_CLASS_PROFESSOR  C 
WHERE A.CLASS_NO=C.CLASS_NO 
AND B.PROFESSOR_NO = C.PROFESSOR_NO;

-- 9. 8 번의 결과 중 ‘인문사회’ 계열에 속핚 과목의 교수 이름을 찾으려고 핚다. 이에 해당하는 과목 이름과 교수 이름을 출력하는 SQL 문을 작성하시오.
SELECT A.CLASS_NAME "과목 이름", B.PROFESSOR_NAME "교수 이름"
FROM TB_CLASS A, TB_PROFESSOR B , TB_CLASS_PROFESSOR  C , TB_DEPARTMENT D
WHERE A.CLASS_NO=C.CLASS_NO 
AND B.PROFESSOR_NO = C.PROFESSOR_NO
AND B.DEPARTMENT_NO  = D.DEPARTMENT_NO
AND B.DEPARTMENT_NO IN  (SELECT DEPARTMENT_NO
                                                            FROM TB_DEPARTMENT
                                                            WHERE CATEGORY = '인문사회');

-- 10.    ‘음악학과’ 학생들의 평점을 구하려고 핚다. 음악학과 학생들의 "학번", "학생 이름", "젂체 평점"을 평점이 높은 순서(평점이 동일하면 학번 순서)로 출력하는 SQL 문장을 작성하시오.
-- (단, 평점은 소수점 1 자리까지맊 반올림하여 표시핚다.)
SELECT A.STUDENT_NO 학번, A.STUDENT_NAME 이름,  ROUND(AVG(B.POINT) ,1)전체평점
FROM TB_STUDENT A, TB_GRADE  B, TB_DEPARTMENT C
WHERE A.STUDENT_NO = B.STUDENT_NO
AND A.DEPARTMENT_NO = C.DEPARTMENT_NO
AND A.DEPARTMENT_NO = (SELECT DEPARTMENT_NO
                                                            FROM TB_DEPARTMENT
                                                            WHERE DEPARTMENT_NAME = '음악학과') 
GROUP BY A.STUDENT_NO, A.STUDENT_NAME
ORDER BY 3 DESC, 1;

--11. 학번이 A313047 인 학생이 학교에 나오고 있지 않다. 지도 교수에게 내용을 젂달하기 위핚 학과 이름, 학생 이름과 지도 교수 이름이 필요하다. 
--이때 사용핛 SQL 문을 작성하시오. 단, 출력헤더는 ‚학과이름‛, ‚학생이름‛, ‚지도교수이름‛으로 출력되도록 핚다.
SELECT DEPARTMENT_NAME 학과이름, STUDENT_NAME 학생이름, PROFESSOR_NAME 지도교수이름
FROM TB_STUDENT A, TB_DEPARTMENT B, TB_PROFESSOR C
WHERE A.DEPARTMENT_NO = B.DEPARTMENT_NO
AND A.COACH_PROFESSOR_NO = C.PROFESSOR_NO
AND A.STUDENT_NO = 'A313047';

-- 12. 2007 년도에 '인갂관계론' 과목을 수강핚 학생을 찾아 학생이름과 수강학기를 이름 가나다 순서로 표시하는 SQL 문장을 작성하시오.
-- ORACLE
SELECT DISTINCT STUDENT_NAME, TERM_NO
FROM TB_STUDENT A, TB_GRADE B, TB_CLASS C
WHERE A.STUDENT_NO = B.STUDENT_NO
AND A.DEPARTMENT_NO = C.DEPARTMENT_NO
AND B.CLASS_NO = (SELECT CLASS_NO
                                            FROM TB_CLASS
                                            WHERE CLASS_NAME = '인간관계론')
AND B.TERM_NO LIKE '2007%';

-- ANSI
SELECT STUDENT_NAME, TERM_NO
FROM TB_STUDENT
JOIN TB_GRADE USING (STUDENT_NO)
WHERE CLASS_NO = (SELECT CLASS_NO
                                            FROM TB_CLASS
                                            WHERE CLASS_NAME = '인간관계론')
AND TERM_NO LIKE '2007%';

-- 13. 예체능 계열 과목 중 과목 담당교수를 한 명도 배정받지 못한 과목을 찾아 그 과목 이름과 학과 이름을 출력하는 SQL 문장을 작성하시오.
SELECT CLASS_NAME, DEPARTMENT_NAME
FROM TB_CLASS
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
LEFT JOIN TB_CLASS_PROFESSOR USING (CLASS_NO)
WHERE PROFESSOR_NO IS NULL
AND CATEGORY = '예체능';

-- 14. 춘 기술대학교 서반아어학과 학생들의 지도교수를 게시하고자 핚다. 학생이름과 지도교수 이름을 찾고 맊일 지도 교수가 없는 학생일 경우 "지도교수 미지정‛으로 표시하도록 하는 SQL 문을 작성하시오. 
-- 단, 출력헤더는 ‚학생이름‛, ‚지도교수‛로 표시하며 고학번 학생이 먼저 표시되도록 핚다.
SELECT STUDENT_NAME AS "학생이름", NVL(PROFESSOR_NAME, '지도교수 미지정') AS "지도교수"
FROM TB_STUDENT A
LEFT JOIN TB_PROFESSOR B ON (A.COACH_PROFESSOR_NO = B.PROFESSOR_NO)
LEFT JOIN TB_DEPARTMENT C ON(A.DEPARTMENT_NO = C.DEPARTMENT_NO)
WHERE C.DEPARTMENT_NAME = '서반아어학과'
ORDER BY A.STUDENT_NO ;

-- 15. 휴학생이 아닌 학생 중 평점이 4.0 이상인 학생을 찾아 그 학생의 학번, 이름, 학과 이름, 평점을 출력하는 SQL 문을 작성하시오.
SELECT STUDENT_NO 학번, STUDENT_NAME 이름, DEPARTMENT_NAME 학과이름, AVG(POINT) 평점
FROM TB_STUDENT
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
JOIN TB_GRADE USING (STUDENT_NO)
WHERE ABSENCE_YN = 'N' 
GROUP BY STUDENT_NAME, STUDENT_NO, STUDENT_NO, DEPARTMENT_NAME
HAVING AVG(POINT) >= 4.0
ORDER BY 1;

--16. 홖경조경학과 젂공과목들의 과목 별 평점을 파악핛 수 있는 SQL 문을 작성하시오.
SELECT CLASS_NO, CLASS_NAME, TRUNC(AVG(POINT),8)
FROM TB_DEPARTMENT
JOIN TB_CLASS USING (DEPARTMENT_NO)
JOIN TB_GRADE USING (CLASS_NO)
WHERE DEPARTMENT_NAME = '환경조경학과' 
AND CLASS_TYPE = '전공선택'
GROUP BY CLASS_NO, CLASS_NAME
ORDER BY 1;

-- 17. 춘 기술대학교에 다니고 있는 최경희 학생과 같은 과 학생들의 이름과 주소를 출력하는 SQL 문을 작성하시오.
SELECT STUDENT_NAME, STUDENT_ADDRESS
FROM TB_STUDENT
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
WHERE DEPARTMENT_NO= (SELECT DEPARTMENT_NO
                                                    FROM TB_STUDENT
                                                    WHERE STUDENT_NAME = '최경희');

--18. 국어국문학과에서 총 평점이 가장 높은 학생의 이름과 학번을 표시하는 SQL 문을 작성하시오.
SELECT  STUDENT_NO, STUDENT_NAME
FROM (SELECT STUDENT_NAME, 	STUDENT_NO, AVG(POINT),
              RANK () OVER (ORDER BY AVG(POINT) DESC) AS RANK
FROM   TB_DEPARTMENT
JOIN   TB_CLASS USING (DEPARTMENT_NO)
 JOIN   TB_GRADE USING (CLASS_NO)
JOIN   TB_STUDENT USING (STUDENT_NO)
WHERE  DEPARTMENT_NAME = '국어국문학과'
GROUP BY STUDENT_NAME, STUDENT_NO)
WHERE RANK = '1';

-- 19. 춘 기술대학교의 "환경조경학과"가 속한 같은 계열 학과들의 학과 별 전공과목 평점을 파악하기 위핚 적절핚 SQL 문을 찾아내시오. 
 -- 단, 출력헤더는 "계열 학과명", "젂공평점"으로 표시되도록 하고, 평점은 소수점 핚 자리까지맊 반올림하여 표시되도록 핚다.
 SELECT DEPARTMENT_NAME "계열 학과명", ROUND(AVG(POINT) ,1) "전공 평점"
 FROM TB_DEPARTMENT

JOIN TB_CLASS USING (DEPARTMENT_NO) 
JOIN TB_GRADE USING  (CLASS_NO)
  
 WHERE CATEGORY IN (SELECT CATEGORY
                                                 FROM TB_DEPARTMENT
                                                 WHERE DEPARTMENT_NAME = '환경조경학과')
GROUP BY DEPARTMENT_NAME
ORDER BY 1;

 
