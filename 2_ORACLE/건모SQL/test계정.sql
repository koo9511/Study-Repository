-- 1
SELECT (
(SELECT count(*) cnt  FROM TB_BOOK) +  
(SELECT count(*) cnt  FROM TB_BOOK_AUTHOR) +  
(SELECT count(*) cnt  FROM TB_PUBLISHER) +  
(SELECT count(*) cnt  FROM TB_WRITER)) TOTAL_COUNT 
FROM DUAL; 
--2
SELECT * FROM col;
--3
SELECT BOOK_NM
FROM TB_BOOK
WHERE   LENGTH (BOOK_NM) >= 25;
--4
SELECT  WRITER_NM 이름,   OFFICE_TELNO 사무실번호, HOME_TELNO 집번호, MOBILE_NO 폰번호
FROM (SELECT * FROM TB_WRITER WHERE SUBSTR(MOBILE_NO,1,3)='019' AND WRITER_NM LIKE '김%' ORDER BY WRITER_NM)
WHERE ROWNUM = 1;
-- 5
select count(*) AS "작가 (명)"
from tb_book_author
where compose_type = '옮김';
--6     
select  compose_type "저작 형태", COUNT(*)  "도서 수량"
from tb_book_author
group by compose_type
having compose_type is not null
order by 2 desc;

SELECT  COMPOSE_TYPE, COUNT(*)
FROM   TB_BOOK_AUTHOR
WHERE  COMPOSE_TYPE IS NOT NULL
GROUP BY COMPOSE_TYPE
HAVING COUNT(*) >= 300
ORDER BY 2 DESC, 1;
-- 7
select book_nm 이름, ISSUE_DATE "발행 일자", publisher_nm "출판사 명"
from (select * from tb_book order  by issue_date desc)
where rownum = 1;
-- 8
select a.writer_nm 작가이름,sum(case compose_type when '지음' then 1 else 0 end)  "권 수"
from tb_writer a, tb_book_author b
where a.writer_no = b.writer_no  
group by a.writer_nm
order by 2 desc;


select a.writer_nm 작가이름,sum(case compose_type when '지음' then 1 else 0 end)  "권 수"
from tb_writer a, tb_book_author b
where a.writer_no = b.writer_no  
group by a.writer_nm
order by 2 desc;

--9
