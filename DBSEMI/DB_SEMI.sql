SELECT USER
FROM DUAL;
--==>> TEAM3

-- �������� ���̺� ����
CREATE TABLE SCOR_TABLE
( SCOR_NO   VARCHAR2(10)                -- ������ȣ
, COR_NAME  VARCHAR2(30)    NOT NULL    -- ������
, CONSTRAINT SCOR_NO_PK PRIMARY KEY(SCOR_NO)
);
--==>> Table SCOR_TABLE��(��) �����Ǿ����ϴ�.

DESC SCOR_TABLE;
--==>>
/*
�̸�       ��?       ����           
-------- -------- ------------ 
SCOR_NO  NOT NULL VARCHAR2(10) 
COR_NAME NOT NULL VARCHAR2(30) 
*/


--�����ǽǡ� ���̺� ����
CREATE TABLE ROOM_TABLE
( ROOM_NO   VARCHAR2(10)                    -- ���ǽ� ��ȣ
, ROOM_INFO VARCHAR2(30)    NOT NULL        -- ���ǽ� ����
, CONSTRAINT ROOM_NO_PK PRIMARY KEY(ROOM_NO)
);
--==>> Table ROOM_TABLE��(��) �����Ǿ����ϴ�.

DESC ROOM_TABLE;
--==>>
/*
�̸�        ��?       ����           
--------- -------- ------------ 
ROOM_NO   NOT NULL VARCHAR2(10) 
ROOM_INFO NOT NULL VARCHAR2(30)
*/


-- �������ڡ� ���̺� ����
CREATE TABLE SYS_TABLE                      -- ������ ���̺�
(SYS_ID         VARCHAR2(5)                 -- ������ ��ȣ
,SYS_PW         VARCHAR2(20)   NOT NULL     -- ��й�ȣ
,SYS_NAME       VARCHAR2(20)   NOT NULL     -- ������ �̸�
,CONSTRAINT SYS_ID_PK PRIMARY KEY(SYS_ID)
);

DESC SYS_TABLE;
--==>>
/*
�̸�       ��?       ����           
-------- -------- ------------ 
SYS_ID   NOT NULL VARCHAR2(5)  
SYS_PW   NOT NULL VARCHAR2(20) 
SYS_NAME NOT NULL VARCHAR2(20) 
*/


--������ ���̺� ����
CREATE TABLE SSUB_TABLE
( SSUB_NO   VARCHAR2(5)     NOT NULL    -- �����ȣ
, SUB_NAME  VARCHAR2(30)    NOT NULL    -- �����
, CONSTRAINT SSUB_NO_PK PRIMARY KEY(SSUB_NO)
);
--==>> Table SSUB_TABLE��(��) �����Ǿ����ϴ�.

DESC SSUB_TABLE;
--==>>
/*
�̸�       ��?       ����           
-------- -------- ------------ 
SSUB_NO  NOT NULL VARCHAR2(5)  
SUB_NAME NOT NULL VARCHAR2(30) 
*/


-- �������� ���̺� ����
CREATE TABLE PROF_TABLE 
( PROF_ID VARCHAR2(10)              /* �����ڹ�ȣ */
, PROF_NAME VARCHAR2(20) NOT NULL   /* �����ڸ� */
, PROF_SSN VARCHAR2(14) NOT NULL    /* �ֹε�Ϲ�ȣ */
, PROF_PW VARCHAR2(20)              /* �����ں�й�ȣ */
, CONSTRAINT PROF_ID_PK PRIMARY KEY(PROF_ID)
);
--==>> Table PROF_TABLE��(��) �����Ǿ����ϴ�.

DESC PROF_TABLE;
--==>>
/*
�̸�        ��?       ����           
--------- -------- ------------ 
PROF_ID   NOT NULL VARCHAR2(10) 
PROF_NAME NOT NULL VARCHAR2(20) 
PROF_SSN  NOT NULL VARCHAR2(14) 
PROF_PW            VARCHAR2(20) 
*/


--���л��� ���̺� ����
CREATE TABLE STU_TABLE
(
 STU_ID       VARCHAR2(5) NOT NULL          -- �л���ȣ
,STU_NAME     VARCHAR2(20) NOT NULL         -- �л��̸�
,STU_SSN      VARCHAR2(14) NOT NULL         -- �ֹι�ȣ
,STU_PW       VARCHAR2(20)                  -- �л���й�ȣ

,CONSTRAINT  STU_ID_PK PRIMARY KEY (STU_ID)
);
--==>>Table STU_TABLE��(��) �����Ǿ����ϴ�.

DESC STU_TABLE;
--==>>
/*
�̸�       ��?       ����           
-------- -------- ------------ 
STU_ID   NOT NULL VARCHAR2(5)  
STU_NAME NOT NULL VARCHAR2(20) 
STU_SSN  NOT NULL VARCHAR2(14) 
STU_PW            VARCHAR2(20) 
*/


--�����硻 ���̺� ����
CREATE TABLE BOOK_TABLE                         -- ���� ���̺�
( BOOK_NO   VARCHAR2(5)                         -- �����ȣ
, BOOK_NAME VARCHAR2(30)  NOT NULL              -- �����
, BOOK_PUB  VARCHAR2(20)  NOT NULL              -- ���ǻ�
, CONSTRAINT BOOK_NO_PK PRIMARY KEY(BOOK_NO)    -- 
);
--==>> Table BOOK_TABLE��(��) �����Ǿ����ϴ�.

DESC BOOK_TABLE;
--==>> 
/*
�̸�        ��?       ����           
--------- -------- ------------ 
BOOK_NO   NOT NULL VARCHAR2(5)  
BOOK_NAME NOT NULL VARCHAR2(30) 
BOOK_PUB  NOT NULL VARCHAR2(20) 
*/


--������������ ���̺� ����
CREATE TABLE DCOR_TABLE 
( DCOR_NO VARCHAR2(10)  -- ���������ڵ�
, SCOR_NO VARCHAR2(5)   -- ������ȣ
, ROOM_NO VARCHAR2(5)   -- ���ǽǹ�ȣ
, COR_DATE DATE         -- ����������
, CONSTRAINT DCOR_NO_PK PRIMARY KEY(DCOR_NO)
, CONSTRAINT SCOR_NO_FK FOREIGN KEY(SCOR_NO)
                        REFERENCES SCOR_TABLE(SCOR_NO)
, CONSTRAINT ROOM_NO_FK FOREIGN KEY(ROOM_NO)
                        REFERENCES ROOM_TABLE(ROOM_NO)
);
--==>> Table DCOR_TABLE��(��) �����Ǿ����ϴ�.

DESC DCOR_TABLE;
--==>>
/*
�̸�       ��?       ����           
-------- -------- ------------ 
DCOR_NO  NOT NULL VARCHAR2(10) 
SCOR_NO           VARCHAR2(5)  
ROOM_NO           VARCHAR2(5)  
COR_DATE          DATE 
*/


--���������� ���̺� ����
CREATE TABLE DSUB_TABLE 
( DSUB_NO VARCHAR2(10)  -- ���������ڵ�
, DCOR_NO VARCHAR2(10)  -- ���������ڵ�
, SSUB_NO VARCHAR2(5)   -- �����ȣ
, SUB_START DATE        -- ���������
, SUB_END DATE          -- ����������
, ATT_SCORE NUMBER      -- ������
, W_SCORE NUMBER        -- �ʱ����
, P_SCORE NUMBER        -- �Ǳ����
, PROF_ID VARCHAR2(5)   -- �����ڹ�ȣ
, BOOK_NO VARCHAR2(5)   -- �����ȣ
, CONSTRAINT DSUB_NO_PK PRIMARY KEY(DSUB_NO)
, CONSTRAINT PROF_ID_FK FOREIGN KEY(PROF_ID)
                     REFERENCES PROF_TABLE(PROF_ID)
, CONSTRAINT BOOK_NO_FK FOREIGN KEY(BOOK_NO)
                        REFERENCES BOOK_TABLE(BOOK_NO)
, CONSTRAINT DCOR_NO_FK FOREIGN KEY(DCOR_NO)
                        REFERENCES DCOR_TABLE(DCOR_NO)
, CONSTRAINT SSUB_NO_FK FOREIGN KEY(SSUB_NO)
                        REFERENCES SSUB_TABLE(SSUB_NO)
);
-- Table DSUB_TABLE��(��) �����Ǿ����ϴ�.

DESC DSUB_TABLE;
--==>>
/*
�̸�        ��?       ����           
--------- -------- ------------ 
DSUB_NO   NOT NULL VARCHAR2(10) 
DCOR_NO            VARCHAR2(10) 
SSUB_NO            VARCHAR2(5)  
SUB_START          DATE         
SUB_END            DATE         
ATT_SCORE          NUMBER       
W_SCORE            NUMBER       
P_SCORE            NUMBER       
PROF_ID            VARCHAR2(5)  
BOOK_NO            VARCHAR2(5)  
*/


