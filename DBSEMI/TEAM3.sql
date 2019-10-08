/*
------------------------------------------------<정책 정리>---------------------------------------------------------
1. 관리자
 - 로그인
   ① 관리자 는 로그인 화면에서 '관리자' 버튼을 클릭 후 로그인을 진행할 수 있다.
   ② 관리자 이름과 비밀번호는 관리자가 직접 관리할 수 있다.
   ③ 비밀번호는 하나 이상의 특수문자를 포함하여야 등록이 가능하다.

 - 관리자 테이블
   ① 관리자 정보(관리자 이름, 관리자 비밀번호)를 입력할 수 있다.
      (관리자번호는 'A'로 시작하며, 제일 마지막 번호에 따라 자동으로 생성된다.)
      
 - 교수 테이블 ☆ NULL
   ① 교수 정보(교수 이름, 교수 주민등록번호)를 입력할 수 있다.
      (교수번호는 'P'로 시작하며, 제일 마지막 번호에 따라 자동으로 생성된다.)
      (교수 비밀번호는 맨 처음 주민등록번호의 뒷번호로 자동 등록 된다.)
   ② 교수 정보(교수 이름, 교수 주민등록번호, 교수 비밀번호)를 수정할 수 있다.
   ③ 교수 정보를 삭제 할 수 있다.
      (단, 교수가 가르치고 있는 과목이 단 한개도 존재하지 않을 경우
           & 교수가 이전에도 과목을 가르친 이력이 존재하지 않는 경우에만 삭제할 수 있음을 전제로 한다.)
      ※ 이외의 경우에 삭제를 하게되면 교수가 이전에 가지고있었던 정보는 모두 『NULL』 로 처리된다.
      
 - 학생 테이블
   ① 학생 정보(학생 이름, 학생 주민등록번호)를 입력할 수 있다.
      (학생번호는 'ST'로 시작하며, 제일 마지막 번호에 따라 자동으로 생성된다.)
      (학생 비밀번호는 맨 처음 주민등록번호의 뒷번호로 자동 등록 된다.)
   ② 학생 정보(학생 이름, 학생 주민등록번호, 학생 비밀번호)를 수정할 수 있다.
   ③ 학생 정보를 삭제 할 수 있다.
      ※ 단, 삭제시 학생 정보와 연관된 '수강신청', '성적', '중도탈락' 정보가 모두 삭제된다.
      
 - 과목 테이블
   ① 과목 정보(과목명)을 입력할 수 있다.
      (과목번호는 'S'로 시작하며, 제일 마지막 번호에 따라 자동으로 생성된다.)
   ② 과목 정보(과목명)을 수정할 수 없다.
   ③ 과목 정보를 삭제할 수 있다.
      (단, 삭제하려는 과목이 개설과목에 사용된 전례가 없을 경우에만 삭제할 수 있음을 전제로 한다.)
      ※ 이외의 경우에 삭제를 하게되면 연관된 '개설과목', '성적' 에서 삭제정보와 일치하는 데이터가 함께 삭제된다. 
      
 - 과정 테이블
   ① 과정 정보(과정명)을 입력할 수 있다.
      (과정번호는 'C'로 시작하며, 제일 나중번호에 따라 자동으로 생성된다.)
   ② 과정 정보(과정명)을 수정할 수 없다.
   ③ 과정 정보를 삭제할 수 있다.
      (단, 삭제하려는 과정이 개설과정에 사용된 전례가 없을 경우에만 삭제할 수 있음을 전제로 한다.)
      ※ 이외의 경우에 삭제를 하게되면 연관된 '개설과정', '수강신청', '성적' 에서 삭제정보와 일치하는 데이터가 함께 삭제된다. 
      
 - 교재 테이블 ☆ NULL
   ① 교재 정보(교재명, 출판사)를 입력할 수 있다.
      (교재번호는 'B'로 시작하며, 제일 나중번호에 따라 자동으로 생성된다.)
   ② 교재 정보(교재명, 출판사)를
   ③ 교재 정보를 삭제할 수 있다.
      (단, 삭제하려는 교재가 개설과목에 사용된 전례가 없을 경우에만 삭제할 수 있음을 전제로 한다.)
      ※ 이외의 경우에 삭제를 하게되면 연관된 '개설과목' 에 있던 교재 정보는 모두 『NULL』로 처리된다.
      
 - 강의실 테이블 ☆ NULL
   ① 강의실 정보(강의실명)을 입력할 수 있다.
      (강의실번호는 'R'로 시작하며, 제일 나중번호에 따라 자동으로 생성된다.)
   ② 강의실 정보(강의실명)을
   ③ 강의실 정보를 삭제할 수 있다.
      (단, 삭제하려는 강의실이 개설과정에 사용된 전례가 없을 경우에만 삭제할 수 있음을 전제로 한다.)
      ※ 이외의 경우에 삭제를 하게되면 연관된 '개설과정' 에 있던 강의실 정보는 모두 『NULL』로 처리된다.
      
 - 중도탈락 테이블
   ① 중도탈락 정보(수강신청코드, 중도탈락일자, 중도탈락사유)를 입력할 수 있다.
   ② 중도탈락 정보(중도탈락일자, 중도탈락사유)를 수정할 수 있다.
   ③ 중도탈락 정보를 삭제할 수 있다.
   
 - 개설 과정 테이블
   ① 개설과정 정보(과정코드, 강의실번호, 개설일)을 입력할 수 있다.
      (개설과정코드는 'DC'로 시작하며, 마지막 코드에 따라 자동으로 생성된다.)
   ② 개설과정 정보(과정코드, 강의실번호, 개설일)을 변경할 수 있다.
      (단, 개설일은 반드시 과정시작일보다 전이어야 한다.)
   ③ 개설과정 정보를 삭제할 수 있다.
      (단, 현재 진행중인 과정은 삭제할 수 없으며, 아직 시작하지 않은 과정(과정개설일<SYSDATE>)에 한해 삭제할 수 있음을 전제로 한다.)
      ※ 이미 끝난 개설과정의 정보를 삭제하게되면 연관된 '개설과목', '성적', '수강신청' 에 대한 정보가 전부 삭제된다.
      
 - 수강신청 테이블
   ① 수강신청 정보(수강신청코드, 학생번호, 개설과정코드)를 입력할 수 있다.
      (수강신청코드는 'SU'로 시작하여, 자동으로 입력되고, 제일 나중번호에 따라 자동으로 생성된다.)
   ② 수강신청 정보(학생번호, 개설과정코드)를 수정할 수 있다.
      (단, 수강신청한 과정의 개설일이나 개설과목의 시작일보다 이전이어야 한다.)
   ③ 수강신청 정보를 삭제할 수 있다.
      (단, 수강철회기간(과정시작일부터 7일 내)에 가능하며, 아직 시작하지 않은 과정에 한해 삭제가능함을 전제로 한다.)
      ※ 이외의 경우에 삭제를 하게되면 연관된 '성적' 에 모든 수강신청정보가 삭제된다.
      
 - 개설 과목 테이블
   ① 개설과목 정보(개설과정코드, 과목코드, 과목시작, 과목끝, 출결, 필기, 실기, 교수번호, 교재번호)를 입력할 수 있다.
      (개설과목코드는 'DS'로 시작하며, 마지막 코드에 따라 자동으로 생성된다. 하나하나 입력된다는 가정 하에 이루어진다.)
      (출결, 필기, 실기 배점은 총합했을 때 100점이 되어야만 입력이 가능하다. )
   ② 개설과목 정보(과목시작, 과목끝)를 수정할 수 있다.
      (단, 과목시작일은 과정개설일 이후여야 하며 한 과정 안에 있는 여러 과목들은 서로의 날짜와 겹치지 않도록 한다.)
   ③ 개설 과목 정보를 삭제할 수 있다.
      (단, 중간에 있는 하나의 과목을 삭제하게되어도 마지막 번호에 따라 번호가 매겨지게 된다.)
      
  - 성적 테이블
   ① 관리자는 출결, 실기, 필기 총 배점 합이 100점이 넘지 않도록 입력할 수 있다.
   ② 출결, 실기, 필기 각각 배점은 교수자가 직접 입력할 수 있도록 한다.
   ③ 학생에게 수강신청코드를 부여할 때, 개설과정코드에 대한 개설과목들의 성적이 기본값인 NULL 로 입력된다.
   
2. 교수자
 - 로그인
   ① 교수 는 로그인 화면에서 '교수' 버튼을 클릭 후 로그인을 진행할 수 있다.
   ② 교수번호는 관리자에 의해 부여받으며, 비밀번호는 주민등록번호 뒷자리로 기본값을 부여받는다.
   ③ 비밀번호는 직접 변경이 가능하다.
   
 - 과목
   ① 로그인 후 교수는 현시각을 기준으로 강의한 모든 과목리스트를 확인할 수 있다.
   
 - 성적
   ① 과목을 클릭하면 해당 과목을 수강하는 학생리스트를 확인할 수 있다.
   ② 과목명, 교수번호, 학생번호, 학생명, 출결, 필기, 실기, 총점을 확인할 수 있다.
   ③ 성적을 입력하고자 하는 학생을 선택하게 되면 출결, 필기, 실기 점수를 입력할 수 있다.
      (과목시작일 전엔 성적입력이 불가능하며, 과목이 진행되고 있거나 과목이 끝난 날짜 이후라면 성적 입력이 가능하다.)
      (각 점수 입력시에 정해둔 각 배점을 넘는 점수는 입력할 수 없다.)
   ④ 저장되어 있는 점수에 대해 수정이 가능하다.
   ⑤ 입력 및 수정, 그리고 삭제가 다 끝난 이후 교수자가 『저장』버튼 을 누를 경우에만 성적에 대한 데이터가 저장(COMMIT)된다.
   
 - 중도탈락
   ① 과목을 클릭하여 확인되는 학생리스트에서 학생을 중도탈락 시킬 수 있다.
   ② 중도탈락일자는 필수입력 조건이며, 중도탈락사유는 선택으로 입력할 수 있다.
   ③ 중도탈락에 대한 정보(중도탈락일자, 중도탈락사유)는 수정이 가능하다.
 

3. 학생
 - 로그인
   ① 학생 은 로그인 화면에서 '학생' 버튼을 클릭 후 로그인을 진행할 수 있다.
   ② 학생번호는 관리자에 의해 부여받으며, 비밀번호는 주민등록번호 뒷자리로 기본값을 부여받는다.
   ③ 비밀번호는 직접 변경이 가능하다.
   
 - 과목
   ① 로그인 후 학생은 수강기간이 지난 과목에 한해 과목리스트를 확인할 수 있다.
   
 - 성적
   ① 과목을 클릭하면 해당 과목에 대해 출결, 필기, 실기, 총점, 등수 를 확인할 수 있다.
   ② 중도탈락 된 경우엔 중도탈락일자, 중도탈락사유를 추가로 확인할 수 있다.
-----------------------------------------------------------------------------------------------------------------------*/

SELECT USER
FROM DUAL;
--==>> TEAM3

-- 『과정』 테이블 생성
CREATE TABLE SCOR_TABLE
( SCOR_NO   VARCHAR2(10)                -- 과정번호
, COR_NAME  VARCHAR2(30)    NOT NULL    -- 과정명
, CONSTRAINT SCOR_NO_PK PRIMARY KEY(SCOR_NO)
);
--==>> Table SCOR_TABLE이(가) 생성되었습니다.

DESC SCOR_TABLE;
--==>>
/*
이름       널?       유형           
-------- -------- ------------ 
SCOR_NO  NOT NULL VARCHAR2(10) 
COR_NAME NOT NULL VARCHAR2(30) 
*/


--『강의실』 테이블 생성
CREATE TABLE ROOM_TABLE
( ROOM_NO   VARCHAR2(10)                    -- 강의실 번호
, ROOM_INFO VARCHAR2(30)    NOT NULL        -- 강의실 정보
, CONSTRAINT ROOM_NO_PK PRIMARY KEY(ROOM_NO)
);
--==>> Table ROOM_TABLE이(가) 생성되었습니다.

DESC ROOM_TABLE;
--==>>
/*
이름        널?       유형           
--------- -------- ------------ 
ROOM_NO   NOT NULL VARCHAR2(10) 
ROOM_INFO NOT NULL VARCHAR2(30)
*/


-- 『관리자』 테이블 생성
CREATE TABLE SYS_TABLE                      -- 관리자 테이블
(SYS_ID         VARCHAR2(5)                 -- 관리자 번호
,SYS_PW         VARCHAR2(20)   NOT NULL     -- 비밀번호
,SYS_NAME       VARCHAR2(20)   NOT NULL     -- 관리자 이름
,CONSTRAINT SYS_ID_PK PRIMARY KEY(SYS_ID)
);

DESC SYS_TABLE;
--==>>
/*
이름       널?       유형           
-------- -------- ------------ 
SYS_ID   NOT NULL VARCHAR2(5)  
SYS_PW   NOT NULL VARCHAR2(20) 
SYS_NAME NOT NULL VARCHAR2(20) 
*/


--『과목』 테이블 생성
CREATE TABLE SSUB_TABLE
( SSUB_NO   VARCHAR2(5)     NOT NULL    -- 과목번호
, SUB_NAME  VARCHAR2(30)    NOT NULL    -- 과목명
, CONSTRAINT SSUB_NO_PK PRIMARY KEY(SSUB_NO)
);
--==>> Table SSUB_TABLE이(가) 생성되었습니다.

DESC SSUB_TABLE;
--==>>
/*
이름       널?       유형           
-------- -------- ------------ 
SSUB_NO  NOT NULL VARCHAR2(5)  
SUB_NAME NOT NULL VARCHAR2(30) 
*/


-- 『교수』 테이블 생성
CREATE TABLE PROF_TABLE 
( PROF_ID VARCHAR2(10)              /* 교수자번호 */
, PROF_NAME VARCHAR2(20) NOT NULL   /* 교수자명 */
, PROF_SSN VARCHAR2(14) NOT NULL    /* 주민등록번호 */
, PROF_PW VARCHAR2(20)              /* 교수자비밀번호 */
, CONSTRAINT PROF_ID_PK PRIMARY KEY(PROF_ID)
);
--==>> Table PROF_TABLE이(가) 생성되었습니다.

DESC PROF_TABLE;
--==>>
/*
이름        널?       유형           
--------- -------- ------------ 
PROF_ID   NOT NULL VARCHAR2(10) 
PROF_NAME NOT NULL VARCHAR2(20) 
PROF_SSN  NOT NULL VARCHAR2(14) 
PROF_PW            VARCHAR2(20) 
*/


--『학생』 테이블 생성
CREATE TABLE STU_TABLE
(
 STU_ID       VARCHAR2(5) NOT NULL          -- 학생번호
,STU_NAME     VARCHAR2(20) NOT NULL         -- 학생이름
,STU_SSN      VARCHAR2(14) NOT NULL         -- 주민번호
,STU_PW       VARCHAR2(20)                  -- 학생비밀번호

,CONSTRAINT  STU_ID_PK PRIMARY KEY (STU_ID)
);
--==>>Table STU_TABLE이(가) 생성되었습니다.

DESC STU_TABLE;
--==>>
/*
이름       널?       유형           
-------- -------- ------------ 
STU_ID   NOT NULL VARCHAR2(5)  
STU_NAME NOT NULL VARCHAR2(20) 
STU_SSN  NOT NULL VARCHAR2(14) 
STU_PW            VARCHAR2(20) 
*/


--『교재』 테이블 생성
CREATE TABLE BOOK_TABLE                         -- 교재 테이블
( BOOK_NO   VARCHAR2(5)                         -- 교재번호
, BOOK_NAME VARCHAR2(30)  NOT NULL              -- 교재명
, BOOK_PUB  VARCHAR2(20)  NOT NULL              -- 출판사
, CONSTRAINT BOOK_NO_PK PRIMARY KEY(BOOK_NO)    -- 
);
--==>> Table BOOK_TABLE이(가) 생성되었습니다.

