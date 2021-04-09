
-- # DML : 데이터 조작어
-- SELECT, INSERT, UPDATE, DELETE
-- 데이터 추가
INSERT INTO
    board (bno, title, content, writter, reg_date)
VALUES
    (4, '4번글이에요~', '재밌는 내용입니다.', '마이콜', SYSDATE);
    
-- PK는 중복된 데이터를 저장할 수 없음.
    
COMMIT;

SELECT * FROM BOARD;
    
INSERT INTO
    board (bno, content, writter, reg_date)
VALUES
    (2, '재밌는 내용2입니다. 아주 재밌죠.', '마이콜', SYSDATE);
    
INSERT INTO
    board (bno, title, writter, reg_date)
VALUES
    (3, '안녕~DJLSKJFLSKDJFLSDKJFSDLK', '마이콜', SYSDATE);
    
COMMIT;

SELECT * FROM BOARD;

INSERT INTO
    board
VALUES
    (4, '안녕~', '재밌는 내용입니다. 아주 재밌다구요.', '마이콜', SYSDATE);
    
COMMIT;

SELECT * FROM BOARD;

-- 데이터 수정
UPDATE BOARD
SET WRITTER='수정자'
WHERE bno = 1;

UPDATE BOARD
SET WRITTER='수정자',
    CONTENT = 'hello goodbye~'
WHERE bno = 3;

-- UPDATE에서 WHERE 조건이 생략될 경우
UPDATE BOARD
SET TITLE = 'TEST';

-- 전체 데이터가 변경됨

COMMIT;

SELECT * FROM BOARD;

-- 데이터 삭제
DELETE FROM BOARD 
WHERE BNO = 4;

DELETE FROM BOARD;
-- WHERE가 빠지면 전부 삭제됨

COMMIT;

SELECT * FROM BOARD;

INSERT INTO
    board (bno, title, content, writter, reg_date)
VALUES
    (2, '제목', '재밌는 내용2입니다. 아주 재밌죠.', '마이콜', SYSDATE);
    
    INSERT INTO
    board (bno, title, content, writter, reg_date)
VALUES
    (3, '제목124', '재밌는 내용2입니다. 아주 재밌죠.', '마이콜', SYSDATE);
    
    INSERT INTO
    board (bno, title, content, writter, reg_date)
VALUES
    (1, '제목ㅁㄴㅇㄹ', '재밌는 내용2입니다. 아주 재밌죠.', '마이콜', SYSDATE);
    
    
    COMMIT;

SELECT * FROM BOARD;

-- 전체 데이터 삭제
-- 1. WHERE절을 생략한 DELETE절 (ROLLBACK 가능)
DELETE FROM BOARD;
ROLLBACK;

-- 2. TRUNCATE TABLE DDL을 사용한 방법 (ROLLBACK 불가능 / 테이블 구조는 삭제되지 않음)
-- FK 설정 해제
ALTER TABLE REPLY 
DROP CONSTRAINT fk_reply_bno;

TRUNCATE TABLE BOARD;

-- 3. DROP TABLE DDL을 사용한 방법 (ROLLBACK 불가능 / 테이블 구조도 삭제됨)
DROP TABLE BOARD;

SELECT * FROM BOARD;