--��������û�� ���̺�
CREATE TABLE SUG_TABLE 
( SUG_NO VARCHAR2(10)             -- ������û�ڵ�
, STU_ID VARCHAR2(5)   NOT NULL   -- �л���ȣ
, DCOR_NO VARCHAR2(10) NOT NULL   -- ���������ڵ�
, CONSTRAINT SUG_NO_PK PRIMARY KEY(SUG_NO)
, CONSTRAINT STU_ID_FK FOREIGN KEY(STU_ID)
                       REFERENCES STU_TABLE(STU_ID)
, CONSTRAINT DCOR_NO_FK2 FOREIGN KEY(DCOR_NO)
                        REFERENCES DCOR_TABLE(DCOR_NO)
);
-- Table SUG_TABLE��(��) �����Ǿ����ϴ�.

DESC SUG_TABLE;
--==>>
/*
�̸�      ��?       ����           
------- -------- ------------ 
SUG_NO  NOT NULL VARCHAR2(10) 
STU_ID  NOT NULL VARCHAR2(5)  
DCOR_NO NOT NULL VARCHAR2(10) 

*/


--���ߵ�Ż���� ���̺� ����
CREATE TABLE FAIL_TABLE             -- �ߵ�Ż��
(
 SUG_NO     VARCHAR2(10) NOT NULL   -- ������û�ڵ� 
,FAIL_DATE  DATE         NOT NULL   -- Ż������
,FAIL_REA   VARCHAR2(100)           -- Ż������

,CONSTRAINT SUG_NO_PK2 PRIMARY KEY(SUG_NO)
,CONSTRAINT SUG_NO_FK  FOREIGN KEY(SUG_NO)
                       REFERENCES SUG_TABLE(SUG_NO)
);
--Table FAIL_TABLE��(��) �����Ǿ����ϴ�.

DESC FAIL_TABLE;
--==>>
/*
�̸�        ��?       ����            
--------- -------- ------------- 
SUG_NO    NOT NULL VARCHAR2(10)  
FAIL_DATE NOT NULL DATE          
FAIL_REA           VARCHAR2(100) 
*/

--�������� ���̺� ����
CREATE TABLE SUNG_TABLE             -- ����
(
 SUG_NO     VARCHAR2(10) NOT NULL   -- ������û�ڵ�    
,DSUB_NO    VARCHAR2(10) NOT NULL   -- ���������ڵ�
,SUNG_ATT   NUMBER                  -- ���
,SUNG_W     NUMBER                  -- �ʱ�
,SUNG_P     NUMBER                  -- �Ǳ�

,CONSTRAINT SUGDSUB_NO_PK3  PRIMARY KEY(SUG_NO, DSUB_NO)
,CONSTRAINT SUG_NO_FK2 FOREIGN KEY(SUG_NO)
                      REFERENCES SUG_TABLE(SUG_NO)
,CONSTRAINT DSUB_NO_FK FOREIGN KEY(DSUB_NO)
                       REFERENCES DSUB_TABLE(DSUB_NO)
);
--Table SUNG_TABLE��(��) �����Ǿ����ϴ�.


ALTER TABLE DSUB_TABLE
DROP CONSTRAINT SYS_C007310;
ALTER TABLE FAIL_TABLE
DROP CONSTRAINT SYS_C007330;
ALTER TABLE SSUB_TABLE
DROP CONSTRAINT SYS_C007300;
ALTER TABLE STU_TABLE
DROP CONSTRAINT SYS_C007303;
ALTER TABLE SUNG_TABLE
DROP CONSTRAINT SYS_C007337;
ALTER TABLE SUNG_TABLE
DROP CONSTRAINT SYS_C007338;

-- ������ ���̺� ������ �Է�
INSERT INTO SYS_TABLE
VALUES('A001','JAVA006$','������');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--���� ���̺� ������ �Է�
INSERT INTO PROF_TABLE
VALUES('P001','�̸��','670912-1234567','1234567');
INSERT INTO PROF_TABLE
VALUES('P002','��ȣ��','751021-1526784','1526784');
INSERT INTO PROF_TABLE
VALUES('P003','�����','770630-2134567','2134567');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. *3

--�л� ���̺� ������ �Է�
INSERT INTO STU_TABLE
VALUES('ST001','�̿���','960523-2658789','2658789');
INSERT INTO STU_TABLE
VALUES('ST002','������','900423-1152369','1152369');
INSERT INTO STU_TABLE
VALUES('ST003','��ҿ�','900213-2236985','2236985');
INSERT INTO STU_TABLE
VALUES('ST004','����ȣ','950630-1584795','1584795');
INSERT INTO STU_TABLE
VALUES('ST005','������','970801-1478523','1478523');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 5

-- ������ Ȯ��
SELECT *
FROM SYS_TABLE;
SELECT *
FROM PROF_TABLE;
SELECT *
FROM STU_TABLE;

--Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

--���ǽ�(ROOM_TABLE) ���̺� ������ �Է�
INSERT INTO ROOM_TABLE
VALUES('R204','���а� 204ȣ');
INSERT INTO ROOM_TABLE
VALUES('R306','�ڿ��� 306ȣ');
INSERT INTO ROOM_TABLE
VALUES('R102','������ 102ȣ');
INSERT INTO ROOM_TABLE
VALUES('R505','��Ƽ�̵�� 505ȣ');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. *4

--����(SCOR_TABLE) ���̺� ������ �Է�
INSERT INTO SCOR_TABLE
VALUES('S001','�ڹ�����SW����');
INSERT INTO SCOR_TABLE
VALUES('S002','��ī�ҿ���');
INSERT INTO SCOR_TABLE
VALUES('S003','��Ʈ��ũ����');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. *3

--���� ���̺� ������ ������Ʈ('S'->'C')
UPDATE SCOR_TABLE
SET SCOR_NO = 'C001'
WHERE SCOR_NO = 'S001';

UPDATE SCOR_TABLE
SET SCOR_NO = 'C002'
WHERE SCOR_NO = 'S003';

UPDATE SCOR_TABLE
SET SCOR_NO = 'C003'
WHERE SCOR_NO = 'S003';
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�. * 3

--����(SSUB_TABLE) ���̺� ������ �Է�
INSERT INTO SSUB_TABLE
VALUES('S001','JAVA');
INSERT INTO SSUB_TABLE
VALUES('S002','DATABASE');
INSERT INTO SSUB_TABLE
VALUES('S003','JSP');
INSERT INTO SSUB_TABLE
VALUES('S004','HTML');
INSERT INTO SSUB_TABLE
VALUES('S005','APACHE');
INSERT INTO SSUB_TABLE
VALUES('S006','SERVELET');
INSERT INTO SSUB_TABLE
VALUES('S007','JAVASCRIPT');
INSERT INTO SSUB_TABLE
VALUES('S008','�̼��а���');
INSERT INTO SSUB_TABLE
VALUES('S009','�߻�ȭ');
INSERT INTO SSUB_TABLE
VALUES('S010','����ġ');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 10

--����(BOOK_TABLE) ���̺� ������ �Է�
INSERT INTO BOOK_TABLE
VALUES('B001','�ڹ�������','��������');
INSERT INTO BOOK_TABLE
VALUES('B002','����ŬSQL�� PL/SQL','��������');
INSERT INTO BOOK_TABLE
VALUES('B003','JSP�� �����ΰ�','��������');
INSERT INTO BOOK_TABLE
VALUES('B004','HTML�� ǥ���� ����','�����ۺ���');
INSERT INTO BOOK_TABLE
VALUES('B005','����ġ��Ĺ','��Ÿ����');
INSERT INTO BOOK_TABLE
VALUES('B006','���� �̰��ϳ��� ������','�Ķ���̽�');
INSERT INTO BOOK_TABLE
VALUES('B007','������Ʈ����','�����ۺ���');
INSERT INTO BOOK_TABLE
VALUES('B008','�̼����̶�','��ī������');
INSERT INTO BOOK_TABLE
VALUES('B009','�߻�ȭ ����','�׸�����');
INSERT INTO BOOK_TABLE
VALUES('B010','����ġ ��ŸƮ','�÷��׷�');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 10


-- Ȯ��
SELECT *
FROM SYS_TABLE;
SELECT *
FROM PROF_TABLE;
SELECT *
FROM STU_TABLE;
SELECT *
FROM SSUB_TABLE;
SELECT *
FROM SCOR_TABLE;
SELECT *
FROM ROOM_TABLE;
SELECT *
FROM BOOK_TABLE;

-- Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


