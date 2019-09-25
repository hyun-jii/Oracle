SELECT USER
FROM DUAL;
--==>> SCOTT

--■■■ PL/SQL ■■■--

-- 1. PL/SQL(Procedural Language extension to SQL) 은
--   프로그래밍 언어의 특성을 가지는 SQL의 확장이며,
--   데이터 조작과 질의 문장은 PL/SQL 절차적 코드 안에 포함된다.
--   또한, PL/SQL을 사용하려면 SQL로 할 수 없는 절차적 작업이 가능하다.
--   여기에서 절차적 이라는 단어가 가지는 의미는
--   어떤 것이 어떤 과정을 거쳐서 어떻게 완료되는지
--   그 방법을 정확하게 코드에 기술한다는 것을 의미한다.

-- 2. PL/SQL 은 절차적으로 표현하기 위해
--    변수를 선언할 수 있는 기능,
--    참과 거짓을 구별할 수 있는 기능,
--    실행 흐름을 컨트롤 할 수 있는 기능 등을 제공한다.

-- 3. PL/SQL 은 블럭 구조로 되어 있으며
--    블럭은 선언 부분, 실행 부분, 예외 처리 부분의
--    세 부분으로 구성되어 있다.
--    또한, 반드시 실행 부분은 존재해야 하며, 구조는 다음과 같다.

-- 4. 형식 및 구조
/*
[DECLARE]
    -- 선언문(DECLARATIONS)
BEGIN
    -- 실행문(STATEMENTS)
    
    [EXCEPTION]
        -- 예외 처리문(EXCEPTIION HANDLERS)

END;
*/

-- 5. 변수 선언ㅇ
/*
DECLARE
    변수명 자료형;
    변수명 자료형 := 초기값;
BEGIN
END;
*/

SET SERVEROUTPUT ON;
--==>> 작업이 완료되었습니다.
-- 『DBMS_OUTPUT.PUT_LINE()』을 통해
-- 화면에 결과를 출력하기 위한 환경변수 설정


--○ 변수에 임의의 값을 대입하고 출력하는 구문 작성
DECLARE
    -- 선언부
    D1 NUMBER := 10;
    D2 VARCHAR2(30) := 'HELLO';
    D3 VARCHAR2(20) := 'Oracle';
BEGIN
    -- 실행부
    DBMS_OUTPUT.PUT_LINE(D1);
    DBMS_OUTPUT.PUT_LINE(D2);
    DBMS_OUTPUT.PUT_LINE(D3);
END;
--==>>
/*
10
HELLO
Oracle

PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/

--○ 변수에 임의의 값을 대입하고 출력하는 구문 작성
DECLARE
    --선언부
    D1 NUMBER := 10;
    D2 VARCHAR2(30) := 'HELLO';
    D3 VARCHAR2(20) := 'Oracle';
BEGIN
    --실행부
    D1 := D1 * 10;    
    D2 := D2 || '이현지';
    D3 := D3 || 'World';
    
    DBMS_OUTPUT.PUT_LINE(D1);
    DBMS_OUTPUT.PUT_LINE(D2);
    DBMS_OUTPUT.PUT_LINE(D3);
END;
--==>>
/*
100
HELLO이현지
OracleWorld
*/

--○ IF문 (조건문)
-- IF ~ THEN ~ ELSE ~ END IF;

-- 1. PL/SQL 의 IF 문장은 다른 언어의 IF 조건문과 거의 유사하다.
--    일치하는 조건에 따라 선택적으로 작업을 수행할 수 있도록 한다.
--    TRUE 이면 THEN과 ELSE 사이의 문장을 수행하고
--    FALSE 나 NULL 이면 ELSE 와 END IF; 사이의 문장을 수행하게 된다.


-- 2. 형식 및 구조
/*
IF 조건
    THEN 처리구문;
ELSIF 조건
    THEN 처리구문;
ELSIF 조건
    THEN 처리구문;
ELSE
    처리구문;
END IF;
*/


--○ 변수에 들어있는 값에 따라 Excellent, Good, Fail 로 구분하여
--   결과를 출력하는 PL/SQL 구문을 작성한다.

DECLARE
    GRADE CHAR;
BEGIN
    GRADE := 'C';
    
    IF GRADE = 'A'
        THEN DBMS_OUTPUT.PUT_LINE('Excellent');
    ELSIF GRADE ='B'
        THEN DBMS_OUTPUT.PUT_LINE('Good');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Fail');
    END IF;
END;
--==>> Fail


DECLARE
    GRADE CHAR;
BEGIN
    GRADE := 'A';
    
    IF GRADE = 'A'
        THEN DBMS_OUTPUT.PUT_LINE('Excellent');
    ELSIF GRADE ='B'
        THEN DBMS_OUTPUT.PUT_LINE('Good');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Fail');
    END IF;
END;
--==>> Excellent

--○ CASE문(조건문)
-- CASE ~ WHEN ~ THEN ~ ELSE ~ END CASE;

-- 1. 형식 및 구조
/*
CASE 변수
    WHEN 값1
        THEN 실행문;
    WHEN 값2
        THEN 실행문;
    ELSE
        실행문;
END CASE;
*/

DECLARE
    GRADE CHAR;
