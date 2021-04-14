

-- # GROUP BY, HAVING절
-- 1. 집계 함수
SELECT
    COUNT(EMP_NO) AS "총 사원수",
    MAX(BIRTH_DE) AS "가장 어린 사람",
    MIN(BIRTH_DE) AS "가장 나이많은 사람"
FROM TB_EMP;

SELECT
    COUNT(*), -- NULL 포함
    COUNT(direct_manager_emp_no) -- NULL 포함 안함
FROM TB_EMP;

SELECT * FROM TB_SAL_HIS;

SELECT
    TO_CHAR(SUM(pay_amt), 999,999,999원)
FROM TB_SAL_HIS;

-- 2. GROUP BY

-- 부서별로 가장 어린사람의 생년월일, 가장 연장자의 생년월일, 부서별 총 직원수를 알고 싶다.
SELECT * FROM TB_EMP;

SELECT
    DEPT_CD,
    COUNT(*) AS "부서별 직원 수",
    MAX(BIRTH_DE) AS "가장 어린 사원",
    MIN(BIRTH_DE) AS "가장 나이많은 사원"
FROM TB_EMP
GROUP BY DEPT_CD
ORDER BY DEPT_CD;

-- HAVING절 : 그룹화 된 결과에서 조건을 걸어서 행 수 제한
SELECT
    A.DEPT_CD,
    (SELECT B.DEPT_NM FROM TB_DEPT B WHERE A.DEPT_CD = B.DEPT_CD) AS DEPT_NM,
    COUNT(*) AS "부서별 직원 수",
    MAX(A.BIRTH_DE) AS "가장 어린 사원",
    MIN(A.BIRTH_DE) AS "가장 나이많은 사원"
FROM TB_EMP A
GROUP BY A.DEPT_CD
HAVING COUNT(*) > 1
ORDER BY A.DEPT_CD;

-- 사원별로 급여를 제일 많이 받은 액수, 제일 적게 받은 액수, 평균액수를 조회
SELECT EMP_NO, pay_amt, pay_de 
FROM tb_sal_his
ORDER BY EMP_NO, pay_de;

SELECT
    A.EMP_NO AS "사원번호",
    (SELECT B.EMP_NM FROM TB_EMP B WHERE A.EMP_NO = B.EMP_NO) AS "사원이름",
    MIN(A.pay_amt) AS "최저 수령액",
    MAX(A.pay_amt) AS "최고 수령액",
    ROUND(AVG(A.pay_amt), 2) AS "평균급여"
FROM TB_SAL_HIS A
WHERE a.pay_de BETWEEN 20190101 AND 20191231
GROUP BY A.EMP_NO
HAVING AVG(a.pay_amt) >= 4500000 
ORDER BY A.EMP_NO;

-- 사원별 2019년 사원번호와, 사원이름, 연봉을 조회

SELECT
    A.EMP_NO AS "사원번호",
    (SELECT B.EMP_NM FROM TB_EMP B WHERE A.EMP_NO = B.EMP_NO) AS "사원이름",
    TO_CHAR(SUM(a.pay_amt), 'L999,999,999') AS "연봉1",
    TO_CHAR(ROUND(AVG(a.pay_amt), 2) * 12, 'L999,999,999') AS "연봉2"
FROM TB_SAL_HIS A
WHERE a.pay_de BETWEEN 20190101 AND 20191231
GROUP BY A.EMP_NO
HAVING SUM(a.pay_amt) >= 50000000
ORDER BY A.EMP_NO;

-- 정렬 ORDER BY
-- ASC: 오름차(기본값), DESC: 내림차

SELECT 
    EMP_NO AS 사원번호, 
    EMP_NM AS 사원이름, 
    ADDR AS 주소
FROM TB_EMP
ORDER BY EMP_NM DESC;

SELECT 
    EMP_NO AS 사원번호, 
    EMP_NM AS 사원이름, 
    ADDR AS 주소
FROM TB_EMP
ORDER BY 3 DESC;

SELECT 
    EMP_NO AS 사원번호, 
    EMP_NM AS 사원이름, 
    ADDR AS 주소
FROM TB_EMP
--ORDER BY EMP_NM DESC, EMP_NO, 3;
ORDER BY 2 DESC, 1, 3;

SELECT 
    EMP_NO AS EN, 
    EMP_NM AS EM, 
    ADDR AS 주소
FROM TB_EMP
ORDER BY EM DESC, EN DESC;













