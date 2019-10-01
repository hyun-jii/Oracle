SELECT USER
FROM DUAL;
--==>> SCOTT


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


ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.


SELECT E1.ENAME"사원", E1.DEPTNO"부선번호", E1.HIREDATE"입사일", E1.SAL"급여"
    , ( SELECT SUM(E2.SAL)
        FROM EMP E2
        )"부서내입사별급여누적"
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

SELECT E1.ENAME"사원", E1.DEPTNO"부선번호", E1.HIREDATE"입사일", E1.SAL"급여"
    , ( SELECT SUM(E2.SAL)
        FROM EMP E2
        WHERE E2.DEPTNO = E1.DEPTNO)"부서내입사별급여누적"
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
SELECT E1.ENAME"사원", E1.DEPTNO"부선번호", E1.HIREDATE"입사일", E1.SAL"급여"
    , ( SELECT SUM(E2.SAL)
        FROM EMP E2
        WHERE E2.DEPTNO = E1.DEPTNO AND E2.HIREDATE <= E1.HIREDATE)"부서내입사별급여누적"
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

--○ 위의 결과를 기반으로
--   입사한 사원의 수가 가장 많았을 때의
--   입사년월과 인원수를 조회할 수 있도록 쿼리문을 구성한다.

-------------------------------
-- 입사년월         인원수
-------------------------------


--------------------------------------------------------------내가 하던것---

SELECT TO_CHAR(HIREDATE, 'YYYY-MM')"입사년월", COUNT(*)"인원수"
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
ORDER BY 1;


SELECT TO_CHAR(HIREDATE, 'YYYY-MM')"입사년월"
        , ( SELECT COUNT(*) 
            FROM EMP
            WHERE HIREDATE = E.TO_CHAR(HIREDATE, 'YYYY-MM')
            )"인원수"
FROM EMP E
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
ORDER BY 1;


SELECT TO_CHAR(HIREDATE, 'YYYY-MM')"입사년월"
        ,CASE WHEN THEN ELSE END"인원수"
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
ORDER BY 1;


SELECT  T.인원수, T.입사년월
FROM
(
    SELECT TO_CHAR(HIREDATE, 'YYYY-MM')"입사년월", COUNT(*)"인원수"
    FROM EMP
    GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
    ORDER BY 1
) T;

-------------------------------------------------------------------------------

SELECT TO_CHAR(HIREDATE, 'YYYY-MM')"입사년월", COUNT(*)"인원수"
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

SELECT TO_CHAR(HIREDATE, 'YYYY-MM')"입사년월", COUNT(*)"인원수"
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

SELECT E.입사년월, E.인원수
FROM
(
    SELECT TO_CHAR(HIREDATE, 'YYYY-MM')"입사년월", COUNT(*)"인원수"
    FROM EMP
    GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
) E
WHERE E.인원수 = (
                     SELECT MAX(T.인원수)
                     FROM
                     (
                         SELECT TO_CHAR(HIREDATE, 'YYYY-MM')"입사년월", COUNT(*)"인원수"
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

--■■■ ROW_NUMBER() ■■■--

SELECT ROW_NUMBER() OVER(ORDER BY SAL DESC)"테스트"
        ,ENAME"사원", SAL"급여", HIREDATE"입사일"
FROM EMP;

SELECT ROW_NUMBER() OVER(ORDER BY SAL DESC)"테스트"
        ,ENAME"사원", SAL"급여", HIREDATE"입사일"
FROM EMP
ORDER BY ENAME;

SELECT ROW_NUMBER() OVER(ORDER BY ENAME DESC)"테스트"
        ,ENAME"사원", SAL"급여", HIREDATE"입사일"
FROM EMP
ORDER BY ENAME;

--※ 게시판의 게시물 번호를 SEQUENCE 나 IDENTITY를 사용하게 되면
--   게시물을 삭제했을 경우, 삭제한 게시물의 자리에 다음 번호를 가진
--   게시물이 등록되는 상황이 발생하게 된다.
--   이는... 보안 측면이나... 미관상,... 바람직하지 않은 상황일 수 있기 때문에
--   ROW_NUMBER()의 사용을 고려해 볼 수 있다.
--   관리의 목적으로 사용할 때에는 SEQUENCE나 IDENTITY를 사용하지만,
--   단순히 게시물을 목록화 하여 사용자에게 리스트 형식으로 보여줄 때에는
--   사용하지 않는 것이 바람직하다.


--○ SEQUENCE (시퀀스 : 주문번호) 생성
--   -> 사전적인 의미 : 1.(일련의) 연속적인 사건들. 2. (사건, 행동 등의) 순서

CREATE SEQUENCE SEQ_BOARD       -- SEQUENCE 생성 구문
START WITH 1                    -- 시작값
INCREMENT BY 1                  -- 증가값
NOMAXVALUE                      -- 최대값 제한 없음
NOCACHE;                        -- 캐시 사용 안함(없음)
--==>> Sequence SEQ_BOARD이(가) 생성되었습니다.


--○ 실습 테이블 생성(TBL_BOARD)
CREATE TABLE TBL_BOARD                  -- TBL_BOARD 테이블 생성 구문 -> 게시판 테이블
( NO            NUMBER                  -- 게시물 번호           X
, TITLE         VARCHAR2(50)            -- 게시물 제목           ○
, CONTENTS      VARCHAR2(2000)          -- 게시물 내용           ○
, NAME          VARCHAR2(20)            -- 게시물 작성자         △
, PW            VARCHAR2(20)            -- 게시물 패스워드       △
, CREATED       DATE DEFAULT SYSDATE    -- 게시물 작성일         X

);
--==>> Table TBL_BOARD이(가) 생성되었습니다.


--○ 데이터 입력 -> 게시판에다 게시물을 작성하는 액션
INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '아~졸려', '자꾸눈이감겨요','오지은','java006$', DEFAULT);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '조금만', '참아봅시다','김종범','java006$', DEFAULT);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '열심히', '공부합시다','김현우','java006$', DEFAULT);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '질문있어요', '이건뭔가요','강초롱','java006$', DEFAULT);
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '여기는', '어디인가요','안준헌','java006$', DEFAULT);
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '나는', '누구인가요','김동현','java006$', DEFAULT);
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '윈도우', '언데이트중','이은채','java006$', DEFAULT);
--==>> 1 행 이(가) 삽입되었습니다.

