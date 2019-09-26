SELECT USER
FROM DUAL;
--==>> SCOTT


--�� ������ ���ν����� ����� �۵��ϴ����� ���� Ȯ�� -> ���ν��� ȣ��
-- ���ν����� : PRC_STUDENTS_INSERT()

EXEC PRC_STUDENTS_INSERT('batman', 'java006$', '������', '010-2222-2222','���� ������');
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

--�� ���̺� Ȯ��
SELECT *
FROM TBL_STUDENTS;
--==>>
/*
superman	������	010-1111-1111	���ֵ� ��������
batman	    ������	010-2222-2222	���� ������
*/
SELECT *
FROM TBL_IDPW;
--==>>
/*
superman	java006$
batman	    java006$
*/

--�� �й�, �̸�, ��������, ��������, �������� �����͸�
--   �Է¹��� �� �ִ� �ǽ� ���̺� ����(TBL_SUNGJUK)

CREATE TABLE TBL_SUNGJUK
( HAKBUN    NUMBER
, NAME      VARCHAR2(40)
, KOR       NUMBER(3)
, ENG       NUMBER(3)
, MAT       NUMBER(3)
, CONSTRAINT SUNGJUK_HAKBUN_PK PRIMARY KEY(HAKBUN)
);
--==>> Table TBL_SUNGJUK��(��) �����Ǿ����ϴ�.

--�� ������ ���̺� �÷� �߰�
--   (���� -> TOT, ��� -> AVG, ���-> GRADE)


ALTER TABLE TBL_SUNGJUK
ADD (TOT NUMBER(3), AVG NUMBER(4,1), GRADE CHAR);
--==>> Table TBL_SUNGJUK��(��) ����Ǿ����ϴ�.

--�� ���⼭ �߰��� �÷��� ���� �׸���
--   ���ν��� �ǽ��� ���� �߰��� ���� ��
--   ���� ���̺� ������ ����������, �ٶ��������� ���� �����̴�.


--�� ����� ���̺� ���� Ȯ��
DESC TBL_SUNGJUK;
--==>>
/*
�̸�     ��?       ����           
------ -------- ------------ 
HAKBUN NOT NULL NUMBER       
NAME            VARCHAR2(40) 
KOR             NUMBER(3)    
ENG             NUMBER(3)    
MAT             NUMBER(3)    
TOT             NUMBER(3)    
AVG             NUMBER(4,1)  
GRADE           CHAR(1)      
*/



-- ���ν��� Ȯ��

EXEC PRC_SUNGJUK_INSERT(1,'����ȣ',90,80,70);


-- ���̺� Ȯ��

SELECT *
FROM TBL_SUNGJUK;



-- ���ν��� Ȯ��

EXEC PRC_SUNGJUK_UPDATE(1,50,50,50);

-- ���̺� Ȯ��

SELECT *
FROM TBL_SUNGJUK;
--==>> 1	����ȣ	50	50	50	150	50	F


-- ���ν��� Ȯ��
EXEC PRC_STUDENTS_UPDATE('superman', 'java006$' ,'010-9999-9999','����');

-- ���̺� Ȯ��
SELECT *
FROM TBL_STUDENTS;

--==>>
/*
superman	������	010-9999-9999	����
batman	    ������	010-2222-2222	���� ������
*/

DESC TBL_INSA;


-- ���ν��� Ȯ��
EXEC PRC_INSA_INSERT('������', '901212-2234567', SYSDATE, '����', '010-3213-6546', '������', '�븮', 1000000, 200000);

-- ���̺� Ȯ��

SELECT *
FROM TBL_INSA;
--==>> 1061	������	901212-2234567	19/09/26	����	010-3213-6546	������	�븮	1000000	200000

-------------------------------------------------------------------------------------------------------

--�� �ǽ� ���̺� ���� (TBL_��ǰ)
CREATE TABLE TBL_��ǰ
( ��ǰ�ڵ�      VARCHAR2(20)
, ��ǰ��        VARCHAR2(100)
, �Һ��ڰ���    NUMBER
, ������      NUMBER  DEFAULT 0
, CONSTRAINT ��ǰ_��ǰ�ڵ�_PK PRIMARY KEY(��ǰ�ڵ�)
);
--==>> Table TBL_��ǰ��(��) �����Ǿ����ϴ�.
-- TBL_��ǰ ���̺��� ��ǰ�ڵ带 �⺻Ű(PK) �������� ����


--�� �ǽ� ���̺� ����(TBL_�԰�)
CREATE TABLE TBL_�԰�
( �԰��ȣ  NUMBER
, ��ǰ�ڵ�  VARCHAR2(20)
, �԰�����  DATE DEFAULT SYSDATE
, �԰����  NUMBER
, �԰�ܰ�  NUMBER
, CONSTRAINT �԰�_�԰��ȣ_PK PRIMARY KEY(�԰��ȣ)
, CONSTRAINT �԰�_��ǰ�ڵ�_FK FOREIGN KEY(��ǰ�ڵ�)
                                REFERENCES TBL_��ǰ(��ǰ�ڵ�)
);
--==>> Table TBL_�԰���(��) �����Ǿ����ϴ�.
-- TBL_�԰� ���̺��� �԰��ȣ�� �⺻Ű(PK) �������� ����
-- TBL_�԰� ���̺��� ��ǰ�ڵ�� TBL_��ǰ ���̺��� ��ǰ�ڵ带
-- ������ �� �ֵ��� �ܷ�Ű(FK) �������� ����


--�� TBL_��ǰ ���̺� ��ǰ���� �Է�
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('H001','��ũ����',500);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('H002','�Ƹ���',300);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('H003','������',700);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('H004','���ũ',300);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('H005','������',800);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('H006','�ҽ���',600);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('H007','�ް����',700);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. *7

INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('C001','������',1000);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('C002','������',1500);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('C003','�����',1500);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('C004','������',1300);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('C005','��������',1200);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('C006','ũ��ġ��',1700);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('C007','�举����',1600);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 7

INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('E001','�ؾ�θ���',2000);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('E002','�������',1500);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('E003','�źϾ�',1900);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('E004','������',2100);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('E005','�ϰմ�������',4700);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('E006','������Ʈ',3500);
INSERT INTO TBL_��ǰ(��ǰ�ڵ�, ��ǰ��, �Һ��ڰ���)
VALUES('E007','���Դ�',4000);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 7

-- Ȯ��
SELECT *
FROM TBL_��ǰ;
--==>>
/*
H001	��ũ����        	500	    0
H002	�Ƹ���	        300	    0
H003	������	        700 	0
H004	���ũ	        300 	0
H005	������	        800 	0
H006	�ҽ���	        600 	0
H007	�ް����	        700 	0
COO1	������	        1000	0
COO2	������	        1500	0
COO3	�����	        1500	0
COO4	������	        1300	0
COO5	��������	        1200	0
COO6	ũ��ġ��	        1700	0
COO7	�举����	        1600	0
EOO1	�ؾ�θ���	    2000	0
EOO2	�������	        1500	0
EOO3	�źϾ�	        1900	0
EOO4	������	        2100	0
EOO5	�ϰմ�������	4700	0
EOO6	������Ʈ	        3500	0
EOO7	���Դ�	        4000	0
*/


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� ��¥ ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.


--�� TBL_�԰� ���̺� ���԰��̺�Ʈ �߻� ��...
--  ���� ���̺��� ����Ǿ�� �ϴ� ����
--  �� INSERT -> TBL_�԰�
--     INSERT INTO TBL_�԰�(�԰��ȣ, ��ǰ�ڵ�, �԰�����, �԰����, �԰�ܰ�)
--     VALUES(1,'H001', SYSDATE, 20, 400);

--  �� UPDATE -> TBL_��ǰ
--     UPDATE TBL_��ǰ
--     SET ������ = ���������� + 20(�԰����)
--     WHERE ��ǰ�ڵ� = 'H001';


--�� ������ ���ν����� ����� �۵��ϴ����� ���� Ȯ�� -> ���ν��� ȣ��
EXEC PRC_�԰�_INSERT('C001', 20, 800);
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

EXEC PRC_�԰�_INSERT('C001', 30, 750);
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.


SELECT *
FROM TBL_�԰�;
--==>>
/*
2   C001   2019-09-26   20   800
3   C001   2019-09-26   30   750
*/

SELECT *
FROM TBL_��ǰ;
--==>> C001   ������   1000   50


EXEC PRC_�԰�_INSERT('H001', 50, 350);
EXEC PRC_�԰�_INSERT('H001', 10, 450);
EXEC PRC_�԰�_INSERT('H001', 20, 300);


SELECT *
FROM TBL_�԰�;
--==>>
/*
4   H001   2019-09-26   50   350
5   H001   2019-09-26   10   450
6   H001   2019-09-26   20   300
*/



SELECT *
FROM TBL_�԰�;

SELECT *
FROM TBL_��ǰ;

COMMIT;

--���� ���ν��� �������� ���� ó�� ����--

--�� ���̺� ����(TBL_MEMBER)
CREATE TABLE TBL_MEMBER
( NUM   NUMBER
, NAME  VARCHAR2(30)
, TEL   VARCHAR2(60)
, CITY  VARCHAR2(60)
);
--==>> Table TBL_MEMBER��(��) �����Ǿ����ϴ�.













