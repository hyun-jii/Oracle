
SELECT USER
FROM DUAL;
--==>> SCOTT

----------------------------------------------------------------------------------

--※ 참고

-- 1. INSERT, UPDATE, DELETE,(MERGE)
--==>> DML(DATA MANUPLATION LANGUAGE)
-- COMMIT / ROLLBACK 이 필요하다.

-- 2. CREATE, DROP, ALTER(TRUNCATE)
--==>> DDL(DATA DEFINITION LANGUAGE)
-- 실행하면 자동으로 COMMIT 된다.

-- 3. GRANT, REVOKE
--==>> DCL (DATA CONTRL LANGUAGE)
-- 실행하면 자동으로 COMMIT 된다.

-- 4. COMMIT, ROLLBACK
--==>> TCL(TRANSACTION CONTROL LANGUAGE)

-- 정적 PL/SQL문  -> DML문, TCL문만 사용 가능하다.
-- 동적 PL/SQL문  -> DML문, DDL문, DCL문, TCL문 사용 가능하다.


------------------------------------------------------------------------------------

--■■■ PROCEDURE(프로시저) ■■■--


-- 1. PL/SQL 에서 가장 대표적인 구조인 스토어드 프로시저는
--    개발자가 자주 작성해야 하는 업무의 흐름을
--    미리 작성하여 데이터베이스 내에 저장해 두었다가
--    필요할 때 마다 호출하여 실행할 수 있도록 처리해 주는 구문이다.

-- 2. 형식 및 구조
/*
CREATE [OR REPLACE] PROCEDURE 프로시저명
[( 매개변수 IN 데이터타입
  ,매개변수 OUT 데이터타입
  ,매개변수 INOUT 데이터타입
)]
IS
    [-- 주요 변수 선언;]
BEGIN
    -- 실행 구문;
    ...
    [EXCEPTION]
        -- 예외 처리 구문;
END;
*/

--※ FUNCTION 과 비교했을 때 『RETURN 반환자료형』 부분이 존재하지 않으며,
--   『RETURN』문 자체도 존재하지 않으며,
--   프로시저 실행 시 넘겨주게 되는 매개변수의 종류는
--   IN, OUT, INOUT 으로 구분된다.

-- 3. 실행(호출)
/*
EXEC[UTE] 프로시저명[(인수1, 인수2,...)];
*/


--○ INSERT 쿼리 실행을 프로시저로 작성(INSERT 프로시저)

-- 실습 테이블 생성(TBL_STUDENTS)
CREATE TABLE TBL_STUDENTS
( ID        VARCHAR2(10)
, NAME      VARCHAR2(40)
, TEL       VARCHAR2(30)
, ADDR      VARCHAR2(100)
);
--==>> Table TBL_STUDENTS이(가) 생성되었습니다.

-- 실습 테이블 생성(TBL_IDPW)
CREATE TABLE TBL_IDPW
( ID    VARCHAR2(10)
, PW    VARCHAR2(20)
, CONSTRAINT IDPW_ID_PK PRIMARY KEY(ID)

);
--==>> Table TBL_IDPW이(가) 생성되었습니다.

-- 두 테이블에 데이터 입력
INSERT INTO TBL_STUDENTS(ID, NAME, TEL, ADDR)
VALUES('superman','김현우','010-1111-1111','제주도 서귀포시');
INSERT INTO TBL_IDPW(ID,PW)
VALUES('superman','java006$');
--==>> 1 행 이(가) 삽입되었습니다. *2

-- 확인
SELECT *
FROM TBL_STUDENTS;
--==>> superman	김현우	010-1111-1111	제주도 서귀포시

SELECT *
FROM TBL_IDPW;
--==>> superman	java006$

COMMIT;
--==>> 커밋 완료.

-- 위의 업무를 수행하는 프로시저(INSERT 프로시저, 입력 프로시저)를 생성하게 되면
-- EXEC PRC_STUDENTS_INSERT('batman','java006$','김종범','010-2222-2222','서울 마포구');
-- 이와 같이 구문 한 줄로 양쪽 테이블에 데이터를 모두 제대로 입력할 수 있다.


