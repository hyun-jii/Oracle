SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT *
FROM TBL_TEST1;


INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(4, '이원정', '010-4444-4444');
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(5, '김소원', '010-5555-5555');
--==>> 1 행 이(가) 삽입되었습니다.

UPDATE TBL_TEST1
SET NAME ='정광현'
WHERE ID=4;
--==>> 1 행 이(가) 업데이트되었습니다.

DELETE
FROM TBL_TEST1
WHERE ID=5;
--==>> 1 행 이(가) 삭제되었습니다.

INSERT INTO TBL_TEST1(ID,NAME,TEL)
VALUES(6,'백호진','010-6666-6666');
--==>> 에러 발생
-- ORA-20003: 작업은 08:00 ~ 18:00 까지만 가능합니다.


UPDATE TBL_TEST1
SET NAME='박지혜'
WHERE ID='박지혜';
--==>> ORA-20003: 작업은 08:00 ~ 18:00 까지만 가능합니다.

DELETE
FROM TBL_TEST1
WHERE ID=4;
--==>> ORA-20003: 작업은 08:00 ~ 18:00 까지만 가능합니다.

SELECT *
FROM TBL_TEST1;
--==>> 4	정광현	010-4444-4444


--■■■ BEFORE ROW TRIGGER 상황 실습 ■■■--
--※ 참조 관계가 설정된 데이터(자식) 삭제를 먼저 제거하는 모델

--○ 실습을 위한 테이블 생성(TBL_TEST2)
CREATE TABLE TBL_TEST2
( CODE  NUMBER
, NAME  VARCHAR2(40)
, CONSTRAINT TEST2_CODE_PK PRIMARY KEY(CODE)
);
--==>> Table TBL_TEST2이(가) 생성되었습니다.

--○ 실습을 위한 테이블 생성(TBL_TEST3)
CREATE TABLE TBL_TEST3
( SID   NUMBER
, CODE  NUMBER
, SU    NUMBER
, CONSTRAINT TEST3_SID_PK PRIMARY KEY(SID)
, CONSTRAINT TEST3_CODE_FK FOREIGN KEY(CODE)
             REFERENCES TBL_TEST2(CODE)
);
--==>> Table TBL_TEST3이(가) 생성되었습니다.

--○ 실습 관련 데이터 입력
INSERT INTO TBL_TEST2(CODE, NAME) VALUES(1,'텔레비전');
INSERT INTO TBL_TEST2(CODE, NAME) VALUES(2,'냉장고');
INSERT INTO TBL_TEST2(CODE, NAME) VALUES(3,'세탁기');
INSERT INTO TBL_TEST2(CODE, NAME) VALUES(4,'전자레인지');
--==>> 1 행 이(가) 삽입되었습니다. *4

SELECT *
FROM TBL_TEST2;
--==>>
/*
1	텔레비전
2	냉장고
3	세탁기
4	전자레인지
*/

COMMIT;
--==>> 커밋 완료.