DESC BOOK_TABLE;
--==>> 
/*
이름        널?       유형           
--------- -------- ------------ 
BOOK_NO   NOT NULL VARCHAR2(5)  
BOOK_NAME NOT NULL VARCHAR2(30) 
BOOK_PUB  NOT NULL VARCHAR2(20) 
*/


--『개설과정』 테이블 생성
CREATE TABLE DCOR_TABLE 
( DCOR_NO VARCHAR2(10)  -- 개설과정코드
, SCOR_NO VARCHAR2(5)   -- 과정번호
, ROOM_NO VARCHAR2(5)   -- 강의실번호
, COR_DATE DATE         -- 과정개설일
, CONSTRAINT DCOR_NO_PK PRIMARY KEY(DCOR_NO)
, CONSTRAINT SCOR_NO_FK FOREIGN KEY(SCOR_NO)
                        REFERENCES SCOR_TABLE(SCOR_NO)
, CONSTRAINT ROOM_NO_FK FOREIGN KEY(ROOM_NO)
                        REFERENCES ROOM_TABLE(ROOM_NO)
);
--==>> Table DCOR_TABLE이(가) 생성되었습니다.

DESC DCOR_TABLE;
--==>>
/*
이름       널?       유형           
-------- -------- ------------ 
DCOR_NO  NOT NULL VARCHAR2(10) 
SCOR_NO           VARCHAR2(5)  
ROOM_NO           VARCHAR2(5)  
COR_DATE          DATE 
*/


--『개설과목』 테이블 생성
CREATE TABLE DSUB_TABLE 
( DSUB_NO VARCHAR2(10)  -- 개설과목코드
, DCOR_NO VARCHAR2(10)  -- 개설과정코드
, SSUB_NO VARCHAR2(5)   -- 과목번호
, SUB_START DATE        -- 과목시작일
, SUB_END DATE          -- 과목종료일
, ATT_SCORE NUMBER      -- 출결배점
, W_SCORE NUMBER        -- 필기배점
, P_SCORE NUMBER        -- 실기배점
, PROF_ID VARCHAR2(5)   -- 교수자번호
, BOOK_NO VARCHAR2(5)   -- 교재번호
, CONSTRAINT DSUB_NO_PK PRIMARY KEY(DSUB_NO)
, CONSTRAINT PROF_ID_FK FOREIGN KEY(PROF_ID)
                     REFERENCES PROF_TABLE(PROF_ID)
, CONSTRAINT BOOK_NO_FK FOREIGN KEY(BOOK_NO)
                        REFERENCES BOOK_TABLE(BOOK_NO)
, CONSTRAINT DCOR_NO_FK FOREIGN KEY(DCOR_NO)
                        REFERENCES DCOR_TABLE(DCOR_NO)
, CONSTRAINT SSUB_NO_FK FOREIGN KEY(SSUB_NO)
                        REFERENCES SSUB_TABLE(SSUB_NO)
);
-- Table DSUB_TABLE이(가) 생성되었습니다.

DESC DSUB_TABLE;
--==>>
/*
이름        널?       유형           
--------- -------- ------------ 
DSUB_NO   NOT NULL VARCHAR2(10) 
DCOR_NO            VARCHAR2(10) 
SSUB_NO            VARCHAR2(5)  
SUB_START          DATE         
SUB_END            DATE         
ATT_SCORE          NUMBER       
W_SCORE            NUMBER       
P_SCORE            NUMBER       
PROF_ID            VARCHAR2(5)  
BOOK_NO            VARCHAR2(5)  
*/


--『수강신청』 테이블
CREATE TABLE SUG_TABLE 
( SUG_NO VARCHAR2(10)             -- 수강신청코드
, STU_ID VARCHAR2(5)   NOT NULL   -- 학생번호
, DCOR_NO VARCHAR2(10) NOT NULL   -- 개설과정코드
, CONSTRAINT SUG_NO_PK PRIMARY KEY(SUG_NO)
, CONSTRAINT STU_ID_FK FOREIGN KEY(STU_ID)
                       REFERENCES STU_TABLE(STU_ID)
, CONSTRAINT DCOR_NO_FK2 FOREIGN KEY(DCOR_NO)
                        REFERENCES DCOR_TABLE(DCOR_NO)
);
-- Table SUG_TABLE이(가) 생성되었습니다.

DESC SUG_TABLE;
--==>>
/*
이름      널?       유형           
------- -------- ------------ 
SUG_NO  NOT NULL VARCHAR2(10) 
STU_ID  NOT NULL VARCHAR2(5)  
DCOR_NO NOT NULL VARCHAR2(10) 

*/


--『중도탈락』 테이블 생성
CREATE TABLE FAIL_TABLE             -- 중도탈락
(
 SUG_NO     VARCHAR2(10) NOT NULL   -- 수강신청코드 
,FAIL_DATE  DATE         NOT NULL   -- 탈락일자
,FAIL_REA   VARCHAR2(100)           -- 탈락사유

,CONSTRAINT SUG_NO_PK2 PRIMARY KEY(SUG_NO)
,CONSTRAINT SUG_NO_FK  FOREIGN KEY(SUG_NO)
                       REFERENCES SUG_TABLE(SUG_NO)
);
--Table FAIL_TABLE이(가) 생성되었습니다.

DESC FAIL_TABLE;
--==>>
/*
이름        널?       유형            
--------- -------- ------------- 
SUG_NO    NOT NULL VARCHAR2(10)  
FAIL_DATE NOT NULL DATE          
FAIL_REA           VARCHAR2(100) 
*/

--『성적』 테이블 생성
CREATE TABLE SUNG_TABLE             -- 성적
(
 SUG_NO     VARCHAR2(10) NOT NULL   -- 수강신청코드    
,DSUB_NO    VARCHAR2(10) NOT NULL   -- 개설과목코드
,SUNG_ATT   NUMBER                  -- 출결
,SUNG_W     NUMBER                  -- 필기
,SUNG_P     NUMBER                  -- 실기

,CONSTRAINT SUGDSUB_NO_PK3  PRIMARY KEY(SUG_NO, DSUB_NO)
,CONSTRAINT SUG_NO_FK2 FOREIGN KEY(SUG_NO)
                      REFERENCES SUG_TABLE(SUG_NO)
,CONSTRAINT DSUB_NO_FK FOREIGN KEY(DSUB_NO)
                       REFERENCES DSUB_TABLE(DSUB_NO)
);
--Table SUNG_TABLE이(가) 생성되었습니다.

--○제약조건 변경
ALTER TABLE DSUB_TABLE
DROP CONSTRAINT SYS_C007310;
ALTER TABLE FAIL_TABLE
DROP CONSTRAINT SYS_C007330;
ALTER TABLE SSUB_TABLE
DROP CONSTRAINT SYS_C007300;
ALTER TABLE STU_TABLE
DROP CONSTRAINT SYS_C007303;
ALTER TABLE SUNG_TABLE
DROP CONSTRAINT SYS_C007337;
ALTER TABLE SUNG_TABLE
DROP CONSTRAINT SYS_C007338;

-- 관리자 테이블 데이터 입력
INSERT INTO SYS_TABLE
VALUES('A001','JAVA006$','이현지');
--==>> 1 행 이(가) 삽입되었습니다.

--교수 테이블 데이터 입력
INSERT INTO PROF_TABLE
VALUES('P001','이모새','670912-1234567','1234567');
INSERT INTO PROF_TABLE
VALUES('P002','김호진','751021-1526784','1526784');
INSERT INTO PROF_TABLE
VALUES('P003','고경희','770630-2134567','2134567');
--==>> 1 행 이(가) 삽입되었습니다. *3

--학생 테이블 데이터 입력
INSERT INTO STU_TABLE
VALUES('ST001','이예림','960523-2658789','2658789');
INSERT INTO STU_TABLE
VALUES('ST002','정광현','900423-1152369','1152369');
INSERT INTO STU_TABLE
VALUES('ST003','김소원','900213-2236985','2236985');
INSERT INTO STU_TABLE
VALUES('ST004','박종호','950630-1584795','1584795');
INSERT INTO STU_TABLE
VALUES('ST005','성열원','970801-1478523','1478523');
--==>> 1 행 이(가) 삽입되었습니다. * 5

-- 데이터 확인
SELECT *
FROM SYS_TABLE;
SELECT *
FROM PROF_TABLE;
SELECT *
FROM STU_TABLE;

--커밋
COMMIT;
--==>> 커밋 완료.

--강의실(ROOM_TABLE) 테이블 데이터 입력
INSERT INTO ROOM_TABLE
VALUES('R204','공학관 204호');
INSERT INTO ROOM_TABLE
VALUES('R306','자연관 306호');
INSERT INTO ROOM_TABLE
VALUES('R102','예술관 102호');
INSERT INTO ROOM_TABLE
VALUES('R505','멀티미디어 505호');
--==>> 1 행 이(가) 삽입되었습니다. *4

--과정(SCOR_TABLE) 테이블 데이터 입력
INSERT INTO SCOR_TABLE
VALUES('S001','자바응용SW개발');
INSERT INTO SCOR_TABLE
VALUES('S002','피카소역사');
INSERT INTO SCOR_TABLE
VALUES('S003','네트워크구축');
--==>> 1 행 이(가) 삽입되었습니다. *3

--과정 테이블 데이터 업데이트('S'->'C')
UPDATE SCOR_TABLE
SET SCOR_NO = 'C001'
WHERE SCOR_NO = 'S001';

UPDATE SCOR_TABLE
SET SCOR_NO = 'C002'
WHERE SCOR_NO = 'S003';

UPDATE SCOR_TABLE
SET SCOR_NO = 'C003'
WHERE SCOR_NO = 'S003';
--==>> 1 행 이(가) 업데이트되었습니다. * 3

--과목(SSUB_TABLE) 테이블 데이터 입력
INSERT INTO SSUB_TABLE
VALUES('S001','JAVA');
INSERT INTO SSUB_TABLE
VALUES('S002','DATABASE');
INSERT INTO SSUB_TABLE
VALUES('S003','JSP');
INSERT INTO SSUB_TABLE
VALUES('S004','HTML');
INSERT INTO SSUB_TABLE
VALUES('S005','APACHE');
INSERT INTO SSUB_TABLE
VALUES('S006','SERVELET');
INSERT INTO SSUB_TABLE
VALUES('S007','JAVASCRIPT');
INSERT INTO SSUB_TABLE
VALUES('S008','미술학개론');
INSERT INTO SSUB_TABLE
VALUES('S009','추상화');
INSERT INTO SSUB_TABLE
VALUES('S010','스케치');
--==>> 1 행 이(가) 삽입되었습니다. * 10

--교재(BOOK_TABLE) 테이블 데이터 입력
INSERT INTO BOOK_TABLE
VALUES('B001','자바의정석','생능출판');
INSERT INTO BOOK_TABLE
VALUES('B002','오라클SQL과 PL/SQL','생능출판');
INSERT INTO BOOK_TABLE
VALUES('B003','JSP란 무엇인가','교보출판');
INSERT INTO BOOK_TABLE
VALUES('B004','HTML웹 표준의 정석','이지퍼블리싱');
INSERT INTO BOOK_TABLE
VALUES('B005','아파치톰캣','스타출판');
INSERT INTO BOOK_TABLE
VALUES('B006','서버 이거하나면 끝난다','파라다이스');
INSERT INTO BOOK_TABLE
VALUES('B007','웹프론트엔드','이지퍼블리싱');
INSERT INTO BOOK_TABLE
VALUES('B008','미술학이란','피카소출판');
INSERT INTO BOOK_TABLE
VALUES('B009','추상화 기초','네모출판');
INSERT INTO BOOK_TABLE
VALUES('B010','스케치 스타트','컬러그램');
--==>> 1 행 이(가) 삽입되었습니다. * 10


-- 테이블 확인
SELECT *
FROM SYS_TABLE;
SELECT *
FROM PROF_TABLE;
SELECT *
FROM STU_TABLE;
SELECT *
FROM SSUB_TABLE;
SELECT *
FROM SCOR_TABLE;
SELECT *
FROM ROOM_TABLE;
SELECT *
FROM BOOK_TABLE;

-- 커밋
COMMIT;
--==>> 커밋 완료.


