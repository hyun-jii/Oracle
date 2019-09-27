SELECT USER
FROM DUAL;
--==>> SCOTT



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


CREATE OR REPLACE PROCEDURE PRC_MEMBER_INSERT
( V_NAME    IN  TBL_MEMBER.NAME%TYPE
, V_TEL     IN  TBL_MEMBER.TEL%TYPE
, V_CITY    IN  TBL_MEMBER.CITY%TYPE
)
IS 
    -- 실행 영역의 쿼리문 수행을 위해 필요한 데이터 변수 선언
    V_NUM   TBL_MEMBER.NUM%TYPE;
    
    -- 사용자 정의 예외에 대한 변수 선언 CHECK~!!!
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN

    -- 프로시저를 통해 입력 처리를 정상적으로 진행해야 할 데이터인지
    -- 아닌지의 여부를 가장 먼저 확인할 수 있도록 코드 구성
    IF(V_CITY NOT IN ('서울','경기','대전'))
        -- 예외 발생 CHECK~!!!
        THEN RAISE USER_DEFINE_ERROR;
        
    END IF;
    -- 선언한 변수에 값 담아내기
    SELECT NVL(MAX(NUM),0)  INTO V_NUM
    FROM TBL_MEMBER;
    
    -- 쿼리문 구성(INSERT)
    INSERT INTO TBL_MEMBER(NUM, NAME, TEL, CITY)
    VALUES((V_NUM+1), V_NAME, V_TEL, V_CITY);
    
    -- 커밋
    COMMIT;
    
    --예외 처리 구문
    EXCEPTION
        WHEN USER_DEFINE_ERROR 
            THEN RAISE_APPLICATION_ERROR(-20001, '서울,경기,대전만 입력이 가능합니다.');
        WHEN OTHERS 
            THEN ROLLBACK;
    
END;
--==>> Procedure PRC_MEMBER_INSERT이(가) 컴파일되었습니다.


--○ TBL_출고 테이블에 데이터 입력 시(즉, 출고 이벤트 발생 시)
--   TBL_상품 테이블의 재고수량이 변동되는 프로시저를 작성한다.
--   단, 출고번호는 입고번호와 마찬가지로 자동 증가.
--   또한, 출고 수량이 재고 수량보다 많은 경우...
--   출고 액션을 취고할 수 있도록 처리한다. (출고가 이루어지지 않도록...)
-- 프로시저명 : PRC_출고_INSERT(상품코드, 출고수량, 출고단가);


CREATE OR REPLACE PROCEDURE PRC_출고_INSERT
( V_상품코드    IN  TBL_출고.상품코드%TYPE
, V_출고수량    IN  TBL_출고.출고수량%TYPE
, V_출고단가    IN  TBL_출고.출고단가%TYPE
)
IS
    V_출고번호           TBL_출고.출고번호%TYPE;
    USER_DEFINE_ERROR    EXCEPTION;
    V_재고수량          TBL_상품.재고수량%TYPE;
BEGIN

    SELECT 재고수량     INTO V_재고수량
    FROM TBL_상품
    WHERE 상품코드 = V_상품코드;
    
    IF V_재고수량 < V_출고수량  OR  V_재고수량 < 0
        THEN RAISE USER_DEFINE_ERROR;
    END IF;

    SELECT NVL(MAX(출고번호),0)     INTO V_출고번호
    FROM TBL_출고;
    
    INSERT INTO TBL_출고
    VALUES((V_출고번호+1), V_상품코드,SYSDATE, V_출고수량, V_출고단가);
    
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 - V_출고수량
    WHERE 상품코드 = V_상품코드;
    
    COMMIT;
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002,'재고부족~!!');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
    
END;
--==>> Procedure PRC_MEMBER_INSERT이(가) 컴파일되었습니다.


--○ TBL_출고 테이블에서 출고수량을 수정(변경)하는 프로시저를 작성한다.
-- 프로시저명 : PRC_출고_UPDATE(출고번호, 변경할 수량)


CREATE OR REPLACE PROCEDURE PRC_출고_UPDATE
( V_출고번호        IN  TBL_출고.출고번호%TYPE
, V_변경할수량      IN  TBL_출고.출고수량%TYPE
)
IS
    V_재고수량          TBL_상품.재고수량%TYPE;
    USER_DEFINE_ERROR   EXCEPTION;
    V_출고수량          TBL_출고.출고수량%TYPE;
