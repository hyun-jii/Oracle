SELECT USER
FROM DUAL;
--==>> SCOTT


--�� EMP ���̺��� ������� ������ ���� ��ȸ�� �� �ֶǷ� �������� �����Ѵ�.
/*

-----------------------------------------------------------
 �����   �μ���ȣ   �Ի���  �޿�  �μ����Ի纰�޿�����
-----------------------------------------------------------


*/
SELECT *
FROM EMP;



SELECT ENAME"�����", DEPTNO"�μ���ȣ", HIREDATE"�Ի���", SAL"�޿�"
        ,( SELECT SUM(SAL) 
           FROM EMP
           WHERE DEPTNO = E.DEPTNO AND HIREDATE <= E.HIREDATE
          )"�μ����Ի纰�޿�����"
FROM EMP E
ORDER BY DEPTNO;


ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.


SELECT E1.ENAME"���", E1.DEPTNO"�μ���ȣ", E1.HIREDATE"�Ի���", E1.SAL"�޿�"
    , ( SELECT SUM(E2.SAL)
        FROM EMP E2
        )"�μ����Ի纰�޿�����"
FROM EMP E1
ORDER BY 2,3;
--==>>
/*
CLARK	10	1981-06-09	2450	29025
KING	10	1981-11-17	5000	29025
MILLER	10	1982-01-23	1300	29025
SMITH	20	1980-12-17	800	    29025
JONES	20	1981-04-02	2975	29025
FORD	20	1981-12-03	3000	29025
SCOTT	20	1987-07-13	3000	29025
ADAMS	20	1987-07-13	1100	29025
ALLEN	30	1981-02-20	1600	29025
WARD	30	1981-02-22	1250	29025
BLAKE	30	1981-05-01	2850	29025
TURNER	30	1981-09-08	1500	29025
MARTIN	30	1981-09-28	1250	29025
JAMES	30	1981-12-03	950	    29025
*/

SELECT E1.ENAME"���", E1.DEPTNO"�μ���ȣ", E1.HIREDATE"�Ի���", E1.SAL"�޿�"
    , ( SELECT SUM(E2.SAL)
        FROM EMP E2
        WHERE E2.DEPTNO = E1.DEPTNO)"�μ����Ի纰�޿�����"
FROM EMP E1
ORDER BY 2,3;
--==>>
/*
CLARK	10	1981-06-09	2450	8750
KING	10	1981-11-17	5000	8750
MILLER	10	1982-01-23	1300	8750
SMITH	20	1980-12-17	800	    10875
JONES	20	1981-04-02	2975	10875
FORD	20	1981-12-03	3000	10875
SCOTT	20	1987-07-13	3000	10875
ADAMS	20	1987-07-13	1100	10875
ALLEN	30	1981-02-20	1600	9400
WARD	30	1981-02-22	1250	9400
BLAKE	30	1981-05-01	2850	9400
TURNER	30	1981-09-08	1500	9400
MARTIN	30	1981-09-28	1250	9400
JAMES	30	1981-12-03	950	    9400
*/
SELECT E1.ENAME"���", E1.DEPTNO"�μ���ȣ", E1.HIREDATE"�Ի���", E1.SAL"�޿�"
    , ( SELECT SUM(E2.SAL)
        FROM EMP E2
        WHERE E2.DEPTNO = E1.DEPTNO AND E2.HIREDATE <= E1.HIREDATE)"�μ����Ի纰�޿�����"
FROM EMP E1
ORDER BY 2,3;
--==>>
/*
CLARK	10	1981-06-09	2450	2450
KING	10	1981-11-17	5000	7450
MILLER	10	1982-01-23	1300	8750
SMITH	20	1980-12-17	800	    800
JONES	20	1981-04-02	2975	3775
FORD	20	1981-12-03	3000	6775
SCOTT	20	1987-07-13	3000	10875
ADAMS	20	1987-07-13	1100	10875
ALLEN	30	1981-02-20	1600	1600
WARD	30	1981-02-22	1250	2850
BLAKE	30	1981-05-01	2850	5700
TURNER	30	1981-09-08	1500	7200
MARTIN	30	1981-09-28	1250	8450
JAMES	30	1981-12-03	950	    9400
*/