-- 프로시저 생성
 
CREATE OR REPLACE PROCEDURE PRC_STUDENTS_INSERT
( V_ID      IN TBL_STUDENTS.ID%TYPE
, V_PW      IN TBL_IDPW.PW%TYPE
, V_NAME    IN TBL_STUDENTS.NAME%TYPE
, V_TEL     IN TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN TBL_STUDENTS.ADDR%TYPE
)
IS
BEGIN
    INSERT INTO TBL_IDPW(ID,PW)
    VALUES(V_ID, V_PW);
    
    INSERT INTO TBL_STUDENTS(ID, NAME, TEL, ADDR)
    VALUES(V_ID, V_NAME, V_TEL, V_ADDR);
    
    COMMIT;
END;
--==>> Procedure PRC_STUDENTS_INSERT이(가) 컴파일되었습니다.


--○ 데이터 입력 시 특정 항목의 데이터만 입력하면
--                 ------------------
--                  (학번, 이름, 국어점수, 영어점수, 수학점수)
-- 내부적으로 총점, 평균, 등급 항목이 함께 입력 처리될 수 있도록 하는
-- 프로시저를 작성한다.
-- 프로시저명 : PRC_SUNGJUK_INSERT()
/*
실행 예)
EXEC PRC_SUNGJUK_INSERT(1,'박종호',90,80,70);

프로시저 호출로 처리된 결과
학번  이름  국어점수    영어점수    수학점수    총점  평균  등급
 1   박종호    90          80          70      240   80    B
*/


CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_INSERT
( V_HAKBUN  IN TBL_SUNGJUK.HAKBUN%TYPE
, V_NAME    IN TBL_SUNGJUK.NAME%TYPE
, V_KOR     IN TBL_SUNGJUK.KOR%TYPE
, V_MAT     IN TBL_SUNGJUK.MAT%TYPE
, V_ENG     IN TBL_SUNGJUK.ENG%TYPE

)
IS 
    V_TOT     TBL_SUNGJUK.TOT%TYPE      :=0;
    V_AVG     TBL_SUNGJUK.AVG%TYPE      :=0;
    V_GRADE   TBL_SUNGJUK.GRADE%TYPE;
BEGIN  
    
    V_TOT := V_KOR + V_MAT + V_ENG;
    V_AVG := V_TOT /3.0;
    IF V_AVG BETWEEN 90 AND 100
        THEN V_GRADE := 'A';
    ELSIF V_AVG BETWEEN 80 AND 89
        THEN V_GRADE := 'B';
    ELSIF V_AVG BETWEEN 70 AND 79
        THEN V_GRADE := 'C';
    ELSIF V_AVG BETWEEN 60 AND 69
        THEN V_GRADE := 'D';
    ELSE
        V_GRADE := 'F';
    END IF;
    
    INSERT INTO TBL_SUNGJUK(HAKBUN, NAME, KOR, ENG, MAT,TOT,AVG,GRADE)
    VALUES(V_HAKBUN, V_NAME, V_KOR, V_ENG, V_MAT, V_TOT, V_AVG, V_GRADE);
    
    
    COMMIT; 
    
END;
--==>> Procedure PRC_SUNGJUK_INSERT이(가) 컴파일되었습니다.



--○ TBL_SUNGJUK 테이블에서 특정 학생의 점수
--   (학번, 국어점수, 영어점수, 수학점수) 데이터 수정 시
--   총점, 평균, 등급까지 수정하는 프로시저를 작성한다.
-- 프로시저명 : PRC_SUNGJUK_UPDATE()
/*
실행 예)
EXEC PRC_SUNGJUK_UPDATE(1,50,50,50);

프로시저 호출로 처리된 결과)
학번  이름  국어점수    영어점수    수학점수    총점  평균  등급
 1    박종호   50          50          50     150    50    F
*/

CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_UPDATE
( V_HAKBUN  IN  TBL_SUNGJUK.HAKBUN%TYPE
, V_KOR     IN  TBL_SUNGJUK.KOR%TYPE
, V_ENG     IN  TBL_SUNGJUK.ENG%TYPE
, V_MAT     IN  TBL_SUNGJUK.MAT%TYPE
)
IS
    V_TOT   TBL_SUNGJUK.TOT%TYPE := 0;
    V_AVG   TBL_SUNGJUK.AVG%TYPE := 0;
    V_GRADE TBL_SUNGJUK.GRADE%TYPE;
BEGIN
    
    V_TOT := V_KOR + V_MAT + V_ENG;
    V_AVG := V_TOT /3.0;
    IF V_AVG BETWEEN 90 AND 100
        THEN V_GRADE := 'A';
    ELSIF V_AVG BETWEEN 80 AND 89
        THEN V_GRADE := 'B';
    ELSIF V_AVG BETWEEN 70 AND 79
        THEN V_GRADE := 'C';
    ELSIF V_AVG BETWEEN 60 AND 69
        THEN V_GRADE := 'D';
    ELSE
        V_GRADE := 'F';
    END IF;
    
    
    UPDATE TBL_SUNGJUK
    SET TBL_SUNGJUK.KOR = V_KOR, TBL_SUNGJUK.ENG = V_ENG, TBL_SUNGJUK.MAT = V_MAT, TBL_SUNGJUK.TOT = V_TOT, TBL_SUNGJUK.AVG = V_AVG, TBL_SUNGJUK.GRADE = V_GRADE 
    WHERE TBL_SUNGJUK.HAKBUN = V_HAKBUN;
    
    COMMIT;
    
    
END;



--○ TBL_STUDENTS 테이블에서 전화번호와 주소 데이터를 수정하는(변경하는)
--   프로시저를 작성한다.
--   단, ID와 PW가 일치하는 경우에만 수정을 진행할 수 있도록 한다.
-- 프로시저명 : PRC_STUDENTS_UPDATE()
/*
실행 예)
EXEC PRC_STUDENTS_UPDATE('superman', 'java006$' ,'010-9999-9999','대전');

프로시저 호출로 처리된 결과)
superman    김현우     010-9999-9999       대전
batman      김종범     010-2222-2222       서울 마포구
*/

CREATE OR REPLACE PROCEDURE PRC_STUDENTS_UPDATE
( V_ID      IN  TBL_STUDENTS.ID%TYPE
, V_PW      IN  TBL_IDPW.PW%TYPE
, V_TEL     IN  TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN  TBL_STUDENTS.ADDR%TYPE
)
IS
BEGIN

    UPDATE TBL_STUDENTS
    SET TEL = V_TEL, ADDR = V_ADDR
    WHERE V_ID = ID AND V_PW IN (  SELECT PW
                                   FROM TBL_IDPW
                                   WHERE V_PW = PW
                                );
    
    /* 조인 사용
    
    UPDATE (SELECT T1.ID, T1.PW, T2.TEL, T2.ADDR
            FROM TBL_IDPW T1 JOIN TBL_STUDENTS T2
            ON T1.ID = T2.ID) T
    SET T.TEL = V_TEL, T.ADDR = V_ADDR
    WHERE T.ID = V_ID AND T.PW = V_PW;
    */
    
    COMMIT;
    
END;
--==>> Procedure PRC_STUDENTS_UPDATE이(가) 컴파일되었습니다.

--○ TBL_INSA 테이블을 대상으로 신규 데이터 입력 프로시저를 작성한다.
-- NUM NAME SSN IBSADATE CITY TEL BUSEO JIKWI BASICPAY SUDANG 로 구성된 컬럼 중
-- NAME SSN IBSADATE CITY TEL BUSEO JIKWI BASICPAY SUDANG 데이터 입력
-- 단, 입력 시 NUM 컬럼(사원번호)의 값은
-- 기본 부여된 사원 번호의 마지막 번호 그 다음 번호를 자동으로 입력 처리할 수 있는
-- 프로시저로 구성한다.
-- 프로시저명 : PRC_INSA_INSERT();
/*
실행 예)
EXEC PRC_INSA_INSERT('오지은', '901212-2234567', SYSDATE, '서울', '010-3213-6546', '영업부', '대리', 1000000, 200000);

프로시저 호출로 처리된 결과)
1061 오지은 901212-223467 19/9/26 서울 010-3213-6456 영업부 대리 1000000 200000
--의 데이터가 신규 입력된 상황
*/