BEGIN

    -- 현재 재고수량 V_재고수량에 저장
    SELECT 재고수량     INTO V_재고수량
    FROM TBL_상품
    WHERE 상품코드 = (  SELECT 상품코드
                        FROM TBL_출고
                        WHERE 출고번호 = V_출고번호
                    );
                    
    -- 현재 출고수량 V_출고수량에 저장
    SELECT 출고수량     INTO V_출고수량
    FROM TBL_출고
    WHERE 출고번호 = V_출고번호;
                                     
    
    -- 재고수량이 변경할수량-출고수량보다 적으면 예외처리
    IF V_재고수량  <  ABS(V_변경할수량 - V_출고수량)
        THEN RAISE USER_DEFINE_ERROR;
    END IF; 
        
    
    -- TBL_상품에 있는 재고수량 업데이트       
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 + V_출고수량 - V_변경할수량
    WHERE 상품코드 = (  SELECT 상품코드
                        FROM TBL_출고
                        WHERE 출고번호 = V_출고번호
                    );
                    
    -- TBL_출고에 있는 출고수량 업데이트                
    UPDATE TBL_출고
    SET 출고수량 = V_변경할수량
    WHERE 출고번호 = V_출고번호;
    
    COMMIT;
    
    -- 예외처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20003,'재고부족');
            ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
    
END;
--==>> Procedure PRC_출고_UPDATE이(가) 컴파일되었습니다.


-- 과제 1. 

/*
PRC_입고_INSERT()
PRC_출고_INSERT()

PRC_출고_UPDATE(출고번호, 출고수량)
PRC_입고_UPDATE(입고번호, 입고수량) --- CHECK~!!!

PRC_입고_DELETE(입고번호) --- CHECK~!!!
PRC_출고_DELETE(출고번호) --- CHECK~!!!
*/

-- 과제 2. 시간 개념 적용
/*
PRC_출고_UPDATE()
PRC_입고_UPDATE() 

PRC_입고_DELETE() 
PRC_출고_DELETE()
*/

---------------------------------------------------------------------------------

--■■■ CURSOR(커서) ■■■--

-- 1. 오라클에서는 하나의 레코드가 아닌 여러 레코드로 구성된
--    작업 영역에서 SQL문을 실행하고 그 과정에서 발생한 정보를
--    저장하기 위해서 커서(CURSOR)를 사용하며,
--    커서에는 암시적인 커서와 명시적인 커서가 있다.

-- 2. 암시적 커서는 모든 SQL문에 존재하며
--    SQL문 실행 후 오직 하나의 행(ROW)만 출력하게 된다.
--    그러나 SQL문을 실행한 결과물(RESULT SET)이
--    여러 행(ROW)으로 구성된 경우
--    커서(CURSOR)를 명시적으로 선언해야 여러 행(ROW)을 다를 수 있다.



--○ 커서 이용 전 상황(단일 행 접근 시)
SET SERVEROUTPUT ON;
--==>> 작업이 완료되었습니다.

DECLARE
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
BEGIN
    SELECT NAME, TEL INTO V_NAME, V_TEL
    FROM TBL_INSA
    WHERE NUM=1001;
    
    DBMS_OUTPUT.PUT_LINE(V_NAME || '--' || V_TEL);
END;
--==>> 홍길동--011-2356-4528


--○ 커서 이용 전 상황(다중 행 접근 시)
DECLARE
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
BEGIN
    SELECT NAME, TEL INTO V_NAME, V_TEL
    FROM TBL_INSA;
    
    DBMS_OUTPUT.PUT_LINE(V_NAME || '--' || V_TEL);
END;
--==>> 에러발생
-- ORA-01422: exact fetch returns more than requested number of rows

--○ 커서 이용 전 상황(다중 행 접근 시)
DECLARE
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
    V_NUM   TBL_INSA.NUM%TYPE := 1001;
