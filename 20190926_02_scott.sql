SELECT USER
FROM DUAL;
--==>> SCOTT


--○ 생성한 프로시저가 제대로 작동하는지의 여부 확인 -> 프로시저 호출
-- 프로시저명 : PRC_STUDENTS_INSERT()

EXEC PRC_STUDENTS_INSERT('batman', 'java006$', '김종범', '010-2222-2222','서울 마포구');
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

--○ 테이블 확인
SELECT *
FROM TBL_STUDENTS;
--==>>
/*
superman	김현우	010-1111-1111	제주도 서귀포시
batman	    김종범	010-2222-2222	서울 마포구
*/
SELECT *
FROM TBL_IDPW;
--==>>
/*
superman	java006$
batman	    java006$
*/

--○ 학번, 이름, 국어점수, 영어점수, 수학점수 데이터를
--   입력받을 수 있는 실습 테이블 생성(TBL_SUNGJUK)

CREATE TABLE TBL_SUNGJUK
( HAKBUN    NUMBER
, NAME      VARCHAR2(40)
, KOR       NUMBER(3)
, ENG       NUMBER(3)
, MAT       NUMBER(3)
, CONSTRAINT SUNGJUK_HAKBUN_PK PRIMARY KEY(HAKBUN)
);
--==>> Table TBL_SUNGJUK이(가) 생성되었습니다.

--○ 생성된 테이블에 컬럼 추가
--   (총점 -> TOT, 평균 -> AVG, 등급-> GRADE)


ALTER TABLE TBL_SUNGJUK
ADD (TOT NUMBER(3), AVG NUMBER(4,1), GRADE CHAR);
--==>> Table TBL_SUNGJUK이(가) 변경되었습니다.

--※ 여기서 추가한 컬럼에 대한 항목은
--   프로시저 실습을 위해 추가한 것일 뿐
--   실제 테이블 구조에 적합하지도, 바람직하지도 않은 내용이다.


--○ 변경된 테이블 구조 확인
DESC TBL_SUNGJUK;
--==>>
/*
이름     널?       유형           
------ -------- ------------ 
HAKBUN NOT NULL NUMBER       
NAME            VARCHAR2(40) 
KOR             NUMBER(3)    
ENG             NUMBER(3)    
MAT             NUMBER(3)    
TOT             NUMBER(3)    
AVG             NUMBER(4,1)  
GRADE           CHAR(1)      
*/



-- 프로시저 확인

EXEC PRC_SUNGJUK_INSERT(1,'박종호',90,80,70);


-- 테이블 확인

SELECT *
FROM TBL_SUNGJUK;



-- 프로시저 확인

EXEC PRC_SUNGJUK_UPDATE(1,50,50,50);

-- 테이블 확인

SELECT *
FROM TBL_SUNGJUK;
--==>> 1	박종호	50	50	50	150	50	F


-- 프로시저 확인
EXEC PRC_STUDENTS_UPDATE('superman', 'java006$' ,'010-9999-9999','대전');

-- 테이블 확인
SELECT *
FROM TBL_STUDENTS;

--==>>
/*
superman	김현우	010-9999-9999	대전
batman	    김종범	010-2222-2222	서울 마포구
*/

DESC TBL_INSA;


-- 프로시저 확인
EXEC PRC_INSA_INSERT('오지은', '901212-2234567', SYSDATE, '서울', '010-3213-6546', '영업부', '대리', 1000000, 200000);

-- 테이블 확인

SELECT *
FROM TBL_INSA;
--==>> 1061	오지은	901212-2234567	19/09/26	서울	010-3213-6546	영업부	대리	1000000	200000

-------------------------------------------------------------------------------------------------------

--○ 실습 테이블 생성 (TBL_상품)
CREATE TABLE TBL_상품
( 상품코드      VARCHAR2(20)
, 상품명        VARCHAR2(100)
, 소비자가격    NUMBER
, 재고수량      NUMBER  DEFAULT 0
, CONSTRAINT 상품_상품코드_PK PRIMARY KEY(상품코드)
);
--==>> Table TBL_상품이(가) 생성되었습니다.
-- TBL_상품 테이블의 상품코드를 기본키(PK) 제약조건 설정


--○ 실습 테이블 생성(TBL_입고)
CREATE TABLE TBL_입고
( 입고번호  NUMBER
, 상품코드  VARCHAR2(20)
, 입고일자  DATE DEFAULT SYSDATE
, 입고수량  NUMBER
, 입고단가  NUMBER
, CONSTRAINT 입고_입고번호_PK PRIMARY KEY(입고번호)
, CONSTRAINT 입고_상품코드_FK FOREIGN KEY(상품코드)
                                REFERENCES TBL_상품(상품코드)
);
--==>> Table TBL_입고이(가) 생성되었습니다.
-- TBL_입고 테이블의 입고번호를 기본키(PK) 제약조건 설정
-- TBL_입고 테이블의 상품코드는 TBL_상품 테이블의 상품코드를
-- 참조할 수 있도록 외래키(FK) 제약조건 설정