--○ 확인
SELECT *
FROM TBL_BOARD;
--==>>
/*
1	아~졸려	    자꾸눈이감겨요	오지은	java006$	2019-09-19
2	조금만	    참아봅시다	    김종범	java006$	2019-09-19
3	열심히	    공부합시다	    김현우	java006$	2019-09-19
4	질문있어요	이건뭔가요	    강초롱	java006$	2019-09-19
5	여기는	    어디인가요	    안준헌	java006$	2019-09-19
6	나는      	누구인가요	    김동현	java006$	2019-09-19
7	윈도우	    언데이트중	    이은채	java006$	2019-09-19

*/

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session이(가) 변경되었습니다.

COMMIT;
--==>> 커밋 완료.

--○ 게시물 삭제
DELETE
FROM TBL_BOARD
WHERE NO = 1;
--==>> 1 행 이(가) 삭제되었습니다.

DELETE
FROM TBL_BOARD
WHERE NO = 4;
--==>> 1 행 이(가) 삭제되었습니다.

DELETE
FROM TBL_BOARD
WHERE NO = 7;
--==>> 1 행 이(가) 삭제되었습니다.


--○ 게시물 작성
INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '저는요', '쉬는시간이네....','박혜민','java006$', DEFAULT);
--==>> 1 행 이(가) 삽입되었습니다.

--○커밋
COMMIT;
--==>> 커밋 완료.

SELECT *
FROM TBL_BOARD;


SELECT ROW_NUMBER() OVER(ORDER BY CREATED)"글번호"
        ,TITLE"제목", NAME"작성자", CREATED"작성일"
FROM TBL_BOARD
ORDER BY 4 DESC;
--==>>
/*
5	저는요	박혜민	2019-09-19 11:48:30
4	나는	    김동현	2019-09-19 11:35:04
3	여기는	안준헌	2019-09-19 11:34:21
2	열심히	김현우	2019-09-19 11:33:15
1	조금만	김종범	2019-09-19 11:32:45
*/

CREATE OR REPLACE VIEW VIEW_BOARD
AS
SELECT ROW_NUMBER() OVER(ORDER BY CREATED)"글번호"
        ,TITLE"제목", NAME"작성자", CREATED"작성일"
FROM TBL_BOARD
ORDER BY 4 DESC;
--==>> View VIEW_BOARD이(가) 생성되었습니다.

SELECT *
FROM VIEW_BOARD;


INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '기운내자', '조금만 더', '최창훈', 'java006$', DEFAULT);
--==>> 1 행 이(가) 삽입되었습니다.

DELETE
FROM TBL_BOARD
WHERE NO =6;
--==>> 1 행 이(가) 삭제되었습니다.

SELECT *
FROM VIEW_BOARD;


-------------------------------------------------------------------------------------------------

--■■■ JOIN(조인) ■■■--

-- 1. SQL 1992 CODE

-- Cross Join
SELECT *
FROM EMP,DEPT;
--> 수학에서 말하는 데카르트 곱(CATERSIAN PRODUCT)
--  두 테이블을 합친(결합한) 모든 경우의 수


-- Equi Join : 서로 정확히 일치하는 것들끼리 연결시키는 결합 방법
SELECT *
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO;

SELECT *
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;


-- Non Equi Join : 범위 안에 적합한 것들끼리 연결시키는 결합 방법

SELECT *
FROM SALGRADE;
SELECT *
FROM EMP;


SELECT *
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;

-- EqUI Join 시 (+) 를 활용한 결합 방법

SELECT *
FROM TBL_EMP;

SELECT *
FROM TBL_DEPT;

SELECT *
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO = D.DEPTNO;
--> 총 14건의 데이터가 결합되어 조회된 상황
--  즉, 부서번호를 갖지 못한 사원들(5)은 모두 누락~!!!