BEGIN

    
    LOOP
         SELECT NAME, TEL INTO V_NAME, V_TEL
         FROM TBL_INSA
         WHERE NUM = V_NUM;
        
         DBMS_OUTPUT.PUT_LINE(V_NAME || '--' || V_TEL);
         
         V_NUM := V_NUM+1;
         
         EXIT WHEN V_NUM > 1060;
    END LOOP;
    
END;
--==>>
/*
홍길동--011-2356-4528
이순신--010-4758-6532
이순애--010-4231-1236
김정훈--019-5236-4221
한석봉--018-5211-3542
이기자--010-3214-5357
장인철--011-2345-2525
김영년--016-2222-4444
나윤균--019-1111-2222
김종서--011-3214-5555
유관순--010-8888-4422
정한국--018-2222-4242
조미숙--019-6666-4444
황진이--010-3214-5467
이현숙--016-2548-3365
이상헌--010-4526-1234
엄용수--010-3254-2542
이성길--018-1333-3333
박문수--017-4747-4848
유영희--011-9595-8585
홍길남--011-9999-7575
이영숙--017-5214-5282
김인수--
김말자--011-5248-7789
우재옥--010-4563-2587
김숙남--010-2112-5225
김영길--019-8523-1478
이남신--016-1818-4848
김말숙--016-3535-3636
정정해--019-6564-6752
지재환--019-5552-7511
심심해--016-8888-7474
김미나--011-2444-4444
이정석--011-3697-7412
정영희--
이재영--011-9999-9999
최석규--011-7777-7777
손인수--010-6542-7412
고순정--010-2587-7895
박세열--016-4444-7777
문길수--016-4444-5555
채정희--011-5125-5511
양미옥--016-8548-6547
지수환--011-5555-7548
홍원신--011-7777-7777
허경운--017-3333-3333
산마루--018-0505-0505
이기상--
이미성--010-6654-8854
이미인--011-8585-5252
권영미--011-5555-7548
권옥경--010-3644-5577
김싱식--011-7585-7474
정상호--016-1919-4242
정한나--016-2424-4242
전용재--010-7549-8654
이미경--016-6542-7546
김신제--010-2415-5444
임수봉--011-4151-4154
김신애--011-4151-4444
*/


--○ 커서 이용 후 상황

DECLARE
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
    
    -- 커서 이용을 위한 커서변수 선언 (-> 커서 정의)
    CURSOR CUR_INSA_SELECT
    IS
    SELECT NAME, TEL
    FROM TBL_INSA;
    
BEGIN
    
    -- 커서 오픈
    OPEN CUR_INSA_SELECT;
    
    -- 커서 오픈 시 쏟아져나오는 데이터들 처리(잡아내기)
    LOOP
        -- 한 행 한 행 끄집어내어 가져오는 행위 -> 『FETCH』
        FETCH CUR_INSA_SELECT INTO V_NAME, V_TEL;
        
        EXIT WHEN CUR_INSA_SELECT%NOTFOUND;
        
        -- 출력
        DBMS_OUTPUT.PUT_LINE(V_NAME || '--' || V_TEL);
    END LOOP;
    
    -- 커서 클로즈
    CLOSE CUR_INSA_SELECT;
END;
--==>>
/*
오지은--010-3213-6546
홍길동--011-2356-4528
이순신--010-4758-6532
이순애--010-4231-1236
김정훈--019-5236-4221
한석봉--018-5211-3542
이기자--010-3214-5357
장인철--011-2345-2525
김영년--016-2222-4444
나윤균--019-1111-2222
김종서--011-3214-5555
유관순--010-8888-4422
정한국--018-2222-4242
조미숙--019-6666-4444
황진이--010-3214-5467
이현숙--016-2548-3365
이상헌--010-4526-1234
엄용수--010-3254-2542
이성길--018-1333-3333
박문수--017-4747-4848
유영희--011-9595-8585
홍길남--011-9999-7575
이영숙--017-5214-5282
김인수--
김말자--011-5248-7789
우재옥--010-4563-2587
김숙남--010-2112-5225
김영길--019-8523-1478
이남신--016-1818-4848
김말숙--016-3535-3636
정정해--019-6564-6752
지재환--019-5552-7511
심심해--016-8888-7474
김미나--011-2444-4444
이정석--011-3697-7412
정영희--
이재영--011-9999-9999
최석규--011-7777-7777
손인수--010-6542-7412
고순정--010-2587-7895
박세열--016-4444-7777
문길수--016-4444-5555
채정희--011-5125-5511
양미옥--016-8548-6547
지수환--011-5555-7548
홍원신--011-7777-7777
허경운--017-3333-3333
산마루--018-0505-0505
이기상--
이미성--010-6654-8854
이미인--011-8585-5252
권영미--011-5555-7548
권옥경--010-3644-5577
김싱식--011-7585-7474
정상호--016-1919-4242
정한나--016-2424-4242
전용재--010-7549-8654
이미경--016-6542-7546
김신제--010-2415-5444
임수봉--011-4151-4154
김신애--011-4151-4444
*/


