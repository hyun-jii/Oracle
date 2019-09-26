
SELECT USER
FROM DUAL;
--==>> SCOTT

----------------------------------------------------------------------------------

--�� ����

-- 1. INSERT, UPDATE, DELETE,(MERGE)
--==>> DML(DATA MANUPLATION LANGUAGE)
-- COMMIT / ROLLBACK �� �ʿ��ϴ�.

-- 2. CREATE, DROP, ALTER(TRUNCATE)
--==>> DDL(DATA DEFINITION LANGUAGE)
-- �����ϸ� �ڵ����� COMMIT �ȴ�.

-- 3. GRANT, REVOKE
--==>> DCL (DATA CONTRL LANGUAGE)
-- �����ϸ� �ڵ����� COMMIT �ȴ�.

-- 4. COMMIT, ROLLBACK
--==>> TCL(TRANSACTION CONTROL LANGUAGE)

-- ���� PL/SQL��  -> DML��, TCL���� ��� �����ϴ�.
-- ���� PL/SQL��  -> DML��, DDL��, DCL��, TCL�� ��� �����ϴ�.


------------------------------------------------------------------------------------

--���� PROCEDURE(���ν���) ����--


-- 1. PL/SQL ���� ���� ��ǥ���� ������ ������ ���ν�����
--    �����ڰ� ���� �ۼ��ؾ� �ϴ� ������ �帧��
--    �̸� �ۼ��Ͽ� �����ͺ��̽� ���� ������ �ξ��ٰ�
--    �ʿ��� �� ���� ȣ���Ͽ� ������ �� �ֵ��� ó���� �ִ� �����̴�.

-- 2. ���� �� ����
/*
CREATE [OR REPLACE] PROCEDURE ���ν�����
[( �Ű����� IN ������Ÿ��
  ,�Ű����� OUT ������Ÿ��
  ,�Ű����� INOUT ������Ÿ��
)]
IS
    [-- �ֿ� ���� ����;]
BEGIN
    -- ���� ����;
    ...
    [EXCEPTION]
        -- ���� ó�� ����;
END;
*/

--�� FUNCTION �� ������ �� ��RETURN ��ȯ�ڷ����� �κ��� �������� ������,
--   ��RETURN���� ��ü�� �������� ������,
--   ���ν��� ���� �� �Ѱ��ְ� �Ǵ� �Ű������� ������
--   IN, OUT, INOUT ���� ���еȴ�.

-- 3. ����(ȣ��)
/*
EXEC[UTE] ���ν�����[(�μ�1, �μ�2,...)];
*/


--�� INSERT ���� ������ ���ν����� �ۼ�(INSERT ���ν���)

-- �ǽ� ���̺� ����(TBL_STUDENTS)
CREATE TABLE TBL_STUDENTS
( ID        VARCHAR2(10)
, NAME      VARCHAR2(40)
, TEL       VARCHAR2(30)
, ADDR      VARCHAR2(100)
);
--==>> Table TBL_STUDENTS��(��) �����Ǿ����ϴ�.

-- �ǽ� ���̺� ����(TBL_IDPW)
CREATE TABLE TBL_IDPW
( ID    VARCHAR2(10)
, PW    VARCHAR2(20)
, CONSTRAINT IDPW_ID_PK PRIMARY KEY(ID)

);
--==>> Table TBL_IDPW��(��) �����Ǿ����ϴ�.

-- �� ���̺� ������ �Է�
INSERT INTO TBL_STUDENTS(ID, NAME, TEL, ADDR)
VALUES('superman','������','010-1111-1111','���ֵ� ��������');
INSERT INTO TBL_IDPW(ID,PW)
VALUES('superman','java006$');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. *2

-- Ȯ��
SELECT *
FROM TBL_STUDENTS;
--==>> superman	������	010-1111-1111	���ֵ� ��������

SELECT *
FROM TBL_IDPW;
--==>> superman	java006$

COMMIT;
--==>> Ŀ�� �Ϸ�.

-- ���� ������ �����ϴ� ���ν���(INSERT ���ν���, �Է� ���ν���)�� �����ϰ� �Ǹ�
-- EXEC PRC_STUDENTS_INSERT('batman','java006$','������','010-2222-2222','���� ������');
-- �̿� ���� ���� �� �ٷ� ���� ���̺� �����͸� ��� ����� �Է��� �� �ִ�.


