SELECT USER
FROM DUAL;
--==>> SCOTT

--���� UNION / UNION ALL ����--

--�� �ǽ� ���̺� ����(TBL_JUMUN)
CREATE TABLE TBL_JUMUN              -- �ֹ� ���̺� ����
( JUNO      NUMBER                  -- �ֹ� ��ȣ
, JECODE    VARCHAR2(30)            -- �ֹ��� ��ǰ �ڵ�
, JUSU      NUMBER                  -- �ֹ� ����
, JUDAY     DATE DEFAULT SYSDATE    -- �ֹ� ����

);
--==>> Table TBL_JUMUN��(��) �����Ǿ����ϴ�.
--> ���� �ֹ��� �߻����� ���
--  �ֹ� ���뿡 ���� �����Ͱ� �Էµ� �� �ִ� ���̺�


--�� ������ �Է� -> ���� �ֹ� �߻� / ����
INSERT INTO TBL_JUMUN
VALUES (1, '����Ĩ', 20, TO_DATE('2001-11-01 09:10:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN
VALUES (2, 'Ȩ����', 10, TO_DATE('2001-11-01 09:42:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN
VALUES (3, '���̽�', 30, TO_DATE('2001-11-01 10:42:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN
VALUES (4, '����Ĩ', 10, TO_DATE('2001-11-02 09:42:10', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN
VALUES (5, '��Ĩ', 10, TO_DATE('2001-11-03 09:42:10', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN
VALUES (6, '������', 10, TO_DATE('2001-11-04 09:42:10', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN
VALUES (7, '��īĨ', 10, TO_DATE('2001-11-05 09:42:10', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN
VALUES (8, '�����', 20, TO_DATE('2001-11-06 09:42:10', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN
VALUES (9, '����', 10, TO_DATE('2001-11-07 09:42:10', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN
VALUES (10, '�ķ��ú���', 10, TO_DATE('2001-11-08 09:42:10', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN
VALUES (11, '����Ĩ', 10, TO_DATE('2001-11-09 09:42:10', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN
VALUES (12, '���̽�', 30, TO_DATE('2002-11-01 10:42:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN
VALUES (13, '����', 30, TO_DATE('2003-11-01 10:42:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN
VALUES (14, '������', 20, TO_DATE('2004-11-01 10:42:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN
VALUES (15, '������', 50, TO_DATE('2005-11-01 10:42:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN
VALUES (16, 'ĭ��', 50, TO_DATE('2006-11-01 10:42:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN
VALUES (17, 'ĭ��', 10, TO_DATE('2007-11-01 10:42:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN
VALUES (18, '�Ǻ���', 30, TO_DATE('2008-11-01 10:42:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN
VALUES (19, '����Ĩ', 10, TO_DATE('2009-11-01 10:42:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN
VALUES (20, '������', 50, TO_DATE('2010-11-01 10:42:12', 'YYYY-MM-DD HH24:MI:SS'));
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 20

--�� Ȯ��

SELECT *
FROM TBL_JUMUN;

--==>>
/*
1	����Ĩ	    20	2001-11-01
2	Ȩ����	    10	2001-11-01
3	���̽�	    30	2001-11-01
4	����Ĩ	    10	2001-11-02
5	��Ĩ	        10	2001-11-03
6	������	    10	2001-11-04
7	��īĨ	    10	2001-11-05
8	�����	    20	2001-11-06
9	����	        10	2001-11-07
10	�ķ��ú���	10	2001-11-08
11	����Ĩ	    10	2001-11-09
12	���̽�	    30	2002-11-01
13	����	        30	2003-11-01
14	������	    20	2004-11-01
15	������	    50	2005-11-01
16	ĭ��      	50	2006-11-01
17	ĭ��	        10	2007-11-01
18	�Ǻ���	    30	2008-11-01
19	����Ĩ	    10	2009-11-01
20	������	    50	2010-11-01
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� ������ �߰� �Է� -> 2001�� ���� ���۵� �ֹ��� ����(2019��)���� ��� �߻�~!!!
INSERT INTO TBL_JUMUN VALUES(98765,'��Ĩ',10,SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98766,'ĭ��',10,SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98767,'������',50,SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98768,'����Ĩ',10,SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98769,'����Ĩ',20,SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98770,'����Ĩ',30,SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98771,'���̽�',60,SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98772,'����',10,SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98773,'������',20,SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98774,'����Ĩ',50,SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98775,'����Ĩ',20,SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� Ȯ��

SELECT *
FROM TBL_JUMUN;
--==>>
/*
    1	����Ĩ	    20	2001-11-01
    2	Ȩ����	    10	2001-11-01
    3	���̽�	    30	2001-11-01
    4	����Ĩ	    10	2001-11-02
    5	��Ĩ  	    10	2001-11-03
    6	������	    10	2001-11-04
    7	��īĨ	    10	2001-11-05
    8	�����	    20	2001-11-06
    9	����  	    10	2001-11-07
    10	�ķ��ú���	10	2001-11-08
    11	����Ĩ	    10	2001-11-09
    12	���̽�	    30	2002-11-01
    13	����	        30	2003-11-01
    14	������	    20	2004-11-01
    15	������	    50	2005-11-01
    16	ĭ��	        50	2006-11-01
    17	ĭ��	        10	2007-11-01
    18	�Ǻ���	    30	2008-11-01
    19	����Ĩ	    10	2009-11-01
    20	������	    50	2010-11-01
98765	��Ĩ	        10	2019-09-20
98766	ĭ��	        10	2019-09-20
98767	������	    50	2019-09-20
98768	����Ĩ	    10	2019-09-20
98769	����Ĩ	    20	2019-09-20
98770	����Ĩ	    30	2019-09-20
98771	���̽�	    60	2019-09-20
98772	����	        10	2019-09-20
98773	������	    20	2019-09-20
98774	����Ĩ	    50	2019-09-20
98775	����Ĩ	    20	2019-09-20
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� �����̰� ���� ���θ� � ��...
--   TBL_JUMUN ���̺��� �ʹ� ���ſ��� ��Ȳ
--   ���ø����̼ǰ��� �������� ���� �ֹ� ������ �ٸ� ���̺�
--   ����� �� �ֵ��� ����� ���� �Ұ����� ��Ȳ.
--   ������ ��� �����͸� ������� ����� �͵� �Ұ����� ��Ȳ.
--   -> ���������...
--      ������� ������ �ֹ� ������ ��
--      ���� �߻��� �ֹ� ������ �����ϰ� �������� �ٸ� ���̺�(TBL_JUMUNBACKUP)��
--      ������ �̰��� ������ ��ȹ

CREATE TABLE TBL_JUMUNBACKUP
AS
(
    SELECT *
    FROM TBL_JUMUN
    WHERE TO_CHAR(SYSDATE,'YYYY-MM-DD') <> TO_CHAR(JUDAY,'YYYY-MM-DD')
);
--==>> Table TBL_JUMUNBACKUP��(��) �����Ǿ����ϴ�.


--�� Ȯ��

SELECT *
FROM TBL_JUMUNBACKUP;
--==>>
/*
1	����Ĩ	    20	2001-11-01 09:10:12
2	Ȩ����	    10	2001-11-01 09:42:12
3	���̽�	    30	2001-11-01 10:42:12
4	����Ĩ	    10	2001-11-02 09:42:10
5	��Ĩ  	    10	2001-11-03 09:42:10
6	������	    10	2001-11-04 09:42:10
7	��īĨ	    10	2001-11-05 09:42:10
8	�����    	20	2001-11-06 09:42:10
9	����	        10	2001-11-07 09:42:10
10	�ķ��ú���	10	2001-11-08 09:42:10
11	����Ĩ	    10	2001-11-09 09:42:10
12	���̽�	    30	2002-11-01 10:42:12
13	����      	30	2003-11-01 10:42:12
14	������	    20	2004-11-01 10:42:12
15	������	    50	2005-11-01 10:42:12
16	ĭ��      	50	2006-11-01 10:42:12
17	ĭ��      	10	2007-11-01 10:42:12
18	�Ǻ���	    30	2008-11-01 10:42:12
19	����Ĩ	    10	2009-11-01 10:42:12
20	������	    50	2010-11-01 10:42:12
*/
--> TBL_JUMUN ���̺��� �����͵� ��
--  ���� �ֹ����� �̿��� �����ʹ� ��� TBL_JUMUNBACKUP ��
--  ����� ��ģ ����.

--  TBL_JUMUN ���̺��� �����͵� ��
--  ����� ��ģ �����͵� ����


DELETE
FROM TBL_JUMUN
WHERE TO_CHAR(SYSDATE,'YYYY-MM-DD') <> TO_CHAR(JUDAY, 'YYYY-MM-DD');
--==>> 20�� �� ��(��) �����Ǿ����ϴ�.
--      ->98764 ���� ������ ����

--�� ���� ��ǰ �߼��� �Ϸ���� ���� ���� �ֹ� �����͸� �����ϰ�
--   ������ ��� �ֹ� �����͵��� ������ ��Ȳ�̹Ƿ�
--   ���̺��� ��(���ڵ�)�� ������ �پ��� �ſ� �������� ��Ȳ�̴�.

--�� Ȯ��
SELECT *
FROM TBL_JUMUN;
--==>>
/*
98765	��Ĩ	10	2019-09-20 12:18:13
98766	ĭ��	10	2019-09-20 12:18:42
98767	������	50	2019-09-20 12:19:06
98768	����Ĩ	10	2019-09-20 12:21:24
98769	����Ĩ	20	2019-09-20 12:21:45
98770	����Ĩ	30	2019-09-20 12:22:00
98771	���̽�	60	2019-09-20 12:22:44
98772	����	10	2019-09-20 12:23:07
98773	������	20	2019-09-20 12:23:27
98774	����Ĩ	50	2019-09-20 12:23:49
98775	����Ĩ	20	2019-09-20 12:24:09
*/

--�� Ŀ��
COMMIT;
--==>>Ŀ�� �Ϸ�.

-- �׷���, ���ݱ��� �ֹ����� ������ ���� ������
-- ��ǰ�� �� �ֹ������� ��Ÿ���� �� ��Ȳ�� �߻��ϰ� �Ǿ���.
-- �׷��ٸ�, TBL_JUMUNBACKUP ���̺��� ���ڵ�(��)��
-- TBL_JUMUN ���̺��� ���ڵ�(��)�� ���ļ� �ϳ��� ���̺���
-- ��ȸ�ϴ� �Ͱ� ���� ����� Ȯ���� �� �ֵ��� ��ȸ�� �̷������ �Ѵ�.

--�� �÷��� �÷��� ���踦 ����Ͽ� ���̺��� �����ϰ��� �ϴ� ���
--   JOIN �� ���������
--   ���ڵ�(��)�� ���ڵ�(��)�� �����ϰ��� �ϴ� ���
--   UNION / UNION ALL �� ����� �� �ִ�.


SELECT *
FROM TBL_JUMUNBACKUP;
SELECT *
FROM TBL_JUMUN;


SELECT *
FROM TBL_JUMUNBACKUP
UNION
SELECT *
FROM TBL_JUMUN;


SELECT *
FROM TBL_JUMUNBACKUP
UNION ALL
SELECT *
FROM TBL_JUMUN;


SELECT *
FROM TBL_JUMUN
UNION
SELECT *
FROM TBL_JUMUNBACKUP;


SELECT *
FROM TBL_JUMUN
UNION ALL
SELECT *
FROM TBL_JUMUNBACKUP;

--�� UNION�� �׻� ������� ù ��° �÷��� �������� �������� ������ �����Ѵ�.
--   UNION ALL�� ���յ� ������� ��ȸ�� ����� ��ȯ�Ѵ�.(���� ����)
--   �̷� ���� UNION �� ���ϰ� �� ũ��.
--   ����, UNION�� ��������� �ߺ��� ���� ������ ���
--   �ߺ��� �����ϰ� 1�� �ุ ��ȸ�� ����� ��ȯ�ϰ� �ȴ�.

--�� ���ݱ��� �ֹ����� ������ ����
--   ��ǰ�� �� �ֹ����� ��ȸ�� �� �ִ� �������� �����Ѵ�.



SELECT JECODE"��ǰ", SUM(JUSU)"�ֹ���"
FROM TBL_JUMUN
GROUP BY JECODE
UNION ALL
SELECT JECODE"��ǰ", SUM(JUSU)"�ֹ���"
FROM TBL_JUMUNBACKUP
GROUP BY JECODE;


SELECT T.JECODE, SUM(T.JUSU)
FROM
(
    SELECT JECODE, JUSU
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
) T
GROUP BY T.JECODE;
--==>>
/*
�����	    20
�ķ��ú���	10
����Ĩ	    80
��Ĩ	        20
���̽�	    120
����  	    50
�Ǻ���	    30
����Ĩ	    100
��īĨ	    10
Ȩ����	    10
������	    200
ĭ��	        70
*/


--�� INTERSECT / MINUS (-> �����հ� ������)

-- TBL_JUMUNBACKUP ���̺�� TBL_JUMUN ���̺���
-- ��ǰ�ڵ�� �ֹ����� ���� �Ȱ��� �ุ �����ϰ��� �Ѵ�.


SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT JECODE, JUSU
FROM TBL_JUMUN;
--==>>
/*
����Ĩ	20
����	    10
������	20
������	50
��Ĩ	    10
ĭ��  	10
*/

--�� ����
-- TBL_JUMUNBACKUP ���̺�� TBL_JUMUN ���̺��� �������
-- ��ǰ�ڵ�� �ֹ����� ���� �Ȱ��� ���� ������
-- �ֹ���ȣ, ��ǰ�ڵ�,�ֹ���, �ֹ����� �׸����� ��ȸ�Ѵ�.


SELECT T2.JUNO, T1.JECODE, T1.JUSU, T2.JUDAY
FROM
(
    SELECT JECODE, JUSU
    FROM TBL_JUMUNBACKUP
    INTERSECT
    SELECT JECODE, JUSU
    FROM TBL_JUMUN 
) T1
LEFT JOIN
(
    SELECT *
    FROM TBL_JUMUN
    UNION ALL
    SELECT *
    FROM TBL_JUMUNBACKUP
) T2
ON T1.JECODE = T2.JECODE AND T1.JUSU = T2.JUSU;

-----------------------------------------------------

-- ��� 1.
SELECT T2.JUNO, T1.JECODE, T1.JUSU, T2.JUDAY
FROM
(
    SELECT JECODE, JUSU
    FROM TBL_JUMUNBACKUP
    INTERSECT
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
) T1
JOIN
(
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUN
) T2
ON T1.JECODE = T2.JECODE AND T1.JUSU = T2.JUSU;

-- ��� 2.

SELECT *
FROM
(
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUN
) T
WHERE CONCAT(JECODE, JUSU) = ANY(SELECT JECODE || JUSU
                                 FROM TBL_JUMUNBACKUP
                                 INTERSECT
                                 SELECT JECODE || JUSU
                                 FROM TBL_JUMUN
                                );
                                
----------------------------------------------------------------------------                                

SELECT D.DEPTNO, D.DNAME, E.ENAME, E.SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;
--==>>
/*
10	ACCOUNTING	CLARK	2450
10	ACCOUNTING	KING	5000
10	ACCOUNTING	MILLER	1300
20	RESEARCH	JONES	2975
20	RESEARCH	FORD	3000
20	RESEARCH	ADAMS	1100
20	RESEARCH	SMITH	800
20	RESEARCH	SCOTT	3000
30	SALES	WARD	1250
30	SALES	TURNER	1500
30	SALES	ALLEN	1600
30	SALES	JAMES	950
30	SALES	BLAKE	2850
30	SALES	MARTIN	1250
*/


SELECT DEPTNO, DNAME, ENAME, SAL
FROM EMP NATURAL JOIN DEPT;

SELECT DEPTNO, DNAME, ENAME, SAL
FROM EMP JOIN DEPT
USING(DEPTNO);

------------------------------------------------------------------

--�� TBL_EMP ���̺��� �޿��� ���� ���� �����
--   �����ȣ, �����, ������, �޿� �׸��� ��ȸ�ϴ� �������� �����Ѵ�.

SELECT EMPNO, ENAME, JOB, SAL
FROM TBL_EMP
WHERE SAL = (
              SELECT MAX(SAL)
              FROM TBL_EMP
            );
--==>> 7839	KING	PRESIDENT	5000


SELECT EMPNO, ENAME, JOB, SAL
FROM TBL_EMP
WHERE SAL = (
            );

-- ��=ANY��

-- ��=ALL��


SELECT SAL
FROM TBL_EMP;


SELECT EMPNO, ENAME, JOB, SAL
FROM TBL_EMP
WHERE SAL >=ALL ( SELECT SAL
                  FROM TBL_EMP
                    );
                    
                    
--�� TBL_EMP ���̺��� 20�� �μ��� �ٹ��ϴ� ��� ��
--   �޿��� ���� ���� ����� ������
--   �����ȣ, �����, �μ���ȣ, ������, �޿� �׸����� ��ȸ�Ѵ�.


SELECT EMPNO, ENAME, DEPTNO, JOB, SAL
FROM TBL_EMP
WHERE SAL = (   SELECT MAX(SAL)
                FROM TBL_EMP
                WHERE DEPTNO=20
            ) AND DEPTNO = 20;                 
--==>>
/*
7788	SCOTT	20	ANALYST	3000
7902	FORD	20	ANALYST	3000
*/
          
SELECT EMPNO, ENAME, DEPTNO, JOB, SAL
FROM TBL_EMP
WHERE DEPTNO =20 AND SAL >=ALL (SELECT SAL FROM TBL_EMP WHERE DEPTNO =20);    
--==>>
/*
7902	FORD	20	ANALYST	3000
7788	SCOTT	20	ANALYST	3000
*/


--�� TBL_EMP ���̺��� ����(Ŀ�̼�:COMM)�� ���� ���� �����
--   �����ȣ, �����, �μ���ȣ, ������, Ŀ�̼� �׸��� ��ȸ�Ѵ�.



SELECT *
FROM TBL_EMP;


SELECT EMPNO, ENAME, DEPTNO, JOB, COMM
FROM TBL_EMP
WHERE COMM = (  SELECT MAX(COMM)
                FROM TBL_EMP
             );
--==>> 7654	MARTIN	30	SALESMAN	1400            
             
SELECT EMPNO, ENAME, DEPTNO, JOB, COMM
FROM TBL_EMP
WHERE COMM >=ALL (  SELECT NVL(COMM,0)
                    FROM TBL_EMP
                 );

--==>> 7654	MARTIN	30	SALESMAN	1400

SELECT EMPNO, ENAME, DEPTNO, JOB, COMM
FROM TBL_EMP
WHERE COMM >=ALL (  SELECT COMM
                    FROM TBL_EMP
                    WHERE COMM IS NOT NULL
                 );
--==>> 7654	MARTIN	30	SALESMAN	1400


SELECT DISTINCT(COMM)       -- �ߺ� ���� �Լ� -> DISTINCT()
FROM TBL_EMP;

-- EMP ���̺��� �����ڷ� ��ϵ� ����� �����͸�
-- �����ȣ, �����, ������ �׸����� ��ȸ�Ѵ�.



SELECT *
FROM EMP;


SELECT EMPNO, ENAME, JOB
FROM EMP
WHERE EMPNO =ANY (  SELECT MGR
                     FROM EMP
                     WHERE MGR IS NOT NULL
                 );


SELECT EMPNO, ENAME, JOB
FROM EMP
WHERE EMPNO =ANY (  SELECT DISTINCT(MGR)
                     FROM EMP
                 );
--==>>
/*
7566	JONES	MANAGER
7698	BLAKE	MANAGER
7782	CLARK	MANAGER
7788	SCOTT	ANALYST
7839	KING	PRESIDENT
7902	FORD	ANALYST
*/

--------------------------------------------------------------

SELECT *
FROM TBL_SAWON;

--�� TBL_SANWON ���̺� ���(������ ����) -> �� ���̺� ���� ���質 �������� ���� ������ ����

CREATE TABLE TBL_SAWONBACKUP
AS
SELECT *
FROM TBL_SAWON;
--==>> Table TBL_SAWONBACKUP��(��) �����Ǿ����ϴ�.
-- TBL_SAWON ���̺��� �����͵鸸 ����� ����
-- ��, �ٸ� �̸��� ���̺� ���·� ������ �� ��Ȳ

--�� Ȯ��

SELECT *
FROM TBL_SAWONBACKUP
MINUS
SELECT *
FROM TBL_SAWON;


--�� ������ ����

UPDATE TBL_SAWON
SET SANAME = '������'
WHERE SANO = 1001;


UPDATE TBL_SAWON
SET SANAME = '�ʶ���';
COMMIT;


SELECT *
FROM TBL_SAWON;


ROLLBACK;
--==>> �ѹ� �Ϸ�.

-- ���� ���� UPDATE ó�� ���Ŀ� COMMIT�� �����Ͽ��� ������
-- ROLLBACK�� �Ұ����� ��Ȳ�̴�.
-- ������, TBL_SAWONBACKUP ���̺� �����͸� ����� �ξ���.
-- SANAME �÷��� ���븸 �����Ͽ� '�ʶ���' ��� �־��� �� �ִٴ� ���̴�.

SELECT *
FROM TBL_SAWONBACKUP;

SELECT *
FROM TBL_SAWON;


UPDATE TBL_SAWON
SET SANAME = (  SELECT SANAME
                FROM TBL_SAWONBACKUP
                WHERE SANO=TBL_SAWON.SANO
              )
WHERE SANAME ='�ʶ���';
--==>> 14�� �� ��(��) ������Ʈ�Ǿ����ϴ�.

SELECT *
FROM TBL_SAWON;

COMMIT;
--==>> Ŀ�� �Ϸ�.