------------------------------------------------------------------------------------------------------

--■■■ TRIGGER(트리거) ■■■--

-- 사전적인 의미  : 촉발시키다, 야기하다, 유발하다.

-- 1. TRIGGER(트리거)란 DML 작업 즉, INSERT, UPDATE, DELETE 작업이 일어날 때
--    자동적으로 실행되는(유발되는, 촉발되는)객체로
--    이와 같은 특징을 강조하여 DML TRIGGER 라고 부르기도 한다.
--    TRIGGER 는 데이터 무결성 뿐 아니라
--    다음과 같은 작업에도 널리 사용된다.

-- 자동으로 파생된 열 값 생성
-- 잘못된 트랜잭션 방지
-- 복잡한 보안 권한 강제 수행
-- 분산 데이터베이스 노드 상에서 참조 무결성 강제 수행
-- 복잡한 업무 규칙 강제 적용
-- 투명한 이벤트 로깅 제공
-- 복잡한 감사 제공
-- 동기 테이블 복제 유지관리
-- 테이블 액세스 통계 수집


-- 2. TRIGGER 내에서는 COMMIT, ROLLBACK 문을 사용할 수 없다.

-- 3. 특징 및 종류

--  - BEFORE STATEMENT
--    SQL 구문이 실행되기 전에 그 문장에 대해 한 번 실행
--  - BEFORE ROW
--    SQL 구문이 실행되기 전에(DML 작업을 수행하기 전에)
--    각 행(ROW)에 대해 한 번씩 실행
--  - AFTER STATEMENT
--    SQL 구문이 실행된 후에 그 문장에 대해 한 번 실행
--  - AFTER ROW
--    SQL 구문이 실행된 후에(DML 작업을 수행한 후에)
--    각 행(ROW)에 대해 한 번씩 실행


-- 4. 형식 및 구조
/*
CREATE [OR REPLACE] TRIGGER 트리거명
    [BEFORE | AFTER]
    이벤트1 [OR 이벤트2 [OR 이벤트3]] ON 테이블명
    [FOR EACH ROW [WHEN TRIGGER 조건]]               -- ROW TRIGGER 에만 기재
[DECLARE]
    -- 선언 구문;
BEGIN
    -- 실행 구문;
END;
*/


--■■■ AFTER STATEMENT TRIGGER 상황 실습 ■■■--
--※ DML 작업에 대한 이벤트 기록

--○ TRIGGER(트리거) 생성(TRG_EVENTLOG)
CREATE OR REPLACE TRIGGER TRG_EVENTLOG
            AFTER
            INSERT OR UPDATE OR DELETE ON TBL_TEST1
BEGIN
    -- 이벤트 종류 구분(조건문을 통한 분기)
    IF(INSERTING)
        THEN INSERT INTO TBL_EVENTLOG(MEMO)
             VALUES('INSERT 쿼리가 실행되었습니다.');
    ELSIF(UPDATING)
        THEN INSERT INTO TBL_EVENTLOG(MEMO)
             VALUES('UPDATE 쿼리가 실행되었습니다.');
    ELSIF(DELETING)
        THEN INSERT INTO TBL_EVENTLOG(MEMO)
             VALUES('DELETE 쿼리가 실행되었습니다.');
    END IF;
    
    --COMMIT;
    --※ TRIGGER 내에서는 COMMIT/ROLLBACK 구문 사용불가~!!
END;
--==>> Trigger TRG_EVENTLOG이(가) 컴파일되었습니다.




