SELECT *
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO = D.DEPTNO(+);
--> 총 19건의 데이터가 결합되어 조회된 상황
--  즉, 부서번호를 갖지 못한 사원들(5)도 모두 조회된 상황~!!!



SELECT *
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO;
--> 총 16건의 데이터가 결합되어 조회된 상황
--  즉, 부서에 소속된 사원들을 갖지 못한 부서(2)도 모두 조회된 상황~!!!

--※ (+)가 없는 쪽 테이블의 데이터를 모두 메모리에 적재한 후
--   (+)가 있는 쪽 테이블의 데이터를 하나하나 확인하여 결합시키는 형태로
--   JOIN 이 이루어진다.
--   이와 같은 이유로...

SELECT *
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO(+);
--   이런 형식의 JOIN은 존재하지 않는다.


-- 2. SQL 1999 CODE -> 『JOIN』 키워드 등장 -> JOIN(결합)의 유형 명시
--                      결합 조건은 『WHERE』 대신 『ON』 사용

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
--> INNER JOIN 에서 INNER 는 생략 가능

SELECT *
FROM EMP E INNER JOIN SALGRADE S
ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

SELECT *
FROM EMP E JOIN SALGRADE S
ON E.SAL BETWEEN S.LOSAL AND S.HISAL;
--> INNER JOIN 에서 INNER 는 생략 가능

SELECT *
FROM TBL_EMP E LEFT OUTER JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO;

--※ 방향이 지정된 쪽 테이블 (->LEFT -> TBL_EMP) 의 데이터를
--   모두 메모리에 적재한 후
--   방향이 지정되지 않으 쪽 테이블들의 데이터를 하나하나 확인하여
--   결합시키는 형태로 JOIN이 이루어진다.

SELECT *
FROM TBL_EMP E LEFT JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO;
--> OUTER JOIN에서 OUTER는 생략 가능하다.

SELECT *
FROM TBL_EMP E RIGHT OUTER JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO;

SELECT *
FROM TBL_EMP E RIGHT JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO;
--> OUTER JOIN에서 OUTER는 생략 가능하다.


SELECT *
FROM TBL_EMP E FULL OUTER JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO;


SELECT *
FROM TBL_EMP E FULL JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO;
--> OUTER JOIN에서 OUTER는 생략 가능하다.


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
--> 이 쿼리문의 조회 결과에서
--  직종이 CLERK 인 사원들만 조회하고자 한다면...

SELECT *
FROM TBL_EMP E JOIN TBL_DEPT D            
ON E.DEPTNO = D.DEPTNO
AND E.JOB = 'CLERK';
--> 이와 같이 쿼리문을 구성하여 조회해도
--  결과를 얻는 과정에서 문제는 없다.

SELECT *
FROM TBL_EMP E JOIN TBL_DEPT D            
ON E.DEPTNO = D.DEPTNO
WHERE E.JOB = 'CLERK';
--> 하지만, 이와 같이 구성하여 조회하는 것을 권장한다.


----------------------------------------------------------------

--○ EMP 테이블과 DEPT 테이블을 대상으로
--   직종이 MANAGER와 CLERK인 사원들만
--   부서번호, 부서명, 사원명, 직종명, 급여 항목을 조회한다.

SELECT E.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE E.JOB IN ('MANAGER','CLERK');


SELECT DEPTNO, DNAME, ENAME, JOB, SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE E.JOB IN ('MANAGER','CLERK');
--==>> 에러 발생
-- ORA-00918: column ambiguously defined
--> 두 테이블 간 중복되는 컬럼에 대한 소속 테이블을
--  정해줘야(명시해줘야)한다.

SELECT D.DEPTNO, DNAME, ENAME, JOB, SAL
FROM EMP E JOIN DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO;



SELECT E.DEPTNO, DNAME, ENAME, JOB, SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO(+) = D.DEPTNO;


--※ 두 테이블 간 중복되는 컬럼에 대해 소속 테이블을 명시하는 경우
--   부모 테이블의 컬럼을 참조할 수 있도록 처리해야 한다.
SELECT *
FROM DEPT;  -- 부모테이블
SELECT *
FROM EMP;   -- 자식테이블

-- 이 과정에서 부모 테이블과 자식 테이블의 관계를 명확히 정리한다.

SELECT D.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;
--> 두 테이블 모두 포함되어 있는 중복된 컬럼이 아니더라도
--  컬럼의 소속 테이블을 명시해 줄 수 있도록 하자.


--○ SELF JOIN(자기 조인)

-- EMP 테이블의 데이터를 다음과 같이 조회할 수 있도록
-- 쿼리문을 구성한다.
---------------------------------------------------------------
--  사원번호  사원명  직종명  관리자번호  관리자명  관리자직종명
---------------------------------------------------------------
--  7369     SMITH   CLERK    7902        FORD      ANALYST  
SELECT *
FROM EMP;

SELECT *
FROM EMP SELF JOIN EMP
WHERE EMP.MGR = EMP.EMPNO;







