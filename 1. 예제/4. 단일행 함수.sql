
-- # 문자열 비교
DROP TABLE CHAR_COMPARE;
CREATE TABLE CHAR_COMPARE (
    sn CHAR(10),
    char_4 CHAR(4),
    char_6 CHAR(6)
);

INSERT INTO char_compare VALUES ('101', 'SQLD', 'SQLD');
INSERT INTO char_compare VALUES ('102', 'SQLD', 'SQLA');


SELECT * FROM CHAR_COMPARE;

--REPLACE는 실제 DATA는 수정하지않고 표현만 바꿔줌.
SELECT
    REPLACE(CHAR_4, ' ', '+') AS CHAR_4,
    REPLACE(CHAR_6, ' ', '+') AS CHAR_6
FROM CHAR_COMPARE;

--CHAR 타입 끼리의 비교
SELECT
    REPLACE(CHAR_4, ' ', '+') AS CHAR_4,
    REPLACE(CHAR_6, ' ', '+') AS CHAR_6
FROM CHAR_COMPARE
WHERE SN = '102'
    AND CHAR_4 > CHAR_6;
--A는 65, a는 97, 가는 44032
    
SELECT * FROM CHAR_COMPARE;

--한쪽이 VARCHAR타입일 경우의 비교
DROP TABLE VARCHAR_COMPARE;
CREATE TABLE VARCHAR_COMPARE (
    sn CHAR(10),
    char_4 CHAR(4),
    varchar_6 VARCHAR2(6)
);

INSERT INTO varchar_compare VALUES ('101', 'SQLD', 'SQLD  ');
INSERT INTO varchar_compare VALUES ('102', 'SQLD', 'SQLA  ');
COMMIT;

SELECT * FROM varchar_compare;

SELECT
    REPLACE(CHAR_4, ' ', '+') AS CHAR_4,
    REPLACE(VARCHAR_6, ' ', '+') AS VARCHAR_6
FROM VARCHAR_COMPARE
WHERE SN = '101'
    AND CHAR_4 ^= VARCHAR_6;
    
    
-- 상수문자열과의 비교
SELECT
    REPLACE(CHAR_4, ' ', '+') AS CHAR_4,
    REPLACE(VARCHAR_6, ' ', '+') AS VARCHAR_6
FROM VARCHAR_COMPARE
WHERE SN = '101'
    AND CHAR_4 = 'SQLD      ';

SELECT
    REPLACE(CHAR_4, ' ', '+') AS CHAR_4,
    REPLACE(VARCHAR_6, ' ', '+') AS VARCHAR_6
FROM VARCHAR_COMPARE
WHERE SN = '101'
    AND VARCHAR_6 = 'SQLD';
    
    
    
-- # 단일행 함수
-- ## 문자열 함수
SELECT
    LOWER('Hello WORLD'), -- 전부 소문자로 변환
    UPPER('Hello WORLD'), -- 전부 대문자로 변환
    INITCAP('abCDef')     -- 첫글자만 대문자로 변환
FROM DUAL;

SELECT
    ASCII('A'),
    CHR(65)
FROM DUAL;

SELECT
    CONCAT('SQL', 'DEVELOPER'),     -- 문자열을 결합
    SUBSTR('SQL DEVELOPER', 1, 3),  -- 문자열 자름. 1번부터 3개 자름(첫글자가 1번)
    LENGTH('HELLO WORLD'),          -- 문자열의 길이
    TRIM('        HI       ')       -- 좌우 공백 제거
FROM DUAL;

SELECT
    RPAD('Steve', 10, '-'), -- 오른쪽에 주어진 문자를 채움
    LPAD('Steve', 10, '*'), -- 왼쪽에 주어진 문자를 채움
    REPLACE('Java programmer', 'Java', 'BigData') AS "REPLACE"-- 문자를 변경
FROM DUAL;

-- ## 숫자형 함수
SELECT 
    MOD(27, 5) AS MOD, -- 나머지 값 반환
    CEIL(38.678) AS ceil, -- 올림값 반환
    FLOOR(38.678) AS floor, -- 내림값 반환
    ROUND(38.678, 2) AS round, -- 자리수까지 반올림
    TRUNC(38.678, 2) AS trunc  -- 자리수 이하를 절삭
FROM dual;

-- ## 날짜형 함수

