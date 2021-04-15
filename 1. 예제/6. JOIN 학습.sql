SELECT * FROM tb_sal_his;

SELECT
    emp_no,
    SUM(pay_amt) AS "총 급여 지불액"
FROM TB_SAL_HIS
GROUP BY emp_no
HAVING AVG(PAY_AMT) > 4000000;

CREATE TABLE 지역별매출_56 (
    지역 VARCHAR2(50),
    매출금액 NUMBER(10),
    년 VARCHAR2(10)
);

INSERT INTO 지역별매출_56 VALUES('서울', 500, '2018');
INSERT INTO 지역별매출_56 VALUES('서울', 700, '2019');
INSERT INTO 지역별매출_56 VALUES('서울', 1000, '2020');

INSERT INTO 지역별매출_56 VALUES('대전', 300, '2019');
INSERT INTO 지역별매출_56 VALUES('대전', 600, '2020');
INSERT INTO 지역별매출_56 VALUES('부산', 400, '2020');
INSERT INTO 지역별매출_56 VALUES('부산', 800, '2021');
COMMIT;

-- JOIN 기초
SELECT * FROM TB_EMP;

-- 2개 테이블 JOIN
SELECT
    A.EMP_NO,
    A.EMP_NM,
    B.DEPT_CD,
    DEPT_NM
FROM TB_EMP A, TB_DEPT B
WHERE A.DEPT_CD = B.DEPT_CD
--    AND B.DEPT_NM = '지원팀'
--ORDER BY EMP_NO
;


-- 자격증 정보 테이블
SELECT * FROM TB_CERTI;
-- 회원이 취득한 자격증 정보 테이블
SELECT * FROM TB_EMP_CERTI;

-- 3개 테이블 JOIN
SELECT
    A.EMP_NO AS 사원번호, 
    A.EMP_NM AS 사원이름,
    B.CERTI_CD AS 자격증코드,
    C.CERTI_NM AS 자격증명,
    b.acqu_de AS 취득일
FROM TB_EMP A
    ,TB_EMP_CERTI B
    ,TB_CERTI C
WHERE A.EMP_NO = B.EMP_NO
    AND B.CERTI_CD = C.CERTI_CD
ORDER BY 취득일
;

-- 4개 테이블 JOIN
SELECT
    A.EMP_NO AS 사원번호,
    A.EMP_NM AS 사원이름,
    A.DEPT_CD AS 부서코드,
    B.DEPT_NM AS 부서명,
    C.CERTI_CD AS 자격증코드,
    C.ACQU_DE AS 취득일자,
    D.CERTI_NM AS 자격증명
FROM TB_EMP A
    ,TB_DEPT B
    ,TB_EMP_CERTI C
    ,TB_CERTI D
WHERE A.EMP_NO = C.EMP_NO
    AND A.DEPT_CD = B.DEPT_CD
    AND C.CERTI_CD = D.CERTI_CD
;

-- # INNER JOIN
-- 1. 2개 이상의 테이블이 공통된 컬럼에 의해 논리적으로 결합되는 조인기법입니다.
-- 2. WHERE절에 사용된 컬럼들이 동등연산자 (=)에 의해 조인됩니다.

SELECT
    A.EMP_NO AS 사원번호,
    A.EMP_NM AS 사원이름,
    A.ADDR AS 주소지,
    A.DEPT_CD AS 부서코드,
    B.DEPT_NM AS 부서이름
FROM TB_EMP A
    ,TB_DEPT B
WHERE A.DEPT_CD = B.DEPT_CD
    AND A.ADDR LIKE '%용인%'
ORDER BY A.EMP_NO
;

-- # NATURAL JOIN
-- 1. NATURAL JOIN은 동일한 이름을 갖는 컬럼들에게 자동 조인하는 기법입니다.
-- 2. 즉, 자동으로 2개 이상의 테이블에서 같은 이름을 가진 컬럼을 찾아 INNER조인을 수행합니다.
-- 3. 이때, 조인되는 동일 이름의 컬럼은 데이터 타입이 같아야하며 ALIAS나 테이블명을 붙일 수 없습니다.
-- 4. SELECT * 문법을 사용하면, 공통 컬럼으로 자동 조인하며 결과집합에서 한번만 표기됩니다.

SELECT
    EMP_NO,
    EMP_NM,
    ADDR,
    dept_cd,
    dept_nm
FROM TB_EMP NATURAL JOIN TB_DEPT
;

SELECT
    *
FROM TB_EMP E NATURAL JOIN TB_DEPT D;

-- # USING절 조인
-- 1. NATURAL 조인에서는 자동으로 이름이 일치하는 모든 컬럼에 대해 조인이 일어나지만
--    USING을 사용하면 원하는 컬럼에 대해서만 선택적으로 조인이 가능합니다.
-- 2. USING절에서도 조인 컬럼에 대해 ALIAS나 테이블명을 붙일 수 없습니다.

SELECT
    E.emp_no, E.emp_nm, E.addr, dept_cd, D.dept_nm
FROM TB_EMP E JOIN TB_DEPT D USING (DEPT_CD)
;

-- # JOIN ON절
-- 1. 조인 조건 서술부(ON절) 일반 조건 서술부(WHERE절)를 분리해서 작성하는 방법입니다.
-- 2. ON절을 사용하면 JOIN이후에 논리 연산이나 서브쿼리와 같은 추가 서술을 할 수 있습니다.

SELECT
    A.EMP_NO AS 사원번호,
    A.EMP_NM AS 사원이름,
    A.ADDR AS 주소지,
    A.DEPT_CD AS 부서코드,
    B.DEPT_NM AS 부서이름
FROM TB_EMP A 
JOIN TB_DEPT B
ON A.DEPT_CD = B.DEPT_CD
WHERE A.ADDR LIKE '%용인%'
ORDER BY A.EMP_NO
;


-- SELECT [DISTINCT] { 열이름 .... } 
-- FROM  테이블 또는 뷰 이름
-- JOIN  테이블 또는 뷰 이름
-- ON    조인 조건
-- WHERE 조회 조건
-- GROUP BY  열을 그룹화
-- HAVING    그룹화 조건
-- ORDER BY  정렬할 열 [ASC | DESC];