-- 개설과정 테이블 데이터 입력
INSERT INTO DCOR_TABLE 
VALUES('DC001', 'C001', 'R204', SYSDATE); -- DC001, 자바응용SW개발, 공학관 204호, SYSDATE
INSERT INTO DCOR_TABLE 
VALUES('DC002', 'C002', 'R505', SYSDATE); -- DC002, 네트워크구축, 멀티미디어 505허, SYSDATE
INSERT INTO DCOR_TABLE 
VALUES('DC003', 'C002', 'R505', SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다. *3


--확인
SELECT *
FROM DCOR_TABLE;

-- 커밋
COMMIT;
--==>> 커밋 완료.


-- 개설과목 테이블 데이터 입력
INSERT INTO DSUB_TABLE
VALUES('DS001','DC001','S001',TO_DATE('2019-08-30','YYYY-MM-DD'), TO_DATE('2019-12-30','YYYY-MM-DD'), 20,40,40,'P001','B001');
INSERT INTO DSUB_TABLE
VALUES('DS002','DC001','S002',TO_DATE('2019-12-31','YYYY-MM-DD'), TO_DATE('2020-01-30','YYYY-MM-DD'), 30,35,35,'P002','B002');
--==>> 1 행 이(가) 삽입되었습니다. *2

INSERT INTO DSUB_TABLE
VALUES('DS003','DC002','S003',TO_DATE('2019-10-10','YYYY-MM-DD'), TO_DATE('2019-11-10','YYYY-MM-DD'), 20,40,40,'P001','B003');
INSERT INTO DSUB_TABLE
VALUES('DS004','DC002','S004',TO_DATE('2019-11-11','YYYY-MM-DD'), TO_DATE('2019-12-11','YYYY-MM-DD'), 20,40,40,'P003','B004');
--==>> 1 행 이(가) 삽입되었습니다. *2


-- 확인
SELECT *
FROM DSUB_TABLE;

--커밋
COMMIT;
--==>> 커밋 완료.

-- 수강신청 테이블 데이터 입력
INSERT INTO SUG_TABLE
VALUES('SU102','ST001','DC001');
INSERT INTO SUG_TABLE
VALUES('SU111','ST002','DC001');
INSERT INTO SUG_TABLE
VALUES('SU256','ST003','DC002');
INSERT INTO SUG_TABLE
VALUES('SU001','ST004','DC002');
INSERT INTO SUG_TABLE
VALUES('SU165','ST005','DC001');
INSERT INTO SUG_TABLE
VALUES('SU110','ST005','DC002');
--==>> 1 행 이(가) 삽입되었습니다. * 6

--확인
SELECT *
FROM SUG_TABLE;

--커밋
COMMIT;
--커밋 완료

-- 중도탈락 테이블 데이터 입력
INSERT INTO FAIL_TABLE
VALUES('SU165',TO_DATE('2019-09-30','YYYY-MM-DD'), '조기취업');
--==>> 1 행 이(가) 삽입되었습니다.

--확인
SELECT *
FROM FAIL_TABLE;

--커밋
COMMIT;
--==>> 커밋 완료.

-- SSUB_TABLE 데이터 업데이트
UPDATE SSUB_TABLE
SET SUB_NAME = 'SERVER'
WHERE SSUB_NO = 'S006';
--==>>1 행 이(가) 업데이트되었습니다.

-- 개설과목 테이블 데이터 업데이트
UPDATE DSUB_TABLE
SET SSUB_NO = 'S005'
WHERE DSUB_NO = 'DS003';
--==>> 1 행 이(가) 업데이트되었습니다.

UPDATE DSUB_TABLE
SET SSUB_NO = 'S006'
WHERE DSUB_NO = 'DS004';
--==>> 1 행 이(가) 업데이트되었습니다.

-- 커밋
COMMIT;
--==>> 커밋 완료.

-- ○ 데이터 추가 입력
INSERT INTO SCOR_TABLE
VALUES('C004', '보안양성자개발');
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO SCOR_TABLE
VALUES('C005','프레임워크활용');
--==>>1 행 이(가) 삽입되었습니다.
INSERT INTO SCOR_TABLE
VALUES('C006', '직업과 창업');
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO DCOR_TABLE
VALUES('DC003', 'C005', 'R505', TO_DATE('2019-10-04', 'YYYY-MM-DD'));
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO DSUB_TABLE
VALUES('DS005', 'DC003', 'S003', TO_DATE('2019-07-28', 'YYYY-MM-DD'), TO_DATE('2019-09-01'), 10,60,30, 'P002', 'B003');
--==>> 1 행 이(가) 삽입되었습니다.
INSERT INTO DSUB_TABLE
VALUES('DS006', 'DC003', 'S006', TO_DATE('2019-09-02', 'YYYY-MM-DD'), TO_DATE('2019-10-01'), 10,50,40, 'P003', 'B006');
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO PROF_TABLE
VALUES('P004', '강미나', '801226-2345678', '2345678');
--==>> 1 행 이(가) 삽입되었습니다.

UPDATE FAIL_TABLE
SET FAIL_REA = '단순변심'
WHERE SUG_NO = 'SU165';
--==>> 1 행 이(가) 업데이트되었습니다.

UPDATE DSUB_TABLE
SET PROF_ID = 'P004'
WHERE DSUB_NO = 'DS003';
--==>> 1 행 이(가) 업데이트되었습니다.

INSERT INTO STU_TABLE
VALUES('ST006', '오지은', '961111-2147852', '2147852');
INSERT INTO STU_TABLE
VALUES('ST007', '이성조', '950528-1369852', '1369852');
INSERT INTO STU_TABLE
VALUES('ST008', '최창훈', '950101-1654789', '1654789');
INSERT INTO STU_TABLE
VALUES('ST009', '박혜민', '950823-1123456', '1123456');
--==>> 1 행 이(가) 삽입되었습니다. * 4

INSERT INTO SUG_TABLE
VALUES('SU002' , 'ST009', 'DC003');
INSERT INTO SUG_TABLE
VALUES('SU112' , 'ST007', 'DC003');
INSERT INTO SUG_TABLE
VALUES('SU211' , 'ST003', 'DC003');
--==>> 1 행 이(가) 삽입되었습니다. *3

INSERT INTO SUNG_TABLE
VALUES('SU002','DS005', 10,50,25);
INSERT INTO SUNG_TABLE
VALUES('SU112','DS005', 8,55,20);
INSERT INTO SUNG_TABLE
VALUES('SU211','DS005', 10,40,25);
--==>> 1 행 이(가) 삽입되었습니다. *3
INSERT INTO SUNG_TABLE
VALUES('SU002','DS006', 10,40,40);
INSERT INTO SUNG_TABLE
VALUES('SU112','DS006', 7,50,30);
INSERT INTO SUNG_TABLE
VALUES('SU211','DS006', 10,45,25);
--==>> 1 행 이(가) 삽입되었습니다. *3

-- ○ 커밋
COMMIT;
--==>> 커밋 완료.


-- 교수 로그인 프로시저 PRC_LOGIN_PROF
CREATE OR REPLACE PROCEDURE PRC_LOGIN_PROF
(  V_ID       IN  PROF_TABLE.PROF_ID%TYPE
,  V_PW       IN  PROF_TABLE.PROF_PW%TYPE
)
IS
    V_NAME                    PROF_TABLE.PROF_NAME%TYPE; --교수의 이름을 저장하기 위한 변수
    USER_DEFINE_ERROR1        EXCEPTION;        -- 아이디가 일치하지 않는 경우 에러
    USER_DEFINE_ERROR2        EXCEPTION;        -- 비밀번호가 일치하지 않는 경우 에러
    TEMP_ID                   NUMBER;           -- 입력받은 아이디의 데이터가 존재하는지 확인하는 변수
    TEMP_PW                   NUMBER;           -- 입력받은 비밀번호의 데이터가 존재하는지 확인하는 변수
    
BEGIN
    -- 입력받은 V_ID가 테이블에 존재한다면 카운트, 카운트 값을 TEMP_ID에 저장
    SELECT COUNT(*)              INTO TEMP_ID
    FROM PROF_TABLE
    WHERE PROF_ID = V_ID;
    
    -- TEMP_ID, 즉 카운트가 0이라면 테이블에 데이터가 존재하지 않으므로 에러발생
    IF TEMP_ID = 0
        THEN RAISE USER_DEFINE_ERROR1;  
    END IF;
    
    -- 입력받은 V_PW가 테이블에 존재한다면 카운트, 카운트 값을 TEMP_PW에 저장
    SELECT COUNT(*)              INTO TEMP_PW
    FROM PROF_TABLE
    WHERE PROF_ID = V_ID AND PROF_PW = V_PW;
    
    -- TEMP_PW, 즉 카운트가 0이라면 테이블에 데이터 존재 X -> 에러 발생
    IF TEMP_PW = 0
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;
    
    -- 입력받은 V_ID 에 해당하는 교수의 이름을 V_NAME에 저장
    SELECT PROF_NAME        INTO V_NAME
    FROM PROF_TABLE
    WHERE PROF_ID = V_ID AND PROF_PW =  V_PW;
    
    -- 로그인 문구 출력
    DBMS_OUTPUT.PUT_LINE(V_NAME  || '교수자로 로그인 되었습니다.');
    
    -- 예외처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20006, '아이디가 일치하지않습니다.');
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20007, '비밀번호가 일치하지않습니다.');
            
    COMMIT;

END;
--==>> Procedure PRC_LOGIN_PROF이(가) 컴파일되었습니다.

-- 학생 로그인 프로시저 PRC_LOGIN_STU
CREATE OR REPLACE PROCEDURE PRC_LOGIN_STU
(  V_ID       IN    STU_TABLE.STU_ID%TYPE
,  V_PW       IN    STU_TABLE.STU_PW%TYPE 
)
IS
    V_NAME                    STU_TABLE.STU_NAME%TYPE;  -- 학생의 이름을 저장하기 위한 변수
    USER_DEFINE_ERROR1        EXCEPTION;        -- 아이디가 일치하지 않는 경우 에러
    USER_DEFINE_ERROR2        EXCEPTION;        -- 비밀번호가 일치하지 않는 경우 에러
    TEMP_ID                   NUMBER;           -- 입력받은 아이디의 데이터가 존재하는지 확인하는 변수
    TEMP_PW                   NUMBER;           -- 입력받은 비밀번호의 데이터가 존재하는지 확인하는 변수
    
BEGIN
    -- 입력받은 V_ID가 테이블에 존재한다면 카운트, 카운트 값을 TEMP_ID에 저장
    SELECT COUNT(*)              INTO TEMP_ID
    FROM STU_TABLE
    WHERE STU_ID = V_ID;
    
    -- TEMP_ID, 즉 카운트가 0이라면 테이블에 데이터가 존재하지 않으므로 에러발생
    IF TEMP_ID = 0
        THEN RAISE USER_DEFINE_ERROR1;  
    END IF;
    
    -- 입력받은 V_PW가 테이블에 존재한다면 카운트, 카운트 값을 TEMP_PW에 저장
    SELECT COUNT(*)              INTO TEMP_PW
    FROM STU_TABLE
    WHERE STU_ID = V_ID AND STU_PW = V_PW;
    
    -- TEMP_PW, 즉 카운트가 0이라면 테이블에 데이터 존재 X -> 에러 발생
    IF TEMP_PW = 0
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;
    
     -- 입력받은 V_ID 에 해당하는 학생의 이름을 V_NAME에 저장
    SELECT STU_NAME        INTO V_NAME
    FROM STU_TABLE
    WHERE STU_ID = V_ID AND STU_PW =  V_PW;
    
    -- 로그인 문구 출력
    DBMS_OUTPUT.PUT_LINE(V_NAME  || '학생으로 로그인 되었습니다.');
    
    -- 예외 처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20006, '아이디가 일치하지않습니다.');
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20007, '비밀번호가 일치하지않습니다.');
            
    -- 커밋
    COMMIT;

END;
--==>> Procedure PRC_LOGIN_STU이(가) 컴파일되었습니다.

-- 관리자 로그인 프로시저 PRC_LOGIN_SYS
CREATE OR REPLACE PROCEDURE PRC_LOGIN_SYS
(  V_ID       IN    SYS_TABLE.SYS_ID%TYPE
,  V_PW       IN    SYS_TABLE.SYS_PW%TYPE 
)
IS
    V_NAME                    SYS_TABLE.SYS_NAME%TYPE;
    USER_DEFINE_ERROR1        EXCEPTION;        -- 아이디가 일치하지 않는 경우 에러
    USER_DEFINE_ERROR2        EXCEPTION;        -- 비밀번호가 일치하지 않는 경우 에러
    TEMP_ID                   NUMBER;           -- 입력받은 아이디의 데이터가 존재하는지 확인하는 변수
    TEMP_PW                   NUMBER;           -- 입력받은 비밀번호의 데이터가 존재하는지 확인하는 변수
    
    
BEGIN
    -- 입력받은 V_ID가 테이블에 존재한다면 카운트, 카운트 값을 TEMP_ID에 저장
    SELECT COUNT(*)              INTO TEMP_ID
    FROM SYS_TABLE
    WHERE SYS_ID = V_ID;
    
     -- TEMP_ID, 즉 카운트가 0이라면 테이블에 데이터가 존재하지 않으므로 에러발생
    IF TEMP_ID = 0
        THEN RAISE USER_DEFINE_ERROR1;  
    END IF;
    
    -- 입력받은 V_PW가 테이블에 존재한다면 카운트, 카운트 값을 TEMP_PW에 저장
    SELECT COUNT(*)              INTO TEMP_PW
    FROM SYS_TABLE
    WHERE SYS_ID = V_ID AND SYS_PW = V_PW;
    
    -- TEMP_PW, 즉 카운트가 0이라면 테이블에 데이터 존재 X -> 에러 발생
    IF TEMP_PW = 0
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;
    
    -- 입력받은 V_ID 에 해당하는 관리자의 이름을 V_NAME에 저장
    SELECT SYS_NAME        INTO V_NAME
    FROM SYS_TABLE
    WHERE SYS_ID = V_ID AND SYS_PW =  V_PW;
    
    -- 로그인 문구 출력
    DBMS_OUTPUT.PUT_LINE(V_NAME  || '관리자로 로그인 되었습니다.');
    
    -- 예외 처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20006, '아이디가 일치하지않습니다.');
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20007, '비밀번호가 일치하지않습니다.');
    
    -- 커밋        
    COMMIT;

END;
--==>> Procedure PRC_LOGIN_SYS이(가) 컴파일되었습니다.


-- 교수자의 정보 VIEW 생성(관리자 입장에서 교수 정보 조회)
CREATE OR REPLACE VIEW VIEW_USER_PROF
AS
SELECT P.PROF_NAME"교수이름", SS.SUB_NAME"과목이름", DS.SUB_START"과목시작일", DS.SUB_END"과목종료일", B.BOOK_NAME"책이름", R.ROOM_NO"강의실"
            ,CASE WHEN SUB_START > SYSDATE THEN '강의 미진행' 
                     WHEN SUB_END < SYSDATE THEN '강의 완료'
                     ELSE  '강의 진행중'
            END"강의진행여부"
FROM PROF_TABLE P, DSUB_TABLE DS, SSUB_TABLE SS, BOOK_TABLE B, DCOR_TABLE DC, SCOR_TABLE SC , ROOM_TABLE R
WHERE P.PROF_ID(+) = DS.PROF_ID
           AND DS.SSUB_NO = SS.SSUB_NO(+)
           AND DS.BOOK_NO = B.BOOK_NO(+)
           AND DS.DCOR_NO =DC.DCOR_NO(+)
           AND DC.SCOR_NO =  SC.SCOR_NO(+)
           AND DC.ROOM_NO = R.ROOM_NO(+)
ORDER BY 1,3;
--==>> View VIEW_PROF이(가) 생성되었습니다.

-- 생성된 VIEW_PROF 확인
SELECT *
FROM VIEW_PROF;


-- 관리자에서 과목 출력 VIEW 생성(관리자 입장에서 과목 조회)
CREATE OR REPLACE VIEW VIEW_USER_DSUB   
AS
SELECT A.COR_NAME"과정명",C.ROOM_INFO"강의실",E.SUB_NAME"과목명"
        ,D.SUB_START"과목시작일",D.SUB_END"과목종료일",F.BOOK_NAME"교재명",G.PROF_NAME"교수자명"
FROM SCOR_TABLE A, DCOR_TABLE B,ROOM_TABLE C,DSUB_TABLE D,SSUB_TABLE E,BOOK_TABLE F,PROF_TABLE G
WHERE A.SCOR_NO(+) = B.SCOR_NO 
        AND B.ROOM_NO = C.ROOM_NO(+)
        AND B.DCOR_NO(+) = D.DCOR_NO
        AND D.SSUB_NO = E.SSUB_NO(+)
        AND D.BOOK_NO = F.BOOK_NO(+)
        AND D.PROF_ID = G.PROF_ID(+);
--==>> View VIEW_USER_DSUB이(가) 생성되었습니다.    
        

-- 개설과목에 설치한 트리거(성적테이블 삭제)
CREATE OR REPLACE TRIGGER TRG_DSUB_DELETE  
        BEFORE
        DELETE ON DSUB_TABLE
        FOR EACH ROW
BEGIN
    DELETE
    FROM SUNG_TABLE
    WHERE DSUB_NO = :OLD.DSUB_NO; 
END;
--==>> Trigger TRG_DSUB_DELETE이(가) 컴파일되었습니다.


-- 과목에 설치한 트리거(개설과목 연관 데이터 삭제)
CREATE OR REPLACE TRIGGER TRG_SSUB_DELETE  
        BEFORE
        DELETE ON SSUB_TABLE
        FOR EACH ROW
BEGIN
    DELETE
    FROM DSUB_TABLE
    WHERE SSUB_NO = :OLD.SSUB_NO;
END;
--==>> Trigger TRG_SSUB_DELETE이(가) 컴파일되었습니다.


-- PRC_DCOR_INSERT : DCOR_TABLE(개설과정) 정보를 입력하기 위한 프로시저 생성
CREATE OR REPLACE PROCEDURE PRC_DCOR_INSERT
( V_SCOR_NO     IN DCOR_TABLE.SCOR_NO%TYPE
, V_ROOM_NO     IN DCOR_TABLE.ROOM_NO%TYPE
, V_COR_DATE    IN DCOR_TABLE.COR_DATE%TYPE
)
IS
    MAX_NO  NUMBER;
BEGIN
    -- MAX_NO 에 개설과목테이블(DCOR_TABLE)의 마지막 번호를 담기 위한 변수
    SELECT MAX(TO_NUMBER(SUBSTR(DCOR_NO,3))) INTO MAX_NO
    FROM DCOR_TABLE;
    
    MAX_NO := MAX_NO + 1;

    -- 과정 테이블의 과목명(COR_NAME)을 V_COR_NAME 으로 변경
    IF(MAX_NO < 10)                     -- 마지막 과목번호가 1의자리 수라면
        THEN INSERT INTO DCOR_TABLE     -- ex) 6 → DC00 || 6  → DC006
             VALUES(('DC00' || TO_CHAR(MAX_NO)), V_SCOR_NO, V_ROOM_NO, V_COR_DATE);
    ELSIF(MAX_NO >= 10 AND MAX_NO <100) -- 마지막 과목번호가 10의자리 수라면
        THEN INSERT INTO DCOR_TABLE     -- ex) 15 → DC0 || 15 → DC015
             VALUES(('DC0' || TO_CHAR(MAX_NO)), V_SCOR_NO, V_ROOM_NO, V_COR_DATE);
    ELSIF(MAX_NO >= 100)                -- 마지막 과목번호가 100의자리 수라면
        THEN INSERT INTO DCOR_TABLE     -- ex) 15 → DC0 || 15 → DC015
             VALUES(('DC' || TO_CHAR(MAX_NO)), V_SCOR_NO, V_ROOM_NO, V_COR_DATE);
    END IF;
    
    COMMIT;
    
END;
--==>> Procedure PRC_DCOR_INSERT이(가) 컴파일되었습니다.

