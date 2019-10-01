SELECT USER
FROM DUAL;
--==>> SCOTT

--�� EMP ���̺��� ��� �����͸�
--   �����, �μ���ȣ, ����, �μ��� ��������, ��ü �������� �׸����� ��ȸ�Ѵ�.


SELECT *
FROM EMP;

SELECT ENAME"�����", DEPTNO"�μ���ȣ", SAL*12"����"
    , RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL*12 DESC)"�μ��� ��������"
    , RANK() OVER(ORDER BY SAL*12 DESC)"��ü ��������"
FROM EMP;
--==>>
/*
KING	10	60000	1	1
FORD	20	36000	1	2
SCOTT	20	36000	1	2
JONES	20	35700	3	4
BLAKE	30	34200	1	5
CLARK	10	29400	2	6
ALLEN	30	19200	2	7
TURNER	30	18000	3	8
MILLER	10	15600	3	9
WARD	30	15000	4	10
MARTIN	30	15000	4	10
ADAMS	20	13200	4	12
JAMES	30	11400	6	13
SMITH	20	9600	5	14
*/

SELECT T.*
    ,RANK() OVER(PARTITION BY T.�μ���ȣ ORDER BY T.���� DESC)"�μ��� ��������"
    ,RANK() OVER(ORDER BY T.���� DESC)"��ü ��������"
FROM
(
    SELECT ENAME"�����", DEPTNO"�μ���ȣ", SAL*12+NVL(COMM,0)"����"
    FROM EMP
) T;


--�� EMP ���̺��� ��ü ���� ���(����)�� 1����� 5�������....
--   �����, �μ���ȣ, ����, ��ü�������� �׸����� ��ȸ�Ѵ�.



SELECT ENAME"�����", DEPTNO"�μ���ȣ", SAL*12+NVL(COMM,0)"����"
        , RANK() OVER(ORDER BY SAL*12+NVL(COMM,0) DESC)"��ü ��������"
FROM EMP
WHERE RANK() OVER(ORDER BY SAL*12+NVL(COMM,0) DESC) <= 5;
--==>> ���� �߻�
-- ORA-30483: window  functions are not allowed here


--�� ���� ������ RANK() OVER() �Լ��� WHERE ���������� ����� ����̸�...
--   �� �Լ��� WHERE ���������� ����� �� ���� ������ �߻��ϴ� �����̴�.
--   �� ���, �츮�� INLINE VIEW�� Ȱ���Ͽ� Ǯ���ؾ� �Ѵ�.

SELECT T.*
FROM
(
    SELECT ENAME"�����", DEPTNO"�μ���ȣ", SAL*12+NVL(COMM,0)"����"
            , RANK() OVER(ORDER BY SAL*12+NVL(COMM,0) DESC)"��ü��������"
    FROM EMP
) T
WHERE T.��ü�������� <= 5;
--==>>
/*
KING	10	60000	1
SCOTT	20	36000	2
FORD	20	36000	2
JONES	20	35700	4
BLAKE	30	34200	5
*/

--�� EMP ���̺��� �� �μ����� ���� ����� 1����� 2�� ������ ��ȸ�Ѵ�.
--   �����, �μ���ȣ, ����, �μ��� ���� ���, ��ü ���� ���
--   �׸��� ��ȸ�� �� �ֵ��� �Ѵ�.

SELECT T.�����, T.�μ���ȣ, T.����, T.�μ����������, T.��ü�������
FROM
(
    SELECT ENAME"�����", DEPTNO"�μ���ȣ", SAL*12+NVL(COMM,0)"����"
            ,RANK() OVER(ORDER BY SAL*12+NVL(COMM,0) DESC)"��ü�������"
            ,RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL*12+NVL(COMM,0) DESC)"�μ����������"
    FROM EMP
) T
WHERE T.�μ���������� <=2;
--==>>
/*
KING	10	60000	1	1
CLARK	10	29400	2	6
FORD	20	36000	1	2
SCOTT	20	36000	1	2
BLAKE	30	34200	1	5
ALLEN	30	19500	2	7
*/

--------------------------------------------------------------------------------

--���� �׷� �ռ� ����--

-- SUM() ��, AVG() ���, COUNT() ī��Ʈ, MAX() �ִ밪, MIN() �ּҰ�
-- , VARIANCE() �л�, STDDEV() ǥ������

--�� �׷� �Լ��� ���� ū Ư¡
--   ó���ؾ� �� �����͵� �� NULL �� �����ϸ�
--   �� NULL �� ������ ���·� ������ �����Ѵٴ� ���̴�.

