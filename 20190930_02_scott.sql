SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT *
FROM TBL_TEST1;


INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(4, '�̿���', '010-4444-4444');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(5, '��ҿ�', '010-5555-5555');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

UPDATE TBL_TEST1
SET NAME ='������'
WHERE ID=4;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

DELETE
FROM TBL_TEST1
WHERE ID=5;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

INSERT INTO TBL_TEST1(ID,NAME,TEL)
VALUES(6,'��ȣ��','010-6666-6666');
--==>> ���� �߻�
-- ORA-20003: �۾��� 08:00 ~ 18:00 ������ �����մϴ�.


UPDATE TBL_TEST1
SET NAME='������'
WHERE ID='������';
--==>> ORA-20003: �۾��� 08:00 ~ 18:00 ������ �����մϴ�.

DELETE
FROM TBL_TEST1
WHERE ID=4;
--==>> ORA-20003: �۾��� 08:00 ~ 18:00 ������ �����մϴ�.

SELECT *
FROM TBL_TEST1;
--==>> 4	������	010-4444-4444


--���� BEFORE ROW TRIGGER ��Ȳ �ǽ� ����--
--�� ���� ���谡 ������ ������(�ڽ�) ������ ���� �����ϴ� ��

--�� �ǽ��� ���� ���̺� ����(TBL_TEST2)
CREATE TABLE TBL_TEST2
( CODE  NUMBER
, NAME  VARCHAR2(40)
, CONSTRAINT TEST2_CODE_PK PRIMARY KEY(CODE)
);
--==>> Table TBL_TEST2��(��) �����Ǿ����ϴ�.

--�� �ǽ��� ���� ���̺� ����(TBL_TEST3)
CREATE TABLE TBL_TEST3
( SID   NUMBER
, CODE  NUMBER
, SU    NUMBER
, CONSTRAINT TEST3_SID_PK PRIMARY KEY(SID)
, CONSTRAINT TEST3_CODE_FK FOREIGN KEY(CODE)
             REFERENCES TBL_TEST2(CODE)
);
--==>> Table TBL_TEST3��(��) �����Ǿ����ϴ�.

--�� �ǽ� ���� ������ �Է�
INSERT INTO TBL_TEST2(CODE, NAME) VALUES(1,'�ڷ�����');
INSERT INTO TBL_TEST2(CODE, NAME) VALUES(2,'�����');
INSERT INTO TBL_TEST2(CODE, NAME) VALUES(3,'��Ź��');
INSERT INTO TBL_TEST2(CODE, NAME) VALUES(4,'���ڷ�����');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. *4

SELECT *
FROM TBL_TEST2;
--==>>
/*
1	�ڷ�����
2	�����
3	��Ź��
4	���ڷ�����
*/

COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� �ǽ� ���� ������ �Է�
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(1,1,20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(2,2,30);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(3,3,40);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(4,1,50);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(5,2,60);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(6,3,70);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(7,1,80);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(8,2,90);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(9,3,100);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(10,1,110);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(11,2,120);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(12,3,130);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 12


SELECT *
FROM TBL_TEST3;
--==>>
/*
1	1	20
2	2	30
3	3	40
4	1	50
5	2	60
6	3	70
7	1	80
8	2	90
9	3	100
10	1	110
11	2	120
12	3	130
*/

COMMIT;
-- Ŀ�� �Ϸ�.

--�� TBL_TEST2(�θ�) ���̺��� ������ ���� �õ�

DELETE
FROM TBL_TEST2
WHERE CODE=4;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

DELETE
FROM TBL_TEST2
WHERE CODE=3;
--==>> �����߻�
-- ORA-02292: integrity constraint (SCOTT.TEST3_CODE_FK) violated - child record found

DELETE
FROM TBL_TEST2
WHERE CODE=2;
--==>> �����߻�
-- ORA-02292: integrity constraint (SCOTT.TEST3_CODE_FK) violated - child record found



--�� Ʈ���� �ۼ� ���� �ٽ� ����

DELETE
FROM TBL_TEST2
WHERE CODE=1;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_TEST2;
--==>>
/*
2	�����
3	��Ź��
*/

SELECT *
FROM TBL_TEST3;
--==>>
/*
2	2	30
3	3	40
5	2	60
6	3	70
8	2	90
9	3	100
11	2	120
12	3	130
*/

DELETE
FROM TBL_TEST2
WHERE CODE=2;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_TEST2;
--==>> 3	��Ź��

SELECT *
FROM TBL_TEST3;
--==>>
/*
3	3	40
6	3	70
9	3	100
12	3	130
*/


COMMIT;
--==>> Ŀ�� �Ϸ�.



--���� AFTER ROW TRIGGER ��Ȳ �ǽ� ����--
--�� ���� ���̺� ���� Ʈ����� ó��


UPDATE TBL_��ǰ
SET ������ = 0;
--==>> 21�� �� ��(��) ������Ʈ�Ǿ����ϴ�.

SELECT *
FROM TBL_��ǰ;


DELETE
FROM TBL_�԰�;
--==>> 23�� �� ��(��) �����Ǿ����ϴ�.

DELETE
FROM TBL_���;
--==>> 7�� �� ��(��) �����Ǿ����ϴ�.

COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� �԰� �̺�Ʈ �߻�
INSERT INTO TBL_�԰�(�԰��ȣ, ��ǰ�ڵ�, �԰�����, �԰����, �԰�ܰ�)
VALUES(1,'H001', SYSDATE, 100, 350);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.

SELECT *
FROM TBL_�԰�;
--==>> 1	H001	2019-09-30 08:23:43	100	350

SELECT *
FROM TBL_��ǰ
WHERE ��ǰ�ڵ� ='H001';
--==>> H001	��ũ����	500	100

INSERT INTO TBL_�԰�(�԰��ȣ, ��ǰ�ڵ�, �԰�����, �԰����, �԰�ܰ�)
VALUES(2,'H001', SYSDATE, 100, 300);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM TBL_�԰�;
--==>>
/*
1	H001	2019-09-30 08:23:43	100	350
2	H001	2019-09-30 10:28:44	100	300
*/

SELECT *
FROM TBL_��ǰ
WHERE ��ǰ�ڵ� ='H001';
--==>> H001	��ũ����	500	200


-- �׽�Ʈ
SELECT *
FROM TBL_�԰�;

SELECT *
FROM TBL_��ǰ;

SELECT *
FROM TBL_���;



UPDATE TBL_�԰�
SET �԰���� = 50
WHERE �԰��ȣ =1;

DELETE
FROM TBL_�԰�
WHERE �԰��ȣ =1;

INSERT INTO TBL_���
VALUES(1,'H001',SYSDATE,50,500);

UPDATE TBL_���
SET ������ = 30
WHERE ����ȣ=1;

DELETE
FROM TBL_���
WHERE ����ȣ=1;

--�� TRIGGER �� ���� ��ȸ

SELECT *
FROM USER_TRIGGERS;
/*
"TRG_IBGO
          AFTER
          INSERT OR UPDATE OR DELETE ON TBL_�԰�
          FOR EACH ROW
"
"BEGIN

    IF (INSERTING)
        THEN UPDATE TBL_��ǰ
             SET ������ = ������ + :NEW.�԰����
             WHERE ��ǰ�ڵ� = :NEW.��ǰ�ڵ�;
    END IF;

    IF (UPDATING)
        THEN UPDATE TBL_��ǰ
             SET ������ = (������ - :OLD.�԰����) + :NEW.�԰����
             WHERE ��ǰ�ڵ� = :OLD.��ǰ�ڵ�;
    END IF;

    IF (DELETING)
        THEN UPDATE TBL_��ǰ
             SET ������ = ������ - :OLD.�԰����
             WHERE ��ǰ�ڵ� = :OLD.��ǰ�ڵ�;
    END IF;
END;"

*/

SELECT INSA_PACK.FN_GENDER('751212-1234567')"�Լ�ȣ��"
FROM DUAL;
--==>> ����


SELECT NAME, SSN, INSA_PACK.FN_GENDER(SSN)"�Լ�ȣ��"
FROM TBL_INSA;
--==>>
/*
������	901212-2234567	����
ȫ�浿	771212-1022432	����
�̼���	801007-1544236	����
�̼���	770922-2312547	����
������	790304-1788896	����
�Ѽ���	811112-1566789	����
�̱���	780505-2978541	����
����ö	780506-1625148	����
�迵��	821011-2362514	����
������	810810-1552147	����
������	751010-1122233	����
������	801010-2987897	����
���ѱ�	760909-1333333	����
���̼�	790102-2777777	����
Ȳ����	810707-2574812	����
������	800606-2954687	����
�̻���	781010-1666678	����
�����	820507-1452365	����
�̼���	801028-1849534	����
�ڹ���	780710-1985632	����
������	800304-2741258	����
ȫ�泲	801010-1111111	����
�̿���	800501-2312456	����
���μ�	731211-1214576	����
�踻��	830225-2633334	����
�����	801103-1654442	����
�����	810907-2015457	����
�迵��	801216-1898752	����
�̳���	810101-1010101	����
�踻��	800301-2020202	����
������	790210-2101010	����
����ȯ	771115-1687988	����
�ɽ���	810206-2222222	����
��̳�	780505-2999999	����
������	820505-1325468	����
������	831010-2153252	����
���翵	701126-2852147	����
�ּ���	770129-1456987	����
���μ�	791009-2321456	����
�����	800504-2000032	����
�ڼ���	790509-1635214	����
�����	721217-1951357	����
ä����	810709-2000054	����
��̿�	830504-2471523	����
����ȯ	820305-1475286	����
ȫ����	690906-1985214	����
����	760105-1458752	����
�긶��	780505-1234567	����
�̱��	790604-1415141	����
�̹̼�	830908-2456548	����
�̹���	810403-2828287	����
�ǿ���	790303-2155554	����
�ǿ���	820406-2000456	����
��̽�	800715-1313131	����
����ȣ	810705-1212141	����
���ѳ�	820506-2425153	����
������	800605-1456987	����
�̹̰�	780406-2003214	����
�����	800709-1321456	����
�Ӽ���	810809-2121244	����
��ž�	810809-2111111	����
*/














