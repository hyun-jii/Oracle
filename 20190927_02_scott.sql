SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT *
FROM TBL_MEMBER;

DESC TBL_MEMBER;


--�� ������ ���ν��� ȣ���� ���� ���� �۵����� Ȯ��
EXEC PRC_MEMBER_INSERT('�赿��', '010-1111-1111', '����');
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.


SELECT *
FROM TBL_MEMBER;
--==>> 1	�赿��	010-1111-1111	����


--�� ������ ���ν��� ȣ���� ���� ���� �۵����� Ȯ��
EXEC PRC_MEMBER_INSERT('�輭��', '010-2222-2222', '���');
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

SELECT *
FROM TBL_MEMBER;
--==>>
/*
1	�赿��	010-1111-1111	����
2	�輭��	010-2222-2222	���
*/

--�� ������ ���ν��� ȣ���� ���� ���� �۵����� Ȯ��
EXEC PRC_MEMBER_INSERT('�賲��', '010-3333-3333', '����');
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

SELECT *
FROM TBL_MEMBER;
--==>>
/*
1	�赿��	010-1111-1111	����
2	�輭��	010-2222-2222	���
3	�賲��	010-3333-3333	����
*/

--�� ������ ���ν��� ȣ���� ���� ���� �۵����� Ȯ��
EXEC PRC_MEMBER_INSERT('�����', '010-3333-3333', 'õ��');
--==>> ���� �߻�
-- ORA-20001: ����,���,������ �Է��� �����մϴ�.

SELECT *
FROM TBL_MEMBER;
--==>>
/*
1	�赿��	010-1111-1111	����
2	�輭��	010-2222-2222	���
3	�賲��	010-3333-3333	����
*/

--�� �ǽ� ���̺� ����(TBL_���)
CREATE TABLE TBL_���
( ����ȣ  NUMBER
, ��ǰ�ڵ�  VARCHAR2(20)
, �������  DATE DEFAULT SYSDATE
, ������  NUMBER
, ���ܰ�  NUMBER
);
--==>> Table TBL_�����(��) �����Ǿ����ϴ�.

--�� TBL_��� ���̺��� ����ȣ�� PK �������� ����

ALTER TABLE TBL_���
ADD CONSTRAINT ���_����ȣ_PK PRIMARY KEY(����ȣ);
--==>> Table TBL_�����(��) ����Ǿ����ϴ�.

--�� TBL_��� ���̺��� ��ǰ�ڵ�� TBL_��ǰ ���̺��� ��ǰ�ڵ带 ������ �� �ֵ���
-- �ܷ�Ű(FK) �������� ����

ALTER TABLE TBL_���
ADD CONSTRAINT ���_��ǰ�ڵ�_FK FOREIGN KEY(��ǰ�ڵ�)
                                REFERENCES TBL_��ǰ(��ǰ�ڵ�);
--==>> Table TBL_�����(��) ����Ǿ����ϴ�.

--�� ������ ���ν��� ȣ���� ���� ��� Ȯ��
-- ���ν����� : PRC_���_INSERT(��ǰ�ڵ�, ������, ���ܰ�);

SELECT *
FROM TBL_��ǰ;
SELECT *
FROM TBL_���;

-- ������ 50���� �������� 30�� ���
EXEC PRC_���_INSERT('C001' ,30, 850);
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.


SELECT *
FROM TBL_��ǰ;
--==>> C001	������	1000	20

SELECT *
FROM TBL_���;
--==>> 1	C001	19/09/27	30	850

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.


-- ������ 20���� �������� 30�� ���
EXEC PRC_���_INSERT('C001' ,30, 850);
--==>> ���� �߻�
-- ORA-20002: ������~!!

SELECT *
FROM TBL_���;
--==>> 1	C001	2019-09-27	30	850

-- �������� 0���� �ް���ٸ� 1�� ���
EXEC PRC_���_INSERT('H007' ,1, 580);
--==>> ���� �߻�
-- ORA-20002: ������~!!

-- �԰� ���̺� ���� ����
EXEC PRC_�԰�_INSERT('E007',50,2000);


SELECT *
FROM TBL_��ǰ;
SELECT *
FROM TBL_���;


EXEC PRC_���_INSERT('H007',20,500);
EXEC PRC_���_UPDATE(7, 25);


----------------------------------------------------------------------------------------------------

--���� AFTER STATEMENT TRIGGER ��Ȳ �ǽ� ����--
--�� DML �۾��� ���� �̺�Ʈ ���

--�� �ǽ� ���̺� ����(TBL_TEST1)
CREATE TABLE TBL_TEST1
( ID    NUMBER
, NAME  VARCHAR2(30)
, TEL   VARCHAR2(60)
, CONSTRAINT TEST1_ID_PK PRIMARY KEY(ID)
);
--==>> Table TBL_TEST1��(��) �����Ǿ����ϴ�.

--�� �ǽ� ���̺� ����(TBL_EVENTLOG)
CREATE TABLE TBL_EVENTLOG
( MEMO  VARCHAR2(200)
, ILJA  DATE DEFAULT SYSDATE
);
--==>> Table TBL_EVENTLOG��(��) �����Ǿ����ϴ�

--�� TBL_TEST1 ���̺��� ������� INSERT, UPDATE, DELETE ����
INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(1,'�̼���','010-1111-1111');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(2,'����ȣ','010-2222-2222');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

UPDATE TBL_TEST1
SET TEL = '010-1212-3434'
WHERE ID =1;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

DELETE
FROM TBL_TEST1
WHERE ID = 2;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

DELETE
FROM TBL_TEST1
WHERE ID =1;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_TEST1;
--==>> ��ȸ ��� ����

COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT *
FROM TBL_EVENTLOG;
--==>>
/*
INSERT ������ ����Ǿ����ϴ�.	2019-09-27
INSERT ������ ����Ǿ����ϴ�.	2019-09-27
UPDATE ������ ����Ǿ����ϴ�.	2019-09-27
DELETE ������ ����Ǿ����ϴ�.	2019-09-27
DELETE ������ ����Ǿ����ϴ�.	2019-09-27
*/