-- SUM()
-- EMP ���̺��� ������� ��ü ������� �޿� ������ ��ȸ�Ѵ�.

SELECT SAL
FROM EMP;
--==>>
/*
800
1600
1250
2975
1250
2850
2450
3000
5000
1500
1100
950
3000
1300
*/


SELECT SUM(SAL)
FROM EMP;
--==>> 29025

SELECT COMM
FROM EMP;
--==>>
/*

300
500

1400




0




*/

SELECT SUM(COMM)
FROM EMP;
--==>> 2200


-- COUNT()
-- ��(���ڵ�)�� ���� ��ȸ -> �����Ͱ� �� ������ Ȯ��....

SELECT COUNT(ENAME)
FROM EMP;
--==>> 14



SELECT COUNT(COMM)  -- COMM �÷��� ���� ���� ��ȸ -> NULL �� ����~!!!
FROM EMP;
--==>> 4


SELECT COUNT(*)
FROM EMP;
--==>> 14


-- AVG()
-- ��� ��ȯ


SELECT SUM(SAL) / COUNT(SAL)"1", AVG(SAL)"2"
FROM EMP;
--==>>
/*
2073.214285714285714285714285714285714286	
2073.214285714285714285714285714285714286
*/

SELECT SUM(COMM) / COUNT(COMM)"1", AVG(COMM)"2"
FROM EMP;
--==>> 
/*
550	
550
*/

--�� �����Ͱ� NULL �� �÷��� ���ڵ�� ���� ��󿡼� ���ܵȴ�~!!!

SELECT SUM(COMM)/COUNT(*)
FROM EMP;
--==>> 157.142857142857142857142857142857142857

-- VARIANCE(), STDDEV()
-- �� ǥ�������� ������ �л�, �л��� �������� ǥ������


SELECT VARIANCE(SAL), STDDEV(SAL)
FROM EMP;
--==>> 1398313.87362637362637362637362637362637	1182.503223516271699458653359613061928508


SELECT POWER(STDDEV(SAL),2)"1", VARIANCE(SAL)"2"
FROM EMP;
--==>> 1398313.87362637362637362637362637362637	1398313.87362637362637362637362637362637

SELECT SQRT(VARIANCE(SAL))"1", STDDEV(SAL)"2"
FROM EMP;
--==>> 1182.503223516271699458653359613061928508	1182.503223516271699458653359613061928508

-- MAX() / MIN()
-- �ִ밪, �ּҰ� ��ȯ

SELECT MAX(SAL)"1", MIN(SAL)"2"
FROM EMP;
--==>> 5000	800


--�� ����

SELECT ENAME, SUM(SAL)
FROM EMP;
--==>> ���� �߻�
-- ORA-00937: not a single-group group function



SELECT DEPTNO, SUM(SAL)
FROM EMP;
--==>> ���� �߻�
-- ORA-00937: not a single-group group function


SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO;
--==>>
/*
30	9400
20	10875
10	8750
*/

SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO
ORDER BY 1;
--==>>
/*
10	8750
20	10875
30	9400
*/

SELECT *
FROM TBL_EMP;

DELETE
FROM TBL_EMP
WHERE EMPNO IN(8000,8001);
--==>> 2�� �� ��(��) �����Ǿ����ϴ�.

COMMIT;
--==>> Ŀ�� �Ϸ�.


SELECT *
FROM TBL_EMP;

--�� �ǽ� ������ �Է�(TBL_EMP)
INSERT INTO TBL_EMP VALUES
(8001, '��ҿ�', 'CLERK', 7566, SYSDATE, 1500, 10, NULL,NULL);
INSERT INTO TBL_EMP VALUES
(8002, '������', 'CLERK', 7566, SYSDATE, 1000, 10, NULL,NULL);
INSERT INTO TBL_EMP VALUES
(8003, '��â��', 'SALESMAN', 7698, SYSDATE, 2000, NULL, NULL,NULL);
INSERT INTO TBL_EMP VALUES
(8004, '������', 'SALESMAN', 7698, SYSDATE, 2500, NULL, NULL,NULL);
INSERT INTO TBL_EMP VALUES
(8005, '����ȣ', 'SALESMAN', 7698, SYSDATE, 1000, NULL, NULL,NULL);