EXEC PRC_DCOR_INSERT('C002', 'R204', SYSDATE);
--==>> DC004   C002   R204   2019-10-07

-- 확인
SELECT *
FROM DCOR_TABLE;

-- PRC_DCOR_UPDATE : DCOR_TABLE(개설과정) 정보를 수정하기 위한 프로시저 생성
CREATE OR REPLACE PROCEDURE PRC_DCOR_UPDATE
( V_DCOR_NO   IN DCOR_TABLE.DCOR_NO%TYPE     -- 변경될 『개설과정코드』
, V_SCOR_NO   IN DCOR_TABLE.SCOR_NO%TYPE     -- 변경할 『과정 번호』
, V_ROOM_NO   IN DCOR_TABLE.ROOM_NO%TYPE     -- 변경할 『강의실 번호』
, V_COR_DATE  IN DCOR_TABLE.COR_DATE%TYPE    -- 변경할 『과정개설일』
)
IS    
    B_COR_DATE  DCOR_TABLE.COR_DATE%TYPE;    -- 변경 『이전 과정개설일』
    USER_DEFINE_ERROR EXCEPTION;
BEGIN
    -- 개설과정 테이블에서 변경하고자 하는 개설과정코드를 찾아 해당 개설일을 B_COR_DATE 변수에 넣어준다.
    SELECT COR_DATE INTO B_COR_DATE
    FROM DCOR_TABLE
    WHERE DCOR_NO = V_DCOR_NO;
    
    -- 변경하려는 과정개설일(바뀌기 전 개설일)이 변경할 과정개설일(V_COR_DATE) 보다 이전이라면, 예외처리 수행
    IF(B_COR_DATE < SYSDATE)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20007, '이미 진행중인 과정이므로 날짜를 변경하실 수 없습니다.');
        WHEN OTHERS
            THEN ROLLBACK;

    -- 해당 『개설과목코드』를 찾아 이전 과정번호를 V_SCOR_NO 으로 변경
    -- 해당 『강의실번호』를 찾아 이전 강의실번호를 V_ROOM_NO 으로 변경
    -- 해당 『과정개설일』을 찾아 이전 과정개설일을 V_COR_DATE 으로 변경
    UPDATE DCOR_TABLE
    SET SCOR_NO = V_SCOR_NO, ROOM_NO = V_ROOM_NO, COR_DATE = V_COR_DATE
    WHERE DCOR_NO = V_DCOR_NO;
    
    COMMIT;
    
END;
--==>> Procedure PRC_DCOR_UPDATE이(가) 컴파일되었습니다.


-- PRC_DCOR_DELETE : DCOR_TABLE(개설과정) 정보를 삭제하기 위한 프로시저 생성 <TEST필요>
CREATE OR REPLACE PROCEDURE PRC_DCOR_DELETE
( V_DCOR_NO   IN DCOR_TABLE.DCOR_NO%TYPE     -- 변경될 『개설과정코드』
)
IS    
    B_COR_DATE  DCOR_TABLE.COR_DATE%TYPE;    -- 변경 『이전 과정개설일』
    USER_DEFINE_ERROR EXCEPTION;
BEGIN
    DELETE
    FROM DCOR_TABLE
    WHERE DCOR_NO = V_DCOR_NO;
    
    COMMIT;
END;
--==>> Procedure PRC_DCOR_DELETE이(가) 컴파일되었습니다.

EXEC PRC_DCOR_DELETE('DC001');
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM DCOR_TABLE;


-- 테스트
EXEC PRC_DCOR_UPDATE('DC002', 'C006', 'R306', '2019-05-23');
--==>> ORA-20007: 이미 진행중인 과정이므로 날짜를 변경하실 수 없습니다.


-- TRG_DCOR_DELETE : DCOR_TABLE(개설과정) 정보가 삭제될 때 수행될 트리거 생성
CREATE OR REPLACE TRIGGER TRG_DCOR_DELETE
    BEFORE
    DELETE ON DCOR_TABLE                    -- 개설과정 테이블에서 삭제처리가 이루어질 때
    FOR EACH ROW

BEGIN   
    DELETE 
    FROM SUG_TABLE                          -- 수강신청 테이블에서
    WHERE DCOR_NO = :OLD.DCOR_NO;           -- 삭제하는 개설과정코드와 일치하는 정보를 삭제
    
    DELETE
    FROM DSUB_TABLE                         -- 개설과목 테이블에서
    WHERE DCOR_NO = :OLD.DCOR_NO;           -- 삭제하는 개설과정코드와 일치하는 정보를 삭제
    
END;
--==>> Trigger TRG_DCOR_DELETE이(가) 컴파일되었습니다.



-- ROOM_TABLE 정보 입력 프로시저 생성 : PRC_ROOM_INSERT
CREATE OR REPLACE PROCEDURE PRC_ROOM_INSERT
( V_ROOM_NO   IN ROOM_TABLE.ROOM_NO%TYPE
, V_ROOM_INFO IN ROOM_TABLE.ROOM_INFO%TYPE
)
IS
BEGIN
    
    INSERT INTO ROOM_TABLE VALUES(V_ROOM_NO, V_ROOM_INFO);
    
    COMMIT;
    
END;
--==>> Procedure PRC_ROOM_INSERT이(가) 컴파일되었습니다.

EXEC PRC_ROOM_INSERT('R303', '자연관 303호');
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.
--==>> R303   자연관 303호

-- ROOM_TABLE 정보 수정 프로시저 생성 : PRC_ROOM_UPDATE
CREATE OR REPLACE PROCEDURE PRC_ROOM_UPDATE
( V_ROOM_NO     IN ROOM_TABLE.ROOM_NO%TYPE
, V_ROOM_INFO   IN ROOM_TABLE.ROOM_INFO%TYPE
)
IS
BEGIN
    -- 강의실 테이블에서 입력된 강의실번호와 일치하는 강의실 정보를 변경시킨다.
    UPDATE ROOM_TABLE
    SET ROOM_INFO = V_ROOM_INFO
    WHERE ROOM_NO = V_ROOM_NO;
    
    COMMIT;
    
END;
--==>> Procedure PRC_ROOM_UPDATE이(가) 컴파일되었습니다.

-- ROOM_TABLE 정보 삭제 프로시저 생성 : PRC_ROOM_DELETE <TEST필요>
CREATE OR REPLACE PROCEDURE PRC_ROOM_DELETE
( V_ROOM_NO     IN ROOM_TABLE.ROOM_NO%TYPE
)
IS
BEGIN
    -- 강의실 테이블에서 입력된 강의실번호와 일치하는 강의실번호의 정보를 삭제한다.
    DELETE
    FROM ROOM_TABLE
    WHERE ROOM_NO = V_ROOM_NO;
    
    COMMIT;
END;
--==>> Procedure PRC_ROOM_DELETE이(가) 컴파일되었습니다.

/*
개설 과정 VIEW 생성(관리자 입장에서 개설 과정 조회)
------ 방법 ①
SELECT B.COR_NAME, C.ROOM_INFO, D.DSUB_NO, E.SUB_NAME, D.SUB_START, D.SUB_END, F.BOOK_NAME, G.PROF_NAME
  FROM DCOR_TABLE A, SCOR_TABLE B, ROOM_TABLE C, DSUB_TABLE D, SSUB_TABLE E, BOOK_TABLE F, PROF_TABLE G
 WHERE A.SCOR_NO    = B.SCOR_NO(+)
   AND A.ROOM_NO    = C.ROOM_NO(+)
   AND A.DCOR_NO    = D.DCOR_NO(+)
   AND D.SSUB_NO    = E.SSUB_NO(+)
   AND D.BOOK_NO    = F.BOOK_NO(+)
   AND D.PROF_ID    = G.PROF_ID(+);
*/
------ 방법 ②
CREATE OR REPLACE VIEW VIEW_USER_DCOR
AS
SELECT B.COR_NAME "과정명", C.ROOM_INFO"강의실", D.DSUB_NO"과목번호", E.SUB_NAME"과목명"
     , D.SUB_START"시작일자", D.SUB_END"종료일자", F.BOOK_NAME"교재명", G.PROF_NAME"교수자명"
FROM DCOR_TABLE A LEFT JOIN SCOR_TABLE B
                           ON A.SCOR_NO = B.SCOR_NO      -- 강좌, 개설과정 테이블을 SCOR_NO(과정번호)로 조인
                                                                            -- : 과정명(COR_NAME) 얻기 위해서
                  LEFT JOIN ROOM_TABLE C
                           ON A.ROOM_NO = C.ROOM_NO   -- 개설과정, 강의실 테이블을 ROOM_NO(강의실번호)로 조인
                                                                            -- : 강의실 정보(ROOM_INFO) 얻기 위해서
                  LEFT JOIN DSUB_TABLE D
                           ON A.DCOR_NO = D.DCOR_NO     -- 개설과정, 개설과목 테이블을 DCOR_NO(개설과정번호)로 조인
                                                                            -- : 시작일자, 종료일자(SUB_START, SUB_END) 얻기 위해서
                  LEFT JOIN SSUB_TABLE E
                           ON D.SSUB_NO = E.SSUB_NO       -- 개설과정, 과목 테이블을 SSUB_NO(과목번호)로 조인
                                                                            -- : 과목번호, 과목명(DSUB_NO, SUB_NAME) 얻기 위해서
                  LEFT JOIN BOOK_TABLE F
                           ON D.BOOK_NO = F.BOOK_NO     -- 개설과정, 교재 테이블을 BOOK_NO(교재번호)로 조인
                                                                            -- : 교재명(BOOK_NAME) 얻기 위해서
                  LEFT JOIN PROF_TABLE G    
                           ON D.PROF_ID = G.PROF_ID;         -- 개설과정, 교수 테이블을 PROF_ID(교수번호)로 조인
                                                                            -- : 교수자명(PROF_NAME) 얻기 위해서
                           
SELECT *
FROM VIEW_USER_DCOR;

-- 과목 선택 시 해당 과목에 대한 성적 출력 VIEW
CREATE OR REPLACE VIEW VIEW_STU 
AS
SELECT ROW_NUMBER() OVER(PARTITION BY S.STU_ID ORDER BY D.SUB_START)"번호"
     , S.STU_ID"학생번호"
     , U.SUB_NAME"과목명"
     , D.SUB_START"시작일"
     , D.SUB_END"끝일"
     , B.BOOK_NAME"교재명"
     , S.STU_NAME "학생명"
     , N.SUNG_ATT"출결"
     , N.SUNG_W"필기"
     , N.SUNG_P"실기"
     , (N.SUNG_ATT + N.SUNG_W + N.SUNG_P)"총합"
     , RANK() OVER(PARTITION BY U.SUB_NAME ORDER BY (N.SUNG_ATT + N.SUNG_W + N.SUNG_P) DESC)"순위"
FROM STU_TABLE S RIGHT JOIN SUG_TABLE G
                 ON S.STU_ID = G.STU_ID
                 RIGHT JOIN SUNG_TABLE N
                 ON G.SUG_NO = N.SUG_NO
                 LEFT JOIN DSUB_TABLE D
                 ON N.DSUB_NO = D.DSUB_NO
                 LEFT JOIN SSUB_TABLE U
                 ON D.SSUB_NO = U.SSUB_NO
                 LEFT JOIN BOOK_TABLE B
                 ON D.BOOK_NO = B.BOOK_NO;

-- 확인
SELECT *
FROM VIEW_STU;

-- (중도탈락여부가 있는 경우)과목 선택 시 해당 과목에 대한 성적 출력 VIEW
CREATE OR REPLACE VIEW VIEW_STU_FAIL    
AS
SELECT ROW_NUMBER() OVER(PARTITION BY S.STU_ID ORDER BY D.SUB_START)"번호"
     , S.STU_ID"학생번호"
     , U.SUB_NAME"과목명"
     , D.SUB_START"시작일"
     , D.SUB_END"끝일"
     , B.BOOK_NAME"교재명"
     , S.STU_NAME "학생명"
     , N.SUNG_ATT"출결"
     , N.SUNG_W"필기"
     , N.SUNG_P"실기"
     , (N.SUNG_ATT + N.SUNG_W + N.SUNG_P)"총합"
     , RANK() OVER(PARTITION BY U.SUB_NAME ORDER BY (N.SUNG_ATT + N.SUNG_W + N.SUNG_P) DESC)"순위"
     , F.FAIL_DATE"탈락일자"
     , F.FAIL_REA"탈락사유"
FROM STU_TABLE S RIGHT JOIN SUG_TABLE G
                 ON S.STU_ID = G.STU_ID
                 LEFT JOIN FAIL_TABLE F
                 ON G.SUG_NO = F.SUG_NO
                 RIGHT JOIN SUNG_TABLE N
                 ON G.SUG_NO = N.SUG_NO
                 LEFT JOIN DSUB_TABLE D
                 ON N.DSUB_NO = D.DSUB_NO
                 LEFT JOIN SSUB_TABLE U
                 ON D.SSUB_NO = U.SSUB_NO
                 LEFT JOIN BOOK_TABLE B
                 ON D.BOOK_NO = B.BOOK_NO;
                 
                 
-- 학생 로그인 시 과목 출력 뷰 생성
CREATE OR REPLACE VIEW VIEW_STU_LIST 
AS
SELECT ROW_NUMBER() OVER(PARTITION BY S.STU_ID ORDER BY D.SUB_START)"번호"
     , S.STU_ID"학생번호"
     , U.SUB_NAME"과목명"
     , D.SUB_START"시작일"
     , D.SUB_END"끝일"
FROM STU_TABLE S RIGHT JOIN SUG_TABLE G
                 ON S.STU_ID = G.STU_ID
                 RIGHT JOIN SUNG_TABLE N
                 ON G.SUG_NO = N.SUG_NO
                 LEFT JOIN DSUB_TABLE D
                 ON N.DSUB_NO = D.DSUB_NO
                 LEFT JOIN SSUB_TABLE U
                 ON D.SSUB_NO = U.SSUB_NO
                 LEFT JOIN BOOK_TABLE B
                 ON D.BOOK_NO = B.BOOK_NO
WHERE D.SUB_END < SYSDATE;


-- 학생번호 및 시작일에 따른 과목에 대한 성적 출력 프로시져
CREATE OR REPLACE PROCEDURE PRC_STU_FAIL            
( SUG_STU_ID   IN  STU_TABLE.STU_ID%TYPE            -- 학생 번호 받기
, DSUB_START_DATE  IN  DSUB_TABLE.SUB_START%TYPE    -- 과목 시작 일자 받기(이전 과목들과 년도/월/일 이 모두 일치할 수가 없음)
)
IS  
    COUNTER_DIS     NUMBER;                         -- 중도탈락 여부를 결정하는 구분자
    T_STU   VIEW_STU%ROWTYPE;                       -- (중도탈락X) 출력 변수
    T_STUF  VIEW_STU_FAIL%ROWTYPE;                  -- (중도탈락O) 출력 변수
    
