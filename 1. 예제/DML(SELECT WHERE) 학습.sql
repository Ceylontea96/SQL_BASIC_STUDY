
-- SELECT 기본
SELECT
    certi_cd, certi_nm
FROM tb_certi;

SELECT
    *
FROM TB_CERTI;

-- DISTINCT: 중복 값 제외 조회
SELECT ALL --ALL은 default값으로 생략되어있음(모두 표시)
    issue_insti_nm
FROM TB_CERTI;

SELECT DISTINCT
    issue_insti_nm
FROM TB_CERTI;

-- 별칭 지정
SELECT
    certi_cd AS "자격증코드",
    certi_nm AS "자격증 이름",
    issue_insti_nm AS 발급기관
FROM TB_CERTI;

-- 결합연산자 ( || )을 통한 컬럼데이터 결합
SELECT
    certi_nm || '(' || certi_cd || ')' || issue_insti_nm AS "자격증 정보"
FROM TB_CERTI;

-- 더미 테이블(DUAL : 단순 연산결과를 조회하고 싶을 때)
SELECT
    (3 + 7) * 5 / 10 AS 연산결과
FROM DUAL;

-- WHERE 절: 조회 결과 행을 제한하는 조건절
SELECT *
FROM TB_EMP;

SELECT
    EMP_NM, BIRTH_DE
FROM TB_EMP
WHERE SEX_CD = 2;

-- PK로 데이터를 조회하면 무조건 단일행이 조회됩니다.
SELECT
    EMP_NO, EMP_NM, ADDR
FROM TB_EMP
WHERE EMP_NO = 1000000001;

-- 비교연산자 (=, <>, <, >, >=)
-- SQL 비교연산자 (BETWEENM IN, LIKE)

-- BETWEEN 연산자
SELECT
    EMP_NO, EMP_NM, BIRTH_DE, TEL_NO
FROM TB_EMP
WHERE BIRTH_DE BETWEEN '19900101' AND '19991231';

-- IN 연산자
SELECT
    EMP_NO, EMP_NM, DEPT_CD
FROM TB_EMP
WHERE dept_cd = '100004'
    OR dept_cd = '100006';
    
SELECT
    EMP_NO, EMP_NM, DEPT_CD
FROM TB_EMP
WHERE dept_cd IN ('100004', '100006');

-- 부정연산자
SELECT
    EMP_NO, EMP_NM, DEPT_CD
FROM TB_EMP
WHERE dept_cd NOT IN ('100004', '100006');

-- LIKE 연산자
-- 와일드카드 매핑
-- % : 1글자 이상 포함, _ : 딱 1글자 포함
SELECT
    EMP_NO, EMP_NM
FROM TB_EMP
WHERE EMP_NM LIKE '이%';

SELECT
    EMP_NO, EMP_NM
FROM TB_EMP
WHERE EMP_NM LIKE '%심';

SELECT
    EMP_NO, EMP_NM
FROM TB_EMP
WHERE EMP_NM LIKE '이__';

-- 성씨가 김씨이면서, 부서가 100003번, 100004번, 100006번 중에 하나이면서, 90년대생인 사원의 사번, 이름, 생일, 부서코드를 조회
SELECT
    EMP_NO, EMP_NM, BIRTH_DE, DEPT_CD
FROM TB_EMP
WHERE EMP_NM LIKE '김%' AND 
    dept_cd IN ('100003', '100004', '100006') AND 
    birth_de BETWEEN '19900101' AND '19991231';
    
-- NULL값 조회
SELECT
    EMP_NO, EMP_NM, DIRECT_MANAGER_EMP_NO
FROM TB_EMP
WHERE DIRECT_MANAGER_EMP_NO IS NULL; -- NULL은 IS로만 비교

SELECT *  FROM TB_EMP;

SELECT
    EMP_NO, EMP_NM, DIRECT_MANAGER_EMP_NO
FROM TB_EMP
WHERE DIRECT_MANAGER_EMP_NO IS NOT NULL;

-- AND 와 OR의 우선순위
SELECT
    EMP_NO, EMP_NM, ADDR, DEPT_CD
FROM TB_EMP
WHERE EMP_NM LIKE '이%'
    AND DEPT_CD IN ('100004', '100006')
    AND NOT (ADDR LIKE '%수원%' OR ADDR LIKE '%성남%');
    
-- 부정 비교연산자
SELECT
    EMP_NO, EMP_NM, SEX_CD
FROM TB_EMP
WHERE EMP_NM LIKE '이%'
    AND DEPT_CD IN ('100004', '100006')
    AND SEX_CD <> 1;
    
    