--�� ���� ����� �������
--   �Ի��� ����� ���� ���� ������ ����
--   �Ի����� �ο����� ��ȸ�� �� �ֵ��� �������� �����Ѵ�.

-------------------------------
-- �Ի���         �ο���
-------------------------------


--------------------------------------------------------------���� �ϴ���---

SELECT TO_CHAR(HIREDATE, 'YYYY-MM')"�Ի���", COUNT(*)"�ο���"
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
ORDER BY 1;


SELECT TO_CHAR(HIREDATE, 'YYYY-MM')"�Ի���"
        , ( SELECT COUNT(*) 
            FROM EMP
            WHERE HIREDATE = E.TO_CHAR(HIREDATE, 'YYYY-MM')
            )"�ο���"
FROM EMP E
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
ORDER BY 1;


SELECT TO_CHAR(HIREDATE, 'YYYY-MM')"�Ի���"
        ,CASE WHEN THEN ELSE END"�ο���"
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
ORDER BY 1;


SELECT  T.�ο���, T.�Ի���
FROM
(
    SELECT TO_CHAR(HIREDATE, 'YYYY-MM')"�Ի���", COUNT(*)"�ο���"
    FROM EMP
    GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
    ORDER BY 1
) T;

-------------------------------------------------------------------------------

SELECT TO_CHAR(HIREDATE, 'YYYY-MM')"�Ի���", COUNT(*)"�ο���"
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM');
--==>>
/*
1980-12	1
1981-02	2
1981-04	1
1981-05	1
1981-06	1
1981-09	2
1981-11	1
1981-12	2
1982-01	1
1987-07	2
*/

SELECT TO_CHAR(HIREDATE, 'YYYY-MM')"�Ի���", COUNT(*)"�ο���"
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
HAVING COUNT(*)=(
                  SELECT MAX(COUNT(*))
                  FROM EMP
                  GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
                )
ORDER BY 1;

--==>>
/*
1981-02	2
1981-09	2
1981-12	2
1987-07	2
*/

SELECT E.�Ի���, E.�ο���
FROM
(
    SELECT TO_CHAR(HIREDATE, 'YYYY-MM')"�Ի���", COUNT(*)"�ο���"
    FROM EMP
    GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
) E
WHERE E.�ο��� = (
                     SELECT MAX(T.�ο���)
                     FROM
                     (
                         SELECT TO_CHAR(HIREDATE, 'YYYY-MM')"�Ի���", COUNT(*)"�ο���"
                         FROM EMP
                         GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
                     ) T
                )
ORDER BY 1;
--==>>
/*
1981-02	2
1981-09	2
1981-12	2
1987-07	2
*/
----------------------------------------------------------------------

--���� ROW_NUMBER() ����--

SELECT ROW_NUMBER() OVER(ORDER BY SAL DESC)"�׽�Ʈ"
        ,ENAME"���", SAL"�޿�", HIREDATE"�Ի���"
FROM EMP;

SELECT ROW_NUMBER() OVER(ORDER BY SAL DESC)"�׽�Ʈ"
        ,ENAME"���", SAL"�޿�", HIREDATE"�Ի���"
FROM EMP
ORDER BY ENAME;

SELECT ROW_NUMBER() OVER(ORDER BY ENAME DESC)"�׽�Ʈ"
        ,ENAME"���", SAL"�޿�", HIREDATE"�Ի���"
FROM EMP
ORDER BY ENAME;

--�� �Խ����� �Խù� ��ȣ�� SEQUENCE �� IDENTITY�� ����ϰ� �Ǹ�
--   �Խù��� �������� ���, ������ �Խù��� �ڸ��� ���� ��ȣ�� ����
--   �Խù��� ��ϵǴ� ��Ȳ�� �߻��ϰ� �ȴ�.
--   �̴�... ���� �����̳�... �̰���,... �ٶ������� ���� ��Ȳ�� �� �ֱ� ������
--   ROW_NUMBER()�� ����� ����� �� �� �ִ�.
--   ������ �������� ����� ������ SEQUENCE�� IDENTITY�� ���������,
--   �ܼ��� �Խù��� ���ȭ �Ͽ� ����ڿ��� ����Ʈ �������� ������ ������
--   ������� �ʴ� ���� �ٶ����ϴ�.


