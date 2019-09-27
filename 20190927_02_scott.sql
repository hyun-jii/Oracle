SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT *
FROM TBL_MEMBER;

DESC TBL_MEMBER;


--○ 생성된 프로시저 호출을 통한 정상 작동여부 확인
EXEC PRC_MEMBER_INSERT('김동현', '010-1111-1111', '서울');
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.


SELECT *
FROM TBL_MEMBER;
--==>> 1	김동현	010-1111-1111	서울


--○ 생성된 프로시저 호출을 통한 정상 작동여부 확인
EXEC PRC_MEMBER_INSERT('김서현', '010-2222-2222', '경기');
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM TBL_MEMBER;
--==>>
/*
1	김동현	010-1111-1111	서울
2	김서현	010-2222-2222	경기
*/

--○ 생성된 프로시저 호출을 통한 정상 작동여부 확인
EXEC PRC_MEMBER_INSERT('김남현', '010-3333-3333', '대전');
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM TBL_MEMBER;
--==>>
/*
1	김동현	010-1111-1111	서울
2	김서현	010-2222-2222	경기
3	김남현	010-3333-3333	대전
*/

--○ 생성된 프로시저 호출을 통한 정상 작동여부 확인
EXEC PRC_MEMBER_INSERT('김북현', '010-3333-3333', '천안');
--==>> 에러 발생
-- ORA-20001: 서울,경기,대전만 입력이 가능합니다.

SELECT *
FROM TBL_MEMBER;
--==>>
/*
1	김동현	010-1111-1111	서울
2	김서현	010-2222-2222	경기
3	김남현	010-3333-3333	대전
*/

--○ 실습 테이블 생성(TBL_출고)
CREATE TABLE TBL_출고
( 출고번호  NUMBER
, 상품코드  VARCHAR2(20)
, 출고일자  DATE DEFAULT SYSDATE
, 출고수량  NUMBER
, 출고단가  NUMBER
);
--==>> Table TBL_출고이(가) 생성되었습니다.

--○ TBL_출고 테이블의 출고번호에 PK 제약조건 지정

ALTER TABLE TBL_출고
ADD CONSTRAINT 출고_출고번호_PK PRIMARY KEY(출고번호);
--==>> Table TBL_출고이(가) 변경되었습니다.

--○ TBL_출고 테이블의 상품코드는 TBL_상품 테이블의 상품코드를 참조할 수 있도록
-- 외래키(FK) 제약조건 지정

ALTER TABLE TBL_출고
ADD CONSTRAINT 출고_상품코드_FK FOREIGN KEY(상품코드)
                                REFERENCES TBL_상품(상품코드);
--==>> Table TBL_출고이(가) 변경되었습니다.

--○ 생성된 프로시저 호출을 통해 결과 확인
-- 프로시저명 : PRC_출고_INSERT(상품코드, 출고수량, 출고단가);

SELECT *
FROM TBL_상품;
SELECT *
FROM TBL_출고;

-- 재고수량 50개인 구구콘을 30개 출고
EXEC PRC_출고_INSERT('C001' ,30, 850);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.


SELECT *
FROM TBL_상품;
--==>> C001	구구콘	1000	20

SELECT *
FROM TBL_출고;
--==>> 1	C001	19/09/27	30	850

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.


-- 재고수량 20개인 구구콘을 30개 출고
EXEC PRC_출고_INSERT('C001' ,30, 850);
--==>> 에러 발생
-- ORA-20002: 재고부족~!!

SELECT *
FROM TBL_출고;
--==>> 1	C001	2019-09-27	30	850

-- 재고수량이 0개인 메가톤바를 1개 출고
EXEC PRC_출고_INSERT('H007' ,1, 580);
--==>> 에러 발생
-- ORA-20002: 재고부족~!!

-- 입고 테이블에 수량 증가
EXEC PRC_입고_INSERT('E007',50,2000);


SELECT *
FROM TBL_상품;
SELECT *
FROM TBL_출고;


EXEC PRC_출고_INSERT('H007',20,500);
EXEC PRC_출고_UPDATE(7, 25);


----------------------------------------------------------------------------------------------------

--■■■ AFTER STATEMENT TRIGGER 상황 실습 ■■■--
--※ DML 작업에 대한 이벤트 기록

--○ 실습 테이블 생성(TBL_TEST1)
CREATE TABLE TBL_TEST1
( ID    NUMBER
, NAME  VARCHAR2(30)
, TEL   VARCHAR2(60)
, CONSTRAINT TEST1_ID_PK PRIMARY KEY(ID)
);
--==>> Table TBL_TEST1이(가) 생성되었습니다.

--○ 실습 테이블 생성(TBL_EVENTLOG)
CREATE TABLE TBL_EVENTLOG
( MEMO  VARCHAR2(200)
, ILJA  DATE DEFAULT SYSDATE
);
--==>> Table TBL_EVENTLOG이(가) 생성되었습니다

--○ TBL_TEST1 테이블을 대상으로 INSERT, UPDATE, DELETE 수행
INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(1,'이성조','010-1111-1111');
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(2,'박종호','010-2222-2222');
--==>> 1 행 이(가) 삽입되었습니다.

UPDATE TBL_TEST1
SET TEL = '010-1212-3434'
WHERE ID =1;
--==>> 1 행 이(가) 업데이트되었습니다.

DELETE
FROM TBL_TEST1
WHERE ID = 2;
--==>> 1 행 이(가) 삭제되었습니다.

DELETE
FROM TBL_TEST1
WHERE ID =1;
--==>> 1 행 이(가) 삭제되었습니다.

SELECT *
FROM TBL_TEST1;
--==>> 조회 결과 없음

COMMIT;
--==>> 커밋 완료.

SELECT *
FROM TBL_EVENTLOG;
--==>>
/*
INSERT 쿼리가 실행되었습니다.	2019-09-27
INSERT 쿼리가 실행되었습니다.	2019-09-27
UPDATE 쿼리가 실행되었습니다.	2019-09-27
DELETE 쿼리가 실행되었습니다.	2019-09-27
DELETE 쿼리가 실행되었습니다.	2019-09-27
*/