SELECT *
FROM TBL_EMP;
--==>>
/*
7369	SMITH	CLERK	    7902	80/12/17	800		20	
7499	ALLEN	SALESMAN	7698	81/02/20	1600	300	30	
7521	WARD	SALESMAN	7698	81/02/22	1250	500	30	
7566	JONES	MANAGER	    7839	81/04/02	2975		20	
7654	MARTIN	SALESMAN	7698	81/09/28	1250	1400	30	
7698	BLAKE	MANAGER	    7839	81/05/01	2850		30	
7782	CLARK	MANAGER	    7839	81/06/09	2450		10	
7788	SCOTT	ANALYST	    7566	87/07/13	3000		20	
7839	KING	PRESIDENT		81/11/17	5000		10	
7844	TURNER	SALESMAN	7698	81/09/08	1500	0	30	
7876	ADAMS	CLERK	    7788	87/07/13	1100		20	
7900	JAMES	CLERK	    7698	81/12/03	950		30	
7902	FORD	ANALYST	    7566	81/12/03	3000		20	
7934	MILLER	CLERK	    7782	82/01/23	1300		10	
8001	��ҿ�	CLERK	    7566	19/09/18	1500	10		
8002	������	CLERK	    7566	19/09/18	1000	10		
8003	��â��	SALESMAN	7698	19/09/18	2000			
8004	������	SALESMAN	7698	19/09/18	2500			
8005	����ȣ	SALESMAN	7698	19/09/18	1000			
*/

ALTER TABLE TBL_EMP DROP COLUMN Y;


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.



SELECT DEPTNO, SAL, COMM
FROM TBL_EMP
ORDER BY COMM DESC;

--�� ����Ŭ������ NULL�� ���� ū ������ �����Ѵ�.
--   (ORACLE 9i ������ NULL�� ���� ���� ������ �����߾���.)
--   ������, MSSQL ������ NULL�� ���� ���� ������ �����Ѵ�.


--�� �μ��� �޿��� ��ȸ

SELECT DEPTNO, SUM(SAL)
FROM TBL_EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;
--==>>
/*
10  	8750
20	    10875
30	    9400
(null)	8000
*/



SELECT DEPTNO"�μ���ȣ", SUM(SAL)"�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	8750
20	10875
30	9400
	8000
	37025   -- ��� �μ��� �޿� �� �հ�
*/


SELECT DEPTNO"�μ���ȣ", SUM(SAL)"�޿���"
FROM EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	8750
20	10875
30	9400
	29025   --��� �μ��� �޿� �� �հ�
*/

-- ������ ��ȸ�� ������
/*
10	    8750
20	    10875
30	    9400
���μ�	29025   
*/

-- �̿� ���� ��ȸ�ǵ��� �������� �ۼ��Ѵ�.

SELECT NVL(TO_CHAR(DEPTNO),'���μ�')"�μ���ȣ", SUM(SAL)"�޿���"
FROM EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	    8750
20	    10875
30	    9400
���μ�	29025
*/



SELECT CASE WHEN T.�׷��� = 1 AND T.�μ���ȣ IS NULL THEN '���μ�'
            WHEN T.�׷��� = 0 AND T.�μ���ȣ IS NULL THEN '����'
            ELSE TO_CHAR(T.�μ���ȣ)
       END"�μ���ȣ"
       ,T.�޿���"�޿���"
FROM
(
    SELECT GROUPING(DEPTNO)"�׷���", DEPTNO"�μ���ȣ", SUM(SAL)"�޿���"
    FROM TBL_EMP
    GROUP BY ROLLUP(DEPTNO)
) T;

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '����') ELSE '���μ�' END"�μ���ȣ"
        , SUM(SAL)"�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);



--�� TBL_SAWON ���̺��� �������
--   ������ ���� ��ȸ�� �� �ֵ��� �������� �����Ѵ�.

/*
---------------------------------------------
    ����                  �޿���
---------------------------------------------
    ��                   XXXXXXX
    ��                   XXXXXXX
    �����             XXXXXXXX
--------------------------------------------
*/


SELECT *
FROM TBL_SAWON;


SELECT NVL(T.����, '�����')"����", SUM(T.�޿�)"�޿���"
FROM
(
    SELECT CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '��' 
                WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '��'
                ELSE '�����Ǻ��Ұ�'
           END"����"
           ,SAL"�޿�"
    FROM TBL_SAWON
) T
GROUP BY ROLLUP(T.����);





SELECT CASE GROUPING(T.����) WHEN 0 THEN T.���� ELSE '�����' END"����"
        ,SUM(T.�޿�)"�޿���"