--�� SEQUENCE (������ : �ֹ���ȣ) ����
--   -> �������� �ǹ� : 1.(�Ϸ���) �������� ��ǵ�. 2. (���, �ൿ ����) ����

CREATE SEQUENCE SEQ_BOARD       -- SEQUENCE ���� ����
START WITH 1                    -- ���۰�
INCREMENT BY 1                  -- ������
NOMAXVALUE                      -- �ִ밪 ���� ����
NOCACHE;                        -- ĳ�� ��� ����(����)
--==>> Sequence SEQ_BOARD��(��) �����Ǿ����ϴ�.


--�� �ǽ� ���̺� ����(TBL_BOARD)
CREATE TABLE TBL_BOARD                  -- TBL_BOARD ���̺� ���� ���� -> �Խ��� ���̺�
( NO            NUMBER                  -- �Խù� ��ȣ           X
, TITLE         VARCHAR2(50)            -- �Խù� ����           ��
, CONTENTS      VARCHAR2(2000)          -- �Խù� ����           ��
, NAME          VARCHAR2(20)            -- �Խù� �ۼ���         ��
, PW            VARCHAR2(20)            -- �Խù� �н�����       ��
, CREATED       DATE DEFAULT SYSDATE    -- �Խù� �ۼ���         X

);
--==>> Table TBL_BOARD��(��) �����Ǿ����ϴ�.


--�� ������ �Է� -> �Խ��ǿ��� �Խù��� �ۼ��ϴ� �׼�
INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '��~����', '�ڲٴ��̰��ܿ�','������','java006$', DEFAULT);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '���ݸ�', '���ƺ��ô�','������','java006$', DEFAULT);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '������', '�����սô�','������','java006$', DEFAULT);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '�����־��', '�̰ǹ�����','���ʷ�','java006$', DEFAULT);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '�����', '����ΰ���','������','java006$', DEFAULT);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '����', '�����ΰ���','�赿��','java006$', DEFAULT);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '������', '����Ʈ��','����ä','java006$', DEFAULT);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_BOARD;
--==>>
/*
1	��~����	    �ڲٴ��̰��ܿ�	������	java006$	2019-09-19
2	���ݸ�	    ���ƺ��ô�	    ������	java006$	2019-09-19
3	������	    �����սô�	    ������	java006$	2019-09-19
4	�����־��	�̰ǹ�����	    ���ʷ�	java006$	2019-09-19
5	�����	    ����ΰ���	    ������	java006$	2019-09-19
6	����      	�����ΰ���	    �赿��	java006$	2019-09-19
7	������	    ����Ʈ��	    ����ä	java006$	2019-09-19

*/

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.

COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� �Խù� ����
DELETE
FROM TBL_BOARD
WHERE NO = 1;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

DELETE
FROM TBL_BOARD
WHERE NO = 4;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

DELETE
FROM TBL_BOARD
WHERE NO = 7;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.


--�� �Խù� �ۼ�
INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '���¿�', '���½ð��̳�....','������','java006$', DEFAULT);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--��Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT *
FROM TBL_BOARD;


SELECT ROW_NUMBER() OVER(ORDER BY CREATED)"�۹�ȣ"
        ,TITLE"����", NAME"�ۼ���", CREATED"�ۼ���"
FROM TBL_BOARD
ORDER BY 4 DESC;
--==>>
/*
5	���¿�	������	2019-09-19 11:48:30
4	����	    �赿��	2019-09-19 11:35:04
3	�����	������	2019-09-19 11:34:21
2	������	������	2019-09-19 11:33:15
1	���ݸ�	������	2019-09-19 11:32:45
*/