-- ���ν��� ����
 
CREATE OR REPLACE PROCEDURE PRC_STUDENTS_INSERT
( V_ID      IN TBL_STUDENTS.ID%TYPE
, V_PW      IN TBL_IDPW.PW%TYPE
, V_NAME    IN TBL_STUDENTS.NAME%TYPE
, V_TEL     IN TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN TBL_STUDENTS.ADDR%TYPE
)
IS
BEGIN
    INSERT INTO TBL_IDPW(ID,PW)
    VALUES(V_ID, V_PW);
    
    INSERT INTO TBL_STUDENTS(ID, NAME, TEL, ADDR)
    VALUES(V_ID, V_NAME, V_TEL, V_ADDR);
    
    COMMIT;
END;
--==>> Procedure PRC_STUDENTS_INSERT��(��) �����ϵǾ����ϴ�.


--�� ������ �Է� �� Ư�� �׸��� �����͸� �Է��ϸ�
--                 ------------------
--                  (�й�, �̸�, ��������, ��������, ��������)
-- ���������� ����, ���, ��� �׸��� �Բ� �Է� ó���� �� �ֵ��� �ϴ�
-- ���ν����� �ۼ��Ѵ�.
-- ���ν����� : PRC_SUNGJUK_INSERT()
/*
���� ��)
EXEC PRC_SUNGJUK_INSERT(1,'����ȣ',90,80,70);

���ν��� ȣ��� ó���� ���
�й�  �̸�  ��������    ��������    ��������    ����  ���  ���
 1   ����ȣ    90          80          70      240   80    B
*/


CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_INSERT
( V_HAKBUN  IN TBL_SUNGJUK.HAKBUN%TYPE
, V_NAME    IN TBL_SUNGJUK.NAME%TYPE
, V_KOR     IN TBL_SUNGJUK.KOR%TYPE
, V_MAT     IN TBL_SUNGJUK.MAT%TYPE
, V_ENG     IN TBL_SUNGJUK.ENG%TYPE

)
IS 
    V_TOT     TBL_SUNGJUK.TOT%TYPE      :=0;
    V_AVG     TBL_SUNGJUK.AVG%TYPE      :=0;
    V_GRADE   TBL_SUNGJUK.GRADE%TYPE;
BEGIN  
    
    V_TOT := V_KOR + V_MAT + V_ENG;
    V_AVG := V_TOT /3.0;
    IF V_AVG BETWEEN 90 AND 100
        THEN V_GRADE := 'A';
    ELSIF V_AVG BETWEEN 80 AND 89
        THEN V_GRADE := 'B';
    ELSIF V_AVG BETWEEN 70 AND 79
        THEN V_GRADE := 'C';
    ELSIF V_AVG BETWEEN 60 AND 69
        THEN V_GRADE := 'D';
    ELSE
        V_GRADE := 'F';
    END IF;
    
    INSERT INTO TBL_SUNGJUK(HAKBUN, NAME, KOR, ENG, MAT,TOT,AVG,GRADE)
    VALUES(V_HAKBUN, V_NAME, V_KOR, V_ENG, V_MAT, V_TOT, V_AVG, V_GRADE);
    
    
    COMMIT; 
    
END;
--==>> Procedure PRC_SUNGJUK_INSERT��(��) �����ϵǾ����ϴ�.



--�� TBL_SUNGJUK ���̺��� Ư�� �л��� ����
--   (�й�, ��������, ��������, ��������) ������ ���� ��
--   ����, ���, ��ޱ��� �����ϴ� ���ν����� �ۼ��Ѵ�.
-- ���ν����� : PRC_SUNGJUK_UPDATE()
/*
���� ��)
EXEC PRC_SUNGJUK_UPDATE(1,50,50,50);

���ν��� ȣ��� ó���� ���)
�й�  �̸�  ��������    ��������    ��������    ����  ���  ���
 1    ����ȣ   50          50          50     150    50    F
*/

CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_UPDATE
( V_HAKBUN  IN  TBL_SUNGJUK.HAKBUN%TYPE
, V_KOR     IN  TBL_SUNGJUK.KOR%TYPE
, V_ENG     IN  TBL_SUNGJUK.ENG%TYPE
, V_MAT     IN  TBL_SUNGJUK.MAT%TYPE
)
IS
    V_TOT   TBL_SUNGJUK.TOT%TYPE := 0;
    V_AVG   TBL_SUNGJUK.AVG%TYPE := 0;
    V_GRADE TBL_SUNGJUK.GRADE%TYPE;
BEGIN
    
    V_TOT := V_KOR + V_MAT + V_ENG;
    V_AVG := V_TOT /3.0;
    IF V_AVG BETWEEN 90 AND 100
        THEN V_GRADE := 'A';
    ELSIF V_AVG BETWEEN 80 AND 89
        THEN V_GRADE := 'B';
    ELSIF V_AVG BETWEEN 70 AND 79
        THEN V_GRADE := 'C';
    ELSIF V_AVG BETWEEN 60 AND 69
        THEN V_GRADE := 'D';
    ELSE
        V_GRADE := 'F';
    END IF;
    
    
    UPDATE TBL_SUNGJUK
    SET TBL_SUNGJUK.KOR = V_KOR, TBL_SUNGJUK.ENG = V_ENG, TBL_SUNGJUK.MAT = V_MAT, TBL_SUNGJUK.TOT = V_TOT, TBL_SUNGJUK.AVG = V_AVG, TBL_SUNGJUK.GRADE = V_GRADE 
    WHERE TBL_SUNGJUK.HAKBUN = V_HAKBUN;
    
    COMMIT;
    
    
END;



--�� TBL_STUDENTS ���̺��� ��ȭ��ȣ�� �ּ� �����͸� �����ϴ�(�����ϴ�)
--   ���ν����� �ۼ��Ѵ�.
--   ��, ID�� PW�� ��ġ�ϴ� ��쿡�� ������ ������ �� �ֵ��� �Ѵ�.
-- ���ν����� : PRC_STUDENTS_UPDATE()
/*
���� ��)
EXEC PRC_STUDENTS_UPDATE('superman', 'java006$' ,'010-9999-9999','����');

���ν��� ȣ��� ó���� ���)
superman    ������     010-9999-9999       ����
batman      ������     010-2222-2222       ���� ������
*/

CREATE OR REPLACE PROCEDURE PRC_STUDENTS_UPDATE
( V_ID      IN  TBL_STUDENTS.ID%TYPE
, V_PW      IN  TBL_IDPW.PW%TYPE
, V_TEL     IN  TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN  TBL_STUDENTS.ADDR%TYPE
)
IS
BEGIN

    UPDATE TBL_STUDENTS
    SET TEL = V_TEL, ADDR = V_ADDR
    WHERE V_ID = ID AND V_PW IN (  SELECT PW
                                   FROM TBL_IDPW
                                   WHERE V_PW = PW
                                );
    
    /* ���� ���
    
    UPDATE (SELECT T1.ID, T1.PW, T2.TEL, T2.ADDR
            FROM TBL_IDPW T1 JOIN TBL_STUDENTS T2
            ON T1.ID = T2.ID) T
    SET T.TEL = V_TEL, T.ADDR = V_ADDR
    WHERE T.ID = V_ID AND T.PW = V_PW;
    */
    
    COMMIT;
    
END;
--==>> Procedure PRC_STUDENTS_UPDATE��(��) �����ϵǾ����ϴ�.

--�� TBL_INSA ���̺��� ������� �ű� ������ �Է� ���ν����� �ۼ��Ѵ�.
-- NUM NAME SSN IBSADATE CITY TEL BUSEO JIKWI BASICPAY SUDANG �� ������ �÷� ��
-- NAME SSN IBSADATE CITY TEL BUSEO JIKWI BASICPAY SUDANG ������ �Է�
-- ��, �Է� �� NUM �÷�(�����ȣ)�� ����
-- �⺻ �ο��� ��� ��ȣ�� ������ ��ȣ �� ���� ��ȣ�� �ڵ����� �Է� ó���� �� �ִ�
-- ���ν����� �����Ѵ�.
-- ���ν����� : PRC_INSA_INSERT();
/*
���� ��)
EXEC PRC_INSA_INSERT('������', '901212-2234567', SYSDATE, '����', '010-3213-6546', '������', '�븮', 1000000, 200000);

���ν��� ȣ��� ó���� ���)
1061 ������ 901212-223467 19/9/26 ���� 010-3213-6456 ������ �븮 1000000 200000
--�� �����Ͱ� �ű� �Էµ� ��Ȳ
*/

