
-- 실습 종료 후 처리
DELETE FROM tb_dept 
WHERE dept_cd IN ('100014', '100015');

DELETE FROM tb_emp 
WHERE emp_no IN ('1000000041', '1000000042', '1000000043', '1000000044', '1000000045');

COMMIT;

ALTER TABLE tb_emp 
ADD CONSTRAINT fk_tb_emp01 
FOREIGN KEY (dept_cd) 
REFERENCES tb_dept (dept_cd)
;







-- 집합 연산자
-- ## UNION
-- 1. 합집합 연산의 의미입니다.
-- 2. 첫번째 쿼리와 두번째 쿼리의 중복정보는 한번만 보여줍니다.
-- 3. 첫번째 쿼리의 열의 개수와 타입이 두번째 쿼리의 열수와 타입과 동일해야 함.

SELECT
    EMP_NO, EMP_NM, BIRTH_DE
FROM TB_EMP
WHERE BIRTH_DE BETWEEN '19600101' AND '19691231'

UNION
SELECT
    EMP_NO, EMP_NM, BIRTH_DE
FROM TB_EMP
WHERE BIRTH_DE BETWEEN '19700101' AND '197901231'
;

SELECT
    EMP_NM, BIRTH_DE
FROM TB_EMP
WHERE BIRTH_DE BETWEEN '19600101' AND '19691231'

UNION

SELECT
    EMP_NM, BIRTH_DE
FROM TB_EMP
WHERE BIRTH_DE BETWEEN '19700101' AND '197901231'
;

-- ## UNION ALL
-- 1. UNION과 같이 두 테이블을 수직으로 합쳐서 보여줍니다.
-- 2. UNION과 달리 중복된 데이터도 한번 더 보여줍니다.
-- 3. 자동 정렬 기능을 지원하지 안아 성능상 유리합니다.
SELECT
    EMP_NO, EMP_NM, BIRTH_DE
FROM TB_EMP
WHERE BIRTH_DE BETWEEN '19600101' AND '19691231'

UNION ALL
SELECT
    EMP_NO, EMP_NM, BIRTH_DE
FROM TB_EMP
WHERE BIRTH_DE BETWEEN '19700101' AND '197901231'
;

SELECT
    EMP_NM, BIRTH_DE
FROM TB_EMP
WHERE BIRTH_DE BETWEEN '19600101' AND '19691231'

UNION ALL

SELECT
    EMP_NM, BIRTH_DE
FROM TB_EMP
WHERE BIRTH_DE BETWEEN '19700101' AND '197901231'
;

-- ## INTERSECT
-- 1. 첫번째 쿼리와 두번째 쿼리에서 중복된 행만을 출력합니다.
-- 2. 교집합의 의미입니다.

SELECT
    A.EMP_NO, A.EMP_NM, A.ADDR,
    B.CERTI_CD, C.CERTI_NM
FROM TB_EMP A
JOIN TB_EMP_CERTI B
ON A.EMP_NO = B.EMP_NO
JOIN TB_CERTI C
ON B.CERTI_CD = C.CERTI_CD
WHERE C.CERTI_NM = 'SQLD'
INTERSECT
SELECT
    A.EMP_NO, A.EMP_NM, A.ADDR,
    B.CERTI_CD, C.CERTI_NM
FROM TB_EMP A
JOIN TB_EMP_CERTI B
ON A.EMP_NO = B.EMP_NO
JOIN TB_CERTI C
ON B.CERTI_CD = C.CERTI_CD
WHERE A.ADDR LIKE '%용인%'
;

SELECT
    A.EMP_NO, A.EMP_NM, A.ADDR,
    B.CERTI_CD, C.CERTI_NM
FROM TB_EMP A
JOIN TB_EMP_CERTI B
ON A.EMP_NO = B.EMP_NO
JOIN TB_CERTI C
ON B.CERTI_CD = C.CERTI_CD
WHERE A.ADDR LIKE '%용인%'
    AND C.CERTI_NM = 'SQLD'
;


-- ## MINUS(EXCEPT)
-- 1. 두번째 쿼리에는 없고 첫번째 쿼리에만 있는 데이터를 보여줍니다.
-- 2. 차집합의 개념입니다.

SELECT EMP_NO, EMP_NM, SEX_CD, DEPT_CD FROM TB_EMP
MINUS
SELECT EMP_NO, EMP_NM, SEX_CD, DEPT_CD FROM TB_EMP WHERE DEPT_CD = '100001'
MINUS
SELECT EMP_NO, EMP_NM, SEX_CD, DEPT_CD FROM TB_EMP WHERE DEPT_CD = '100004'
MINUS
SELECT EMP_NO, EMP_NM, SEX_CD, DEPT_CD FROM TB_EMP WHERE SEX_CD = '1'
;



-- 계층형 질의
SELECT 
    LEVEL AS LVL,
    LPAD(' ', 4*(LEVEL-1)) || emp_no || '(' || emp_nm || ')' AS "조직인원",
    A.dept_cd,
    B.dept_nm,
    A.EMP_NO,
    a.direct_manager_emp_no
FROM tb_emp A
JOIN tb_dept B
ON A.dept_cd = B.dept_cd
START WITH A.direct_manager_emp_no IS NULL
CONNECT BY PRIOR A.emp_no = A.direct_manager_emp_no;

SELECT 
    LEVEL AS LVL,
    LPAD(' ', 4*(LEVEL-1)) || emp_no || '(' || emp_nm || ')' AS "조직인원",
    A.dept_cd,
    B.dept_nm,
    A.EMP_NO,
    a.direct_manager_emp_no
    ,CONNECT_BY_ISLEAF
FROM tb_emp A
JOIN tb_dept B
ON A.dept_cd = B.dept_cd
START WITH A.direct_manager_emp_no = '1000000037'
CONNECT BY A.emp_no = PRIOR A.direct_manager_emp_no;