CREATE OR REPLACE VIEW VIEW_BOARD
AS
SELECT ROW_NUMBER() OVER(ORDER BY CREATED)"�۹�ȣ"
        ,TITLE"����", NAME"�ۼ���", CREATED"�ۼ���"
FROM TBL_BOARD
ORDER BY 4 DESC;
--==>> View VIEW_BOARD��(��) �����Ǿ����ϴ�.

SELECT *
FROM VIEW_BOARD;


INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '����', '���ݸ� ��', '��â��', 'java006$', DEFAULT);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

DELETE
FROM TBL_BOARD
WHERE NO =6;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

SELECT *
FROM VIEW_BOARD;


-------------------------------------------------------------------------------------------------

--���� JOIN(����) ����--

-- 1. SQL 1992 CODE

-- Cross Join
SELECT *
FROM EMP,DEPT;
--> ���п��� ���ϴ� ��ī��Ʈ ��(CATERSIAN PRODUCT)
--  �� ���̺��� ��ģ(������) ��� ����� ��


-- Equi Join : ���� ��Ȯ�� ��ġ�ϴ� �͵鳢�� �����Ű�� ���� ���
SELECT *
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO;

SELECT *
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;


-- Non Equi Join : ���� �ȿ� ������ �͵鳢�� �����Ű�� ���� ���

SELECT *
FROM SALGRADE;
SELECT *
FROM EMP;


SELECT *
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;

-- EqUI Join �� (+) �� Ȱ���� ���� ���

SELECT *
FROM TBL_EMP;

SELECT *
FROM TBL_DEPT;

SELECT *
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO = D.DEPTNO;
--> �� 14���� �����Ͱ� ���յǾ� ��ȸ�� ��Ȳ
--  ��, �μ���ȣ�� ���� ���� �����(5)�� ��� ����~!!!

SELECT *
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO = D.DEPTNO(+);
--> �� 19���� �����Ͱ� ���յǾ� ��ȸ�� ��Ȳ
--  ��, �μ���ȣ�� ���� ���� �����(5)�� ��� ��ȸ�� ��Ȳ~!!!



SELECT *
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO;
--> �� 16���� �����Ͱ� ���յǾ� ��ȸ�� ��Ȳ
--  ��, �μ��� �Ҽӵ� ������� ���� ���� �μ�(2)�� ��� ��ȸ�� ��Ȳ~!!!

--�� (+)�� ���� �� ���̺��� �����͸� ��� �޸𸮿� ������ ��
--   (+)�� �ִ� �� ���̺��� �����͸� �ϳ��ϳ� Ȯ���Ͽ� ���ս�Ű�� ���·�
--   JOIN �� �̷������.
--   �̿� ���� ������...

SELECT *
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO(+);
--   �̷� ������ JOIN�� �������� �ʴ´�.


-- 2. SQL 1999 CODE -> ��JOIN�� Ű���� ���� -> JOIN(����)�� ���� ���
--                      ���� ������ ��WHERE�� ��� ��ON�� ���

-- Cross Join

SELECT *
FROM EMP CROSS JOIN DEPT;

-- Inner Join

SELECT *
FROM EMP INNER JOIN DEPT
ON EMP.DEPTNO = DEPT.DEPTNO;


SELECT *
FROM EMP E INNER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;


SELECT *
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;
--> INNER JOIN ���� INNER �� ���� ����

SELECT *
FROM EMP E INNER JOIN SALGRADE S
ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

SELECT *
FROM EMP E JOIN SALGRADE S
ON E.SAL BETWEEN S.LOSAL AND S.HISAL;
--> INNER JOIN ���� INNER �� ���� ����

SELECT *
FROM TBL_EMP E LEFT OUTER JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO;

--�� ������ ������ �� ���̺� (->LEFT -> TBL_EMP) �� �����͸�
--   ��� �޸𸮿� ������ ��
--   ������ �������� ���� �� ���̺���� �����͸� �ϳ��ϳ� Ȯ���Ͽ�
--   ���ս�Ű�� ���·� JOIN�� �̷������.

SELECT *
FROM TBL_EMP E LEFT JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO;
--> OUTER JOIN���� OUTER�� ���� �����ϴ�.

