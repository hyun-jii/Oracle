SELECT USER
FROM DUAL;
--==>> SCOTT

--○ EMP 테이블의 사원 데이터를
--   사원명, 부서번호, 연봉, 부서내 연봉순위, 전체 연봉순위 항목으로 조회한다.


SELECT *
FROM EMP;

SELECT ENAME"사원명", DEPTNO"부서번호", SAL*12"연봉"
    , RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL*12 DESC)"부서내 연봉순위"
    , RANK() OVER(ORDER BY SAL*12 DESC)"전체 연봉순위"
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
    ,RANK() OVER(PARTITION BY T.부서번호 ORDER BY T.연봉 DESC)"부서내 연봉순위"
    ,RANK() OVER(ORDER BY T.연봉 DESC)"전체 연봉순위"
FROM
(
    SELECT ENAME"사원명", DEPTNO"부서번호", SAL*12+NVL(COMM,0)"연봉"
    FROM EMP
) T;


--○ EMP 테이블에서 전체 연봉 등수(순위)가 1등부터 5등까지만....
--   사원명, 부서번호, 연봉, 전체연봉순위 항목으로 조회한다.



SELECT ENAME"사원명", DEPTNO"부서번호", SAL*12+NVL(COMM,0)"연봉"
        , RANK() OVER(ORDER BY SAL*12+NVL(COMM,0) DESC)"전체 연봉순위"
FROM EMP
WHERE RANK() OVER(ORDER BY SAL*12+NVL(COMM,0) DESC) <= 5;
--==>> 에러 발생
-- ORA-30483: window  functions are not allowed here


--※ 위의 내용은 RANK() OVER() 함수를 WHERE 조건절에서 사용한 경우이며...
--   이 함수는 WHERE 조건절에서 사용할 수 없기 때문에 발생하는 에러이다.
--   이 경우, 우리는 INLINE VIEW를 활용하여 풀이해야 한다.

SELECT T.*
FROM
(
    SELECT ENAME"사원명", DEPTNO"부서번호", SAL*12+NVL(COMM,0)"연봉"
            , RANK() OVER(ORDER BY SAL*12+NVL(COMM,0) DESC)"전체연봉순위"
    FROM EMP
) T
WHERE T.전체연봉순위 <= 5;
--==>>
/*
KING	10	60000	1
SCOTT	20	36000	2
FORD	20	36000	2
JONES	20	35700	4
BLAKE	30	34200	5
*/

--○ EMP 테이블에서 각 부서별로 연봉 등수가 1등부터 2등 까지만 조회한다.
--   사원명, 부서번호, 연봉, 부서내 연봉 등수, 전체 연봉 등수
--   항목을 조회할 수 있도록 한다.

SELECT T.사원명, T.부서번호, T.연봉, T.부서내연봉등수, T.전체연봉등수
FROM
(
    SELECT ENAME"사원명", DEPTNO"부서번호", SAL*12+NVL(COMM,0)"연봉"
            ,RANK() OVER(ORDER BY SAL*12+NVL(COMM,0) DESC)"전체연봉등수"
            ,RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL*12+NVL(COMM,0) DESC)"부서내연봉등수"
    FROM EMP
) T
WHERE T.부서내연봉등수 <=2;
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

--■■■ 그룹 합수 ■■■--

-- SUM() 합, AVG() 평균, COUNT() 카운트, MAX() 최대값, MIN() 최소값
-- , VARIANCE() 분산, STDDEV() 표준편차

--※ 그룹 함수의 가장 큰 특징
--   처리해야 할 데이터들 중 NULL 이 존재하면
--   이 NULL 은 제외한 상태로 연산을 수행한다는 것이다.

-- SUM()
-- EMP 테이블을 대상으로 전체 사원들의 급여 총합을 조회한다.

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
-- 행(레코드)의 개수 조회 -> 데이터가 몇 건인지 확인....

SELECT COUNT(ENAME)
FROM EMP;
--==>> 14