-- �������� ���̺� ������ �Է�
INSERT INTO DCOR_TABLE 
VALUES('DC001', 'C001', 'R204', SYSDATE); -- DC001, �ڹ�����SW����, ���а� 204ȣ, SYSDATE
INSERT INTO DCOR_TABLE 
VALUES('DC002', 'C002', 'R505', SYSDATE); -- DC002, ��Ʈ��ũ����, ��Ƽ�̵�� 505��, SYSDATE
INSERT INTO DCOR_TABLE 
VALUES('DC003', 'C002', 'R505', SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. *3



--Ȯ��
SELECT *
FROM DCOR_TABLE;

-- Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


-- �������� ���̺� ������ �Է�
INSERT INTO DSUB_TABLE
VALUES('DS001','DC001','S001',TO_DATE('2019-08-30','YYYY-MM-DD'), TO_DATE('2019-12-30','YYYY-MM-DD'), 20,40,40,'P001','B001');
INSERT INTO DSUB_TABLE
VALUES('DS002','DC001','S002',TO_DATE('2019-12-31','YYYY-MM-DD'), TO_DATE('2020-01-30','YYYY-MM-DD'), 30,35,35,'P002','B002');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. *2

INSERT INTO DSUB_TABLE
VALUES('DS003','DC002','S003',TO_DATE('2019-10-10','YYYY-MM-DD'), TO_DATE('2019-11-10','YYYY-MM-DD'), 20,40,40,'P001','B003');
INSERT INTO DSUB_TABLE
VALUES('DS004','DC002','S004',TO_DATE('2019-11-11','YYYY-MM-DD'), TO_DATE('2019-12-11','YYYY-MM-DD'), 20,40,40,'P003','B004');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. *2


-- Ȯ��
SELECT *
FROM DSUB_TABLE;

--Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

-- ������û ���̺� ������ �Է�
INSERT INTO SUG_TABLE
VALUES('SU102','ST001','DC001');
INSERT INTO SUG_TABLE
VALUES('SU111','ST002','DC001');
INSERT INTO SUG_TABLE
VALUES('SU256','ST003','DC002');
INSERT INTO SUG_TABLE
VALUES('SU001','ST004','DC002');
INSERT INTO SUG_TABLE
VALUES('SU165','ST005','DC001');
INSERT INTO SUG_TABLE
VALUES('SU110','ST005','DC002');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 6

--Ȯ��
SELECT *
FROM SUG_TABLE;

--Ŀ��
COMMIT;
--Ŀ�� �Ϸ�

-- �ߵ�Ż�� ���̺� ������ �Է�
INSERT INTO FAIL_TABLE
VALUES('SU165',TO_DATE('2019-09-30','YYYY-MM-DD'), '�������');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--Ȯ��
SELECT *
FROM FAIL_TABLE;

--Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

-- SSUB_TABLE ������ ������Ʈ
UPDATE SSUB_TABLE
SET SUB_NAME = 'SERVER'
WHERE SSUB_NO = 'S006';
--==>>1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

-- �������� ���̺� ������ ������Ʈ
UPDATE DSUB_TABLE
SET SSUB_NO = 'S005'
WHERE DSUB_NO = 'DS003';
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

UPDATE DSUB_TABLE
SET SSUB_NO = 'S006'
WHERE DSUB_NO = 'DS004';
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

-- Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

-- �� ������ �߰� �Է�
INSERT INTO SCOR_TABLE
VALUES('C004', '���Ⱦ缺�ڰ���');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO SCOR_TABLE
VALUES('C005','�����ӿ�ũȰ��');
--==>>1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO SCOR_TABLE
VALUES('C006', '������ â��');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO DCOR_TABLE
VALUES('DC003', 'C005', 'R505', TO_DATE('2019-10-04', 'YYYY-MM-DD'));
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO DSUB_TABLE
VALUES('DS005', 'DC003', 'S003', TO_DATE('2019-07-28', 'YYYY-MM-DD'), TO_DATE('2019-09-01'), 10,60,30, 'P002', 'B003');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO DSUB_TABLE
VALUES('DS006', 'DC003', 'S006', TO_DATE('2019-09-02', 'YYYY-MM-DD'), TO_DATE('2019-10-01'), 10,50,40, 'P003', 'B006');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO PROF_TABLE
VALUES('P004', '���̳�', '801226-2345678', '2345678');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

UPDATE FAIL_TABLE
SET FAIL_REA = '�ܼ�����'
WHERE SUG_NO = 'SU165';
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

UPDATE DSUB_TABLE
SET PROF_ID = 'P004'
WHERE DSUB_NO = 'DS003';
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

INSERT INTO STU_TABLE
VALUES('ST006', '������', '961111-2147852', '2147852');
INSERT INTO STU_TABLE
VALUES('ST007', '�̼���', '950528-1369852', '1369852');
INSERT INTO STU_TABLE
VALUES('ST008', '��â��', '950101-1654789', '1654789');
INSERT INTO STU_TABLE
VALUES('ST009', '������', '950823-1123456', '1123456');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 4

INSERT INTO SUG_TABLE
VALUES('SU002' , 'ST009', 'DC003');
INSERT INTO SUG_TABLE
VALUES('SU112' , 'ST007', 'DC003');
INSERT INTO SUG_TABLE
VALUES('SU211' , 'ST003', 'DC003');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. *3

INSERT INTO SUNG_TABLE
VALUES('SU002','DS005', 10,50,25);
INSERT INTO SUNG_TABLE
VALUES('SU112','DS005', 8,55,20);
INSERT INTO SUNG_TABLE
VALUES('SU211','DS005', 10,40,25);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. *3
INSERT INTO SUNG_TABLE
VALUES('SU002','DS006', 10,40,40);
INSERT INTO SUNG_TABLE
VALUES('SU112','DS006', 7,50,30);
INSERT INTO SUNG_TABLE
VALUES('SU211','DS006', 10,45,25);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. *3

-- �� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


-- �������� ���� VIEW ����
CREATE OR REPLACE VIEW VIEW_USER_PROF
AS
SELECT P.PROF_NAME"�����̸�", SS.SUB_NAME"�����̸�", DS.SUB_START"���������", DS.SUB_END"����������", B.BOOK_NAME"å�̸�", R.ROOM_NO"���ǽ�"
            ,CASE WHEN SUB_START > SYSDATE THEN '���� ������' 
                     WHEN SUB_END < SYSDATE THEN '���� �Ϸ�'
                     ELSE  '���� ������'
            END"�������࿩��"
FROM PROF_TABLE P, DSUB_TABLE DS, SSUB_TABLE SS, BOOK_TABLE B, DCOR_TABLE DC, SCOR_TABLE SC , ROOM_TABLE R
WHERE P.PROF_ID(+) = DS.PROF_ID
           AND DS.SSUB_NO = SS.SSUB_NO(+)
           AND DS.BOOK_NO = B.BOOK_NO(+)
           AND DS.DCOR_NO =DC.DCOR_NO(+)
           AND DC.SCOR_NO =  SC.SCOR_NO(+)
           AND DC.ROOM_NO = R.ROOM_NO(+)
ORDER BY 1,3;
--==>> View VIEW_PROF��(��) �����Ǿ����ϴ�.

-- ������ VIEW_PROF Ȯ��
SELECT *
FROM VIEW_PROF;

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

-- ���� ���� ����  PRC_UPDATE_PROF
CREATE OR REPLACE PROCEDURE PRC_UPDATE_PROF
( V_PROF_ID         IN      PROF_TABLE.PROF_ID%TYPE 
, V_PROF_NAME    IN      PROF_TABLE.PROF_NAME%TYPE
, V_PROF_PW        IN      PROF_TABLE.PROF_PW%TYPE
)
IS
BEGIN
    
    UPDATE PROF_TABLE
    SET PROF_NAME = V_PROF_NAME, PROF_PW = V_PROF_PW
    WHERE PROF_ID = V_PROF_ID;
    
END;
--==>> Procedure PRC_UPDATE_PROF��(��) �����ϵǾ����ϴ�.

-- ���� ���� ���� TRG_DELETE_PROF
CREATE OR REPLACE TRIGGER TRG_DELETE_PROF
                                BEFORE
                                DELETE ON PROF_TABLE
                                FOR EACH ROW
                                
DECLARE V_SUB_START     NUMBER;
BEGIN

    SELECT COUNT(*)                 INTO V_SUB_START
    FROM DSUB_TABLE
    WHERE PROF_ID = :OLD.PROF_ID AND SUB_START <= SYSDATE AND SUB_END > SYSDATE;


    IF (V_SUB_START >= 1) 
        THEN RAISE_APPLICATION_ERROR(-2004,'�̹� ������ ���۵� �����Դϴ�.');
    END IF;
    
    DELETE
    FROM DSUB_TABLE
    WHERE PROF_ID = :OLD.PROF_ID;
END;
--==>> Trigger TRG_DELETE_PROF��(��) �����ϵǾ����ϴ�.


-- ���� �α���
CREATE OR REPLACE PROCEDURE PRC_LOGIN_PROF
(  V_ID       IN  PROF_TABLE.PROF_ID%TYPE
,  V_PW      IN  PROF_TABLE.PROF_PW%TYPE
)
IS
    V_NAME                          PROF_TABLE.PROF_NAME%TYPE;
    USER_DEFINE_ERROR1        EXCEPTION;
    USER_DEFINE_ERROR2        EXCEPTION;
    TEMP_ID                           NUMBER;
    TEMP_PW                          NUMBER;
    
BEGIN
    
    SELECT COUNT(*)              INTO TEMP_ID
    FROM PROF_TABLE
    WHERE PROF_ID = V_ID;
    
    IF TEMP_ID = 0
        THEN RAISE USER_DEFINE_ERROR1;  
    END IF;
    
    SELECT COUNT(*)              INTO TEMP_PW
    FROM PROF_TABLE
    WHERE PROF_ID = V_ID AND PROF_PW = V_PW;
    
    IF TEMP_PW = 0
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;
    
    SELECT PROF_NAME        INTO V_NAME
    FROM PROF_TABLE
    WHERE PROF_ID = V_ID AND PROF_PW =  V_PW;
    
    
    DBMS_OUTPUT.PUT_LINE(V_NAME  || '�����ڷ� �α��� �Ǿ����ϴ�.');
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20006, '���̵� ��ġ�����ʽ��ϴ�.');
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20007, '��й�ȣ�� ��ġ�����ʽ��ϴ�.');
            
    COMMIT;