SELECT *
FROM TBL_EMP E RIGHT OUTER JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO;

SELECT *
FROM TBL_EMP E RIGHT JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO;
--> OUTER JOIN���� OUTER�� ���� �����ϴ�.


SELECT *
FROM TBL_EMP E FULL OUTER JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO;


SELECT *
FROM TBL_EMP E FULL JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO;
--> OUTER JOIN���� OUTER�� ���� �����ϴ�.


-------------------------------------------------------
SELECT *
FROM TBL_EMP E JOIN TBL_DEPT D              -- INNER JOIN
ON E.DEPTNO = D.DEPTNO;


SELECT *
FROM TBL_EMP E LEFT JOIN TBL_DEPT D         -- OUTER JOIN(LEFT/RIHGT/FULL)
ON E.DEPTNO = D.DEPTNO;
--------------------------------------------------------


SELECT *
FROM TBL_EMP E JOIN TBL_DEPT D            
ON E.DEPTNO = D.DEPTNO
AND E.DEPTNO = 20;
--> �� �������� ��ȸ �������
--  ������ CLERK �� ����鸸 ��ȸ�ϰ��� �Ѵٸ�...

SELECT *
FROM TBL_EMP E JOIN TBL_DEPT D            
ON E.DEPTNO = D.DEPTNO
AND E.JOB = 'CLERK';
--> �̿� ���� �������� �����Ͽ� ��ȸ�ص�
--  ����� ��� �������� ������ ����.

SELECT *
FROM TBL_EMP E JOIN TBL_DEPT D            
ON E.DEPTNO = D.DEPTNO
WHERE E.JOB = 'CLERK';
--> ������, �̿� ���� �����Ͽ� ��ȸ�ϴ� ���� �����Ѵ�.


----------------------------------------------------------------

--�� EMP ���̺�� DEPT ���̺��� �������
--   ������ MANAGER�� CLERK�� ����鸸
--   �μ���ȣ, �μ���, �����, ������, �޿� �׸��� ��ȸ�Ѵ�.

SELECT E.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE E.JOB IN ('MANAGER','CLERK');


SELECT DEPTNO, DNAME, ENAME, JOB, SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE E.JOB IN ('MANAGER','CLERK');
--==>> ���� �߻�
-- ORA-00918: column ambiguously defined
--> �� ���̺� �� �ߺ��Ǵ� �÷��� ���� �Ҽ� ���̺���
--  �������(��������)�Ѵ�.

SELECT D.DEPTNO, DNAME, ENAME, JOB, SAL
FROM EMP E JOIN DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO;



SELECT E.DEPTNO, DNAME, ENAME, JOB, SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO(+) = D.DEPTNO;


--�� �� ���̺� �� �ߺ��Ǵ� �÷��� ���� �Ҽ� ���̺��� ����ϴ� ���
--   �θ� ���̺��� �÷��� ������ �� �ֵ��� ó���ؾ� �Ѵ�.
SELECT *
FROM DEPT;  -- �θ����̺�
SELECT *
FROM EMP;   -- �ڽ����̺�

-- �� �������� �θ� ���̺�� �ڽ� ���̺��� ���踦 ��Ȯ�� �����Ѵ�.

SELECT D.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;
--> �� ���̺� ��� ���ԵǾ� �ִ� �ߺ��� �÷��� �ƴϴ���
--  �÷��� �Ҽ� ���̺��� ����� �� �� �ֵ��� ����.


--�� SELF JOIN(�ڱ� ����)

-- EMP ���̺��� �����͸� ������ ���� ��ȸ�� �� �ֵ���
-- �������� �����Ѵ�.
---------------------------------------------------------------
--  �����ȣ  �����  ������  �����ڹ�ȣ  �����ڸ�  ������������
---------------------------------------------------------------
--  7369     SMITH   CLERK    7902        FORD      ANALYST  
SELECT *
FROM EMP;

SELECT *
FROM EMP SELF JOIN EMP
WHERE EMP.MGR = EMP.EMPNO;