SELECT COUNT(COMM)  -- COMM 컬럼의 행의 개수 조회 -> NULL 은 제외~!!!
FROM EMP;
--==>> 4


SELECT COUNT(*)
FROM EMP;
--==>> 14


-- AVG()
-- 평균 반환


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

--※ 데이터가 NULL 인 컬럼의 레코드는 연산 대상에서 제외된다~!!!

SELECT SUM(COMM)/COUNT(*)
FROM EMP;
--==>> 157.142857142857142857142857142857142857

-- VARIANCE(), STDDEV()
-- ※ 표준편차의 제곱이 분산, 분산의 제곱근이 표준편차


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
-- 최대값, 최소값 반환

SELECT MAX(SAL)"1", MIN(SAL)"2"
FROM EMP;
--==>> 5000	800


--※ 주의

SELECT ENAME, SUM(SAL)
FROM EMP;
--==>> 에러 발생
-- ORA-00937: not a single-group group function



SELECT DEPTNO, SUM(SAL)
FROM EMP;
--==>> 에러 발생
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
--==>> 2개 행 이(가) 삭제되었습니다.

COMMIT;
--==>> 커밋 완료.


SELECT *
FROM TBL_EMP;

--○ 실습 데이터 입력(TBL_EMP)
INSERT INTO TBL_EMP VALUES
(8001, '김소원', 'CLERK', 7566, SYSDATE, 1500, 10, NULL,NULL);
INSERT INTO TBL_EMP VALUES
(8002, '김종범', 'CLERK', 7566, SYSDATE, 1000, 10, NULL,NULL);
INSERT INTO TBL_EMP VALUES
(8003, '김창기', 'SALESMAN', 7698, SYSDATE, 2000, NULL, NULL,NULL);
INSERT INTO TBL_EMP VALUES
(8004, '김현우', 'SALESMAN', 7698, SYSDATE, 2500, NULL, NULL,NULL);
INSERT INTO TBL_EMP VALUES
(8005, '박종호', 'SALESMAN', 7698, SYSDATE, 1000, NULL, NULL,NULL);


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
8001	김소원	CLERK	    7566	19/09/18	1500	10		
8002	김종범	CLERK	    7566	19/09/18	1000	10		
8003	김창기	SALESMAN	7698	19/09/18	2000			
8004	김현우	SALESMAN	7698	19/09/18	2500			
8005	박종호	SALESMAN	7698	19/09/18	1000			
*/

ALTER TABLE TBL_EMP DROP COLUMN Y;


--○ 커밋
COMMIT;
--==>> 커밋 완료.



SELECT DEPTNO, SAL, COMM
FROM TBL_EMP
ORDER BY COMM DESC;

--※ 오라클에서는 NULL을 가장 큰 값으로 간주한다.
--   (ORACLE 9i 까지는 NULL을 가장 작은 값으로 간주했었다.)
--   하지만, MSSQL 에서는 NULL을 가장 작은 값으로 간주한다.


--○ 부서별 급여합 조회

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



SELECT DEPTNO"부서번호", SUM(SAL)"급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	8750
20	10875
30	9400
	8000
	37025   -- 모든 부서의 급여 총 합계
*/


SELECT DEPTNO"부서번호", SUM(SAL)"급여합"
FROM EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	8750
20	10875
30	9400
	29025   --모든 부서의 급여 총 합계
*/

-- 위에서 조회한 내용을
/*
10	    8750
20	    10875
30	    9400
모든부서	29025   
*/

-- 이와 같이 조회되도록 쿼리문을 작성한다.

SELECT NVL(TO_CHAR(DEPTNO),'모든부서')"부서번호", SUM(SAL)"급여합"
FROM EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	    8750
20	    10875
30	    9400
모든부서	29025
*/



SELECT CASE WHEN T.그루핑 = 1 AND T.부서번호 IS NULL THEN '모든부서'
            WHEN T.그루핑 = 0 AND T.부서번호 IS NULL THEN '인턴'
            ELSE TO_CHAR(T.부서번호)
       END"부서번호"
       ,T.급여합"급여합"
