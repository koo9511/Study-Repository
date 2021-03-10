-- DAY11 : USER, ROLL, GRANT, PL/SQL

/*
사용자 관리 : 사요\용자 계정과 암호 설정, 권한 부여
오라클 데이터베이스 설치하면, 기본적으로 제공되는 계정은
    SYS
    SYSTEM
    SCOTT
    HR
    
보안을 위한 데이터베이스 관리자
 : 사용자가 데이터베이스 객체(테이블, 뷰 등)에 접근 권한을 다룰 수 있ㄱ[ 됨
 다수의 사용자, 데이터베이스 정보에 대한 보안 설정
 
 시스템 권한 : 데이터베이스 관리자가 가지고 있는 권한
            CREATE USER
            DROP USER
            DROP ANY TABLE
            QUERY REWRITE
            BACKUP ANY TABLE
            
 시스템 관리자가 사용자에게 부여하는 권한
            CREATE SESSION (데이터베이스에 접속)
            CREATE TABLE (테이블 생성)
            CREATE VIEW (뷰 생성)
            CREATE SEQUENCE (시퀀스 생성)
*/
/*
사용자 계정 만들기
 : 데이터베이스에 접근할 수 있는 계정과 암호를 만듦
 [형식]
 CREATE USER 아이디 IDENTIFIED BY 암호;
 
*/

CREATE USER USER01 IDENTIFIED BY PASS01;


-- PL/SQL 사용 테스트

-- PL/SQL 블럭 사용 테스트
-- 한선기 직원의 사번과 이름 출력
SET SERVEROUTPUT ON;


DECLARE
    -- 변수 선언 영역 : 테이블 생성시 컬럼명 지정과 동일
    VEMPNO  EMPLOYEE.EMP_ID%TYPE;
    VENAME  EMPLOYEE.EMP_NAME%TYPE;
BEGIN
    SELECT EMP_ID, EMP_NAME
    INTO VEMPNO, VENAME
    FROM EMPLOYEE
    WHERE EMP_NAME = '한선기';
    
    SYS.DBMS_OUTPUT.PUT_LINE('사번        이름');
    SYS.DBMS_OUTPUT.PUT_LINE('--------------');
    SYS.DBMS_OUTPUT.PUT_LINE(VEMPNO || '    ' ||  VENAME);
    
END;
/-- 위 블럭의 내용을 자동 실행




-- 사번을 입력받아 직원 정보 출력
SET SERVEROUTPUT ON;

DECLARE 
        VEMPNO           EMPLOYEE.EMP_ID%TYPE;
        VENAME           EMPLOYEE.EMP_NAME%TYPE;
        VSAL                  EMPLOYEE.SALARY%TYPE;
        VHIREDATE     EMPLOYEE.HIRE_DATE%TYPE;
BEGIN
        SELECT EMP_ID, EMP_NAME, SALARY, HIRE_DATE
        INTO VEMPNO, VENAME, VSAL ,VHIREDATE
        FROM EMPLOYEE
        WHERE EMP_ID = '&EMPID'; -- 입력받기
        
        SYS.DBMS_OUTPUT.PUT_LINE(VENAME || ' , ' || VSAL || ' , ' || VHIREDATE);
END;
/

--declare
--    vempno emp.empno%type;
--    vename emp_ename%type;
--    vdeptno emp.deptno%type;
--    vdname varchar2(20) := null;
--begin
--        select empno, ename, deptno
--        into vempno, vename, vdeptno
--        from emp
--        where empno = &empno;
--        
--        if (cdeptno = 10) then
--                vdname := 'accounting';
--        end if;
--        if (cdeptno = 10) then
--                vdname := 'accounting';
--        end if;   if (cdeptno = 10) then
--                vdname := 'accounting';
--        end if;



declare
        toolong_name exception;
        pragma exception_init(toolong_name, -12899);
begin
        insert into emp (empno, ename)
        values (7777, 'JAVAKINGOOOOOOOOOOO');
exception
    when toolong_name then
    dbms_output.put_line('ENAME 컬럼에 지정된 바이트 크기를 초과하였습니다.');
    when others then
    dbms_output.put_line('알 수 없는 예외가 발생했습니다.');
end;
/

-- EMP01 테이블의 데이터 모두 삭제하는 프로시저 작성
CREATE or replace procedure del_all
is
begin
        delete from emp01;
        commit;
end;
/

exec del_all;

create or replace procedure
        del_ename(vename IN employee.emp_name%type)
is
begin
        delete from employee
        where emp_name like  VENAME;
        commit;
end;
/

exec del_ename ('김%');

select emp_name
from employee;

select emp_name
from employee;

create or replace procedure emp_sal(eid in employee.emp_id%type,
                                                        ename out employee.emp_name%type,
                                                       sal out employee.salary%type )
is
begin
        select emp_name, salary
        into ename, sal
        from employee
        where emp_id = eid;
end;
/

-- BIND 변수 선언
variable var_ename varchar2(20);
variable var_sal number;

exec emp_sal('200', :var_ename, :var_sal);

print var_ename;
print var_sal;


-- FUNCTION


-- 트러거 : 이벤트
create or replace trigger twelcome
after insert on department
for each row
begin
        insert into dept01
        values (:new.dept_id, :new.dept_name, :new.loc_id);
end;
/

insert into department
values ('77','IT개발부','A1');

select * from dept01;