FROM
(
    SELECT CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '��' 
                WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '��'
                ELSE '�����Ǻ��Ұ�'
           END"����"
           ,SAL"�޿�"
    FROM TBL_SAWON
) T
GROUP BY ROLLUP(T.����);
--==>>
/*
��	    11000
��	    36000
�����	47000
*/

--�� TBL_SAWON ���̺��� �������
--   ������ ���� ��ȸ�� �� �ֵ��� �������� �����Ѵ�.
/*
---------------------------------
    ���ɴ�         �ο���
---------------------------------
      0             X
      10             X
      20            X
      30            X
      40            X
      50            X
      60            X
      ��ü          14
-------------------------------
*/

--��� 1. -> INLINE VIEW�� �� �� ���~!!!
SELECT NVL(TO_CHAR(T.���ɴ�), '��ü')"���ɴ�", COUNT(*)"�ο���"
FROM
(
    SELECT CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','2') THEN TRUNC(EXTRACT(YEAR FROM SYSDATE) - TO_NUMBER(SUBSTR(JUBUN,1,2))-1899,-1) 
                WHEN SUBSTR(JUBUN,7,1) IN ('3','4') THEN TRUNC(EXTRACT(YEAR FROM SYSDATE) - TO_NUMBER(SUBSTR(JUBUN,1,2))-1999,-1)
                ELSE 0
           END"���ɴ�"
    FROM TBL_SAWON
) T
GROUP BY ROLLUP(T.���ɴ�);



--��� 2. -> INLINE VIEW�� �� �� ��ø~!!!

-- ���ɴ�
SELECT CASE GROUPING(T2.���ɴ�) WHEN 0 THEN TO_CHAR(T2.���ɴ�) ELSE '��ü' END"���ɴ�"
        ,COUNT(T2.���ɴ�)"�ο���"
FROM
(
    SELECT CASE WHEN T1.���� >= 60 THEN 60 
                WHEN T1.���� >= 50 THEN 50
                WHEN T1.���� >= 40 THEN 40
                WHEN T1.���� >= 30 THEN 30
                WHEN T1.���� >= 20 THEN 20
                WHEN T1.���� >= 10 THEN 10
                ELSE 0
           END"���ɴ�"
    FROM 
    (   -- ����
        SELECT CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','2') THEN EXTRACT(YEAR FROM SYSDATE) - TO_NUMBER(SUBSTR(JUBUN,1,2))-1899 
                        WHEN SUBSTR(JUBUN,7,1) IN ('3','4') THEN EXTRACT(YEAR FROM SYSDATE) - TO_NUMBER(SUBSTR(JUBUN,1,2))-1999
                        ELSE -1
               END"����"
        FROM TBL_SAWON
    ) T1
) T2
GROUP BY ROLLUP(T2.���ɴ�);
--==>>
/*
10	5
20	4
30	1
40	1
50	1
60	2
��ü	14
*/

SELECT DEPTNO, JOB, SUM(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY 1,2;
--==>>
/*
10	CLERK	    1300
10	MANAGER	    2450
10	PRESIDENT	5000
20	ANALYST	    6000
20	CLERK	    1900
20	MANAGER	    2975
30	CLERK	    950
30	MANAGER	    2850
30	SALESMAN	5600
*/

SELECT DEPTNO, JOB, SUM(SAL)
FROM EMP
GROUP BY ROLLUP(DEPTNO, JOB)
ORDER BY 1,2;
--==>>
/*
10	CLERK	    1300
10	MANAGER	    2450
10	PRESIDENT	5000
10		        8750    --10�� �μ� ��� ������ �޿���
20	ANALYST	    6000
20	CLERK	    1900
20	MANAGER	    2975
20		        10875   --20�� �μ� ��� ������ �޿���
30	CLERK	    950
30	MANAGER	    2850
30	SALESMAN	5600
30		        9400    --30�� �μ� ��� ������ �޿���
                29025   --��� �μ� ��� ������ �޿���
*/

--�� CUBE() -> ROLLUP() ���� ���� �� �ڼ��� ����� ��ȯ���� �� �ִ�.


SELECT DEPTNO, JOB, SUM(SAL)
FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY 1,2;
--==>>
/*
10	CLERK	    1300
10	MANAGER	    2450
10	PRESIDENT	5000
10		        8750
20	ANALYST	    6000
20	CLERK	    1900
20	MANAGER	    2975
20		        10875   --20�� �μ� ��� ������ �޿���
30	CLERK	    950
30	MANAGER	    2850
30	SALESMAN	5600
30		        9400    --30�� �μ� ��� ������ �޿���
	ANALYST	    6000    --��� �μ� ANALYST ������ �޿���
	CLERK	    4150    --��� �μ� CLERK ������ �޿���
	MANAGER	    8275    --��� �μ� MANAGER ������ �޿���
	PRESIDENT	5000    --��� �μ� PRESIDENT ������ �޿���
	SALESMAN	5600    --��� �μ� SALESMAN ������ �޿���
                29025   --��� �μ� ��� ������ �޿���
*/

--�� ROLLUP()�� CUBE()��
--   �׷��� �����ִ� ����� �ٸ���.(����)

-- ex)
-- ROLLUP(A,B,C)
-- -> (A,B,C) / (A,B) / (A) / ()