FROM
(
    SELECT GROUPING(DEPTNO)"그루핑", DEPTNO"부서번호", SUM(SAL)"급여합"
    FROM TBL_EMP
    GROUP BY ROLLUP(DEPTNO)
) T;

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '인턴') ELSE '모든부서' END"부서번호"
        , SUM(SAL)"급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);



--○ TBL_SAWON 테이블을 대상으로
--   다음과 같이 조회될 수 있도록 쿼리문을 구성한다.

/*
---------------------------------------------
    성별                  급여합
---------------------------------------------
    남                   XXXXXXX
    여                   XXXXXXX
    모든사원             XXXXXXXX
--------------------------------------------
*/


SELECT *
FROM TBL_SAWON;


SELECT NVL(T.성별, '모든사원')"성별", SUM(T.급여)"급여합"
FROM
(
    SELECT CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '남' 
                WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '여'
                ELSE '성별판별불가'
           END"성별"
           ,SAL"급여"
    FROM TBL_SAWON
) T
GROUP BY ROLLUP(T.성별);





SELECT CASE GROUPING(T.성별) WHEN 0 THEN T.성별 ELSE '모든사원' END"성별"
        ,SUM(T.급여)"급여합"
FROM
(
    SELECT CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '남' 
                WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '여'
                ELSE '성별판별불가'
           END"성별"
           ,SAL"급여"
    FROM TBL_SAWON
) T
GROUP BY ROLLUP(T.성별);
--==>>
/*
남	    11000
여	    36000
모든사원	47000
*/

--○ TBL_SAWON 테이블을 대상으로
--   다음과 같이 조회될 수 있도록 쿼리문을 구성한다.
/*
---------------------------------
    연령대         인원수
---------------------------------
      0             X
      10             X
      20            X
      30            X
      40            X
      50            X
      60            X
      전체          14
-------------------------------
*/

--방법 1. -> INLINE VIEW를 한 번 사용~!!!
SELECT NVL(TO_CHAR(T.연령대), '전체')"연령대", COUNT(*)"인원수"
FROM
(
    SELECT CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','2') THEN TRUNC(EXTRACT(YEAR FROM SYSDATE) - TO_NUMBER(SUBSTR(JUBUN,1,2))-1899,-1) 
                WHEN SUBSTR(JUBUN,7,1) IN ('3','4') THEN TRUNC(EXTRACT(YEAR FROM SYSDATE) - TO_NUMBER(SUBSTR(JUBUN,1,2))-1999,-1)
                ELSE 0
           END"연령대"
    FROM TBL_SAWON
) T
GROUP BY ROLLUP(T.연령대);



--방법 2. -> INLINE VIEW를 두 번 중첩~!!!

-- 연령대
SELECT CASE GROUPING(T2.연령대) WHEN 0 THEN TO_CHAR(T2.연령대) ELSE '전체' END"연령대"
        ,COUNT(T2.연령대)"인원수"
FROM
(
    SELECT CASE WHEN T1.나이 >= 60 THEN 60 
                WHEN T1.나이 >= 50 THEN 50
                WHEN T1.나이 >= 40 THEN 40
                WHEN T1.나이 >= 30 THEN 30
                WHEN T1.나이 >= 20 THEN 20
                WHEN T1.나이 >= 10 THEN 10
                ELSE 0
           END"연령대"
    FROM 
    (   -- 나이
        SELECT CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','2') THEN EXTRACT(YEAR FROM SYSDATE) - TO_NUMBER(SUBSTR(JUBUN,1,2))-1899 
                        WHEN SUBSTR(JUBUN,7,1) IN ('3','4') THEN EXTRACT(YEAR FROM SYSDATE) - TO_NUMBER(SUBSTR(JUBUN,1,2))-1999
                        ELSE -1
               END"나이"
        FROM TBL_SAWON
    ) T1
) T2
GROUP BY ROLLUP(T2.연령대);
--==>>
/*
10	5
20	4
30	1
40	1
50	1
60	2
전체	14
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
10		        8750    --10번 부서 모든 직종의 급여합
20	ANALYST	    6000
20	CLERK	    1900
20	MANAGER	    2975
20		        10875   --20번 부서 모든 직종의 급여합
30	CLERK	    950
30	MANAGER	    2850
30	SALESMAN	5600
30		        9400    --30번 부서 모든 직종의 급여합
                29025   --모든 부서 모든 직종의 급여합
*/