END;
--==>> Procedure PRC_LOGIN_PROF��(��) �����ϵǾ����ϴ�.

-- �л� �α���
CREATE OR REPLACE PROCEDURE PRC_LOGIN_STU
(  V_ID       IN    STU_TABLE.STU_ID%TYPE
,  V_PW      IN    STU_TABLE.STU_PW%TYPE 
)
IS
    V_NAME                           STU_TABLE.STU_NAME%TYPE;
    USER_DEFINE_ERROR1        EXCEPTION;
    USER_DEFINE_ERROR2        EXCEPTION;
    TEMP_ID                           NUMBER;
    TEMP_PW                          NUMBER;
    
BEGIN
    
    SELECT COUNT(*)              INTO TEMP_ID
    FROM STU_TABLE
    WHERE STU_ID = V_ID;
    
    IF TEMP_ID = 0
        THEN RAISE USER_DEFINE_ERROR1;  
    END IF;
    
    SELECT COUNT(*)              INTO TEMP_PW
    FROM STU_TABLE
    WHERE STU_ID = V_ID AND STU_PW = V_PW;
    
    IF TEMP_PW = 0
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;
    
    SELECT STU_NAME        INTO V_NAME
    FROM STU_TABLE
    WHERE STU_ID = V_ID AND STU_PW =  V_PW;
    
    
    DBMS_OUTPUT.PUT_LINE(V_NAME  || '�л����� �α��� �Ǿ����ϴ�.');
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20006, '���̵� ��ġ�����ʽ��ϴ�.');
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20007, '��й�ȣ�� ��ġ�����ʽ��ϴ�.');
            
    COMMIT;

END;
--==>> Procedure PRC_LOGIN_STU��(��) �����ϵǾ����ϴ�.

-- ������ �α���
CREATE OR REPLACE PROCEDURE PRC_LOGIN_SYS
(  V_ID       IN    SYS_TABLE.SYS_ID%TYPE
,  V_PW      IN    SYS_TABLE.SYS_PW%TYPE 
)
IS
    V_NAME                           SYS_TABLE.SYS_NAME%TYPE;
    USER_DEFINE_ERROR1        EXCEPTION;
    USER_DEFINE_ERROR2        EXCEPTION;
    TEMP_ID                           NUMBER;
    TEMP_PW                          NUMBER;
    
BEGIN
    
    SELECT COUNT(*)              INTO TEMP_ID
    FROM SYS_TABLE
    WHERE SYS_ID = V_ID;
    
    IF TEMP_ID = 0
        THEN RAISE USER_DEFINE_ERROR1;  
    END IF;
    
    SELECT COUNT(*)              INTO TEMP_PW
    FROM SYS_TABLE
    WHERE SYS_ID = V_ID AND SYS_PW = V_PW;
    
    IF TEMP_PW = 0
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;
    
    SELECT SYS_NAME        INTO V_NAME
    FROM SYS_TABLE
    WHERE SYS_ID = V_ID AND SYS_PW =  V_PW;
    
    
    DBMS_OUTPUT.PUT_LINE(V_NAME  || '�����ڷ� �α��� �Ǿ����ϴ�.');
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20006, '���̵� ��ġ�����ʽ��ϴ�.');
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20007, '��й�ȣ�� ��ġ�����ʽ��ϴ�.');
            
    COMMIT;

END;
--==>> Procedure PRC_LOGIN_SYS��(��) �����ϵǾ����ϴ�.

---------------------------------------------------------------------------------------------------------------------------------- ����ҿ���

CREATE OR REPLACE VIEW VIEW_USER_DSUB   --�����ڿ��� ���� ��ºκ�
AS
SELECT A.COR_NAME"������",C.ROOM_INFO"���ǽ�",E.SUB_NAME"�����"
        ,D.SUB_START"���������",D.SUB_END"����������",F.BOOK_NAME"�����",G.PROF_NAME"�����ڸ�"
FROM SCOR_TABLE A, DCOR_TABLE B,ROOM_TABLE C,DSUB_TABLE D,SSUB_TABLE E,BOOK_TABLE F,PROF_TABLE G
WHERE A.SCOR_NO(+) = B.SCOR_NO 
        AND B.ROOM_NO = C.ROOM_NO(+)
        AND B.DCOR_NO(+) = D.DCOR_NO
        AND D.SSUB_NO = E.SSUB_NO(+)
        AND D.BOOK_NO = F.BOOK_NO(+)
        AND D.PROF_ID = G.PROF_ID(+)
        
CREATE OR REPLACE PROCEDURE PRC_UPDATE_SUB --�����ڿ��� ���� ������Ʈ �κ� (���߿� �������� �ʿ��� �� ����!!)
( V_SSUB_NO      IN SSUB_TABLE.SSUB_NO%TYPE
, V_SUB_NAME     IN SSUB_TABLE.SUB_NAME%TYPE
)
IS
BEGIN
    UPDATE SSUB_TABLE
    SET SSUB_NO =V_SSUB_NO, SUB_NAME = V_SUB_NAME
    WHERE  SSUB_NO = V_SSUB_NO;

END;       
-------------------------------------------------------------------------------------------------------------------<�����̰� ��...>
CREATE OR REPLACE TRIGGER TRG_DSUB  -- �������� ��ġ�� Ʈ����(�������̺� ����)
        BEFORE
        DELETE ON DSUB_TABLE
        FOR EACH ROW
BEGIN
    DELETE
    FROM SUNG_TABLE
    WHERE DSUB_NO = :OLD.DSUB_NO; 
END;
--==>> Trigger TRG_DSUB��(��) �����ϵǾ����ϴ�.


CREATE OR REPLACE TRIGGER TRG_SSUB  -- ���� ��ġ�� Ʈ����(�������� ���� ������ ����)
        BEFORE
        DELETE ON SSUB_TABLE
        FOR EACH ROW
BEGIN
    DELETE
    FROM DSUB_TABLE
    WHERE SSUB_NO = :OLD.SSUB_NO;
END;
--==>> Trigger TRG_SSUB��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------- ���̿�����

/*
- �����ڴ� ���� ���� ������ �̸� ���
- ������, �����Ⱓ(����, ��), ���ǽ� ���� �Է�
- ��ϵ� ��� ���� ���� ��� 
   : ������, ���ǽ�, �����, ����Ⱓ(����, ��), �����, �����ڸ�
- �������� ���� : PROCEDURE
  �������� ���� : TRIGGER -> ������û, ���������� ���������ڵ� ����
*/

-- PRC_DCOR_UPDATE : DCOR_TABLE(��������) ������ �����ϱ� ���� ���ν��� ����
CREATE OR REPLACE PROCEDURE PRC_DCOR_UPDATE
( V_DCOR_NO   IN DCOR_TABLE.DCOR_NO%TYPE     -- ����� �����������ڵ塻
, V_SCOR_NO   IN DCOR_TABLE.SCOR_NO%TYPE     -- ������ ������ ��ȣ��
, V_ROOM_NO   IN DCOR_TABLE.ROOM_NO%TYPE     -- ������ �����ǽ� ��ȣ��
, V_COR_DATE  IN DCOR_TABLE.COR_DATE%TYPE    -- ������ �����������ϡ�
)
IS    
BEGIN
    -- �ش� �����������ڵ塻�� ã�� ���� ������ȣ�� V_SCOR_NO ���� ����
    -- �ش� �����ǽǹ�ȣ���� ã�� ���� ���ǽǹ�ȣ�� V_ROOM_NO ���� ����
    -- �ش� �����������ϡ��� ã�� ���� ������������ V_COR_DATE ���� ����
    UPDATE DCOR_TABLE
    SET SCOR_NO = V_SCOR_NO, ROOM_NO = V_ROOM_NO, COR_DATE = V_COR_DATE
    WHERE DCOR_NO = V_DCOR_NO;
    
    -- COMMIT;
    
END;
--==>> Procedure PRC_DCOR_UPDATE��(��) �����ϵǾ����ϴ�.