BEGIN
    
    SELECT COUNT(*) INTO COUNTER_DIS                 -- 구분자 저장
    FROM FAIL_TABLE
    WHERE SUG_NO = ANY(SELECT SUG_NO
                       FROM SUG_TABLE
                       WHERE STU_ID = SUG_STU_ID);
    
    IF (COUNTER_DIS = 0)                            -- 중도 탈락 여부가 없는 경우(탈락일자, 탈락사유 생략)
        THEN 
        
                SELECT 학생번호, 과목명, 시작일, 끝일, 교재명, 학생명, 출결, 필기, 실기, 총합, 순위
                    INTO T_STU.학생번호, T_STU.과목명, T_STU.시작일, T_STU.끝일
                    , T_STU.교재명, T_STU.학생명, T_STU.출결, T_STU.필기, T_STU.실기, T_STU.총합, T_STU.순위
                FROM VIEW_STU
                WHERE 학생번호 = SUG_STU_ID
                  AND 시작일 = DSUB_START_DATE;
                
                DBMS_OUTPUT.PUT_LINE(T_STU.학생번호 ||', '|| T_STU.과목명 ||', '|| T_STU.시작일 ||', '|| T_STU.끝일
                     ||', '|| T_STU.교재명 ||', '|| T_STU.학생명 ||', '|| T_STU.출결 
                     ||', '|| T_STU.필기 ||', '|| T_STU.실기 ||', '|| T_STU.총합 ||', '|| T_STU.순위);
            
    ELSE                                                                        -- 중도 탈락 여부가 있는 경우(탈락일자, 탈락사유 추가)
                                 
                SELECT 학생번호, 과목명, 시작일, 끝일, 교재명, 학생명, 출결, 필기, 실기, 총합, 순위, 탈락일자, 탈락사유
                    INTO T_STUF.학생번호, T_STUF.과목명, T_STUF.시작일, T_STUF.끝일
                    , T_STUF.교재명, T_STUF.학생명, T_STUF.출결, T_STUF.필기, T_STUF.실기, T_STUF.총합, T_STUF.순위
                    , T_STUF.탈락일자, T_STUF.탈락사유
                FROM VIEW_STU_FAIL
                WHERE 학생번호 = SUG_STU_ID
                  AND 시작일 = DSUB_START_DATE;
                
                DBMS_OUTPUT.PUT_LINE(T_STUF.학생번호 ||', '|| T_STUF.과목명 ||', '|| T_STUF.시작일 ||', '|| T_STUF.끝일
                     ||', '|| T_STUF.교재명 ||', '|| T_STUF.학생명 ||', '|| T_STUF.출결 
                     ||', '|| T_STUF.필기 ||', '|| T_STUF.실기 ||', '|| T_STUF.총합 ||', '|| T_STUF.순위 ||', '|| T_STUF.탈락일자 ||', '|| T_STUF.탈락사유);
            
    END IF;
    COMMIT;
END;
--==>> Procedure PRC_STU_FAIL이(가) 컴파일되었습니다.


-- 실행
-- 실제로는 인터페이스를 통해 클릭을 하게되면 해당 정보를 넘겨받는다고 가정하여 프로시저로 임시방편 표현을 하게 되었다.
EXEC PRC_STU_FAIL('ST003', '19/07/28');
/*
ST003, JSP, 19/07/28, 19/09/01, JSP란 무엇인가, 김소원, 10, 40, 25, 75, 3
*/

-- 학생 로그인 시, 종료된 과목 리스트 출력 VIEW
CREATE OR REPLACE PROCEDURE PRC_STU_LOGIN 
( LIST_STU_ID   IN  STU_TABLE.STU_ID%TYPE -- 학생 번호 받기
)
IS
    COUNTER  NUMBER;                -- 루프 변수
    COUNTER_LIST NUMBER;            -- 학생번호와 일치하는 과목 갯수 저장 변수
    T_STUL   VIEW_STU_LIST%ROWTYPE; -- VIEW_STU_LIST 내용 저장 변수
    
BEGIN
    
                                       
    SELECT COUNT(*) INTO COUNTER_LIST -- 학생번호 일치하는 과목 갯수 저장
    FROM VIEW_STU_LIST
    WHERE 학생번호 = LIST_STU_ID;   
                      
    
    
    FOR COUNTER IN 1 .. COUNTER_LIST LOOP -- 과목 갯수만큼 출력
                
                SELECT 번호, 학생번호, 과목명, 시작일, 끝일
                    INTO T_STUL.번호, T_STUL.학생번호, T_STUL.과목명, T_STUL.시작일, T_STUL.끝일
                FROM VIEW_STU_LIST
                WHERE 학생번호 = LIST_STU_ID
                  AND 번호 = COUNTER;
                
                DBMS_OUTPUT.PUT_LINE(T_STUL.번호 ||', '|| T_STUL.학생번호 ||', '|| T_STUL.과목명 ||', '|| T_STUL.시작일 ||', '|| T_STUL.끝일);
            
    END LOOP;
    
    COMMIT;
    
    
END;
--==>> Procedure PRC_STU_LOGIN이(가) 컴파일되었습니다.


-- 실행
-- 실제 인터페이스를 통해 학생에 대한 정보를 가지고있다고 가정하에 프로시저를 구현해보았다.
EXEC PRC_STU_LOGIN('ST003');
/*
1, ST003, JSP, 19/07/28, 19/09/01
2, ST003, SERVER, 19/09/02, 19/10/01
*/


CREATE OR REPLACE TRIGGER TRG_DSUB  -- 개설과목에 설치한 트리거(성적테이블 삭제)
        BEFORE
        DELETE ON DSUB_TABLE
        FOR EACH ROW
BEGIN
    DELETE
    FROM SUNG_TABLE
    WHERE DSUB_NO = :OLD.DSUB_NO; 
END;
--==>> Trigger TRG_DSUB이(가) 컴파일되었습니다.


CREATE OR REPLACE TRIGGER TRG_SSUB  -- 과목에 설치한 트리거(개설과목 연관 데이터 삭제)
        BEFORE
        DELETE ON SSUB_TABLE
        FOR EACH ROW
BEGIN
    DELETE
    FROM DSUB_TABLE
    WHERE SSUB_NO = :OLD.SSUB_NO;
END;
--==>> Trigger TRG_SSUB이(가) 컴파일되었습니다.



CREATE OR REPLACE VIEW VIEW_PROF_START  /*(교수자 관점) 강의 목록 뷰*/
AS
SELECT  D.DSUB_NO "개설과목코드", S.SUB_NAME "과목명", P.PROF_ID "교수번호", D.SUB_START "시작일", D.SUB_END "종료일"
        , CASE WHEN SUB_START > SYSDATE THEN '강의 미진행' 
               WHEN SUB_END < SYSDATE THEN '강의 완료'
               ELSE  '강의 진행중' END "강의상태"
FROM    DSUB_TABLE D JOIN PROF_TABLE P
ON      D.PROF_ID = P.PROF_ID
        JOIN SSUB_TABLE S
        ON  D.SSUB_NO = S.SSUB_NO;
/*
SELECT 개설과목코드, 과목명, 시작일, 종료일, 강의상태
FROM VIEW_PROF_START
WHERE 교수번호 = 'P003';
*/
        
        
CREATE OR REPLACE VIEW VIEW_PROF_SUNGJUK_IN     /*(교수자 관점) 학생 성적 입력 뷰*/
AS
SELECT  S.SUB_NAME "과목명", P.PROF_ID "교수번호", ST.STU_ID "학생번호", ST.STU_NAME "학생명"
      , SU.SUNG_ATT "출결", SU.SUNG_W "필기", SU.SUNG_P "실기"
      , (SU.SUNG_ATT + SU.SUNG_W + SU.SUNG_P) "총점"
FROM    DSUB_TABLE D JOIN SSUB_TABLE S
ON  D.SSUB_NO = S.SSUB_NO
        JOIN SUNG_TABLE SU
        ON  D.DSUB_NO = SU.DSUB_NO
            JOIN SUG_TABLE SUG
            ON SU.SUG_NO = SUG.SUG_NO
                JOIN STU_TABLE ST
                ON  SUG.STU_ID = ST.STU_ID
                    JOIN PROF_TABLE P
                    ON D.PROF_ID = P.PROF_ID
                        LEFT JOIN FAIL_TABLE F
                        ON SUG.SUG_NO = F.SUG_NO
                        WHERE F.SUG_NO IS NULL;
/*
SELECT 과목명, 학생번호, 학생명, 출결, 필기, 실기, 총점
FROM VIEW_PROF_SUNGJUK_IN
WHERE 교수번호 = 'P003';
*/        


CREATE OR REPLACE VIEW VIEW_PROF_SUNGJUK_OUT    /*(교수자 관점) 모든 학생 성적 출력 뷰*/
AS
SELECT  S.SUB_NAME "과목명", P.PROF_ID "교수번호", D.SUB_START "시작일", D.SUB_END "종료일", B.BOOK_NAME "교재명", ST.STU_ID "학생번호", ST.STU_NAME "학생명"
      , SU.SUNG_ATT "출결", SU.SUNG_W "필기", SU.SUNG_P "실기"
      , (SU.SUNG_ATT + SU.SUNG_W + SU.SUNG_P) "총점"
      , RANK() OVER(PARTITION BY D.DSUB_NO ORDER BY (NVL(SU.SUNG_ATT,0) + NVL(SU.SUNG_W,0) + NVL(SU.SUNG_P,0)) DESC) "등수"
      , DECODE(F.SUG_NO, NULL, 'N', 'Y') "탈락여부"
FROM    DSUB_TABLE D JOIN PROF_TABLE P
ON      D.PROF_ID = P.PROF_ID
        JOIN SSUB_TABLE S
        ON  D.SSUB_NO = S.SSUB_NO
            JOIN BOOK_TABLE B
            ON  D.BOOK_NO = B.BOOK_NO
                JOIN SUNG_TABLE SU
                ON  D.DSUB_NO = SU.DSUB_NO
                    JOIN SUG_TABLE SUG
                    ON SU.SUG_NO = SUG.SUG_NO
                        JOIN STU_TABLE ST
                        ON  SUG.STU_ID = ST.STU_ID
                            LEFT JOIN FAIL_TABLE F
                            ON  SUG.SUG_NO = F.SUG_NO;
/*
SELECT 과목명, 시작일, 종료일, 교재명, 학생번호, 학생명, 출결, 필기, 실기, 총점, 등수, 탈락여부
FROM VIEW_PROF_SUNGJUK_OUT
WHERE 교수번호 = 'P002';
*/

CREATE OR REPLACE VIEW VIEW_PROF_SUNGJUK_OUT_F  /*(교수자 관점) 중도탈락 학생 성적 출력 뷰*/
AS
SELECT  S.SUB_NAME "과목명", P.PROF_ID "교수번호", D.SUB_START "시작일", D.SUB_END "종료일", B.BOOK_NAME "교재명", ST.STU_ID "학생번호", ST.STU_NAME "학생명"
      , SU.SUNG_ATT "출결", SU.SUNG_W "필기", SU.SUNG_P "실기"
      , (SU.SUNG_ATT + SU.SUNG_W + SU.SUNG_P) "총점"
      , RANK() OVER(PARTITION BY D.DSUB_NO ORDER BY (NVL(SU.SUNG_ATT,0) + NVL(SU.SUNG_W,0) + NVL(SU.SUNG_P,0)) DESC) "등수"
      , F.FAIL_DATE "탈락일자"
      , F.FAIL_REA "탈락사유"
FROM    DSUB_TABLE D JOIN PROF_TABLE P
ON      D.PROF_ID = P.PROF_ID
        JOIN SSUB_TABLE S
        ON  D.SSUB_NO = S.SSUB_NO
            JOIN BOOK_TABLE B
            ON  D.BOOK_NO = B.BOOK_NO
                JOIN SUNG_TABLE SU
                ON  D.DSUB_NO = SU.DSUB_NO
                    JOIN SUG_TABLE SUG
                    ON SU.SUG_NO = SUG.SUG_NO
                        JOIN STU_TABLE ST
                        ON  SUG.STU_ID = ST.STU_ID
                            JOIN FAIL_TABLE F
                            ON  SUG.SUG_NO = F.SUG_NO;
/*
SELECT 과목명, 시작일, 종료일, 교재명, 학생번호, 학생명, 출결, 필기, 실기, 총점, 등수, 탈락일자, 탈락사유
FROM VIEW_PROF_SUNGJUK_OUT_F
WHERE 교수번호 = 'P002';
*/
 
CREATE OR REPLACE PROCEDURE PRC_PROF_SUNGJUK_SAVE   /*(교수자 관점) 성적 저장 명령 프로시저*/
( V_INPUT   IN NUMBER
)
IS
BEGIN
    -- 교수가 확인 버튼을 누른다는 것을 1을 입력받았다고 가정하여, 1을 입력받으면 COMMIT
    IF (V_INPUT = 1)
        THEN DBMS_OUTPUT.PUT_LINE('저장 완료');
            COMMIT;
    ELSE DBMS_OUTPUT.PUT_LINE('저장을 취소하였습니다.');
    END IF;
    
    COMMIT;
END;
--==>> Procedure PRC_PROF_SUNGJUK_SAVE이(가) 컴파일되었습니다.


/*
-- EXEC PRC_PROF_SUNGJUK_SAVE(2);
저장 명령을 1이라 설정하고 사용자가 1을 입력할시 COMMIT
*/

CREATE OR REPLACE PROCEDURE PRC_PROF_SUNGJUK_UPDATE     /*학생 성적 수정 프로시저*/
( V_SUGNO   IN SUNG_TABLE.SUG_NO%TYPE
, V_DSUBNO  IN SUNG_TABLE.DSUB_NO%TYPE
, V_ATT     IN SUNG_TABLE.SUNG_ATT%TYPE
, V_WRITE   IN SUNG_TABLE.SUNG_W%TYPE
, V_PRAC    IN SUNG_TABLE.SUNG_P%TYPE
)
IS
    S_SUGNO     SUG_TABLE.SUG_NO%TYPE;
    S_DSUBNO    DSUB_TABLE.DSUB_NO%TYPE;
    S_START     DSUB_TABLE.SUB_START%TYPE;
    S_ATT       DSUB_TABLE.ATT_SCORE%TYPE;
    S_W         DSUB_TABLE.W_SCORE%TYPE;
    S_P         DSUB_TABLE.P_SCORE%TYPE;
    TEMP_FAIL   NUMBER;
    ERROR1      EXCEPTION;
    ERROR2      EXCEPTION;
    ERROR3      EXCEPTION;
BEGIN
    SELECT SUG_NO, DSUB_NO INTO S_SUGNO, S_DSUBNO
    FROM SUNG_TABLE
    WHERE SUG_NO = V_SUGNO
      AND DSUB_NO = V_DSUBNO;
      
    SELECT ATT_SCORE, W_SCORE, P_SCORE, SUB_START INTO S_ATT, S_W, S_P, S_START
    FROM DSUB_TABLE
    WHERE DSUB_NO = V_DSUBNO;

    IF (SYSDATE < S_START)
        THEN RAISE ERROR1;
    END IF;
    
    IF (V_ATT > S_ATT) OR (V_WRITE > S_W) OR (V_PRAC > S_P)
        THEN RAISE ERROR2;
    END IF;
    
    SELECT COUNT(*) INTO TEMP_FAIL
    FROM FAIL_TABLE
    WHERE SUG_NO = V_SUGNO;
    
    IF (TEMP_FAIL = 1)
        THEN RAISE ERROR3;
    END IF;

    UPDATE SUNG_TABLE
             SET SUNG_ATT = V_ATT
               , SUNG_W = V_WRITE
               , SUNG_P = V_PRAC
             WHERE SUG_NO = S_SUGNO AND DSUB_NO = S_DSUBNO;

    EXCEPTION
        WHEN ERROR1
            THEN RAISE_APPLICATION_ERROR(-20100, '시작되지 않은 과목입니다.');
            ROLLBACK;
        WHEN ERROR2
            THEN RAISE_APPLICATION_ERROR(-20101, '배점과 성적이 맞지 않습니다.');
            ROLLBACK;
        WHEN ERROR3
            THEN RAISE_APPLICATION_ERROR(-20102, '중도탈락한 학생은 성적입력이 불가능합니다.');
            ROLLBACK;
            
    
END;
--==>> Procedure PRC_PROF_SUNGJUK_UPDATE이(가) 컴파일되었습니다.


/*
-- EXEC PRC_PROF_SUNGJUK_UPDATE('SU102', 'DS001', 20, 10, 40);
수강신청번호, 개설과목코드를 기준으로 출결, 필기, 실기 점수를 수정하는 프로시저
개설과목 테이블에서 설정한 배점과 입력점수가 맞지 않으면 예외발생
*/

CREATE OR REPLACE PROCEDURE PRC_PROF_SUNGJUK_DELETE     /*학생 성적 삭제 프로시저*/
( V_SUGNO   IN SUNG_TABLE.SUG_NO%TYPE
, V_DSUBNO  IN SUNG_TABLE.DSUB_NO%TYPE
)
IS
    S_SUGNO     SUG_TABLE.SUG_NO%TYPE;
    S_DSUBNO    DSUB_TABLE.DSUB_NO%TYPE;