-- CUBE(A,B,C)
-- -> (A,B,C) / (A,B) / (A,C) / (B,C) /(A) / (B) /(C) /()

--==>> ���� ��(ROLLUP())��  ���� ����� �ټ� ���ڶ��
--     �Ʒ� ��(CUBE())�� ���� ����� �ټ� ����ġ�� ������
--     ������ ���� ����� ���� ���¸� �� ���� ����Ѵ�.
--     ���� �ۼ��ϴ� ������ ��ȸ�ϰ��� �ϴ� �׷츸 ��GROUPING SETS����
--     �̿��Ͽ� �����ִ� ����̴�.

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '����')
            ELSE '��ü�μ�'
       END"�μ���ȣ"
       ,CASE GROUPING(JOB) WHEN 0 THEN JOB ELSE '��ü����' END"����"
       ,SUM(SAL)"�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO, JOB)
ORDER BY 1,2;


SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '����')
            ELSE '��ü�μ�'
       END"�μ���ȣ"
       ,CASE GROUPING(JOB) WHEN 0 THEN JOB ELSE '��ü����' END"����"
       ,SUM(SAL)"�޿���"
FROM TBL_EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY 1,2;


SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '����')
            ELSE '��ü�μ�'
       END"�μ���ȣ"
       ,CASE GROUPING(JOB) WHEN 0 THEN JOB ELSE '��ü����' END"����"
       ,SUM(SAL)"�޿���"
FROM TBL_EMP
GROUP BY GROUPING SETS((DEPTNO, JOB), (DEPTNO), (JOB) ,())
ORDER BY 1,2;
--==>> CUBE() �� ����� ����� ���� ��ȸ ���
  

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '����')
            ELSE '��ü�μ�'
       END"�μ���ȣ"
       ,CASE GROUPING(JOB) WHEN 0 THEN JOB ELSE '��ü����' END"����"
       ,SUM(SAL)"�޿���"
FROM TBL_EMP
GROUP BY GROUPING SETS((DEPTNO, JOB), (DEPTNO),())
ORDER BY 1,2;
--> ROLLUP() �� ����� ����� ���� ��ȸ ���



SELECT *
FROM TBL_EMP;

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.


--�� TBL_EMP ���̺��� �������
--   �Ի�⵵�� �ο����� ��ȸ�Ѵ�.


SELECT NVL(TO_CHAR(HIREDATE, 'YYYY'), '��ü')"�Ի�⵵��", COUNT(*)"�ο���"
FROM TBL_EMP
GROUP BY ROLLUP(TO_CHAR(HIREDATE, 'YYYY'))
ORDER BY 1;


SELECT NVL(TO_CHAR(HIREDATE, 'YYYY'), '��ü')"�Ի�⵵��", COUNT(*)"�ο���"
FROM TBL_EMP
GROUP BY CUBE(TO_CHAR(HIREDATE, 'YYYY'))
ORDER BY 1;


SELECT NVL(TO_CHAR(HIREDATE, 'YYYY'), '��ü')"�Ի�⵵��", COUNT(*)"�ο���"
FROM TBL_EMP
GROUP BY GROUPING SETS((TO_CHAR(HIREDATE, 'YYYY')),())
ORDER BY 1;

--> GROUP BY ���� ���� �Ͱ� SELECT ������ ��ġ�ϰ� ����ؾ���
--  �ڷ��� Ÿ�Ը� ����ٰ� �Ǵ� ���� �ƴ�, �ڷ����� ���Ƶ� ���� ����� �ٸ��� ������ ��ġ�ϰ� ��� �Ѵ�.


