SELECT USER
FROM DUAL;
--==>> SCOTT



--○ SELF JOIN(자기 조인)

-- EMP 테이블의 데이터를 다음과 같이 조회할 수 있도록
-- 쿼리문을 구성한다.
---------------------------------------------------------------
--  사원번호  사원명  직종명  관리자번호  관리자명  관리자직종명
---------------------------------------------------------------
--  7369     SMITH   CLERK    7902        FORD      ANALYST  


SELECT E.EMPNO"사원번호", E.ENAME"사원명", E.JOB"직종명", E.MGR"관리자번호", EMP.ENAME"관리자명", EMP.JOB"관리자직종명"
FROM EMP E LEFT JOIN EMP
ON  E.MGR = EMP.EMPNO
ORDER BY 1;



SELECT E.EMPNO"사원번호", E.ENAME"사원명", E.JOB"직종명", EMP.EMPNO"관리자번호", EMP.ENAME"관리자명", EMP.JOB"관리자직종명"
FROM EMP E LEFT JOIN EMP
ON  E.MGR = EMP.EMPNO
ORDER BY 1;










