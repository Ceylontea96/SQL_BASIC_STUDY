
-- DDL(데이터 정의어)
-- CREATE TABLE
CREATE TABLE BOARD (
    BNO NUMBER(10),
    TITLE VARCHAR2(200) NOT NULL,
    CONTENT VARCHAR2(3000),
    WRITTER VARCHAR2(50) NOT NULL,
    REG_DATE DATE NOT NULL
);

-- PK 설정
ALTER TABLE BOARD ADD CONSTRAINT pk_board_bno PRIMARY KEY (BNO);

CREATE TABLE REPLY(
    REPLY_NO NUMBER(10),
    REPLY_CONTENT VARCHAR2(500) NOT NULL,
    REPLY_WRITTER VARCHAR2(50) NOT NULL,
    BNO NUMBER(1O)
);

ALTER TABLE REPLY ADD CONSTRAINT pk_reply_no PRIMARY KEY (REPLY_NO);

--FK 설정
ALTER TABLE REPLY ADD CONSTRAINT fk_reply_bno FOREIGN KEY (BNO) REFERENCES BOARD (BNO);

-- 컬럼 변경
ALTER TABLE REPLY ADD (REPLY_REG_DATE DATE NOT NULL);

SELECT * FROM REPLY
