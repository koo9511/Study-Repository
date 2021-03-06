
SELECT * FROM NOTICES;
DESC NOTICES;

-- 게시목록 조회 저장 프로시저
CREATE OR REPLACE PROCEDURE GET_NOTICES
(
	V_CUR OUT SYS_REFCURSOR
)
IS
BEGIN
	OPEN V_CUR FOR SELECT * FROM NOTICES;
END;

-- 프로시저 사용1 ( 익명프로시저사용)
DECLARE 
	V_CUR SYS_REFCURSOR;
	V_NOTICE NOTICES%ROWTYPE;
BEGIN 
	GET_NOTICES(V_CUR);	
	LOOP 
		FETCH V_CUR INTO V_NOTICE;
		EXIT WHEN V_CUR%NOTFOUND;
		DBMS_OUTPUT.PUT_LINE(V_NOTICE.TITLE);
	END LOOP;
END;

-- 프로시저 사용2 
VARIABLE V_CUR REFCURSOR;
EXECUTE GET_NOTICES(:V_CUR);
PRINT V_CUR;

-- 동적쿼리를 이용한 게시 목록
CREATE OR REPLACE PROCEDURE GET_NOTICES
(
	V_TITLE VARCHAR2,
	V_CUR OUT SYS_REFCURSOR
)
IS
BEGIN
	--커서를 만들때 쿼리식을 문자열로 가능	
	OPEN V_CUR FOR 'SELECT * FROM NOTICES WHERE TITLE LIKE ''%'||V_TITLE||'%''';
END;

--프로시저 사용
VARIABLE V_CUR REFCURSOR;
EXECUTE GET_NOTICES('테스트',:V_CUR);
PRINT V_CUR;


--

CREATE OR REPLACE PROCEDURE GET_NOTICES
(
	V_TITLE VARCHAR2,
	V_CUR OUT SYS_REFCURSOR
)
IS
	V_SQL VARCHAR2(1000) := 'SELECT * FROM NOTICES WHERE TITLE LIKE :1';
	
BEGIN	
	OPEN V_CUR FOR V_SQL USING '%'||V_TITLE||'%';
	
END;

VARIABLE V_CUR REFCURSOR;
EXECUTE GET_NOTICES('테스트',:V_CUR);
PRINT V_CUR;

--
CREATE OR REPLACE PROCEDURE GET_NOTICES
(
	V_SCOPE VARCHAR2, --TITLE/WRITER
	V_TITLE VARCHAR2,
	V_CUR OUT SYS_REFCURSOR
)
IS
	V_SQL VARCHAR2(1000) := 'SELECT * FROM NOTICES WHERE '|| V_SCOPE ||' LIKE :1';
	
BEGIN	
	OPEN V_CUR FOR V_SQL USING '%'||V_TITLE||'%';
	
END;

--프로시저 사용
VARIABLE V_CUR REFCURSOR;
EXECUTE GET_NOTICES('TITLE','테스트',:V_CUR);
PRINT V_CUR;
