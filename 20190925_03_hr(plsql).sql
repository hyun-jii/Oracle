SELECT USER
FROM DUAL;
--==>> HR

--------------------------------------------------------------------------------------

--�� %TYPE

-- 1. Ư�� ���̺� ���ԵǾ��ִ� �÷��� �ڷ����� �����ϴ� ������Ÿ��

-- 2. ���� �� ����
-- ������ ���̺��.�÷���%TYPE [:= �ʱⰪ];


--�� HR.EMPLOYEES ���̺��� Ư�� �����͸� ������ ����
DESC EMPLOYEES;

SET SERVEROUTPUT ON;
--==>> �۾��� �Ϸ�Ǿ����ϴ�.

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

--�� %ROWTYPE

-- 1. ���̺��� ���ڵ�� ���� ������ ����ü ������ ����(�������� �÷�)

-- 2. ���� �� ����
-- ������ ���̺��%ROWTYPE;

--�� HR.EMPLOYEES ���̺��� ������ �������� ������ ����

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


--�� HR.EMPLOYEES ���̺��� �������� ������ �������� ������ ����

DECLARE
    V_DEP   DEPARTMENTS%ROWTYPE;
BEGIN
    SELECT * INTO V_DEP.DEPARTMENT_ID, V_DEP.DEPARTMENT_NAME, V_DEP.MANAGER_ID, V_DEP.LOCATION_ID
    FROM DEPARTMENTS;
    
    
    DBMS_OUTPUT.PUT_LINE(V_DEP.DEPARTMENT_ID || ',' || V_DEP.DEPARTMENT_NAME || ',' || V_DEP.MANAGER_ID || ',' || V_DEP.LOCATION_ID);
END;
--==>> ���� �߻�
-- ORA-01422: exact fetch returns more than requested number of rows

--> ���� ���� ��(ROWS) ������ ���� �������� �ϸ�
--  ������ �����ϴ� �� ��ü�� �Ұ���������.