--○ CUBE() -> ROLLUP() 보다 조금 더 자세한 결과를 반환받을 수 있다.


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
20		        10875   --20번 부서 모든 직종의 급여합
30	CLERK	    950
30	MANAGER	    2850
30	SALESMAN	5600
30		        9400    --30번 부서 모든 직종의 급여합
	ANALYST	    6000    --모든 부서 ANALYST 직종의 급여합
	CLERK	    4150    --모든 부서 CLERK 직종의 급여합
	MANAGER	    8275    --모든 부서 MANAGER 직종의 급여합
	PRESIDENT	5000    --모든 부서 PRESIDENT 직종의 급여합
	SALESMAN	5600    --모든 부서 SALESMAN 직종의 급여합
                29025   --모든 부서 모든 직종의 급여합
*/

--※ ROLLUP()과 CUBE()는
--   그룹을 묶어주는 방식이 다르다.(차이)

-- ex)
-- ROLLUP(A,B,C)
-- -> (A,B,C) / (A,B) / (A) / ()

-- CUBE(A,B,C)
-- -> (A,B,C) / (A,B) / (A,C) / (B,C) /(A) / (B) /(C) /()

--==>> 위의 것(ROLLUP())은  묶음 방식이 다소 모자라고
--     아래 것(CUBE())은 묶음 방식이 다소 지나치기 때문에
--     다음과 같은 방식의 쿼리 형태를 더 많이 사용한다.
--     다음 작성하는 쿼리는 조회하고자 하는 그룹만 『GROUPING SETS』를
--     이용하여 묶어주는 방법이다.

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '인턴')
            ELSE '전체부서'
       END"부서번호"
       ,CASE GROUPING(JOB) WHEN 0 THEN JOB ELSE '전체직종' END"직종"
       ,SUM(SAL)"급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO, JOB)
ORDER BY 1,2;


SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '인턴')
            ELSE '전체부서'
       END"부서번호"
       ,CASE GROUPING(JOB) WHEN 0 THEN JOB ELSE '전체직종' END"직종"
       ,SUM(SAL)"급여합"
FROM TBL_EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY 1,2;


SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '인턴')
            ELSE '전체부서'
       END"부서번호"
       ,CASE GROUPING(JOB) WHEN 0 THEN JOB ELSE '전체직종' END"직종"
       ,SUM(SAL)"급여합"
FROM TBL_EMP
GROUP BY GROUPING SETS((DEPTNO, JOB), (DEPTNO), (JOB) ,())
ORDER BY 1,2;
--==>> CUBE() 를 사용한 결과와 같은 조회 결과
  

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '인턴')
            ELSE '전체부서'
       END"부서번호"
       ,CASE GROUPING(JOB) WHEN 0 THEN JOB ELSE '전체직종' END"직종"
       ,SUM(SAL)"급여합"
FROM TBL_EMP
GROUP BY GROUPING SETS((DEPTNO, JOB), (DEPTNO),())
ORDER BY 1,2;
--> ROLLUP() 를 사용한 결과와 같은 조회 결과



SELECT *
FROM TBL_EMP;

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.


--○ TBL_EMP 테이블을 대상으로
--   입사년도별 인원수를 조회한다.


SELECT NVL(TO_CHAR(HIREDATE, 'YYYY'), '전체')"입사년도별", COUNT(*)"인원수"
FROM TBL_EMP
GROUP BY ROLLUP(TO_CHAR(HIREDATE, 'YYYY'))
ORDER BY 1;


SELECT NVL(TO_CHAR(HIREDATE, 'YYYY'), '전체')"입사년도별", COUNT(*)"인원수"
FROM TBL_EMP
GROUP BY CUBE(TO_CHAR(HIREDATE, 'YYYY'))
ORDER BY 1;