CREATE OR REPLACE PROCEDURE PRC_INSA_INSERT
( V_NAME        IN  TBL_INSA.NAME%TYPE
, V_SSN         IN  TBL_INSA.SSN%TYPE
, V_IBSADATE    IN  TBL_INSA.IBSADATE%TYPE
, V_CITY        IN  TBL_INSA.CITY%TYPE
, V_TEL         IN  TBL_INSA.TEL%TYPE
, V_BUSEO       IN  TBL_INSA.BUSEO%TYPE
, V_JIKWI       IN  TBL_INSA.JIKWI%TYPE
, V_BASICPAY    IN  TBL_INSA.BASICPAY%TYPE
, V_SUDANG      IN  TBL_INSA.SUDANG%TYPE
)
IS
    V_NUM   TBL_INSA.NUM%TYPE;
BEGIN
    SELECT MAX(NUM)      INTO V_NUM
    FROM TBL_INSA;
    
    V_NUM := V_NUM+1;
    
    INSERT INTO TBL_INSA
    VALUES(V_NUM, V_NAME, V_SSN, V_IBSADATE, V_CITY, V_TEL, V_BUSEO, V_JIKWI, V_BASICPAY, V_SUDANG);
    
    COMMIT;
    
END;
--==>> Procedure PRC_INSA_INSERT��(��) �����ϵǾ����ϴ�.


--�� TBL_��ǰ, TBL_�԰� ���̺��� �������
--   TBL_�԰� ���̺� ������ �Է� ��(��, �԰� �̺�Ʈ �߻� ��)
--   TBL_��ǰ ���̺��� �������� �Բ� ������ �� �ִ� ����� ����
--   ���ν����� �ۼ��Ѵ�.
--   ��, �� �������� �԰��ȣ�� �ڵ� ���� ó���Ѵ�. (������ ��� X)
--   TBL_�԰� ���̺� ���� �÷�
--   : �԰��ȣ, ��ǰ�ڵ�, �԰�����, �԰����, �԰�ܰ�
-- ���ν����� : PRC_�԰�_INSERT(��ǰ�ڵ�, �԰����, �԰�ܰ�)

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE PRC_�԰�_INSERT
( V_��ǰ�ڵ�    IN  TBL_��ǰ.��ǰ�ڵ�%TYPE
, V_�԰����    IN  TBL_�԰�.�԰����%TYPE
, V_�԰�ܰ�    IN  TBL_�԰�.�԰�ܰ�%TYPE
)
IS
    V_�԰��ȣ  TBL_�԰�.�԰��ȣ%TYPE;
BEGIN
    
    SELECT NVL(MAX(�԰��ȣ),0) INTO V_�԰��ȣ
    FROM TBL_�԰�;

    V_�԰��ȣ := V_�԰��ȣ + 1;
    
    
    INSERT INTO TBL_�԰�(�԰��ȣ, ��ǰ�ڵ�, �԰����, �԰�ܰ�)
    VALUES(V_�԰��ȣ, V_��ǰ�ڵ�, V_�԰����, V_�԰�ܰ�);
    
    UPDATE TBL_��ǰ
    SET ������ = ������ + V_�԰����
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
    COMMIT;
    
END;
--==>> Procedure PRC_�԰�_INSERT��(��) �����ϵǾ����ϴ�.


--���� ���ν��� �������� ���� ó�� ����--

--�� TBL_MEMBER ���̺� �����͸� �Է��ϴ� ���ν����� ����
--   ��, �� ���ν����� ���� �����͸� �Է��� ���
--   CITY(����) �׸� '����','���','����'�� �Է��� �����ϵ��� �����Ѵ�.
--   �� ���� ���� �ٸ� ������ ���ν��� ȣ���� ���� �Է��ϰ��� �ϴ� ���
--   (��, �Է��� �õ��ϴ� ���)
--   ���ܿ� ���� ó���� �Ϸ��� �Ѵ�.
-- ���ν����� : PRC_MEMBER_INSERT();
/*
���� ��)
EXEC PRC_MEMBER_INSERT('�赿��', '010-1111-1111', '����');
*/


















