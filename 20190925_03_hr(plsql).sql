SELECT USER
FROM DUAL;
--==>> HR

--------------------------------------------------------------------------------------

--○ %TYPE

-- 1. 특정 테이블에 포함되어있는 컬럼의 자료형을 참조하는 데이터타입

-- 2. 형식 및 구조
-- 변수명 테이블명.컬럼명%TYPE [:= 초기값];


--○ HR.EMPLOYEES 테이블의 특정 데이터를 변수에 저장
DESC EMPLOYEES;

SET SERVEROUTPUT ON;
--==>> 작업이 완료되었습니다.

DECLARE
    --V_NAME VARCHAR2(20);
    V_NAME EMPLOYEES.FIRST_NAME%TYPE;
BEGIN
    SELECT FIRST_NAME INTO V_NAME
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 103;
    
    DBMS_OUTPUT.PUT_LINE(V_NAME);
END;
--==>> Alexander

--○ %ROWTYPE

-- 1. 테이블의 레코드와 같은 구조의 구조체 변수를 선언(여러개의 컬럼)

-- 2. 형식 및 구조
-- 변수명 테이블명%ROWTYPE;

--○ HR.EMPLOYEES 테이블의 데이터 여러개를 변수에 저장

DESC EMPLOYEES;

DECLARE
    --V_FIRST_NAME    VARCHAR2(20);
    --V_PHONE_NUMBER  VARCHAR2(20);
    --V_EMAIL         VARCHAR2(25);
    
    --V_FIRST_NAME EMPLOYEES.FIRST_NAME%TYPE;
    --V_PHONE_NUMBER EMPLOYEES.PHONE_NUMBER%TYPE;
    --V_EMAIL EMPLOYEES.EMAIL%TYPE;
    
    V_EMP EMPLOYEES%ROWTYPE;
BEGIN
    SELECT FIRST_NAME, PHONE_NUMBER, EMAIL INTO V_EMP.FIRST_NAME, V_EMP.PHONE_NUMBER, V_EMP.EMAIL
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 103;
    
    DBMS_OUTPUT.PUT_LINE(V_EMP.FIRST_NAME || ',' || V_EMP.PHONE_NUMBER || ',' || V_EMP.EMAIL);
END;

--==>> Alexander,590.423.4567,AHUNOLD

SELECT *
FROM EMPLOYEES;


DECLARE
    V_DEP   DEPARTMENTS%ROWTYPE;
BEGIN
    SELECT * INTO V_DEP.DEPARTMENT_ID, V_DEP.DEPARTMENT_NAME, V_DEP.MANAGER_ID, V_DEP.LOCATION_ID
    FROM DEPARTMENTS
    WHERE DEPARTMENT_ID = 90;
    
    DBMS_OUTPUT.PUT_LINE(V_DEP.DEPARTMENT_ID || ',' || V_DEP.DEPARTMENT_NAME || ',' || V_DEP.MANAGER_ID || ',' || V_DEP.LOCATION_ID);
END;
--==>> 90,Executive,100,1700


--○ HR.EMPLOYEES 테이블의 여러명의 데이터 여러개를 변수에 저장

DECLARE
    V_DEP   DEPARTMENTS%ROWTYPE;
BEGIN
    SELECT * INTO V_DEP.DEPARTMENT_ID, V_DEP.DEPARTMENT_NAME, V_DEP.MANAGER_ID, V_DEP.LOCATION_ID
    FROM DEPARTMENTS;
    
    
    DBMS_OUTPUT.PUT_LINE(V_DEP.DEPARTMENT_ID || ',' || V_DEP.DEPARTMENT_NAME || ',' || V_DEP.MANAGER_ID || ',' || V_DEP.LOCATION_ID);
END;
--==>> 에러 발생
-- ORA-01422: exact fetch returns more than requested number of rows

--> 여러 개의 행(ROWS) 정보를 얻어와 담으려고 하면
--  변수에 저장하는 것 자체가 불가능해진다.