SELECT NVL(TO_CHAR(HIREDATE, 'YYYY'), '전체')"입사년도별", COUNT(*)"인원수"
FROM TBL_EMP
GROUP BY GROUPING SETS((TO_CHAR(HIREDATE, 'YYYY')),())
ORDER BY 1;

--> GROUP BY 에서 묶은 것과 SELECT 문에서 일치하게 사용해야함
--  자료형 타입만 맞춘다고 되는 것이 아님, 자료형이 같아도 묶는 방식이 다르기 때문에 일치하게 써야 한다.


--------------------------------------------------------------------------------------------------------

--■■■ HAVING ■■■--

--○ EMP 테이블에서 부서번호가 20,30 인 부서를 대상으로
--   부서의 총 급여가 10000보다 적을 경우만 부서별 총 급여를 조회한다.

SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20,30)
GROUP BY DEPTNO;

SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20,30) AND SUM(SAL) > 10000
GROUP BY DEPTNO;
--==>> 에러 발생
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
--> 위에가 더 좋음 메모리 관련 



-------------------------------------------------------------------------------


--■■■ 중첩 그룹함수 / 분석함수 ■■■--

-- 그룹 함수 2LEVEL 까지 중첩해서 사용할 수 있다.
-- 이마저도 MSSQL은 불가능하다.

SELECT MAX(SUM(SAL))
FROM EMP
GROUP BY DEPTNO;
--==>> 10875

--RANK()
--DENSE_RANK()
--> ORACLE 9i 부터 적용...MSSQL 2005 부터 적용....

-- 하위 버전에서는 RANK()나 DENSE_RANK() 를 사용할 수 없기 때문에
-- 예를 들어... 급여 순위를 구하고자 한다면...
-- 해당 사원의 급여보다 더 큰 값이 몇 개인지 확인한 후
-- 확인한 숫자에 +1 을 추가 연산해주면 그 값이 곧 해당 사원의 등수가 된다.


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

--※ 서브 상관 쿼리 (상관 서브쿼리)
--   메인 쿼리가 있는 테이브의 컬럼이
--   서브 쿼리의 조건절(WHERE절, HAVING절)에 사용되는 경우
--   우리는 이 쿼리문을 서브 상관 쿼리(상관 서브 쿼리)라고 부른다.


SELECT ENAME"사원명", SAL"급여"
        , (1)"급여등수"
FROM EMP;


SELECT E1.ENAME"사원명", E1.SAL"급여"
        ,(SELECT COUNT(*)+1
          FROM EMP
          WHERE SAL > E1.SAL)"급여등수"
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

--○ EMP 테이블을 대상으로
--   사원명, 급여, 부서번호, 부서내급여등수, 전체급여등수 항목을 조회한다.
--   단, RANK 함수를 사용하지 않고, 서브 상관 쿼리를 활용할 수 있도록 한다.


SELECT E.ENAME"사원명", E.SAL"급여", E.DEPTNO"부서번호"
        ,(SELECT COUNT(*)+1
          FROM EMP
          WHERE SAL > E.SAL AND DEPTNO = E.DEPTNO )"부서내급여등수"
        ,(SELECT COUNT(*)+1
          FROM EMP
          WHERE SAL > E.SAL)"전체급여등수"
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


--○ EMP 테이블을 대상으로 다음과 같이 조회할 수 있또록 쿼리문을 구성한다.
/*

-----------------------------------------------------------
 사원명   부서번호   입사일  급여  부서내입사별급여누적
-----------------------------------------------------------


*/
SELECT *
FROM EMP;



SELECT ENAME"사원명", DEPTNO"부서번호", HIREDATE"입사일", SAL"급여"
        ,( SELECT SUM(SAL) 
           FROM EMP
           WHERE DEPTNO = E.DEPTNO AND HIREDATE <= E.HIREDATE
          )"부서내입사별급여누적"
FROM EMP E
ORDER BY DEPTNO;