-- 현재 날짜를 조회
SELECT SYSDATE
FROM DUAL;

SELECT SYSTIMESTAMP
FROM DUAL;

-- 날짜 연산
-- 날짜 + 숫자 = 날짜  => 일(DAY) 수를 날짜에 더함
-- 날짜 - 숫자 = 날짜  => 날짜에서 일 수를 뺌
-- 날짜 - 날짜 = 일수  => 어떤 날짜에서 다른 날짜를 뺀 일수
-- 날짜 + 숫자/24 = 날짜  => 날짜에 시간을 더함

SELECT 
    SYSDATE AS "현재 시간",
    SYSDATE - 1 AS "SYSDATE - 1",
    (SYSDATE + 10) - SYSDATE AS "날짜 - 날짜",
    SYSDATE - (1/24) AS "1시간 차감",
    SYSDATE - (1/24/60) * 100 AS "100분 차감",
    SYSDATE - (1/24/60/60) * 30 AS "30초 차감"
FROM dual;


-- ## 변환 함수
SELECT * FROM CHAR_COMPARE
WHERE SN = '101';

-- 날짜를 문자로 변환 (TO_CHAR 함수)
-- 날짜 포맷 형식: Y - 연도, MM - 두자리 월, D - 일수
-- 시간 포맷 형식: HH12 - 시(1~12), HH24 (0~23), MI - 분, SS - 초
SELECT
    SYSDATE,
    TO_CHAR(SYSDATE, 'MM - DD') AS "월 - 일",
    TO_CHAR(SYSDATE, 'YYYY/MM/DD') AS "년/월/일",
    TO_CHAR(SYSDATE, 'YYYY"년" MM"월" DD"일"') AS "날짜 - 한글포함",
    TO_CHAR(SYSDATE, 'YY/MM/DD AM HH12:MI:SS') AS "날짜와 시간"
FROM DUAL;

-- 숫자를 문자로 변환
-- 숫자 포맷 형식 - $: 달러표시, L: 지역화페기호
SELECT
    TO_CHAR(9500012 * 1.33, '$999,999,999.99') AS 달러,
    TO_CHAR(1350000 * 1.1123546795321231 , '999,999,999L') AS 원화
FROM DUAL;

-- 문자를 숫자로 변환
SELECT
    TO_NUMBER('$5,500', '$999,999') - 4000 AS "계산결과"
FROM DUAL;


-- CASE표현과 DECODE함수
SELECT 
    SAL_CD,
    CASE WHEN SAL_CD = '100001' THEN '기본급여'
         WHEN SAL_CD = '100002' THEN '보너스급여'
         ELSE '기타'
         END SAL_NAME
FROM TB_SAL;

SELECT
    SAL_CD,
    DECODE(SAL_CD, '100001', '기본급', '100002', '보너스급여', '기타') AS SAL_NAME
FROM TB_SAL;

-- # 널 관련 함수
-- NVL(expr1, expr2)
-- expr1: Null을 가질 수 있는 값이나 표현식
-- expr2: expr1이 Null일 경우 대체할 값
SELECT
    EMP_NO,
    EMP_NM,
    NVL(DIRECT_MANAGER_EMP_NO, '회장님')
FROM TB_EMP;

SELECT
    NVL(MAX(emp_nm), '존재안함') AS EMP_NM
FROM TB_EMP
WHERE EMP_NM = '박찬호';

-- NVL2(expr1, expr2, expr3)
-- expr1의 값이 Null이 아니면 expr2를 반환, Null이면 expr3를 반환
SELECT
    EMP_NM,
    NVL2(direct_manager_emp_no, '일반사원', '회장님') AS 직위
FROM TB_EMP;

-- NULLIF(expr1, expr2)
-- 두 값이 같으면 NULL 리턴, 다르면 expr1 리턴
SELECT
    NULLIF('박지성', '박찬호') 
FROM DUAL;

-- COALESCE(expr1, ...)
-- 많은 표현식 중 NULL이 아닌 값이 최초로 발견되면 해당 값을 리턴
SELECT
    COALESCE(NULL, NULL, 3000, 4000)
FROM DUAL;

SELECT
    COALESCE(NULL, 5000, NULL)
FROM DUAL;

SELECT
    COALESCE(7000, NULL, NULL, 10000)
FROM DUAL;
