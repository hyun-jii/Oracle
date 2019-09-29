-------------------------------------------------------------------------------------------------------------------------
-- PRC_입고_DELETE(입고번호)


CREATE OR REPLACE PROCEDURE PRC_입고_DELETE
( V_입고번호    IN      TBL_입고.입고번호%TYPE
)
IS
    V_상품코드              TBL_상품.상품코드%TYPE;
    V_입고수량              TBL_입고.입고수량%TYPE;
    V_현재재고수량         TBL_상품.재고수량%TYPE; 
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN

    SELECT 상품코드, 입고수량     INTO V_상품코드, V_입고수량
    FROM TBL_입고
    WHERE 입고번호 = V_입고번호;
    
    SELECT 재고수량     INTO    V_현재재고수량
    FROM TBL_상품
    WHERE 상품코드 =  V_상품코드;
    
    -- TBL_입고 테이블에서 해당 입고번호 삭제
    DELETE
    FROM TBL_입고
    WHERE 입고번호 = V_입고번호;
    
    -- 현재재고수량이 V_입고수량보다 작으면 예욍 발생
    IF ( V_현재재고수량 < V_입고수량)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- TBL_상품 테이블의 재고수량 UPDATE
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 - V_입고수량
    WHERE 상품코드 = V_상품코드;
    
    
    -- 예외처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002,'재고부족');
            ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
            
    -- 커밋
    COMMIT;
    
    
END;
--==>> Procedure PRC_입고_DELETE이(가) 컴파일되었습니다.

-------------------------------------------------------------------------------------------------------------------------------
-- PRC_출고_DELETE(출고번호)

CREATE OR REPLACE PROCEDURE PRC_출고_DELETE
( V_출고번호    IN      TBL_출고.출고번호%TYPE
)
IS 
    V_상품코드  TBL_출고.상품코드%TYPE;
    V_출고수량  TBL_출고.출고수량%TYPE;
BEGIN
    
    -- TBL_출고의 상품코드와 출고수량을 V_상품코드, V_출고수량에 저장
    SELECT 상품코드, 출고수량     INTO    V_상품코드, V_출고수량
    FROM TBL_출고
    WHERE 출고번호 = V_출고번호;
    
    -- TBL_출고 테이블에서 해당 출고번호 삭제
    DELETE
    FROM TBL_출고
    WHERE 출고번호 = V_출고번호;
    
    -- TBL_상품 테이블의 재고수량 UPDATE
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 + V_출고수량
    WHERE 상품코드 = V_상품코드;
    
    -- 커밋
    COMMIT;
    
END;
--==>> Procedure PRC_출고_DELETE이(가) 컴파일되었습니다.