--○ TBL_상품 테이블에 상품정보 입력
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
VALUES('H001','스크류바',500);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
VALUES('H002','아맛나',300);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
VALUES('H003','돼지바',700);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
VALUES('H004','쿠앤크',300);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
VALUES('H005','보석바',800);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
VALUES('H006','죠스바',600);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
VALUES('H007','메가톤바',700);
--==>> 1 행 이(가) 삽입되었습니다. *7

INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
VALUES('C001','구구콘',1000);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
VALUES('C002','월드콘',1500);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
VALUES('C003','브라보콘',1500);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
VALUES('C004','슈퍼콘',1300);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
VALUES('C005','돼지바콘',1200);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
VALUES('C006','크런치콘',1700);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
VALUES('C007','요맘때콘',1600);
--==>> 1 행 이(가) 삽입되었습니다. * 7

INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
VALUES('E001','붕어싸만코',2000);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
VALUES('E002','더위사냥',1500);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
VALUES('E003','거북알',1900);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
VALUES('E004','설레임',2100);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
VALUES('E005','하겐다즈딸기맛',4700);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
VALUES('E006','엑설런트',3500);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
VALUES('E007','투게더',4000);
--==>> 1 행 이(가) 삽입되었습니다. * 7

-- 확인
SELECT *
FROM TBL_상품;
--==>>
/*
H001	스크류바        	500	    0
H002	아맛나	        300	    0
H003	돼지바	        700 	0
H004	쿠앤크	        300 	0
H005	보석바	        800 	0
H006	죠스바	        600 	0
H007	메가톤바	        700 	0
COO1	구구콘	        1000	0
COO2	월드콘	        1500	0
COO3	브라보콘	        1500	0
COO4	슈퍼콘	        1300	0
COO5	돼지바콘	        1200	0
COO6	크런치콘	        1700	0
COO7	요맘때콘	        1600	0
EOO1	붕어싸만코	    2000	0
EOO2	더위사냥	        1500	0
EOO3	거북알	        1900	0
EOO4	설레임	        2100	0
EOO5	하겐다즈딸기맛	4700	0
EOO6	엑설런트	        3500	0
EOO7	투게더	        4000	0
*/


--○ 커밋
COMMIT;
--==>> 커밋 완료.

--○ 날짜 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.


--○ TBL_입고 테이블에 『입고』이벤트 발생 시...
--  관련 테이블에서 수행되어야 하는 내용
--  ① INSERT -> TBL_입고
--     INSERT INTO TBL_입고(입고번호, 상품코드, 입고일자, 입고수량, 입고단가)
--     VALUES(1,'H001', SYSDATE, 20, 400);

--  ② UPDATE -> TBL_상품
--     UPDATE TBL_상품
--     SET 재고수량 = 기존재고수량 + 20(입고수량)
--     WHERE 상품코드 = 'H001';


--○ 생성한 프로시저가 제대로 작동하는지의 여부 확인 -> 프로시저 호출
EXEC PRC_입고_INSERT('C001', 20, 800);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

EXEC PRC_입고_INSERT('C001', 30, 750);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.


SELECT *
FROM TBL_입고;
--==>>
/*
2   C001   2019-09-26   20   800
3   C001   2019-09-26   30   750
*/

SELECT *
FROM TBL_상품;
--==>> C001   구구콘   1000   50


EXEC PRC_입고_INSERT('H001', 50, 350);
EXEC PRC_입고_INSERT('H001', 10, 450);
EXEC PRC_입고_INSERT('H001', 20, 300);


SELECT *
FROM TBL_입고;
--==>>
/*
4   H001   2019-09-26   50   350
5   H001   2019-09-26   10   450
6   H001   2019-09-26   20   300
*/



SELECT *
FROM TBL_입고;

SELECT *
FROM TBL_상품;

COMMIT;

--■■■ 프로시저 내에서의 예외 처리 ■■■--

--○ 테이블 생성(TBL_MEMBER)
CREATE TABLE TBL_MEMBER
( NUM   NUMBER
, NAME  VARCHAR2(30)
, TEL   VARCHAR2(60)
, CITY  VARCHAR2(60)
);
--==>> Table TBL_MEMBER이(가) 생성되었습니다.













