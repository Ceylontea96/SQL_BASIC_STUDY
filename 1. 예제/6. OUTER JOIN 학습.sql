
-- 3개의 테이블 조인
SELECT
    A.EMP_NO, A.EMP_NM, A.ADDR,
    B.DEPT_CD, B.DEPT_NM,
    C.CERTI_CD
FROM TB_EMP A, TB_DEPT B, TB_EMP_CERTI C
WHERE A.DEPT_CD = B.DEPT_CD
    AND A.EMP_NO = C.EMP_NO
;

-- JOIN ON
SELECT
    A.EMP_NO, A.EMP_NM, A.ADDR,
    B.DEPT_CD, B.DEPT_NM,
    C.CERTI_CD,
    D.CERTI_NM
FROM TB_EMP A 
JOIN TB_DEPT B 
ON A.DEPT_CD = B.DEPT_CD
JOIN TB_EMP_CERTI C
ON A.EMP_NO = C.EMP_NO
JOIN TB_CERTI D
ON C.CERTI_CD = D.CERTI_CD
WHERE B.DEPT_NM = '지원팀' OR B.DEPT_NM = '운영본부'
    AND A.ADDR LIKE '%고양%'
;

-- # SLEF JOIN
-- 1. SELF JOIN은 자기 자신 테이블을 조인하는 개념입니다.
-- 2. 자기 테이블의 컬럼들을 매칭하여 조회하는 기법입니다.

SELECT
    A.emp_no, A.emp_nm, 
    A.direct_manager_emp_no,
    B.emp_nm AS 상사이름
FROM TB_EMP A
JOIN TB_EMP B
ON A.direct_manager_emp_no = B.emp_no
ORDER BY A.EMP_NO
;
-- NULL(김회장)은 포함되지 않음


-- OUTER JOIN 실습환경 세팅
INSERT INTO tb_dept VALUES ('100014', '4차산업혁명팀', '999999');
INSERT INTO tb_dept VALUES ('100015', '포스트코로나팀', '999999');
COMMIT;

SELECT * FROM tb_dept;

ALTER TABLE tb_emp DROP CONSTRAINT fk_tb_emp01;

INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
                    final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000041', '이순신', '19811201', '1', '경기도 용인시 수지구 죽전1동 435', '010-5656-7878',
        NULL, '006', '003', '114-554-223433', '000000', 'N');

INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
                    final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000042', '정약용', '19820402', '1', '경기도 고양시 덕양구 화정동 231', '010-4054-6547',
        NULL, '004', '001', '110-223-553453', '000000', 'Y');

INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
                    final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000043', '박지원', '19850611', '1', '경기도 수원시 팔달구 매탄동 553', '010-1254-1116',
        NULL, '004', '001', '100-233-664234', '000000', 'N');
        
INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
            final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000044', '장보고', '19870102', '1', '경기도 성남시 분당구 정자동 776', '010-1215-8784',
        NULL, '004', '002', '180-345-556634', '000000', 'Y');
        
INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
            final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000045', '김종서', '19880824', '1', '경기도 고양시 일산서구 백석동 474', '010-3687-1245',
        NULL, '004', '002', '325-344-45345', '000000', 'Y');
        
COMMIT;
    
 
SELECT * FROM tb_emp ORDER BY emp_no DESC;

SELECT * FROM tb_dept;
-- 환경 구축 완료

-- # OUTER JOIN
-- 1. 조인 조건을 만족하지 않는 행들도 조회할 때 사용하는 조인기법입니다.
-- 2. OUTER JOIN 연산자 기호는 (+)기호입니다.
-- 3. INNER JOIN은 조인 조건을 만족하지 않으면 해당 행을 조회하지 않습니다.
--    그러나 OUTER JOIN은 방향(LEFT, RIGHT, FULL)에 맞게 조건에 매칭되지
--    않는 행들도 모두 NULL로 처리해서 조회합니다.

-- # LEFT OUTER JOIN
-- 조인되는 왼쪽 테이블은 모두 조회하고, 오른쪽 테이블은 조인조건에 매칭된 것만 조회합니다.

-- 사원정보는 모두 보여주고, 부서 테이블이 매칭되면 부서 테이블도 보여줘라
-- 매칭안되면 NULL로 표시
SELECT
    A.EMP_NO, A.EMP_NM,
    B.DEPT_CD, B.DEPT_NM
FROM TB_EMP A, TB_DEPT B
WHERE A.DEPT_CD = B.DEPT_CD(+)
ORDER BY A.EMP_NO
;

SELECT
    A.EMP_NO, A.EMP_NM,
    B.DEPT_CD, B.DEPT_NM
FROM TB_EMP A
LEFT OUTER JOIN TB_DEPT B
ON (A.DEPT_CD = B.DEPT_CD)
;

-- # RIGHT OUTER JOIN
-- 조인되는 오른쪽 테이블은 모두 조회하고, 왼쪽 테이블은 조인조건에 매칭된 것만 조회합니다.

-- 부서는 모두 보여주고, 사원 테이블이 매칭되면 사원 테이블도 보여줘라
-- 매칭안되면 NULL로 표시

SELECT
    A.EMP_NO, A.EMP_NM,
    B.DEPT_CD, B.DEPT_NM
FROM TB_EMP A, TB_DEPT B
WHERE A.DEPT_CD(+) = B.DEPT_CD
ORDER BY A.EMP_NO
;

SELECT
    A.EMP_NO, A.EMP_NM,
    B.DEPT_CD, B.DEPT_NM
FROM TB_EMP A
RIGHT OUTER JOIN TB_DEPT B
ON (A.DEPT_CD = B.DEPT_CD)
;

-- # FULL OUTER JOIN

SELECT
    A.EMP_NO, A.EMP_NM,
    B.DEPT_CD, B.DEPT_NM
FROM TB_EMP A
FULL OUTER JOIN TB_DEPT B
ON A.DEPT_CD = B.DEPT_CD
;