--------------------------------------------------------------------------------------------------------

--���� HAVING ����--

--�� EMP ���̺��� �μ���ȣ�� 20,30 �� �μ��� �������
--   �μ��� �� �޿��� 10000���� ���� ��츸 �μ��� �� �޿��� ��ȸ�Ѵ�.

SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20,30)
GROUP BY DEPTNO;

SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20,30) AND SUM(SAL) > 10000
GROUP BY DEPTNO;
--==>> ���� �߻�
-- ORA-00934: group function is not allowed here


SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20,30)
GROUP BY DEPTNO
HAVING SUM(SAL) < 10000;
--==>> 30	9400



SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING DEPTNO IN(20,30) AND SUM(SAL) <10000;
--> ������ �� ���� �޸� ���� 



-------------------------------------------------------------------------------


--���� ��ø �׷��Լ� / �м��Լ� ����--

-- �׷� �Լ� 2LEVEL ���� ��ø�ؼ� ����� �� �ִ�.
-- �̸����� MSSQL�� �Ұ����ϴ�.

SELECT MAX(SUM(SAL))
FROM EMP
GROUP BY DEPTNO;
--==>> 10875

--RANK()
--DENSE_RANK()
--> ORACLE 9i ���� ����...MSSQL 2005 ���� ����....

-- ���� ���������� RANK()�� DENSE_RANK() �� ����� �� ���� ������
-- ���� ���... �޿� ������ ���ϰ��� �Ѵٸ�...
-- �ش� ����� �޿����� �� ū ���� �� ������ Ȯ���� ��
-- Ȯ���� ���ڿ� +1 �� �߰� �������ָ� �� ���� �� �ش� ����� ����� �ȴ�.


SELECT ENAME, SAL
FROM EMP;
--==>>
/*
SMITH	800
ALLEN	1600
WARD	1250
JONES	2975
MARTIN	1250
BLAKE	2850
CLARK	2450
SCOTT	3000
KING	5000
TURNER	1500
ADAMS	1100
JAMES	950
FORD	3000
MILLER	1300
*/


SELECT COUNT(*) +1
FROM EMP
WHERE SAL > 800;

--�� ���� ��� ���� (��� ��������)
--   ���� ������ �ִ� ���̺��� �÷���
--   ���� ������ ������(WHERE��, HAVING��)�� ���Ǵ� ���
--   �츮�� �� �������� ���� ��� ����(��� ���� ����)��� �θ���.


SELECT ENAME"�����", SAL"�޿�"
        , (1)"�޿����"
FROM EMP;


SELECT E1.ENAME"�����", E1.SAL"�޿�"
        ,(SELECT COUNT(*)+1
          FROM EMP
          WHERE SAL > E1.SAL)"�޿����"
FROM EMP E1;
--==>>
/*
SMITH	800	    14
ALLEN	1600	7
WARD	1250	10
JONES	2975	4
MARTIN	1250	10
BLAKE	2850	5
CLARK	2450	6
SCOTT	3000	2
KING	5000	1
TURNER	1500	8
ADAMS	1100	12
JAMES	950	    13
FORD	3000	2
MILLER	1300	9
*/

--�� EMP ���̺��� �������
--   �����, �޿�, �μ���ȣ, �μ����޿����, ��ü�޿���� �׸��� ��ȸ�Ѵ�.
--   ��, RANK �Լ��� ������� �ʰ�, ���� ��� ������ Ȱ���� �� �ֵ��� �Ѵ�.


SELECT E.ENAME"�����", E.SAL"�޿�", E.DEPTNO"�μ���ȣ"
        ,(SELECT COUNT(*)+1
          FROM EMP
          WHERE SAL > E.SAL AND DEPTNO = E.DEPTNO )"�μ����޿����"
        ,(SELECT COUNT(*)+1
          FROM EMP
          WHERE SAL > E.SAL)"��ü�޿����"
FROM EMP E;
--==>>
/*
SMITH	800	    20	5	14
ALLEN	1600	30	2	7
WARD	1250	30	4	10
JONES	2975	20	3	4
MARTIN	1250	30	4	10
BLAKE	2850	30	1	5
CLARK	2450	10	2	6
SCOTT	3000	20	1	2
KING	5000	10	1	1
TURNER	1500	30	3	8
ADAMS	1100	20	4	12
JAMES	950	    30	6	13
FORD	3000	20	1	2
MILLER	1300	10	3	9
*/


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