BEGIN
    SELECT SUG_NO, DSUB_NO INTO S_SUGNO, S_DSUBNO
    FROM SUNG_TABLE
    WHERE SUG_NO = V_SUGNO
      AND DSUB_NO = V_DSUBNO;

    UPDATE SUNG_TABLE
    SET SUNG_ATT = NULL
      , SUNG_W = NULL
      , SUNG_P = NULL
    WHERE SUG_NO = S_SUGNO AND DSUB_NO = S_DSUBNO;
    
    
END;
--==>> Procedure PRC_PROF_SUNGJUK_DELETE이(가) 컴파일되었습니다.


/*
-- EXEC PRC_PROF_SUNGJUK_DELETE('SU102', 'DS001');
수강신청번호, 개설과목코드를 기준으로 투플을 삭제하는 프로시저
성적 테이블은 값 삭제 시 다른 테이블에 영향을 미치지 않음
*/

CREATE OR REPLACE PROCEDURE PRC_PROF_BAEJUM     /*과목별 배점 입력 프로시저*/
( V_DSUBNO  IN DSUB_TABLE.DSUB_NO%TYPE
, V_ATT     IN DSUB_TABLE.ATT_SCORE%TYPE
, V_W       IN DSUB_TABLE.W_SCORE%TYPE
, V_P       IN DSUB_TABLE.P_SCORE%TYPE
)
IS
BEGIN
    UPDATE DSUB_TABLE
    SET ATT_SCORE = V_ATT, W_SCORE = V_W, P_SCORE = V_P
    WHERE DSUB_NO = V_DSUBNO;
    
    COMMIT;
END;
--==>> Procedure PRC_PROF_BAEJUM이(가) 컴파일되었습니다.


/*
-- EXEC PRC_PROF_BAEJUM('DS001', 20, 40, 40);
개설과목 테이블에서 개설과목코드를 기준으로 각 과목별 배점을 입력하는 테이블
SCORE_CK 제약조건으로 배점의 총합이 100이 되어야함
*/

-- DSUB_TABLE의 배점의 총점이 100이 되도록 체크 제약조건 추가
ALTER TABLE DSUB_TABLE
ADD CONSTRAINT SCORE_CK CHECK((ATT_SCORE + W_SCORE + P_SCORE) = 100);


-- 교수 데이터 입력 시 자동으로 비밀번호 컬럼의 값 생성 트리거
CREATE OR REPLACE TRIGGER TRG_PASSWORD_PROF
                                AFTER
                                INSERT ON PROF_TABLE                          
BEGIN
    IF (INSERTING)
        THEN UPDATE PROF_TABLE
                 SET PROF_PW =  SUBSTR(PROF_SSN,8);
    END IF;
END;


-- 학생 데이터 입력 시 자동으로 비밀번호 컬럼의 값 생성 트리거
CREATE OR REPLACE TRIGGER TRG_PASSWORD_STU
                                AFTER
                                INSERT ON STU_TABLE
                               
BEGIN
    IF (INSERTING)
        THEN UPDATE STU_TABLE
                 SET STU_PW =  SUBSTR(STU_SSN,8);
    END IF;
END;
/*
INSERT INTO STU_TABLE(STU_ID, STU_NAME, STU_SSN)
VALUES('ST010', '가나다', '970419-1030028');
INSERT INTO STU_TABLE(STU_ID, STU_NAME, STU_SSN)
VALUES('ST011', '각난닫', '911212-2222222');
*/


-- 학생의 주민등록번호가 고유한 값을 갖도록 유니크 제약조건 추가
ALTER TABLE STU_TABLE
ADD CONSTRAINT STU_SSN_UK UNIQUE(STU_SSN);


-- 교수자의 주민등록번호가 고유한 값을 갖도록 유니크 제약조건 추가
ALTER TABLE PROF_TABLE
ADD CONSTRAINT PROF_SSN_UK UNIQUE(PROF_SSN);


CREATE OR REPLACE VIEW VIEW_USER_STU_F --탈락자만 출력
AS
SELECT  ST.STU_NAME "학생이름", SUNG.DSUB_NO "과목코드", SUG.SUG_NO "수강신청코드", (SUNG.SUNG_ATT + SUNG.SUNG_W + SUNG.SUNG_P)"수강과목총점", DECODE(FL.FAIL_DATE, NULL, 'N', 'Y') "탈락여부"
FROM SUG_TABLE SUG  JOIN  SUNG_TABLE SUNG ON  SUG.SUG_NO = SUNG.SUG_NO
                                    JOIN  FAIL_TABLE FL ON  SUG.SUG_NO = FL.SUG_NO
                                    JOIN  STU_TABLE ST ON  SUG.STU_ID = ST.STU_ID;

                                    
--==>>View VIEW_USER_STU_F이(가) 생성되었습니다.


--전체 출력
CREATE OR REPLACE VIEW VIEW_USER_STU 
AS 
SELECT STU.STU_NAME "학생이름", SUG.SUG_NO "수강신청코드"
      ,SS.SUB_NAME "과목명" ,SUNG.SUNG_ATT + SUNG.SUNG_W + SUNG.SUNG_P "수강총점"
      ,DECODE(FL.FAIL_DATE, NULL, 'N', 'Y') "탈락여부" 
FROM STU_TABLE STU LEFT JOIN SUG_TABLE SUG
                                       ON STU.STU_ID = SUG.STU_ID
                                   LEFT  JOIN SUNG_TABLE SUNG 
                                       ON SUG.SUG_NO = SUNG.SUG_NO
                                   LEFT JOIN FAIL_TABLE FL
                                        ON SUG.SUG_NO = FL.SUG_NO 
                                   LEFT JOIN DSUB_TABLE DS
                                        ON SUNG.DSUB_NO = DS.DSUB_NO
                                   LEFT JOIN SSUB_TABLE SS
                                        ON SS.SSUB_NO = DS.SSUB_NO
ORDER BY STU.STU_NAME;

--==>>View VIEW_USER_STU이(가) 생성되었습니다.


--학생테이블기준 트리거 생성(상위 테이블로 먼저 생성되야 다음 SUG_TABLE 트리거 생성시에도 연쇄적으로 삭제됨)
CREATE OR REPLACE TRIGGER TRG_STU_DELETE 
        BEFORE
        DELETE ON STU_TABLE
        FOR EACH ROW 
BEGIN
        DELETE 
        FROM SUG_TABLE
        WHERE STU_ID = :OLD.STU_ID;
END;
--==>> Trigger TRG_STU_DELETE이(가) 컴파일되었습니다.


-- 수강신청테이블의 수강신청코드 삭제시 연쇄적으로 탈락테이블과 성적테이블의 수강신청코드 삭제
CREATE OR REPLACE TRIGGER TRG_SUG_DELETE
            BEFORE
            DELETE ON SUG_TABLE
            FOR EACH ROW
BEGIN
            DELETE
            FROM FAIL_TABLE
            WHERE SUG_NO= :OLD.SUG_NO;
            
            DELETE
            FROM SUNG_TABLE
            WHERE SUG_NO = :OLD.SUG_NO;
END;
--==>> Trigger TRG_SUG_DELETE이(가) 컴파일되었습니다.


--학생 테이블 정보수정 (입력한 학생의 번호가 일치하면 나머지 값들을 변경하게 하기위한)
CREATE OR REPLACE PROCEDURE PRC_USER_STU_UPDATE
(V_STUID      IN STU_TABLE.STU_ID%TYPE          
,V_STUNAME IN STU_TABLE.STU_NAME%TYPE
,V_STUSSN   IN STU_TABLE.STU_SSN%TYPE
,V_STUPW    IN STU_TABLE.STU_PW%TYPE)
IS
BEGIN
            UPDATE STU_TABLE 
            SET STU_NAME = V_STUNAME
                 , STU_SSN   = V_STUSSN 
                 , STU_PW    = V_STUPW 
            WHERE  STU_ID = V_STUID;
            
            COMMIT;
END;
--==>>Procedure PRC_USER_STU_UPDATE이(가) 컴파일되었습니다.


-- 과정 삽입 프로시저 PRC_SCOR_INSERT
CREATE OR REPLACE PROCEDURE PRC_SCOR_INSERT
( V_COR_NAME    IN  SCOR_TABLE.COR_NAME%TYPE
)
IS
    V_SCOR_NO   SCOR_TABLE.SCOR_NO%TYPE;
BEGIN
    
    SELECT MAX(TO_NUMBER(SUBSTR(SCOR_NO,2)))     INTO V_SCOR_NO
    FROM SCOR_TABLE;
    
    V_SCOR_NO := V_SCOR_NO+1;
    
    IF V_SCOR_NO < 10
        THEN INSERT INTO SCOR_TABLE
             VALUES('C'||'0'||'0'||V_SCOR_NO, V_COR_NAME);
    ELSIF V_SCOR_NO >= 10 AND V_SCOR_NO < 100
        THEN INSERT INTO SCOR_TABLE
             VALUES('C'||'0'||V_SCOR_NO, V_COR_NAME);
    ELSE
        INSERT INTO SCOR_TABLE
        VALUES('C'||V_SCOR_NO, V_COR_NAME);
    
    END IF;
    
    COMMIT;
    
END;
--==>> Procedure PRC_SCOR_INSERT이(가) 컴파일되었습니다.

-- 과정 수정 프로시저 PRC_SCOR_UPDATE
CREATE OR REPLACE PROCEDURE PRC_SCOR_UPDATE
( V_SCOR_NO       IN  SCOR_TABLE.SCOR_NO%TYPE
, V_COR_NAME      IN  SCOR_TABLE.COR_NAME%TYPE
)
IS
BEGIN

    UPDATE SCOR_TABLE
    SET COR_NAME = V_COR_NAME
    WHERE SCOR_NO = V_SCOR_NO;
    
    COMMIT;
    
END;
--==>> Procedure PRC_SCOR_UPDATE이(가) 컴파일되었습니다.

-- 과정 삭제 프로시저 PRC_SCOR_DELETE
CREATE OR REPLACE PROCEDURE PRC_SCOR_DELETE
( V_SCOR_NO     IN  SCOR_TABLE.SCOR_NO%TYPE
)
IS
BEGIN

    DELETE
    FROM SCOR_TABLE
    WHERE SCOR_NO = V_SCOR_NO;
    
    COMMIT;
    
END;
--==>> Procedure PRC_SCOR_DELETE이(가) 컴파일되었습니다.


-- 과정 테이블 삭제 TRIGGER TRG_SCOR_DELETE
CREATE OR REPLACE TRIGGER TRG_SCOR_DELETE
                   BEFORE
                   DELETE ON SCOR_TABLE
                   FOR EACH ROW
BEGIN
    DELETE
    FROM DCOR_TABLE
    WHERE SCOR_NO = :OLD.SCOR_NO;
END;
--==>> Trigger TRG_SCOR_DELETE이(가) 컴파일되었습니다.


-- 교수 정보 삽입 프로시저 PRC_PROF_INSERT
CREATE OR REPLACE PROCEDURE PRC_PROF_INSERT
( V_PROF_ID         IN  PROF_TABLE.PROF_ID%TYPE
, V_PROF_NAME       IN  PROF_TABLE.PROF_NAME%TYPE
, V_PROF_SSN        IN  PROF_TABLE.PROF_SSN%TYPE
)
IS
BEGIN
    INSERT INTO PROF_TABLE(PROF_ID, PROF_NAME, PROF_SSN)
    VALUES(V_PROF_ID, V_PROF_NAME, V_PROF_SSN);
    
    COMMIT;
    
END;
--==>> Procedure PRC_PROF_INSERT이(가) 컴파일되었습니다.


-- 교수 정보 수정 프로시저 PRC_PROF_UPDATE
CREATE OR REPLACE PROCEDURE PRC_PROF_UPDATE
( V_PROF_ID         IN      PROF_TABLE.PROF_ID%TYPE 
, V_PROF_NAME       IN      PROF_TABLE.PROF_NAME%TYPE
, V_PROF_SSN        IN      PROF_TABLE.PROF_SSN%TYPE
)
IS
BEGIN
    -- PROF_TABLE(교수테이블) 이름, 비밀번호 업데이트
    UPDATE PROF_TABLE
    SET PROF_NAME = V_PROF_NAME, PROF_SSN = V_PROF_SSN
    WHERE PROF_ID = V_PROF_ID;
    
END;
--==>> Procedure PRC_PROF_UPDATE이(가) 컴파일되었습니다.

-- 교수 정보 삭제 프로시저 PRC_PROF_DELETE
CREATE OR REPLACE PROCEDURE PRC_PROF_DELETE
( V_PROF_ID     IN  PROF_TABLE.PROF_ID%TYPE
)
IS
BEGIN
    DELETE
    FROM PROF_TABLE
    WHERE PROF_ID = V_PROF_ID;
    
    COMMIT;
END;
--==>> Procedure PRC_PROF_DELETE이(가) 컴파일되었습니다.


--학생 테이블 인서트 프로시저 생성
CREATE OR REPLACE PROCEDURE PRC_STU_INSERT
(V_STUNAME     IN STU_TABLE.STU_NAME%TYPE
,V_STUSSN      IN STU_TABLE.STU_SSN%TYPE

)
IS

V_STUID2   STU_TABLE.STU_ID%TYPE;
V_STUID3   STU_TABLE.STU_ID%TYPE;

BEGIN

    SELECT  MAX(TO_NUMBER(SUBSTR(STU_ID, 3, 5)) + 1) INTO V_STUID2
    FROM    STU_TABLE;
    
    V_STUID3 := 'ST' || LPAD(V_STUID2, 3, 0);
    
    INSERT INTO STU_TABLE(STU_ID, STU_NAME, STU_SSN)
    VALUES(V_STUID3, V_STUNAME, V_STUSSN);
    
    COMMIT;
     
END;
--==>>Procedure PRC_STU_INSERT이(가) 컴파일되었습니다


EXEC PRC_STU_INSERT('박지성','697215-2569887','141519');
--==>>PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM STU_TABLE;
/*
ST009   박혜민   950823-1123456   1123456
ST010   박지성   697215-2569887   2569887
*/
--STU_ID의 경우는 인서트시에 증가해야하는 STU_ID의 자료형이 VARCHAR이므로
--예) ST001의경우 ST를 따로 분리하고 001의경우 테이블의 존재하는 가장큰값
--에서 더하기1을 연산하여 그값이 새로운 학생의 STU_ID로 들어갈수 있게 한다


--학생 테이블 삭제 프로시저
CREATE OR REPLACE PROCEDURE PRC_STU_DELETE
(V_STUID    IN  STU_TABLE.STU_ID%TYPE)
IS
BEGIN
    
    DELETE
    FROM   STU_TABLE
    WHERE  V_STUID = STU_ID; 
    
    COMMIT;
        
END;
--==>>Procedure PRC_STU_DELETE이(가) 컴파일되었습니다.

EXEC PRC_STU_DELETE('ST009');
--==>PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM STU_TABLE;


--학생 테이블 업데이트 프로시저
CREATE OR REPLACE PROCEDURE PRC_STU_UPDATE
(V_STUID    IN  STU_TABLE.STU_ID%TYPE
,V_STUNAME  IN  STU_TABLE.STU_NAME%TYPE
,V_STUSSN   IN  STU_TABLE.STU_SSN%TYPE
,V_STUPW    IN  STU_TABLE.STU_PW%TYPE)
IS
BEGIN

    UPDATE STU_TABLE
       SET STU_NAME = V_STUNAME
     WHERE STU_ID = V_STUID;
     
    UPDATE STU_TABLE
       SET STU_SSN = V_STUSSN
     WHERE STU_ID = V_STUID;
     
    UPDATE STU_TABLE
       SET STU_PW = V_STUPW
     WHERE STU_ID = V_STUID;
     
     COMMIT;
END;
--==>>Procedure PRC_STU_UPDATE이(가) 컴파일되었습니다.

EXEC PRC_STU_UPDATE('ST009', '박박박', '914846-1518487', '2222222');
--==>>PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM STU_TABLE;
--==>>ST009   박박박   914846-1518487   2222222


