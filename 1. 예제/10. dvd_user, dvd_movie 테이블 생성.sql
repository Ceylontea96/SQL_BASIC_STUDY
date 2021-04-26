
-- User 도메인 테이블 설계
CREATE SEQUENCE seq_dvd_user;

CREATE TABLE dvd_user (
    user_number NUMBER(10),
    user_name VARCHAR2(10) NOT NULL,
    phone_number VARCHAR2(13),
    total_paying NUMBER(10) DEFAULT 0,
    grade VARCHAR2(10) DEFAULT 'BRONZE',
    CONSTRAINT pk_user_number PRIMARY KEY (user_number)
);

INSERT INTO dvd_user 
    (user_number, user_name, phone_number)
VALUES (seq_dvd_user.nextval, '김철수', '010-1234-5678');

INSERT INTO dvd_user 
    (user_number, user_name, phone_number)
VALUES (seq_dvd_user.nextval, '박영희', '010-1243-1088');

COMMIT;

SELECT * FROM dvd_user;

-- Movie 도메인 테이블 설계
CREATE SEQUENCE seq_dvd_movie;

CREATE TABLE dvd_movie (
    serial_number NUMBER(10),
    movie_name VARCHAR2(15) NOT NULL,
    nation VARCHAR2(15) NOT NULL,
    pub_year NUMBER(4) NOT NULL,
    charge NUMBER(5) NOT NULL,
    rental CHAR(1) DEFAULT 'F',
    user_number NUMBER(10),
    CONSTRAINT pk_dvd_movie PRIMARY KEY (serial_number),
    CONSTRAINT fk_dvd_movie 
    FOREIGN KEY (user_number) 
    REFERENCES dvd_user (user_number)
);

SELECT * FROM dvd_movie;