BEGIN
    GRADE := 'A';
    CASE GRADE
        WHEN 'A'
            THEN DBMS_OUTPUT.PUT_LINE('Excellent');
        WHEN 'B'
            THEN DBMS_OUTPUT.PUT_LINE('Good');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Fail');
            
    END CASE;
END;

--==>> Excellent


--○ 외부 입력 처리

-- ACCEPT 구문
-- ACCEPT 변수명 PROMPT '메세지';
--> 외부 변수로부터 입력받은 데이터를 내부 변수에 전달할 때
-- 『&외부변수명』 형태로 접근하게 된다.


--○ 정수 2개를 외부로부터(사용자로부터) 입력받아
--   이들의 덧셈 결과를 출력하는 PL/SQL 구문을 작성한다.

ACCEPT N1 PROMPT '첫 번째 정수를 입력하세요';
ACCEPT N2 PROMPT '두 번째 정수를 입력하세요';

DECLARE
    -- 주요 변수 선언
    NUM1  NUMBER := &N1;
    NUM2  NUMBER := &N2;
    TOTAL NUMBER := 0;
BEGIN
    -- 연산 및 처리
    
    TOTAL := NUM1 + NUM2;
    
    --결과 출력
    DBMS_OUTPUT.PUT_LINE(NUM1 || '+' || NUM2 || '=' || TOTAL);
END;
-- 바인딩 변수 입력 대화창을 통해 입력된 값 : 25, 47
--==>> 25+47=72

--○ 사용자로부터 입력받은 금액을 화폐단위로 구분하여 출력하는 프로그램을 작성한다.
--   단, 반환 금액은 편의상 1천원 미만, 10원 이상만 가능하다고 가정한다.
/*
실행 예)
바인딩 변수 입력 대화창 -> 금액 입력 : 990

입력받은 금액 총액 : 990원
화폐단위 : 오백원1, 백원4, 오십원1, 십원4
*/

ACCEPT N1 PROMPT '금액 입력';

DECLARE
    MONEY   NUMBER := &N1;
    MONEY2  NUMBER := &N1;
    N500    NUMBER := 0;
    N100    NUMBER := 0;
    N50     NUMBER := 0;
    N10     NUMBER := 0;
   
BEGIN
/*------------------내가 한것------------------------------------
    N500 := TRUNC((MONEY / 500),0);
    N100 := TRUNC(((MONEY-(N500*500))/100),0);
    N50  := TRUNC(((MONEY-(N500*500)-(N100*100)) / 50),0);
    N10  := TRUNC(((MONEY-(N500*500)-(N100*100)-(N50*50))/10),0);
----------------------------------------------------------------*/

    N500  := TRUNC(MONEY/500);
    MONEY := MOD(MONEY, 500);
    
    N100  := TRUNC(MONEY/100);
    MONEY := MOD(MONEY, 100);
    
    N50   := TRUNC(MONEY/50);
    MONEY := MOD(MONEY, 50);
    
    N10   := TRUNC(MONEY/10);
    
    DBMS_OUTPUT.PUT_LINE('입력받은 금액 총액' || MONEY2);
    DBMS_OUTPUT.PUT_LINE('오백원' || N500 ||'백원' || N100 ||'오십원' || N50 || '십원' || N10);
/*
    DBMS_OUTPUT.PUT_LINE('오백원' || N500);
    DBMS_OUTPUT.PUT_LINE('백원' || N100);
    DBMS_OUTPUT.PUT_LINE('오십원' || N50);
    DBMS_OUTPUT.PUT_LINE('십원' || N10);
*/ 
    
END;
--==>>
/*
오백원1
백원4
오십원1
십원4

입력받은 금액 총액990
오백원1백원4오십원1십원4
*/

--○ 기본 반복문
-- LOOP ~ END LOOP;

-- 1. 조건과 상관없이 무조건 반복하는 구문.

-- 2. 형식 및 구조
/*
LOOP
    -- 실행문
    EXIT WHEN 조건;       -- 조건이 참인 경우 반복문을 빠져나간다.

END LOOP;
*/

--○ 1부터 10까지의 수 출력(LOOP 문 활용)
DECLARE
    N NUMBER;
BEGIN
    N := 1;
    LOOP
        DBMS_OUTPUT.PUT_LINE(N);
        EXIT WHEN N >= 10;
        N := N+1;
    END LOOP;
END;
--==>>
/*
1
2
3
4
5
6
7
8
9
10
*/

--○ WHILE 반복문
-- WHILE LOOP ~ END LOOP;

-- 1. 제어 조건이 TRUE인 동안 일련의 문장을 반복하기 위해
-- WHILE LOOP 구문을 사용한다.
-- 조건은 반복이 시작되는 시점에 체크하게 되어
-- LOOP 내의 문장이 한 번도 수행되지 않을 경우도 있다.
-- LOOP 를 시작할 때 조건이 FALSE 이면 반복 문장을 탈출하게 된다.


-- 2. 형식 및 구조
/*
WHILE 조건 LOOP   -- 조건이 참인 경우 바복 수행
    -- 실행문;
END LOOP;
*/


--○ 1부터 10까지의 수 출력 (WHILE LOOP문 활용)
DECLARE
    N NUMBER;
BEGIN
    N := 0;
    WHILE N < 10 LOOP
        N := N+1;
        DBMS_OUTPUT.PUT_LINE(N);
    END LOOP;
END;
--==>>
/*
1
2
3
4
5
6
7
8
9
10
*/