CREATE OR REPLACE PROCEDURE PRC_SSUB_INSERT     --과목 테이블 인서트 하는 프로시저
(V_SUB_NAME     IN SSUB_TABLE.SUB_NAME%TYPE)

IS
    V_NUM      NUMBER;
    V_SSUB_NO  SSUB_TABLE.SSUB_NO%TYPE;
    
BEGIN

    SELECT MAX(TO_NUMBER(SUBSTR(SSUB_NO,2,4)))+1 INTO V_NUM
    FROM SSUB_TABLE;
    
    V_SSUB_NO := 'S' || LPAD(V_NUM,3,0);
    
    INSERT INTO SSUB_TABLE(SSUB_NO,SUB_NAME) VALUES(V_SSUB_NO,V_SUB_NAME);
    
    COMMIT;
    
END;
--==>> Procedure PRC_SSUB_INSERT이(가) 컴파일되었습니다.

CREATE OR REPLACE PROCEDURE PRC_SSUB_UPDATE    --과목 테이블 업데이트 하는 프로시저
(V_SSUB_NO      IN SSUB_TABLE.SSUB_NO%TYPE
,V_SUB_NAME     IN SSUB_TABLE.SUB_NAME%TYPE
)

IS
BEGIN
    UPDATE SSUB_TABLE
    SET SUB_NAME = V_SUB_NAME
    WHERE SSUB_NO = V_SSUB_NO;
    
    COMMIT;
END;
--==>> Procedure PRC_SSUB_UPDATE이(가) 컴파일되었습니다.


CREATE OR REPLACE PROCEDURE PRC_SSUB_DELETE     --과목 테이블 삭제 하는 프로시저
(V_SSUB_NO      IN SSUB_TABLE.SSUB_NO%TYPE)

IS
BEGIN
    DELETE
    FROM SSUB_TABLE
    WHERE SSUB_NO = V_SSUB_NO;
    
    COMMIT;
END;
--==>> Procedure PRC_SSUB_DELETE이(가) 컴파일되었습니다.


CREATE OR REPLACE PROCEDURE PRC_STU_PW_UPDATE    --학생 비밀번호 바꾸는 프로시저
(V_STU_ID     IN STU_TABLE.STU_ID%TYPE
,V_STU_PW     IN STU_TABLE.STU_PW%TYPE
,V_STU_NEWPW  IN STU_TABLE.STU_PW%TYPE
)
IS
    USER_DEFINE_ERROR1        EXCEPTION;
    USER_DEFINE_ERROR2        EXCEPTION;
    TEMP_ID                   NUMBER;
    TEMP_PW                   NUMBER;
BEGIN

    SELECT COUNT(*)              INTO TEMP_ID
    FROM STU_TABLE
    WHERE STU_ID = V_STU_ID;

    IF TEMP_ID = 0
        THEN RAISE USER_DEFINE_ERROR1;  
    END IF;

    SELECT COUNT(*)              INTO TEMP_PW
    FROM STU_TABLE
    WHERE STU_ID = V_STU_ID AND STU_PW = V_STU_PW;

    IF TEMP_PW = 0
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;
    
    UPDATE STU_TABLE
    SET STU_PW = V_STU_NEWPW
    WHERE STU_ID = V_STU_ID AND STU_PW=V_STU_PW;
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20006, '아이디가 일치하지않습니다.');
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20007, '비밀번호가 일치하지않습니다.');
            
    COMMIT;
END;
--==>> Procedure PRC_STU_PW_UPDATE이(가) 컴파일되었습니다.


CREATE OR REPLACE PROCEDURE PRC_FAIL_INSERT     /*중도탈락학생 입력 프로시저*/
( V_SUGNO   IN FAIL_TABLE.SUG_NO%TYPE
, V_DATE    IN FAIL_TABLE.FAIL_DATE%TYPE
, V_REASON  IN FAIL_TABLE.FAIL_REA%TYPE := NULL
)
IS
BEGIN
    INSERT INTO FAIL_TABLE(SUG_NO, FAIL_DATE, FAIL_REA)
    VALUES(V_SUGNO, V_DATE, V_REASON);
    
    COMMIT;
END;
--==>> Procedure PRC_FAIL_INSERT이(가) 컴파일되었습니다.

/*
-- EXEC PRC_FAIL_INSERT('SU102', '19/01/11');
EXEC PRC_FAIL_INSERT('SU112', '19/01/11', '멍청해서');
중도탈락 테이블에 수강번호, 탈락일자, 탈락사유를 입력하는 프로시저
탈락사유를 입력하지 않을 시 자동으로 NULL 입력
*/


CREATE OR REPLACE PROCEDURE PRC_FAIL_UPDATE     /*중도탈락학생 수정 프로시저*/
( V_SUGNO   IN FAIL_TABLE.SUG_NO%TYPE
, V_DATE    IN FAIL_TABLE.FAIL_DATE%TYPE
, V_REASON  IN FAIL_TABLE.FAIL_REA%TYPE := NULL
)
IS
    F_SUGNO FAIL_TABLE.SUG_NO%TYPE;
BEGIN
    UPDATE FAIL_TABLE
    SET FAIL_DATE = V_DATE, FAIL_REA = V_REASON
    WHERE SUG_NO = V_SUGNO;
    
    COMMIT;
    
END;
--==>> Procedure PRC_FAIL_UPDATE이(가) 컴파일되었습니다.

/*
-- EXEC PRC_FAIL_UPDATE('SU102', '19/10/08', '나는너무멍청해');
중도탈락 테이블의 수강번호를 기준으로 탈락일자, 탈락사유를 수정하는 프로시저
탈락사유를 입력하지 않을 시 자동으로 NULL 입력
*/


CREATE OR REPLACE PROCEDURE PRC_FAIL_DELETE     /*중도탈락학생 삭제 프로시저*/
( V_SUGNO   IN FAIL_TABLE.SUG_NO%TYPE
)
IS
BEGIN
    DELETE
    FROM FAIL_TABLE
    WHERE SUG_NO = V_SUGNO;
    
    COMMIT;
    
END;
--==>> Procedure PRC_FAIL_DELETE이(가) 컴파일되었습니다.

/*
-- EXEC PRC_FAIL_DELETE('SU102');
중도탈락 테이블의 수강번호를 기준으로 레코드를 삭제하는 프로시저
*/


-- 외래키 제약 조건 삭제 후 옵션 부여하여 재지정(ROOM_NO_FK)
ALTER TABLE DCOR_TABLE
DROP CONSTRAINT ROOM_NO_FK;
ALTER TABLE DCOR_TABLE
ADD CONSTRAINT ROOM_NO_FK FOREIGN KEY(ROOM_NO)
                          REFERENCES ROOM_TABLE(ROOM_NO)
                          ON DELETE SET NULL;
                          
-- 외래키 제약 조건 삭제 후 옵션 부여하여 재지정(BOOK_NO_FK)                          
ALTER TABLE DSUB_TABLE
DROP CONSTRAINT BOOK_NO_FK;
ALTER TABLE DSUB_TABLE
ADD CONSTRAINT BOOK_NO_FK FOREIGN KEY(BOOK_NO)
                          REFERENCES BOOK_TABLE(BOOK_NO)
                          ON DELETE SET NULL;

-- 외래키 제약 조건 삭제 후 옵션 부여하여 재지정(PROF_ID_FK)
ALTER TABLE DSUB_TABLE
DROP CONSTRAINT PROF_ID_FK;
ALTER TABLE DSUB_TABLE
ADD CONSTRAINT PROF_ID_FK FOREIGN KEY(PROF_ID)
                          REFERENCES PROF_TABLE(PROF_ID)
                          ON DELETE SET NULL;


CREATE OR REPLACE PROCEDURE PRC_SYS_INSERT      /*관리자 정보 입력 프로시저*/
( V_NAME    IN SYS_TABLE.SYS_NAME%TYPE
, V_PW      IN SYS_TABLE.SYS_PW%TYPE
)
IS
    S_ID  NUMBER;
    S_SYSID SYS_TABLE.SYS_ID%TYPE;
BEGIN
    SELECT MAX(TO_NUMBER(SUBSTR(SYS_ID, 2, 4)))+1 INTO S_ID
    FROM SYS_TABLE;
    
    S_SYSID := 'A' || LPAD(S_ID, 3, 0);
    
    INSERT INTO SYS_TABLE(SYS_ID, SYS_PW, SYS_NAME)
    VALUES(S_SYSID, V_PW, V_NAME);
    
    COMMIT;
END;
--==>> Procedure PRC_SYS_INSERT이(가) 컴파일되었습니다.

/*
-- EXEC PRC_SYS_INSERT('성열원관리자', 'SYW1234');
관리자 이름, 비밀번호를 입력받아 값을 테이블에 저장하는 프로시저.
관리자 번호는 기존에 존재하는 번호들을 조회하여 1을 올린 값으로 자동 생성
*/


CREATE OR REPLACE PROCEDURE PRC_SYS_UPDATE      /*관리자 정보 수정 프로시저*/
( V_ID      IN SYS_TABLE.SYS_ID%TYPE
, V_PW      IN SYS_TABLE.SYS_PW%TYPE
, V_NAME    IN SYS_TABLE.SYS_NAME%TYPE
)
IS
    TEMP_ID NUMBER;
    ERROR1  EXCEPTION;
BEGIN
    SELECT COUNT(*) INTO TEMP_ID
    FROM SYS_TABLE
    WHERE SYS_ID = V_ID;

    IF TEMP_ID = 0
        THEN RAISE ERROR1;  
    END IF;
    
    UPDATE SYS_TABLE
    SET SYS_PW = V_PW, SYS_NAME = V_NAME
    WHERE SYS_ID = V_ID;
    
    EXCEPTION
        WHEN ERROR1
            THEN RAISE_APPLICATION_ERROR(-20009, '입력하신 아이디가 존재하지 않습니다.');
    COMMIT;
END;
--==>> Procedure PRC_SYS_UPDATE이(가) 컴파일되었습니다.

/*
-- EXEC PRC_SYS_UPDATE('A002', 'SYW123', '성열원');
입력받는 관리자 아이디를 기준으로 비밀번호, 관리자 이름을 변경하는 프로시저.
아이디가 일치하지 않는 경우 에러 발생.
*/


CREATE OR REPLACE PROCEDURE PRC_SYS_DELETE      /*관리자 정보 삭제 프로시저*/
( V_ID  IN SYS_TABLE.SYS_ID%TYPE
, V_PW  IN SYS_TABLE.SYS_PW%TYPE
)
IS
    TEMP_ID NUMBER;
    TEMP_PW NUMBER;
    ERROR1  EXCEPTION;
    ERROR2  EXCEPTION;
BEGIN

    SELECT COUNT(*) INTO TEMP_ID
    FROM SYS_TABLE
    WHERE SYS_ID = V_ID;

    IF TEMP_ID = 0
        THEN RAISE ERROR1;  
    END IF;

    SELECT COUNT(*) INTO TEMP_PW
    FROM SYS_TABLE
    WHERE SYS_ID = V_ID AND SYS_PW = V_PW;

    IF TEMP_PW = 0
        THEN RAISE ERROR2;
    END IF;
    
    DELETE
    FROM SYS_TABLE
    WHERE SYS_ID = V_ID AND SYS_PW = V_PW;
    
    EXCEPTION
        WHEN ERROR1
            THEN RAISE_APPLICATION_ERROR(-20009, '입력하신 아이디가 존재하지 않습니다.');
        WHEN ERROR2
            THEN RAISE_APPLICATION_ERROR(-20007, '비밀번호가 일치하지않습니다.');
    COMMIT;
END;
--==>> Procedure PRC_SYS_DELETE이(가) 컴파일되었습니다.
/*
-- EXEC PRC_SYS_DELETE('A002', 'SYW123');
관리자 아이디와 비밀번호를 입력받아 알맞은 레코드를 삭제하는 프로시저.
아이디와 비밀번호가 일치하지 않을 경우 에러 발생.
*/


CREATE OR REPLACE PROCEDURE PRC_PROF_PW_UPDATE      /*교수 비밀번호 변경 프로시저*/
( V_ID      IN PROF_TABLE.PROF_ID%TYPE
, V_PW      IN PROF_TABLE.PROF_PW%TYPE
, V_NEWPW   IN PROF_TABLE.PROF_PW%TYPE
)
IS
    TEMP_ID NUMBER;
    TEMP_PW NUMBER;
    ERROR1  EXCEPTION;
    ERROR2  EXCEPTION;
BEGIN

    SELECT COUNT(*) INTO TEMP_ID
    FROM PROF_TABLE
    WHERE PROF_ID = V_ID;

    IF TEMP_ID = 0
        THEN RAISE ERROR1;  
    END IF;

    SELECT COUNT(*) INTO TEMP_PW
    FROM PROF_TABLE
    WHERE PROF_ID = V_ID AND PROF_PW = V_PW;

    IF TEMP_PW = 0
        THEN RAISE ERROR2;
    END IF;

    UPDATE PROF_TABLE
    SET PROF_PW = V_NEWPW
    WHERE PROF_ID = V_ID AND PROF_PW = V_PW;

    EXCEPTION
        WHEN ERROR1
            THEN RAISE_APPLICATION_ERROR(-20006, '아이디가 일치하지않습니다.');
        WHEN ERROR2
            THEN RAISE_APPLICATION_ERROR(-20007, '비밀번호가 일치하지않습니다.');
    COMMIT;
END;
--==>> Procedure PRC_PROF_PW_UPDATE이(가) 컴파일되었습니다.

/*
-- EXEC PRC_PROF_PW_UPDATE('P001', '2234567', '1234567');
교수번호, 비밀번호와 바꿀 비밀번호를 한꺼번에 받아 변경을 수행하는 프로시저.
입력받은 아이디가 교수 테이블에 존재하지 않을 경우 에러 발생,
입력받은 비밀번호가 교수 테이블에 존재하지 않을 경우 에러 발생
*/


CREATE OR REPLACE PROCEDURE PRC_BOOK_INSERT -- 교재 테이블 데이터 입력 프로시저
( V_BOOK_NAME   IN      BOOK_TABLE.BOOK_NAME%TYPE -- 입력할 교재명
, V_BOOK_PUB    IN      BOOK_TABLE.BOOK_PUB%TYPE  -- 입력할 출판사명
)
IS
    TEMP_MAX    NUMBER; -- NUMBERING을 하기위한 변수선언
BEGIN
        SELECT MAX(TO_NUMBER(SUBSTR(BOOK_NO, 2))) INTO TEMP_MAX -- 등록된 교재번호 중 마지막 값 변수에 저장
        FROM BOOK_TABLE;
        
        IF (TEMP_MAX+1 >= 1 AND TEMP_MAX+1 < 10)
            THEN INSERT INTO BOOK_TABLE VALUES(('B00' || (TEMP_MAX+1)) , V_BOOK_NAME, V_BOOK_PUB);
        ELSIF (TEMP_MAX+1 >= 10 AND TEMP_MAX+1 < 100) -- 등록된 마지막 교재번호가 두 자릿수일 경우
            THEN INSERT INTO BOOK_TABLE VALUES(('B0' || (TEMP_MAX+1)) , V_BOOK_NAME, V_BOOK_PUB);
        ELSIF (TEMP_MAX+1 >= 100) -- 등록된 마지막 교재번호가 세 자릿수일 경우
            THEN INSERT INTO BOOK_TABLE VALUES(('B' || (TEMP_MAX+1)) , V_BOOK_NAME, V_BOOK_PUB);
        END IF;
        
        COMMIT;
END;

--==>> Procedure PRC_BOOK_INSERT이(가) 컴파일되었습니다.


CREATE OR REPLACE PROCEDURE PRC_BOOK_UPDATE         -- 교재 테이블 데이터 수정 프로시저
( V_BOOK_NO     IN      BOOK_TABLE.BOOK_NO%TYPE     -- 기존 교재 번호
, V_BOOK_NAME   IN      BOOK_TABLE.BOOK_NAME%TYPE   -- 변경할 교재명
, V_BOOK_PUB    IN      BOOK_TABLE.BOOK_PUB%TYPE    -- 변경할 교재 출판사
)
IS
BEGIN

        UPDATE BOOK_TABLE
        SET BOOK_NAME = V_BOOK_NAME, BOOK_PUB = V_BOOK_PUB -- 변경할 교재명, 교재 출판사 적용
        WHERE BOOK_NO = V_BOOK_NO; -- 교재번호 일치조건
        
        COMMIT;