--○ 실습 관련 데이터 입력
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(1,1,20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(2,2,30);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(3,3,40);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(4,1,50);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(5,2,60);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(6,3,70);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(7,1,80);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(8,2,90);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(9,3,100);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(10,1,110);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(11,2,120);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(12,3,130);
--==>> 1 행 이(가) 삽입되었습니다. * 12


SELECT *
FROM TBL_TEST3;
--==>>
/*
1	1	20
2	2	30
3	3	40
4	1	50
5	2	60
6	3	70
7	1	80
8	2	90
9	3	100
10	1	110
11	2	120
12	3	130
*/

COMMIT;
-- 커밋 완료.

--○ TBL_TEST2(부모) 테이블의 데이터 삭제 시도

DELETE
FROM TBL_TEST2
WHERE CODE=4;
--==>> 1 행 이(가) 삭제되었습니다.

DELETE
FROM TBL_TEST2
WHERE CODE=3;
--==>> 에러발생
-- ORA-02292: integrity constraint (SCOTT.TEST3_CODE_FK) violated - child record found

DELETE
FROM TBL_TEST2
WHERE CODE=2;
--==>> 에러발생
-- ORA-02292: integrity constraint (SCOTT.TEST3_CODE_FK) violated - child record found



--※ 트리거 작성 이후 다시 실행

DELETE
FROM TBL_TEST2
WHERE CODE=1;
--==>> 1 행 이(가) 삭제되었습니다.

SELECT *
FROM TBL_TEST2;
--==>>
/*
2	냉장고
3	세탁기
*/

SELECT *
FROM TBL_TEST3;
--==>>
/*
2	2	30
3	3	40
5	2	60
6	3	70
8	2	90
9	3	100
11	2	120
12	3	130
*/

DELETE
FROM TBL_TEST2
WHERE CODE=2;
--==>> 1 행 이(가) 삭제되었습니다.

SELECT *
FROM TBL_TEST2;
--==>> 3	세탁기

SELECT *
FROM TBL_TEST3;
--==>>
/*
3	3	40
6	3	70
9	3	100
12	3	130
*/


COMMIT;
--==>> 커밋 완료.



--■■■ AFTER ROW TRIGGER 상황 실습 ■■■--
--※ 참조 테이블 관련 트랜잭션 처리


UPDATE TBL_상품
SET 재고수량 = 0;
--==>> 21개 행 이(가) 업데이트되었습니다.

SELECT *
FROM TBL_상품;


DELETE
FROM TBL_입고;
--==>> 23개 행 이(가) 삭제되었습니다.

DELETE
FROM TBL_출고;
--==>> 7개 행 이(가) 삭제되었습니다.

COMMIT;
--==>> 커밋 완료.

--○ 입고 이벤트 발생
INSERT INTO TBL_입고(입고번호, 상품코드, 입고일자, 입고수량, 입고단가)
VALUES(1,'H001', SYSDATE, 100, 350);
--==>> 1 행 이(가) 삽입되었습니다.

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session이(가) 변경되었습니다.

SELECT *
FROM TBL_입고;
--==>> 1	H001	2019-09-30 08:23:43	100	350

SELECT *
FROM TBL_상품
WHERE 상품코드 ='H001';
--==>> H001	스크류바	500	100

INSERT INTO TBL_입고(입고번호, 상품코드, 입고일자, 입고수량, 입고단가)
VALUES(2,'H001', SYSDATE, 100, 300);
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_입고;
--==>>
/*
1	H001	2019-09-30 08:23:43	100	350
2	H001	2019-09-30 10:28:44	100	300
*/

SELECT *
FROM TBL_상품
WHERE 상품코드 ='H001';
--==>> H001	스크류바	500	200


-- 테스트
SELECT *
FROM TBL_입고;

SELECT *
FROM TBL_상품;

SELECT *
FROM TBL_출고;



UPDATE TBL_입고
SET 입고수량 = 50
WHERE 입고번호 =1;

DELETE
FROM TBL_입고
WHERE 입고번호 =1;

INSERT INTO TBL_출고
VALUES(1,'H001',SYSDATE,50,500);

UPDATE TBL_출고
SET 출고수량 = 30
WHERE 출고번호=1;

DELETE
FROM TBL_출고
WHERE 출고번호=1;

--※ TRIGGER 의 정보 조회

SELECT *
FROM USER_TRIGGERS;
/*
"TRG_IBGO
          AFTER
          INSERT OR UPDATE OR DELETE ON TBL_입고
          FOR EACH ROW
"
"BEGIN

    IF (INSERTING)
        THEN UPDATE TBL_상품
             SET 재고수량 = 재고수량 + :NEW.입고수량
             WHERE 상품코드 = :NEW.상품코드;
    END IF;

    IF (UPDATING)
        THEN UPDATE TBL_상품
             SET 재고수량 = (재고수량 - :OLD.입고수량) + :NEW.입고수량
             WHERE 상품코드 = :OLD.상품코드;
    END IF;

    IF (DELETING)
        THEN UPDATE TBL_상품
             SET 재고수량 = 재고수량 - :OLD.입고수량
             WHERE 상품코드 = :OLD.상품코드;
    END IF;
END;"

*/

SELECT INSA_PACK.FN_GENDER('751212-1234567')"함수호출"
FROM DUAL;
--==>> 남자


SELECT NAME, SSN, INSA_PACK.FN_GENDER(SSN)"함수호출"
FROM TBL_INSA;
--==>>
/*
오지은	901212-2234567	여자
홍길동	771212-1022432	남자
이순신	801007-1544236	남자
이순애	770922-2312547	여자
김정훈	790304-1788896	남자
한석봉	811112-1566789	남자
이기자	780505-2978541	여자
장인철	780506-1625148	남자
김영년	821011-2362514	여자
나윤균	810810-1552147	남자
김종서	751010-1122233	남자
유관순	801010-2987897	여자
정한국	760909-1333333	남자
조미숙	790102-2777777	여자
황진이	810707-2574812	여자
이현숙	800606-2954687	여자
이상헌	781010-1666678	남자
엄용수	820507-1452365	남자
이성길	801028-1849534	남자
박문수	780710-1985632	남자
유영희	800304-2741258	여자
홍길남	801010-1111111	남자
이영숙	800501-2312456	여자
김인수	731211-1214576	남자
김말자	830225-2633334	여자
우재옥	801103-1654442	남자
김숙남	810907-2015457	여자
김영길	801216-1898752	남자
이남신	810101-1010101	남자
김말숙	800301-2020202	여자
정정해	790210-2101010	여자
지재환	771115-1687988	남자
심심해	810206-2222222	여자
김미나	780505-2999999	여자
이정석	820505-1325468	남자
정영희	831010-2153252	여자
이재영	701126-2852147	여자
최석규	770129-1456987	남자
손인수	791009-2321456	여자
고순정	800504-2000032	여자
박세열	790509-1635214	남자
문길수	721217-1951357	남자
채정희	810709-2000054	여자
양미옥	830504-2471523	여자
지수환	820305-1475286	남자
홍원신	690906-1985214	남자
허경운	760105-1458752	남자
산마루	780505-1234567	남자
이기상	790604-1415141	남자
이미성	830908-2456548	여자
이미인	810403-2828287	여자
권영미	790303-2155554	여자
권옥경	820406-2000456	여자
김싱식	800715-1313131	남자
정상호	810705-1212141	남자
정한나	820506-2425153	여자
전용재	800605-1456987	남자
이미경	780406-2003214	여자
김신제	800709-1321456	남자
임수봉	810809-2121244	여자
김신애	810809-2111111	여자
*/