-- TRG_DCOR_DELETE : DCOR_TABLE(��������) ������ ������ �� ����� ���ν��� ����
CREATE OR REPLACE TRIGGER TRG_SCOR_DELETE
    BEFORE
    DELETE ON DCOR_TABLE                    -- �������� ���̺��� ����ó���� �̷���� ��
    FOR EACH ROW

BEGIN   
    DELETE 
    FROM SUG_TABLE                              -- ������û ���̺���
    WHERE DCOR_NO = :OLD.DCOR_NO;   -- �����ϴ� ���������ڵ�� ��ġ�ϴ� ������ ����
    
    DELETE
    FROM DSUB_TABLE                            -- �������� ���̺���
    WHERE DCOR_NO = :OLD.DCOR_NO;   -- �����ϴ� ���������ڵ�� ��ġ�ϴ� ������ ����
    
END;
--==>> Trigger TRG_SCOR_DELETE��(��) �����ϵǾ����ϴ�.

------------------ TEST : ����������ȣ�� ��DC003���� ����(�����Ǿ� �ִ� ������) ����
DELETE
FROM DCOR_TABLE
WHERE DCOR_NO = 'DC003';

ROLLBACK;

----------------------------------------------------------------------------------------------

-- ��ϵ� ��� ���� ���� ��� 
--  : ������(SCOR_TABLE # COR_NAME), ���ǽ�(ROOM_TABLE # ROOM_INFO), �����(SSUB_TABLE # SUB_NAME)
--    , ����Ⱓ(DSUB_TABLE # SUB_START, SUB_END), �����(BOOK_TABLE # BOOK_NAME), �����ڸ�(PROF_TABLE # PROF_NAME)
/*
------ ��� ��
SELECT B.COR_NAME, C.ROOM_INFO, D.DSUB_NO, E.SUB_NAME, D.SUB_START, D.SUB_END, F.BOOK_NAME, G.PROF_NAME
  FROM DCOR_TABLE A, SCOR_TABLE B, ROOM_TABLE C, DSUB_TABLE D, SSUB_TABLE E, BOOK_TABLE F, PROF_TABLE G
 WHERE A.SCOR_NO    = B.SCOR_NO(+)
   AND A.ROOM_NO    = C.ROOM_NO(+)
   AND A.DCOR_NO    = D.DCOR_NO(+)
   AND D.SSUB_NO    = E.SSUB_NO(+)
   AND D.BOOK_NO    = F.BOOK_NO(+)
   AND D.PROF_ID    = G.PROF_ID(+);
*/
------ ��� ��
CREATE OR REPLACE VIEW VIEW_USER_DCOR
AS
SELECT B.COR_NAME "������", C.ROOM_INFO"���ǽ�", D.DSUB_NO"�����ȣ", E.SUB_NAME"�����"
     , D.SUB_START"��������", D.SUB_END"��������", F.BOOK_NAME"�����", G.PROF_NAME"�����ڸ�"
FROM DCOR_TABLE A LEFT JOIN SCOR_TABLE B
                           ON A.SCOR_NO = B.SCOR_NO      -- ����, �������� ���̺��� SCOR_NO(������ȣ)�� ����
                                                                            -- : ������(COR_NAME) ��� ���ؼ�
                  LEFT JOIN ROOM_TABLE C
                           ON A.ROOM_NO = C.ROOM_NO   -- ��������, ���ǽ� ���̺��� ROOM_NO(���ǽǹ�ȣ)�� ����
                                                                            -- : ���ǽ� ����(ROOM_INFO) ��� ���ؼ�
                  LEFT JOIN DSUB_TABLE D
                           ON A.DCOR_NO = D.DCOR_NO     -- ��������, �������� ���̺��� DCOR_NO(����������ȣ)�� ����
                                                                            -- : ��������, ��������(SUB_START, SUB_END) ��� ���ؼ�
                  LEFT JOIN SSUB_TABLE E
                           ON D.SSUB_NO = E.SSUB_NO       -- ��������, ���� ���̺��� SSUB_NO(�����ȣ)�� ����
                                                                            -- : �����ȣ, �����(DSUB_NO, SUB_NAME) ��� ���ؼ�
                  LEFT JOIN BOOK_TABLE F
                           ON D.BOOK_NO = F.BOOK_NO     -- ��������, ���� ���̺��� BOOK_NO(�����ȣ)�� ����
                                                                            -- : �����(BOOK_NAME) ��� ���ؼ�
                  LEFT JOIN PROF_TABLE G    
                           ON D.PROF_ID = G.PROF_ID;         -- ��������, ���� ���̺��� PROF_ID(������ȣ)�� ����
                                                                            -- : �����ڸ�(PROF_NAME) ��� ���ؼ�
                           
SELECT *
FROM VIEW_USER_DCOR;
--==>>
/*
�ڹ�����SW����   ���а� 204ȣ       DS001   JAVA       19/08/30   19/12/30   �ڹ�������               �̸��
�ڹ�����SW����   ���а� 204ȣ       DS002   DATABASE   19/12/31   20/01/30   ����ŬSQL�� PL/SQL       ��ȣ��
��ī�ҿ���       ������ 102ȣ       DS003   APACHE       19/10/10   19/11/10   JSP�� �����ΰ�           ���̳�
�����ӿ�ũȰ��   ��Ƽ�̵�� 505ȣ   DS005   JSP           19/07/28   19/09/01   JSP�� �����ΰ�           ��ȣ��
��ī�ҿ���       ������ 102ȣ       DS004   SERVER       19/11/11   19/12/11   HTML�� ǥ���� ����       �����
�����ӿ�ũȰ��   ��Ƽ�̵�� 505ȣ   DS006   SERVER       19/09/02   19/10/01   ���� �̰��ϳ��� ������   �����                  
*/

--------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------- ����������

CREATE OR REPLACE VIEW VIEW_STU -- ���� ���� �� �ش� ���� ���� ���� ��� VIEW
AS
SELECT ROW_NUMBER() OVER(PARTITION BY S.STU_ID ORDER BY D.SUB_START)"��ȣ"
     , S.STU_ID"�л���ȣ"
     , U.SUB_NAME"�����"
     , D.SUB_START"������"
     , D.SUB_END"����"
     , B.BOOK_NAME"�����"
     , S.STU_NAME "�л���"
     , N.SUNG_ATT"���"
     , N.SUNG_W"�ʱ�"
     , N.SUNG_P"�Ǳ�"
     , (N.SUNG_ATT + N.SUNG_W + N.SUNG_P)"����"
     , RANK() OVER(PARTITION BY U.SUB_NAME ORDER BY (N.SUNG_ATT + N.SUNG_W + N.SUNG_P) DESC)"����"
FROM STU_TABLE S RIGHT JOIN SUG_TABLE G
                 ON S.STU_ID = G.STU_ID
                 RIGHT JOIN SUNG_TABLE N
                 ON G.SUG_NO = N.SUG_NO
                 LEFT JOIN DSUB_TABLE D
                 ON N.DSUB_NO = D.DSUB_NO
                 LEFT JOIN SSUB_TABLE U
                 ON D.SSUB_NO = U.SSUB_NO
                 LEFT JOIN BOOK_TABLE B
                 ON D.BOOK_NO = B.BOOK_NO;

SELECT *
FROM VIEW_STU;

CREATE OR REPLACE VIEW VIEW_STU_FAIL -- (�ߵ�Ż�����ΰ� �ִ� ���)���� ���� �� �ش� ���� ���� ���� ��� VIEW   
AS
SELECT ROW_NUMBER() OVER(PARTITION BY S.STU_ID ORDER BY D.SUB_START)"��ȣ"
     , S.STU_ID"�л���ȣ"
     , U.SUB_NAME"�����"
     , D.SUB_START"������"
     , D.SUB_END"����"
     , B.BOOK_NAME"�����"
     , S.STU_NAME "�л���"
     , N.SUNG_ATT"���"
     , N.SUNG_W"�ʱ�"
     , N.SUNG_P"�Ǳ�"
     , (N.SUNG_ATT + N.SUNG_W + N.SUNG_P)"����"
     , RANK() OVER(PARTITION BY U.SUB_NAME ORDER BY (N.SUNG_ATT + N.SUNG_W + N.SUNG_P) DESC)"����"
     , F.FAIL_DATE"Ż������"
     , F.FAIL_REA"Ż������"
FROM STU_TABLE S RIGHT JOIN SUG_TABLE G
                 ON S.STU_ID = G.STU_ID
                 LEFT JOIN FAIL_TABLE F
                 ON G.SUG_NO = F.SUG_NO
                 RIGHT JOIN SUNG_TABLE N
                 ON G.SUG_NO = N.SUG_NO
                 LEFT JOIN DSUB_TABLE D
                 ON N.DSUB_NO = D.DSUB_NO
                 LEFT JOIN SSUB_TABLE U
                 ON D.SSUB_NO = U.SSUB_NO
                 LEFT JOIN BOOK_TABLE B
                 ON D.BOOK_NO = B.BOOK_NO;
                 
                 

CREATE OR REPLACE VIEW VIEW_STU_LIST -- �л� �α��� �� ���� ��� ��
AS
SELECT ROW_NUMBER() OVER(PARTITION BY S.STU_ID ORDER BY D.SUB_START)"��ȣ"
     , S.STU_ID"�л���ȣ"
     , U.SUB_NAME"�����"
     , D.SUB_START"������"
     , D.SUB_END"����"
FROM STU_TABLE S RIGHT JOIN SUG_TABLE G
                 ON S.STU_ID = G.STU_ID
                 RIGHT JOIN SUNG_TABLE N
                 ON G.SUG_NO = N.SUG_NO
                 LEFT JOIN DSUB_TABLE D
                 ON N.DSUB_NO = D.DSUB_NO
                 LEFT JOIN SSUB_TABLE U
                 ON D.SSUB_NO = U.SSUB_NO
                 LEFT JOIN BOOK_TABLE B
                 ON D.BOOK_NO = B.BOOK_NO
WHERE D.SUB_END < SYSDATE;

SET SERVEROUTPUT ON;

------------------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE PRO_STU_FAIL             -- �л���ȣ �� �����Ͽ� ���� ���� ���� ���� ��� ���ν���
( SUG_STU_ID   IN  STU_TABLE.STU_ID%TYPE                     -- �л� ��ȣ �ޱ�
, DSUB_START_DATE  IN  DSUB_TABLE.SUB_START%TYPE    -- ���� ���� ���� �ޱ�(���� ������ �⵵/��/�� �� ��� ��ġ�� ���� ����)
)
IS  
    COUNTER_DIS     NUMBER;                                         -- �ߵ�Ż�� ���θ� �����ϴ� ������
    T_STU   VIEW_STU%ROWTYPE;                                     -- (�ߵ�Ż��X) ��� ����
    T_STUF  VIEW_STU_FAIL%ROWTYPE;                             -- (�ߵ�Ż��O) ��� ����
    
BEGIN
    
    SELECT COUNT(*) INTO COUNTER_DIS                         -- ������ ����
    FROM FAIL_TABLE
    WHERE SUG_NO = ANY(SELECT SUG_NO
                       FROM SUG_TABLE
                       WHERE STU_ID = SUG_STU_ID);
    
    IF (COUNTER_DIS = 0)                                                -- �ߵ� Ż�� ���ΰ� ���� ���(Ż������, Ż������ ����)
        THEN 
        
                SELECT �л���ȣ, �����, ������, ����, �����, �л���, ���, �ʱ�, �Ǳ�, ����, ����
                    INTO T_STU.�л���ȣ, T_STU.�����, T_STU.������, T_STU.����
                    , T_STU.�����, T_STU.�л���, T_STU.���, T_STU.�ʱ�, T_STU.�Ǳ�, T_STU.����, T_STU.����
                FROM VIEW_STU
                WHERE �л���ȣ = SUG_STU_ID
                  AND ������ = DSUB_START_DATE;
                
                DBMS_OUTPUT.PUT_LINE(T_STU.�л���ȣ ||', '|| T_STU.����� ||', '|| T_STU.������ ||', '|| T_STU.����
                     ||', '|| T_STU.����� ||', '|| T_STU.�л��� ||', '|| T_STU.��� 
                     ||', '|| T_STU.�ʱ� ||', '|| T_STU.�Ǳ� ||', '|| T_STU.���� ||', '|| T_STU.����);
            
    ELSE                                                                        -- �ߵ� Ż�� ���ΰ� �ִ� ���(Ż������, Ż������ �߰�)
                                 
                SELECT �л���ȣ, �����, ������, ����, �����, �л���, ���, �ʱ�, �Ǳ�, ����, ����, Ż������, Ż������
                    INTO T_STUF.�л���ȣ, T_STUF.�����, T_STUF.������, T_STUF.����
                    , T_STUF.�����, T_STUF.�л���, T_STUF.���, T_STUF.�ʱ�, T_STUF.�Ǳ�, T_STUF.����, T_STUF.����
                    , T_STUF.Ż������, T_STUF.Ż������
                FROM VIEW_STU_FAIL
                WHERE �л���ȣ = SUG_STU_ID
                  AND ������ = DSUB_START_DATE;
                
                DBMS_OUTPUT.PUT_LINE(T_STUF.�л���ȣ ||', '|| T_STUF.����� ||', '|| T_STUF.������ ||', '|| T_STUF.����
                     ||', '|| T_STUF.����� ||', '|| T_STUF.�л��� ||', '|| T_STUF.��� 
                     ||', '|| T_STUF.�ʱ� ||', '|| T_STUF.�Ǳ� ||', '|| T_STUF.���� ||', '|| T_STUF.���� ||', '|| T_STUF.Ż������ ||', '|| T_STUF.Ż������);
            
    END IF;
    --COMMIT;
END;

-- ����
-- �����δ� �������̽��� ���� Ŭ���� �ϰԵǸ� �ش� ������ �Ѱܹ޴´ٰ� �����Ͽ� ���ν����� �ӽù��� ǥ���� �ϰ� �Ǿ���.
EXEC PRO_STU_FAIL('ST003', '19/07/28');
/*
ST003, JSP, 19/07/28, 19/09/01, JSP�� �����ΰ�, ��ҿ�, 10, 40, 25, 75, 3
*/

------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRO_STU_LOGIN -- �л� �α��� ��, ����� ���� ����Ʈ ��� VIEW
( LIST_STU_ID   IN  STU_TABLE.STU_ID%TYPE -- �л� ��ȣ �ޱ�
)
IS
    COUNTER  NUMBER; -- ���� ����
    COUNTER_LIST NUMBER; -- �л���ȣ�� ��ġ�ϴ� ���� ���� ���� ����
    T_STUL   VIEW_STU_LIST%ROWTYPE; -- VIEW_STU_LIST ���� ���� ����
    
BEGIN
    
                                       
    SELECT COUNT(*) INTO COUNTER_LIST -- �л���ȣ ��ġ�ϴ� ���� ���� ����
    FROM VIEW_STU_LIST
    WHERE �л���ȣ = LIST_STU_ID;   
                      
    
    
    FOR COUNTER IN 1 .. COUNTER_LIST LOOP -- ���� ������ŭ ���
                
                SELECT ��ȣ, �л���ȣ, �����, ������, ����
                    INTO T_STUL.��ȣ, T_STUL.�л���ȣ, T_STUL.�����, T_STUL.������, T_STUL.����
                FROM VIEW_STU_LIST
                WHERE �л���ȣ = LIST_STU_ID
                  AND ��ȣ = COUNTER;
                
                DBMS_OUTPUT.PUT_LINE(T_STUL.��ȣ ||', '|| T_STUL.�л���ȣ ||', '|| T_STUL.����� ||', '|| T_STUL.������ ||', '|| T_STUL.����);
            
    END LOOP;
    
    --COMMIT;
    
    
END;


-- ����
-- ���� �������̽��� ���� �л��� ���� ������ �������ִٰ� �����Ͽ� ���ν����� �����غ��Ҵ�.
EXEC PRO_STU_LOGIN('ST003');
/*
1, ST003, JSP, 19/07/28, 19/09/01
2, ST003, SERVER, 19/09/02, 19/10/01
*/

------------------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER TRG_DSUB  -- �������� ��ġ�� Ʈ����(�������̺� ����)
        BEFORE
        DELETE ON DSUB_TABLE
        FOR EACH ROW
BEGIN
    DELETE
    FROM SUNG_TABLE
    WHERE DSUB_NO = :OLD.DSUB_NO; 
END;
--==>> Trigger TRG_DSUB��(��) �����ϵǾ����ϴ�.


CREATE OR REPLACE TRIGGER TRG_SSUB  -- ���� ��ġ�� Ʈ����(�������� ���� ������ ����)
        BEFORE
        DELETE ON SSUB_TABLE
        FOR EACH ROW
BEGIN
    DELETE
    FROM DSUB_TABLE
    WHERE SSUB_NO = :OLD.SSUB_NO;
END;
--==>> Trigger TRG_SSUB��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------- ����������

CREATE OR REPLACE VIEW VIEW_PROF_START  /*(������ ����) ���� ��� ��*/
AS
SELECT  D.DSUB_NO "���������ڵ�", S.SUB_NAME "�����", D.SUB_START "������", D.SUB_END "������"
        , CASE WHEN SUB_START > SYSDATE THEN '���� ������' 
               WHEN SUB_END < SYSDATE THEN '���� �Ϸ�'
               ELSE  '���� ������' END "���ǻ���"
FROM    DSUB_TABLE D JOIN PROF_TABLE P
ON      D.PROF_ID = P.PROF_ID
        JOIN SSUB_TABLE S
        ON  D.SSUB_NO = S.SSUB_NO;
        
        
CREATE OR REPLACE VIEW VIEW_PROF_SUNGJUK_IN     /*(������ ����) �л� ���� �Է� ��*/
AS
SELECT  S.SUB_NAME "�����", ST.STU_ID "�л���ȣ", ST.STU_NAME "�л���"
      , SU.SUNG_ATT "���", SU.SUNG_W "�ʱ�", SU.SUNG_P "�Ǳ�"
      , (SU.SUNG_ATT + SU.SUNG_W + SU.SUNG_P) "����"
FROM    DSUB_TABLE D JOIN SSUB_TABLE S
ON  D.SSUB_NO = S.SSUB_NO
        JOIN SUNG_TABLE SU
        ON  D.DSUB_NO = SU.DSUB_NO
            JOIN SUG_TABLE SUG
            ON SU.SUG_NO = SUG.SUG_NO
                JOIN STU_TABLE ST
                ON  SUG.STU_ID = ST.STU_ID
                    LEFT JOIN FAIL_TABLE F
                    ON SUG.SUG_NO = F.SUG_NO
                    WHERE F.SUG_NO IS NULL;
                    

CREATE OR REPLACE VIEW VIEW_PROF_SUNGJUK_OUT    /*(������ ����) ��� �л� ���� ��� ��*/
AS
SELECT  S.SUB_NAME "�����", D.SUB_START "������", D.SUB_END "������", B.BOOK_NAME "�����", ST.STU_ID "�л���ȣ", ST.STU_NAME "�л���"
      , SU.SUNG_ATT "���", SU.SUNG_W "�ʱ�", SU.SUNG_P "�Ǳ�"
      , (SU.SUNG_ATT + SU.SUNG_W + SU.SUNG_P) "����"
      , RANK() OVER(PARTITION BY D.DSUB_NO ORDER BY (NVL(SU.SUNG_ATT,0) + NVL(SU.SUNG_W,0) + NVL(SU.SUNG_P,0)) DESC) "���"
      , DECODE(F.SUG_NO, NULL, 'N', 'Y') "Ż������"
FROM    DSUB_TABLE D JOIN PROF_TABLE P
ON      D.PROF_ID = P.PROF_ID
        JOIN SSUB_TABLE S
        ON  D.SSUB_NO = S.SSUB_NO
            JOIN BOOK_TABLE B
            ON  D.BOOK_NO = B.BOOK_NO
                JOIN SUNG_TABLE SU
                ON  D.DSUB_NO = SU.DSUB_NO
                    JOIN SUG_TABLE SUG
                    ON SU.SUG_NO = SUG.SUG_NO
                        JOIN STU_TABLE ST
                        ON  SUG.STU_ID = ST.STU_ID
                            LEFT JOIN FAIL_TABLE F
                            ON  SUG.SUG_NO = F.SUG_NO;


CREATE OR REPLACE VIEW VIEW_PROF_SUNGJUK_OUT_F  /*(������ ����) �ߵ�Ż�� �л� ���� ��� ��*/
AS
SELECT  S.SUB_NAME "�����", D.SUB_START "������", D.SUB_END "������", B.BOOK_NAME "�����", ST.STU_ID "�л���ȣ", ST.STU_NAME "�л���"
      , SU.SUNG_ATT "���", SU.SUNG_W "�ʱ�", SU.SUNG_P "�Ǳ�"
      , (SU.SUNG_ATT + SU.SUNG_W + SU.SUNG_P) "����"
      , RANK() OVER(PARTITION BY D.DSUB_NO ORDER BY (NVL(SU.SUNG_ATT,0) + NVL(SU.SUNG_W,0) + NVL(SU.SUNG_P,0)) DESC) "���"
      , F.FAIL_DATE "Ż������"
      , F.FAIL_REA "Ż������"
FROM    DSUB_TABLE D JOIN PROF_TABLE P
ON      D.PROF_ID = P.PROF_ID
        JOIN SSUB_TABLE S
        ON  D.SSUB_NO = S.SSUB_NO
            JOIN BOOK_TABLE B
            ON  D.BOOK_NO = B.BOOK_NO
                JOIN SUNG_TABLE SU
                ON  D.DSUB_NO = SU.DSUB_NO
                    JOIN SUG_TABLE SUG
                    ON SU.SUG_NO = SUG.SUG_NO
                        JOIN STU_TABLE ST
                        ON  SUG.STU_ID = ST.STU_ID
                            JOIN FAIL_TABLE F
                            ON  SUG.SUG_NO = F.SUG_NO;


CREATE OR REPLACE PROCEDURE PRO_PROF_SUNGJUK_INSERT     /*�л� ���� �Է� ���ν���*/
( V_SUGNO   IN SUNG_TABLE.SUG_NO%TYPE
, V_DSUBNO  IN SUNG_TABLE.DSUB_NO%TYPE
, V_ATT     IN SUNG_TABLE.SUNG_ATT%TYPE
, V_WRITE   IN SUNG_TABLE.SUNG_W%TYPE
, V_PRAC    IN SUNG_TABLE.SUNG_P%TYPE
)
IS
    S_SUGNO     SUG_TABLE.SUG_NO%TYPE;
    S_DSUBNO    DSUB_TABLE.DSUB_NO%TYPE;
    S_START     DSUB_TABLE.SUB_START%TYPE;
    S_ATT       DSUB_TABLE.ATT_SCORE%TYPE;
    S_W         DSUB_TABLE.W_SCORE%TYPE;
    S_P         DSUB_TABLE.P_SCORE%TYPE;
    ERROR1      EXCEPTION;
    ERROR2      EXCEPTION;

BEGIN
    SELECT SUG_NO INTO S_SUGNO
    FROM SUG_TABLE
    WHERE SUG_NO = V_SUGNO;
    
    SELECT DSUB_NO, ATT_SCORE, W_SCORE, P_SCORE, SUB_START INTO S_DSUBNO, S_ATT, S_W, S_P, S_START
    FROM DSUB_TABLE
    WHERE DSUB_NO = V_DSUBNO;
    
    IF (SYSDATE < S_START)
        THEN RAISE ERROR1;
    END IF;
    
    IF (V_ATT > S_ATT) OR (V_WRITE > S_W) OR (V_PRAC > S_P)
        THEN RAISE ERROR2;
    END IF;
    
    IF ((V_SUGNO = S_SUGNO) AND (V_DSUBNO = S_DSUBNO))
        THEN INSERT INTO SUNG_TABLE(SUG_NO, DSUB_NO, SUNG_ATT, SUNG_W, SUNG_P)
        VALUES(S_SUGNO, S_DSUBNO, V_ATT, V_WRITE, V_PRAC);
    END IF;
    
    EXCEPTION
        WHEN ERROR1
            THEN RAISE_APPLICATION_ERROR(-20100, '�����Է±Ⱓ�� �ƴմϴ�.');
            ROLLBACK;
        WHEN ERROR2
            THEN RAISE_APPLICATION_ERROR(-20101, '������ ������ ���� �ʽ��ϴ�.');
            ROLLBACK;
END;
/*
-- EXEC PRO_PROF_SUNGJUK_INSERT('SU102', 'DS001', 20, 41, 40);
������û��ȣ, ���������ڵ带 �������� ���, �ʱ�, �Ǳ� ������ �Է��ϴ� ���ν���
����������� ���纸�� �̷���� ���ܹ߻�, 
�������� ���̺��� ������ ������ �Է������� ���� ������ ���ܹ߻�
*/
 
CREATE OR REPLACE PROCEDURE PRO_PROF_SUNGJUK_SAVE   /*(������ ����) ���� ���� ��� ���ν���*/
( V_INPUT   IN NUMBER
)
IS
BEGIN
    IF (V_INPUT = 1)
        THEN DBMS_OUTPUT.PUT_LINE('���� �Ϸ�');
            COMMIT;
    ELSE DBMS_OUTPUT.PUT_LINE('������ ����Ͽ����ϴ�.');
    END IF;
END;
/*
-- EXEC PRO_PROF_SUNGJUK_SAVE(2);
���� ����� 1�̶� �����ϰ� ����ڰ� 1�� �Է��ҽ� COMMIT
*/

CREATE OR REPLACE PROCEDURE PRO_PROF_SUNGJUK_UPDATE     /*�л� ���� ���� ���ν���*/
( V_SUGNO   IN SUNG_TABLE.SUG_NO%TYPE
, V_DSUBNO  IN SUNG_TABLE.DSUB_NO%TYPE
, V_ATT     IN SUNG_TABLE.SUNG_ATT%TYPE
, V_WRITE   IN SUNG_TABLE.SUNG_W%TYPE
, V_PRAC    IN SUNG_TABLE.SUNG_P%TYPE
)
IS
    S_SUGNO     SUG_TABLE.SUG_NO%TYPE;
    S_DSUBNO    DSUB_TABLE.DSUB_NO%TYPE;
    S_ATT       DSUB_TABLE.ATT_SCORE%TYPE;
    S_W         DSUB_TABLE.W_SCORE%TYPE;
    S_P         DSUB_TABLE.P_SCORE%TYPE;
    ERROR1      EXCEPTION;
BEGIN
    SELECT SUG_NO, DSUB_NO INTO S_SUGNO, S_DSUBNO
    FROM SUNG_TABLE
    WHERE SUG_NO = V_SUGNO
      AND DSUB_NO = V_DSUBNO;
      
    SELECT ATT_SCORE, W_SCORE, P_SCORE INTO S_ATT, S_W, S_P
    FROM DSUB_TABLE
    WHERE DSUB_NO = V_DSUBNO;

    IF (V_ATT > S_ATT) OR (V_WRITE > S_W) OR (V_PRAC > S_P)
        THEN RAISE ERROR1;
    END IF;

    UPDATE SUNG_TABLE
             SET SUNG_ATT = V_ATT
               , SUNG_W = V_WRITE
               , SUNG_P = V_PRAC
             WHERE SUG_NO = S_SUGNO AND DSUB_NO = S_DSUBNO;

    EXCEPTION
        WHEN ERROR1
            THEN RAISE_APPLICATION_ERROR(-20101, '������ ������ ���� �ʽ��ϴ�.');
            ROLLBACK;
END;
/*
-- EXEC PRO_PROF_SUNGJUK_UPDATE('SU102', 'DS001', 20, 10, 40);
������û��ȣ, ���������ڵ带 �������� ���, �ʱ�, �Ǳ� ������ �����ϴ� ���ν���
�������� ���̺��� ������ ������ �Է������� ���� ������ ���ܹ߻�
*/

CREATE OR REPLACE PROCEDURE PRO_PROF_SUNGJUK_DELETE     /*�л� ���� ���� ���ν���*/
( V_SUGNO   IN SUNG_TABLE.SUG_NO%TYPE
, V_DSUBNO  IN SUNG_TABLE.DSUB_NO%TYPE
)
IS
    S_SUGNO     SUG_TABLE.SUG_NO%TYPE;
    S_DSUBNO    DSUB_TABLE.DSUB_NO%TYPE;
BEGIN
    SELECT SUG_NO, DSUB_NO INTO S_SUGNO, S_DSUBNO
    FROM SUNG_TABLE
    WHERE SUG_NO = V_SUGNO
      AND DSUB_NO = V_DSUBNO;

    DELETE
    FROM SUNG_TABLE
    WHERE SUG_NO = S_SUGNO AND DSUB_NO = S_DSUBNO;
END;
/*
-- EXEC PRO_PROF_SUNGJUK_DELETE('SU102', 'DS001');
������û��ȣ, ���������ڵ带 �������� ������ �����ϴ� ���ν���
���� ���̺��� �� ���� �� �ٸ� ���̺� ������ ��ġ�� ����
*/

CREATE OR REPLACE PROCEDURE PRO_PROF_BAEJUM     /*���� ���� �Է� ���ν���*/
( V_DSUBNO  IN DSUB_TABLE.DSUB_NO%TYPE
, V_ATT     IN DSUB_TABLE.ATT_SCORE%TYPE
, V_W       IN DSUB_TABLE.W_SCORE%TYPE
, V_P       IN DSUB_TABLE.P_SCORE%TYPE
)
IS
BEGIN
    UPDATE DSUB_TABLE
    SET ATT_SCORE = V_ATT, W_SCORE = V_W, P_SCORE = V_P
    WHERE DSUB_NO = V_DSUBNO;
END;
/*
-- EXEC PRO_PROF_BAEJUM('DS001', 20, 40, 40);
�������� ���̺��� ���������ڵ带 �������� �� ���� ������ �Է��ϴ� ���̺�
SCORE_CK ������������ ������ ������ 100�� �Ǿ����
*/

-- DSUB_TABLE�� ������ ������ 100�� �ǵ��� üũ �������� �߰�
ALTER TABLE DSUB_TABLE
ADD CONSTRAINT SCORE_CK CHECK((ATT_SCORE + W_SCORE + P_SCORE) = 100);


-------------------------------------------------------------------------------------------------------------

-- ���� ������ �Է� �� �ڵ����� ��й�ȣ �÷��� �� ���� Ʈ����
CREATE OR REPLACE TRIGGER TRG_PASSWORD_PROF
                                AFTER
                                INSERT ON PROF_TABLE
                                
BEGIN
    IF (INSERTING)
        THEN UPDATE PROF_TABLE
                 SET PROF_PW =  SUBSTR(PROF_SSN,8);
    END IF;
END;


-- �л� ������ �Է� �� �ڵ����� ��й�ȣ �÷��� �� ���� Ʈ����
CREATE OR REPLACE TRIGGER TRG_PASSWORD_STU
                                AFTER
                                INSERT ON STU_TABLE
                               
BEGIN
    IF (INSERTING)
        THEN UPDATE STU_TABLE
                 SET STU_PW =  SUBSTR(STU_SSN,8);
    END IF;
END;
/*
INSERT INTO STU_TABLE(STU_ID, STU_NAME, STU_SSN)
VALUES('ST010', '������', '970419-1030028');
INSERT INTO STU_TABLE(STU_ID, STU_NAME, STU_SSN)
VALUES('ST011', '������', '911212-2222222');
*/


-- �л��� �ֹε�Ϲ�ȣ�� ������ ���� ������ ����ũ �������� �߰�
ALTER TABLE STU_TABLE
ADD CONSTRAINT STU_SSN_UK UNIQUE(STU_SSN);


-- �������� �ֹε�Ϲ�ȣ�� ������ ���� ������ ����ũ �������� �߰�
ALTER TABLE PROF_TABLE
ADD CONSTRAINT PROF_SSN_UK UNIQUE(PROF_SSN);

--------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------- ������ȣ��


CREATE OR REPLACE VIEW VIEW_USER_STU_F --Ż���ڸ� ���
AS
SELECT  ST.STU_NAME "�л��̸�", SUNG.DSUB_NO "�����ڵ�(������)", SUG.SUG_NO "������û(����)�ڵ�", (SUNG.SUNG_ATT + SUNG.SUNG_W + SUNG.SUNG_P)"������������", DECODE(FL.FAIL_DATE, NULL, 'N', 'Y') "Ż������"
FROM SUG_TABLE SUG  JOIN  SUNG_TABLE SUNG ON  SUG.SUG_NO = SUNG.SUG_NO
                                    JOIN  FAIL_TABLE FL ON  SUG.SUG_NO = FL.SUG_NO
                                    JOIN  STU_TABLE ST ON  SUG.STU_ID = ST.STU_ID;
--==>>View VIEW_USER_STU_F��(��) �����Ǿ����ϴ�.

CREATE OR REPLACE VIEW VIEW_USER_STU  --��ü���
AS
SELECT S.STU_NAME "�л��̸�", U.SUG_NO "������û�ڵ�", (N.SUNG_ATT + N.SUNG_W + N.SUNG_P) "��������",  F.FAIL_DATE "Ż������"
FROM STU_TABLE S, SUG_TABLE U, FAIL_TABLE F, SUNG_TABLE N 
WHERE  U.SUG_NO = N.SUG_NO
ORDER BY S.STU_NAME;
--==>>View VIEW_USER_STU��(��) �����Ǿ����ϴ�.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--���⼭���ʹ� ���� ���� ���ν��� Ʈ���ŵ�

--�л����̺���� Ʈ���� ����(���� ���̺�� ���� �����Ǿ� ���� SUG_TABLE Ʈ���� �����ÿ��� ���������� ������)
CREATE OR REPLACE TRIGGER TRG_USER_STU 
        BEFORE
        DELETE ON STU_TABLE
        FOR EACH ROW 
BEGIN
        DELETE 
        FROM SUG_TABLE
        WHERE STU_ID = :OLD.STU_ID;
END;

-- ������û���̺��� ������û�ڵ� ������ ���������� Ż�����̺�� �������̺��� ������û�ڵ� ����
CREATE OR REPLACE TRIGGER TRG_USER_STU1 
            BEFORE
            DELETE ON SUG_TABLE
            FOR EACH ROW
BEGIN
            DELETE
            FROM FAIL_TABLE
            WHERE SUG_NO= :OLD.SUG_NO;
            
            DELETE
            FROM SUNG_TABLE
            WHERE SUG_NO = :OLD.SUG_NO;
END;

--�л� ���̺� �������� (�Է��� �л��� ��ȣ�� ��ġ�ϸ� ������ ������ �����ϰ� �ϱ�����)
CREATE OR REPLACE PROCEDURE PRC_USER_STU_UPDATE
(V_STUID      IN STU_TABLE.STU_ID%TYPE          
,V_STUNAME IN STU_TABLE.STU_NAME%TYPE
,V_STUSSN   IN STU_TABLE.STU_SSN%TYPE
,V_STUPW    IN STU_TABLE.STU_PW%TYPE)
IS
BEGIN
            UPDATE STU_TABLE 
            SET STU_NAME = V_STUNAME
                 , STU_SSN   = V_STUSSN 
                 , STU_PW    = V_STUPW 
            WHERE  STU_ID = V_STUID;
END;
--==>>Procedure PRC_USER_STU_UPDATE��(��) �����ϵǾ����ϴ�.