END;
--==>> Procedure PRC_BOOK_UPDATE이(가) 컴파일되었습니다.


CREATE OR REPLACE PROCEDURE PRC_BOOK_DELETE         -- 교재 테이블 데이터 삭제 프로시저
( V_BOOK_NO     IN      BOOK_TABLE.BOOK_NO%TYPE     -- 삭제할 교재번호 입력
)
IS
BEGIN
        DELETE
        FROM BOOK_TABLE
        WHERE BOOK_NO = V_BOOK_NO; -- 교재번호 일치조건
        
        COMMIT;
END;
--==>> Procedure PRC_BOOK_DELETE이(가) 컴파일되었습니다.


CREATE OR REPLACE PROCEDURE PRC_SUG_INSERT -- 수강신청 테이블 데이터 입력 프로시저
( V_STU_ID      IN      SUG_TABLE.STU_ID%TYPE -- 입력할 학생번호
, V_DCOR_NO     IN      SUG_TABLE.DCOR_NO%TYPE -- 입력할 개설과정코드
)
IS
    TEMP_NUMBER NUMBER; -- 수강신청 테이블 내 마지막 코드값을 담을 변수선언
    
    V_DCOR_NON SUG_TABLE.DCOR_NO%TYPE;
    V_COUNTER NUMBER;
    V_START NUMBER;
    V_START_COUNTER NUMBER;
    V_SUG_NO SUG_TABLE.SUG_NO%TYPE;
    COUNTER NUMBER;
BEGIN
        SELECT MAX(TO_NUMBER(SUBSTR(SUG_NO, 3))) INTO TEMP_NUMBER -- 마지막 코드값 담기
        FROM SUG_TABLE;

        IF (TEMP_NUMBER+1 >=1 AND TEMP_NUMBER+1 < 10)
            THEN INSERT INTO SUG_TABLE VALUES(('SU00' || (TEMP_NUMBER+1)), V_STU_ID, V_DCOR_NO);
        ELSIF (TEMP_NUMBER+1 >= 10 AND TEMP_NUMBER+1 < 100) -- 마지막 코드값이 두 자릿수인 경우
            THEN INSERT INTO SUG_TABLE VALUES(('SU0' || (TEMP_NUMBER+1)), V_STU_ID, V_DCOR_NO);
        ELSIF (TEMP_NUMBER+1 >= 100) -- 마지막 코드값이 세 자릿수인 경우
            THEN INSERT INTO SUG_TABLE VALUES(('SU' || (TEMP_NUMBER+1)), V_STU_ID, V_DCOR_NO);
        END IF;
        
        COMMIT;
        
        
                SELECT DCOR_NO INTO V_DCOR_NON
                FROM SUG_TABLE
                WHERE SUG_NO = (SELECT MAX(SUG_NO)
                                FROM SUG_TABLE);
                                
        
                SELECT SUG_NO INTO V_SUG_NO
                FROM SUG_TABLE
                WHERE SUG_NO = (SELECT MAX(SUG_NO)
                                FROM SUG_TABLE);
                
                SELECT COUNT(DSUB_NO) INTO V_COUNTER
                FROM DSUB_TABLE
                WHERE DCOR_NO = V_DCOR_NON;
                
                SELECT MIN(TO_NUMBER(SUBSTR(DSUB_NO,3))) INTO V_START
                FROM DSUB_TABLE
                WHERE DCOR_NO = V_DCOR_NON;
                
                V_START_COUNTER := V_START;
                
                FOR COUNTER IN V_START .. (V_COUNTER + V_START -1) LOOP  
                    INSERT INTO SUNG_TABLE VALUES(V_SUG_NO, ('DS' || LPAD(V_START_COUNTER,3,0)), NULL, NULL, NULL);
                    V_START_COUNTER := V_START_COUNTER + 1;
                END LOOP;
                
                COMMIT;
       

END;
--==>> Procedure PRC_SUG_INSERT이(가) 컴파일되었습니다.


CREATE OR REPLACE PROCEDURE PRC_SUG_UPDATE      -- 수강신청 테이블 데이터 수정 프로시저
( V_SUG_NO      IN      SUG_TABLE.SUG_NO%TYPE   -- 변경할 수강신청코드
, V_STU_ID      IN      SUG_TABLE.STU_ID%TYPE   -- 변경할 학생번호 
, V_DCOR_NO     IN      SUG_TABLE.DCOR_NO%TYPE  -- 변경할 개설과정코드
)
IS
BEGIN
        UPDATE SUG_TABLE 
        SET STU_ID = V_STU_ID, DCOR_NO = V_DCOR_NO -- 학생번호, 개설과정코드 수정
        WHERE SUG_NO = V_SUG_NO; -- 수강신청코드 일치 조건
        
        COMMIT;
END;
--==>> Procedure PRC_SUG_UPDATE이(가) 컴파일되었습니다.


CREATE OR REPLACE PROCEDURE PRC_SUG_DELETE      -- 수강신청 테이블 데이터 삭제 프로시저
( V_SUG_NO      IN      SUG_TABLE.SUG_NO%TYPE   -- 삭제할 수강신청코드
)
IS
BEGIN
        DELETE
        FROM SUG_TABLE
        WHERE SUG_NO = V_SUG_NO; -- 수강신청코드 일치 조건
        
        COMMIT;
END;
--==>> Procedure PRC_SUG_DELETE이(가) 컴파일되었습니다.



CREATE OR REPLACE PROCEDURE PRC_DSUB_INSERT         -- 개설과목 테이블 데이터 입력 프로시저
( V_DCOR_NO     IN      DSUB_TABLE.DCOR_NO%TYPE     -- 입력할 개설과정코드 
, V_SSUB_NO     IN      DSUB_TABLE.SSUB_NO%TYPE     -- 입력할 과목코드
, V_SUB_START   IN      DSUB_TABLE.SUB_START%TYPE   -- 입력할 개설과목 시작일
, V_SUB_END     IN      DSUB_TABLE.SUB_END%TYPE     -- 입력할 개설과목 종료일
, V_PROF_ID     IN      DSUB_TABLE.PROF_ID%TYPE     -- 입력할 담당교수명
, V_BOOK_NO     IN      DSUB_TABLE.BOOK_NO%TYPE  :=  NULL -- 입력할 교재명(추후 입력 가능)
)
IS
  TEMP_NUMBER NUMBER; -- NUMBERING 변수 선언
  TEMP_DCOR_START DATE; -- 과정 개설일 저장 변수 선언
  TEMP_DSUB_BEF_END DATE; -- 등록할 개설과목의 바로 전 과목에 대한 종료일 저장 변수 선언
  
  USER_DEFINE_ERROR1 EXCEPTION; -- 예외 처리 변수 선언
  USER_DEFINE_ERROR2 EXCEPTION; -- 예외 처리 변수 선언
BEGIN
    
    SELECT MAX(TO_NUMBER(SUBSTR(DSUB_NO,3))) INTO TEMP_NUMBER -- 테이블 내 마지막 코드순서 저장
    FROM DSUB_TABLE;
    
    SELECT COR_DATE INTO TEMP_DCOR_START -- 해당 개설과목이 포함된 개설과정의 개설일 저장
    FROM DCOR_TABLE
    WHERE DCOR_NO = V_DCOR_NO;
    
    SELECT MAX(T.과목끝일) INTO TEMP_DSUB_BEF_END -- 등록할 개설과목의 바로 전 과목에 대한 종료일 저장
    FROM
    ( 
        SELECT SUB_END"과목끝일"
        FROM DSUB_TABLE
        WHERE DCOR_NO = V_DCOR_NO
          AND SUB_START < V_SUB_START
    ) T;
    
    
    IF (V_SUB_START < TEMP_DCOR_START) -- 등록할 과목의 시작일이 개설일보다 앞설 경우 예외처리 발생
        THEN RAISE USER_DEFINE_ERROR1;
    END IF;
    
    IF (V_SUB_START < TEMP_DSUB_BEF_END) -- 등록할 과목의 시작일이 바로 인접한 과목의 종료일보다 앞설 경우 예외처리 발생
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;
    
    IF ((TEMP_NUMBER+1) >=1 AND (TEMP_NUMBER+1) < 10) -- 개설과목코드의 숫자부분이 한 자릿수 일 때
        THEN INSERT INTO DSUB_TABLE VALUES(('DS00' || (TEMP_NUMBER+1)), V_DCOR_NO, V_SSUB_NO, V_SUB_START, V_SUB_END, NULL, NULL, NULL, V_PROF_ID, V_BOOK_NO);
    ELSIF ((TEMP_NUMBER+1) >= 10 AND (TEMP_NUMBER+1) < 100) -- 개설과목코드의 숫자부분이 두 자릿수 일 때
        THEN INSERT INTO DSUB_TABLE VALUES(('DS0' || (TEMP_NUMBER+1)), V_DCOR_NO, V_SSUB_NO, V_SUB_START, V_SUB_END, NULL, NULL, NULL, V_PROF_ID, V_BOOK_NO);
    ELSIF ((TEMP_NUMBER+1) >= 100) -- 개설과목코드의 숫자부분이 세 자릿수 일 때
        THEN INSERT INTO DSUB_TABLE VALUES(('DS' || (TEMP_NUMBER+1)), V_DCOR_NO, V_SSUB_NO, V_SUB_START, V_SUB_END, NULL, NULL, NULL, V_PROF_ID, V_BOOK_NO);
    END IF;
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR1 -- 예외처리 1
            THEN RAISE_APPLICATION_ERROR(-20020, '과정개설일보다 과목시작일이 앞설 수 없습니다.');
        WHEN USER_DEFINE_ERROR2 -- 예외처리 2
            THEN RAISE_APPLICATION_ERROR(-20021, '과목기간이 겹칠 수 없습니다.');
            
    COMMIT;
END;
--==>> Procedure PRC_DSUB_INSERT이(가) 컴파일되었습니다.


CREATE OR REPLACE PROCEDURE PRC_DSUB_UPDATE         -- 개설과목 테이블 데이터 수정 프로시저
( V_DSUB_NO     IN      DSUB_TABLE.DSUB_NO%TYPE     -- 수정할 개설과목 번호 입력
, V_SUB_START   IN      DSUB_TABLE.SUB_START%TYPE   -- 수정할 개설과목 시작일
, V_SUB_END     IN      DSUB_TABLE.SUB_END%TYPE     -- 수정할 개설과목 종료일
)
IS
  
  TEMP_DCOR_START DATE; -- 해당 개설과목이 포함된 개설과정의 개설일 저장 변수 선언
  TEMP_DSUB_BEF_END DATE; -- 해당 개설과목에 바로 앞선 개설과목의 종료일 저장 변수 선언
  TEMP_DSUB_BEF_START DATE; -- 해당 개설과목에 바로 뒤에 있는 개설과목의 시작일 저장 변수 선언
  
  USER_DEFINE_ERROR1 EXCEPTION; -- 예외 처리 변수 선언
  USER_DEFINE_ERROR2 EXCEPTION; -- 예외 처리 변수 선언
  
BEGIN

    
    SELECT COR_DATE INTO TEMP_DCOR_START -- 해당 개설과목이 포함된 개설과정의 개설일 저장
    FROM DCOR_TABLE
    WHERE DCOR_NO = (SELECT DCOR_NO
                     FROM DSUB_TABLE
                     WHERE DSUB_NO = V_DSUB_NO);
    
    SELECT MAX(T.과목끝일) INTO TEMP_DSUB_BEF_END -- 해당 개설과목에 바로 뒤에오는 개설과목의 시작일 저장
    FROM
    ( 
        SELECT SUB_END"과목끝일"
        FROM DSUB_TABLE
        WHERE DCOR_NO = (SELECT DCOR_NO
                         FROM DSUB_TABLE
                         WHERE DSUB_NO = V_DSUB_NO)
          AND SUB_START < V_SUB_START
    ) T;
    
    SELECT MIN(T.과목시작일) INTO TEMP_DSUB_BEF_START -- 해당 개설과목에 바로 앞선 개설과목의 종료일 저장
    FROM
    ( 
        SELECT SUB_START"과목시작일"
        FROM DSUB_TABLE
        WHERE DCOR_NO = (SELECT DCOR_NO
                         FROM DSUB_TABLE
                         WHERE DSUB_NO = V_DSUB_NO)
          AND SUB_START > V_SUB_START
    ) T;
    
    
    
    
    IF (V_SUB_START <= TEMP_DCOR_START) -- 변경하려는 시작일이 개설과정의 개설일보다 앞설 경우 예외처리 발생
        THEN RAISE USER_DEFINE_ERROR1;
    END IF;
    
    IF (V_SUB_START <= TEMP_DSUB_BEF_END) -- 변경하려는 시작일이 앞선 개설과목의 종료일보다 앞설 경우 예외처리 발생
       THEN IF (TEMP_DSUB_BEF_END IS NOT NULL)
                THEN RAISE USER_DEFINE_ERROR2;
            END IF; 
    END IF;   
        
    IF (V_SUB_END >= TEMP_DSUB_BEF_START) -- 변경하려는 종료일이 바로 뒷순서의 개설과목 시작일보다 늦을 경우 예외처리 발생
        THEN IF (TEMP_DSUB_BEF_START IS NOT NULL)
                THEN RAISE USER_DEFINE_ERROR2;
             END IF;
    END IF;
    
    UPDATE DSUB_TABLE 
    SET SUB_START = V_SUB_START, SUB_END = V_SUB_END -- 개설과목 시작일, 개설과목 끝일 수정
    WHERE DSUB_NO = V_DSUB_NO;
    
    
     EXCEPTION
        WHEN USER_DEFINE_ERROR1 -- 예외처리 1
            THEN RAISE_APPLICATION_ERROR(-20020, '과정개설일보다 과목시작일이 앞설 수 없습니다.');
        WHEN USER_DEFINE_ERROR2 -- 예외처리 2
            THEN RAISE_APPLICATION_ERROR(-20021, '과목기간이 겹칠 수 없습니다.');
            
    COMMIT;
        
END;
--==>> Procedure PRC_DSUB_UPDATE이(가) 컴파일되었습니다.


CREATE OR REPLACE PROCEDURE PRC_DSUB_DELETE     -- 개설과목 테이블 데이터 삭제
( V_DSUB_NO     IN      DSUB_TABLE.DSUB_NO%TYPE -- 삭제할 개설과목 번호 입력
)
IS
    V_SUB_START DSUB_TABLE.SUB_START%TYPE; -- 해당 개설과목 시작일 변수 선언
    V_SUB_END DSUB_TABLE.SUB_END%TYPE; -- 해당 개설과목 종료일 변수 선언
    
    USER_DEFINE_ERROR EXCEPTION; -- 예외 처리 변수 선언
BEGIN
        SELECT SUB_START INTO V_SUB_START -- 해당 개설과목 시작일 변수 저장
        FROM DSUB_TABLE
        WHERE DSUB_NO = V_DSUB_NO;
        
        SELECT SUB_END INTO V_SUB_END -- 해당 개설과목 종료일 변수 저장
        FROM DSUB_TABLE
        WHERE DSUB_NO = V_DSUB_NO;
        
        IF ( (V_SUB_START < SYSDATE) AND (V_SUB_END > SYSDATE) )
            THEN RAISE USER_DEFINE_ERROR;
        END IF;
        
        DELETE
        FROM DSUB_TABLE
        WHERE DSUB_NO = V_DSUB_NO; -- 해당 개설과목코드 일치 조건
        
        
        COMMIT;
        
        EXCEPTION
            WHEN USER_DEFINE_ERROR
                THEN RAISE_APPLICATION_ERROR(-20022, '진행중인 강의는 삭제할 수 없습니다.');
        
        
END;
--==>> Procedure PRC_DSUB_DELETE이(가) 컴파일되었습니다.

-- 커밋
COMMIT;
--==>> 커밋 완료.

