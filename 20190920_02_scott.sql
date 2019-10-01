SELECT USER
FROM DUAL;
--==>> SCOTT

--■■■ UNION / UNION ALL ■■■--

--○ 실습 테이블 생성(TBL_JUMUN)
CREATE TABLE TBL_JUMUN              -- 주문 테이블 생성
( JUNO      NUMBER                  -- 주문 번호
, JECODE    VARCHAR2(30)            -- 주문된 제품 코드
, JUSU      NUMBER                  -- 주문 수량
, JUDAY     DATE DEFAULT SYSDATE    -- 주문 일자

);
--==>> Table TBL_JUMUN이(가) 생성되었습니다.
--> 고객의 주문이 발생했을 경우
--  주문 내용에 대한 데이터가 입력될 수 있는 테이블


--○ 데이터 입력 -> 고객의 주문 발생 / 접수
INSERT INTO TBL_JUMUN
VALUES (1, '꼬북칩', 20, TO_DATE('2001-11-01 09:10:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN
VALUES (2, '홈런볼', 10, TO_DATE('2001-11-01 09:42:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN
VALUES (3, '에이스', 30, TO_DATE('2001-11-01 10:42:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN
VALUES (4, '스윙칩', 10, TO_DATE('2001-11-02 09:42:10', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN
VALUES (5, '썬칩', 10, TO_DATE('2001-11-03 09:42:10', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN
VALUES (6, '빼빼로', 10, TO_DATE('2001-11-04 09:42:10', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN
VALUES (7, '포카칩', 10, TO_DATE('2001-11-05 09:42:10', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN
VALUES (8, '구운감자', 20, TO_DATE('2001-11-06 09:42:10', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN
VALUES (9, '나초', 10, TO_DATE('2001-11-07 09:42:10', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN
VALUES (10, '후레시베리', 10, TO_DATE('2001-11-08 09:42:10', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN
VALUES (11, '스윙칩', 10, TO_DATE('2001-11-09 09:42:10', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN
VALUES (12, '에이스', 30, TO_DATE('2002-11-01 10:42:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN
VALUES (13, '나초', 30, TO_DATE('2003-11-01 10:42:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN
VALUES (14, '빼빼로', 20, TO_DATE('2004-11-01 10:42:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN
VALUES (15, '빼빼로', 50, TO_DATE('2005-11-01 10:42:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN
VALUES (16, '칸쵸', 50, TO_DATE('2006-11-01 10:42:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN
VALUES (17, '칸쵸', 10, TO_DATE('2007-11-01 10:42:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN
VALUES (18, '뽀빠이', 30, TO_DATE('2008-11-01 10:42:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN
VALUES (19, '스윙칩', 10, TO_DATE('2009-11-01 10:42:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN
VALUES (20, '빼빼로', 50, TO_DATE('2010-11-01 10:42:12', 'YYYY-MM-DD HH24:MI:SS'));
--==>> 1 행 이(가) 삽입되었습니다. * 20

--○ 확인

SELECT *
FROM TBL_JUMUN;

--==>>
/*
1	꼬북칩	    20	2001-11-01
2	홈런볼	    10	2001-11-01
3	에이스	    30	2001-11-01
4	스윙칩	    10	2001-11-02
5	썬칩	        10	2001-11-03
6	빼빼로	    10	2001-11-04
7	포카칩	    10	2001-11-05
8	구운감자	    20	2001-11-06
9	나초	        10	2001-11-07
10	후레시베리	10	2001-11-08
11	스윙칩	    10	2001-11-09
12	에이스	    30	2002-11-01
13	나초	        30	2003-11-01
14	빼빼로	    20	2004-11-01
15	빼빼로	    50	2005-11-01
16	칸쵸      	50	2006-11-01
17	칸쵸	        10	2007-11-01
18	뽀빠이	    30	2008-11-01
19	스윙칩	    10	2009-11-01
20	빼빼로	    50	2010-11-01
*/

--○ 커밋
COMMIT;
--==>> 커밋 완료.

--○ 데이터 추가 입력 -> 2001년 부터 시작된 주문이 현재(2019년)까지 계속 발생~!!!
INSERT INTO TBL_JUMUN VALUES(98765,'썬칩',10,SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_JUMUN VALUES(98766,'칸쵸',10,SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_JUMUN VALUES(98767,'빼빼로',50,SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_JUMUN VALUES(98768,'꼬북칩',10,SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_JUMUN VALUES(98769,'꼬북칩',20,SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_JUMUN VALUES(98770,'꼬북칩',30,SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_JUMUN VALUES(98771,'에이스',60,SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_JUMUN VALUES(98772,'나초',10,SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_JUMUN VALUES(98773,'빼빼로',20,SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_JUMUN VALUES(98774,'스윙칩',50,SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_JUMUN VALUES(98775,'스윙칩',20,SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

--○ 확인

SELECT *
FROM TBL_JUMUN;
--==>>
/*
    1	꼬북칩	    20	2001-11-01
    2	홈런볼	    10	2001-11-01
    3	에이스	    30	2001-11-01
    4	스윙칩	    10	2001-11-02
    5	썬칩  	    10	2001-11-03
    6	빼빼로	    10	2001-11-04
    7	포카칩	    10	2001-11-05
    8	구운감자	    20	2001-11-06
    9	나초  	    10	2001-11-07
    10	후레시베리	10	2001-11-08
    11	스윙칩	    10	2001-11-09
    12	에이스	    30	2002-11-01
    13	나초	        30	2003-11-01
    14	빼빼로	    20	2004-11-01
    15	빼빼로	    50	2005-11-01
    16	칸쵸	        50	2006-11-01
    17	칸쵸	        10	2007-11-01
    18	뽀빠이	    30	2008-11-01
    19	스윙칩	    10	2009-11-01
    20	빼빼로	    50	2010-11-01
98765	썬칩	        10	2019-09-20
98766	칸쵸	        10	2019-09-20
98767	빼빼로	    50	2019-09-20
98768	꼬북칩	    10	2019-09-20
98769	꼬북칩	    20	2019-09-20
98770	꼬북칩	    30	2019-09-20
98771	에이스	    60	2019-09-20
98772	나초	        10	2019-09-20
98773	빼빼로	    20	2019-09-20
98774	스윙칩	    50	2019-09-20
98775	스윙칩	    20	2019-09-20
*/

--○ 커밋
COMMIT;
--==>> 커밋 완료.

--○ 혜민이가 과자 쇼핑몰 운영 중...
--   TBL_JUMUN 테이블이 너무 무거워진 상황
--   어플리케이션과의 연동으로 인해 주문 내역을 다른 테이블에
--   저장될 수 있도록 만드는 것은 불가능한 상황.
--   기존의 모든 데이터를 덮어놓고 지우는 것도 불가능한 상황.
--   -> 결과적으로...
--      현재까지 누적된 주문 데이터 중
--      금일 발생한 주문 내역을 제외하고 나머지를 다른 테이블(TBL_JUMUNBACKUP)로
--      데이터 이관을 수행할 계획

CREATE TABLE TBL_JUMUNBACKUP
AS
(
    SELECT *
    FROM TBL_JUMUN
    WHERE TO_CHAR(SYSDATE,'YYYY-MM-DD') <> TO_CHAR(JUDAY,'YYYY-MM-DD')
);
--==>> Table TBL_JUMUNBACKUP이(가) 생성되었습니다.


--○ 확인

SELECT *
FROM TBL_JUMUNBACKUP;
--==>>
/*
1	꼬북칩	    20	2001-11-01 09:10:12
2	홈런볼	    10	2001-11-01 09:42:12
3	에이스	    30	2001-11-01 10:42:12
4	스윙칩	    10	2001-11-02 09:42:10
5	썬칩  	    10	2001-11-03 09:42:10
6	빼빼로	    10	2001-11-04 09:42:10
7	포카칩	    10	2001-11-05 09:42:10
8	구운감자    	20	2001-11-06 09:42:10
9	나초	        10	2001-11-07 09:42:10
10	후레시베리	10	2001-11-08 09:42:10
11	스윙칩	    10	2001-11-09 09:42:10
12	에이스	    30	2002-11-01 10:42:12
13	나초      	30	2003-11-01 10:42:12
14	빼빼로	    20	2004-11-01 10:42:12
15	빼빼로	    50	2005-11-01 10:42:12
16	칸쵸      	50	2006-11-01 10:42:12
17	칸쵸      	10	2007-11-01 10:42:12
18	뽀빠이	    30	2008-11-01 10:42:12
19	스윙칩	    10	2009-11-01 10:42:12
20	빼빼로	    50	2010-11-01 10:42:12
*/
--> TBL_JUMUN 테이블의 데이터들 중
--  금일 주문내역 이외의 데이터는 모두 TBL_JUMUNBACKUP 에
--  백업을 마친 상태.

--  TBL_JUMUN 테이블의 데이터들 중
--  백업을 마친 데이터들 삭제


DELETE
FROM TBL_JUMUN
WHERE TO_CHAR(SYSDATE,'YYYY-MM-DD') <> TO_CHAR(JUDAY, 'YYYY-MM-DD');
--==>> 20개 행 이(가) 삭제되었습니다.
--      ->98764 건의 데이터 삭제

--※ 아직 제품 발송이 완료되지 않은 금일 주문 데이터를 제외하고
--   이전의 모든 주문 데이터들이 삭제된 상황이므로
--   테이블은 행(레코드)의 개수가 줄어들어 매우 가벼워진 상황이다.

--○ 확인
SELECT *
FROM TBL_JUMUN;
--==>>
/*
98765	썬칩	10	2019-09-20 12:18:13
98766	칸쵸	10	2019-09-20 12:18:42
98767	빼빼로	50	2019-09-20 12:19:06
98768	꼬북칩	10	2019-09-20 12:21:24
98769	꼬북칩	20	2019-09-20 12:21:45
98770	꼬북칩	30	2019-09-20 12:22:00
98771	에이스	60	2019-09-20 12:22:44
98772	나초	10	2019-09-20 12:23:07
98773	빼빼로	20	2019-09-20 12:23:27
98774	스윙칩	50	2019-09-20 12:23:49
98775	스윙칩	20	2019-09-20 12:24:09
*/

--○ 커밋
COMMIT;
--==>>커밋 완료.

-- 그런데, 지금까지 주문받은 내역에 대한 정보를
-- 제품별 총 주문량으로 나타내야 할 상황이 발생하게 되었다.
-- 그렇다면, TBL_JUMUNBACKUP 테이블의 레코드(행)와
-- TBL_JUMUN 테이블의 레코드(행)을 합쳐서 하나의 테이블을
-- 조회하는 것과 같은 결과를 확인할 수 있도록 조회가 이루어져야 한다.

--※ 컬럼과 컬럼의 관계를 고려하여 테이블을 결합하고자 하는 경우
--   JOIN 을 사용하지만
--   레코드(행)와 레코드(행)를 결합하고자 하는 경우
--   UNION / UNION ALL 을 사용할 수 있다.


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

--※ UNION은 항상 결과물의 첫 번째 컬럼을 기준으로 오름차순 정렬을 수행한다.
--   UNION ALL은 결합된 순서대로 조회한 결과를 반환한다.(정렬 없음)
--   이로 인해 UNION 이 부하가 더 크다.
--   또한, UNION은 결과물에서 중복된 행이 존재할 경우
--   중복을 제거하고 1개 행만 조회된 결과를 반환하게 된다.

--○ 지금까지 주문받은 정보를 통해
--   제품별 총 주문량을 조회할 수 있는 쿼리문을 구성한다.



SELECT JECODE"제품", SUM(JUSU)"주문량"
FROM TBL_JUMUN
GROUP BY JECODE
UNION ALL
SELECT JECODE"제품", SUM(JUSU)"주문량"
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
구운감자	    20
후레시베리	10
꼬북칩	    80
썬칩	        20
에이스	    120
나초  	    50
뽀빠이	    30
스윙칩	    100
포카칩	    10
홈런볼	    10
빼빼로	    200
칸쵸	        70
*/


--○ INTERSECT / MINUS (-> 교집합과 차집합)

-- TBL_JUMUNBACKUP 테이블과 TBL_JUMUN 테이블에서
-- 제품코드와 주문량의 값이 똑같은 행만 추출하고자 한다.


SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT JECODE, JUSU
FROM TBL_JUMUN;
--==>>
/*
꼬북칩	20
나초	    10
빼빼로	20
빼빼로	50
썬칩	    10
칸쵸  	10
*/

--○ 문제
-- TBL_JUMUNBACKUP 테이블과 TBL_JUMUN 테이블을 대상으로
-- 제품코드와 주문량의 값이 똑같은 행의 정보를
-- 주문번호, 제품코드,주문량, 주문일자 항목으로 조회한다.


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

-- 방법 1.
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

-- 방법 2.

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

--○ TBL_EMP 테이블에서 급여가 가장 많은 사원의
--   사원번호, 사원명, 직종명, 급여 항목을 조회하는 쿼리문을 구성한다.

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

-- 『=ANY』

-- 『=ALL』


SELECT SAL
FROM TBL_EMP;


SELECT EMPNO, ENAME, JOB, SAL
FROM TBL_EMP
WHERE SAL >=ALL ( SELECT SAL
                  FROM TBL_EMP
                    );
                    
                    
--○ TBL_EMP 테이블에서 20번 부서에 근무하는 사원 중
--   급여가 가장 많은 사원의 정보를
--   사원번호, 사원명, 부서번호, 직종명, 급여 항목으로 조회한다.


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


--○ TBL_EMP 테이블에서 수당(커미션:COMM)이 가장 많은 사원의
--   사원번호, 사원명, 부서번호, 직종명, 커미션 항목을 조회한다.



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


SELECT DISTINCT(COMM)       -- 중복 제거 함수 -> DISTINCT()
FROM TBL_EMP;

-- EMP 테이블에서 관리자로 등록된 사원의 데이터를
-- 사원번호, 사원명, 직종명 항목으로 조회한다.



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

--○ TBL_SANWON 테이블 백업(데이터 위주) -> 각 테이블 간의 관계나 제약조건 등은 제외한 상태

CREATE TABLE TBL_SAWONBACKUP
AS
SELECT *
FROM TBL_SAWON;
--==>> Table TBL_SAWONBACKUP이(가) 생성되었습니다.
-- TBL_SAWON 테이블의 데이터들만 백업을 수행
-- 즉, 다른 이름의 테이블 형태로 저장해 둔 상황

--○ 확인

SELECT *
FROM TBL_SAWONBACKUP
MINUS
SELECT *
FROM TBL_SAWON;


--○ 데이터 수정

UPDATE TBL_SAWON
SET SANAME = '가가멜'
WHERE SANO = 1001;


UPDATE TBL_SAWON
SET SANAME = '똘똘이';
COMMIT;


SELECT *
FROM TBL_SAWON;


ROLLBACK;
--==>> 롤백 완료.

-- 위와 같이 UPDATE 처리 이후에 COMMIT을 수행하였기 때문에
-- ROLLBACK은 불가능한 상황이다.
-- 하지만, TBL_SAWONBACKUP 테이블에 데이터를 백업해 두었다.
-- SANAME 컬럼의 내용만 추출하여 '똘똘이' 대신 넣어줄 수 있다는 것이다.

SELECT *
FROM TBL_SAWONBACKUP;

SELECT *
FROM TBL_SAWON;


UPDATE TBL_SAWON
SET SANAME = (  SELECT SANAME
                FROM TBL_SAWONBACKUP
                WHERE SANO=TBL_SAWON.SANO
              )
WHERE SANAME ='똘똘이';
--==>> 14개 행 이(가) 업데이트되었습니다.

SELECT *
FROM TBL_SAWON;

COMMIT;
--==>> 커밋 완료.