CREATE OR REPLACE PROCEDURE PRC_INSA_INSERT
( V_NAME        IN  TBL_INSA.NAME%TYPE
, V_SSN         IN  TBL_INSA.SSN%TYPE
, V_IBSADATE    IN  TBL_INSA.IBSADATE%TYPE
, V_CITY        IN  TBL_INSA.CITY%TYPE
, V_TEL         IN  TBL_INSA.TEL%TYPE
, V_BUSEO       IN  TBL_INSA.BUSEO%TYPE
, V_JIKWI       IN  TBL_INSA.JIKWI%TYPE
, V_BASICPAY    IN  TBL_INSA.BASICPAY%TYPE
, V_SUDANG      IN  TBL_INSA.SUDANG%TYPE
)
IS
    V_NUM   TBL_INSA.NUM%TYPE;
BEGIN
    SELECT MAX(NUM)      INTO V_NUM
    FROM TBL_INSA;
    
    V_NUM := V_NUM+1;
    
    INSERT INTO TBL_INSA
    VALUES(V_NUM, V_NAME, V_SSN, V_IBSADATE, V_CITY, V_TEL, V_BUSEO, V_JIKWI, V_BASICPAY, V_SUDANG);
    
    COMMIT;
    
END;
--==>> Procedure PRC_INSA_INSERT이(가) 컴파일되었습니다.


--○ TBL_상품, TBL_입고 테이블을 대상으로
--   TBL_입고 테이블에 데이터 입력 시(즉, 입고 이벤트 발생 시)
--   TBL_상품 테이블의 재고수량이 함께 변동될 수 있는 기능을 가진
--   프로시저를 작성한다.
--   단, 이 과정에서 입고번호는 자동 증가 처리한다. (시퀀스 사용 X)
--   TBL_입고 테이블 구성 컬럼
--   : 입고번호, 상품코드, 입고일자, 입고수량, 입고단가
-- 프로시저명 : PRC_입고_INSERT(상품코드, 입고수량, 입고단가)

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE PRC_입고_INSERT
( V_상품코드    IN  TBL_상품.상품코드%TYPE
, V_입고수량    IN  TBL_입고.입고수량%TYPE
, V_입고단가    IN  TBL_입고.입고단가%TYPE
)
IS
    V_입고번호  TBL_입고.입고번호%TYPE;
BEGIN
    
    SELECT NVL(MAX(입고번호),0) INTO V_입고번호
    FROM TBL_입고;

    V_입고번호 := V_입고번호 + 1;
    
    
    INSERT INTO TBL_입고(입고번호, 상품코드, 입고수량, 입고단가)
    VALUES(V_입고번호, V_상품코드, V_입고수량, V_입고단가);
    
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 + V_입고수량
    WHERE 상품코드 = V_상품코드;
    
    COMMIT;
    
END;
--==>> Procedure PRC_입고_INSERT이(가) 컴파일되었습니다.


--■■■ 프로시저 내에서의 예외 처리 ■■■--

--○ TBL_MEMBER 테이블에 데이터를 입력하는 프로시저를 생성
--   단, 이 프로시저를 통해 데이터를 입력할 경우
--   CITY(지역) 항목에 '서울','경기','대전'만 입력이 가능하도록 구성한다.
--   이 지역 외의 다른 지역을 프로시저 호출을 통해 입력하고자 하는 경우
--   (즉, 입력을 시도하는 경우)
--   예외에 대한 처리를 하려고 한다.
-- 프로시저명 : PRC_MEMBER_INSERT();
/*
실행 예)
EXEC PRC_MEMBER_INSERT('김동현', '010-1111-1111', '서울');
*/


















