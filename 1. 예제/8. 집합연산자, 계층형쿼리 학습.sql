
-- �ǽ� ���� �� ó��
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







-- ���� ������
-- ## UNION
-- 1. ������ ������ �ǹ��Դϴ�.
-- 2. ù��° ������ �ι�° ������ �ߺ������� �ѹ��� �����ݴϴ�.
-- 3. ù��° ������ ���� ������ Ÿ���� �ι�° ������ ������ Ÿ�԰� �����ؾ� ��.

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
-- 1. UNION�� ���� �� ���̺��� �������� ���ļ� �����ݴϴ�.
-- 2. UNION�� �޸� �ߺ��� �����͵� �ѹ� �� �����ݴϴ�.
-- 3. �ڵ� ���� ����� �������� �Ⱦ� ���ɻ� �����մϴ�.
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
-- 1. ù��° ������ �ι�° �������� �ߺ��� �ุ�� ����մϴ�.
-- 2. �������� �ǹ��Դϴ�.

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
WHERE A.ADDR LIKE '%����%'
;

SELECT
    A.EMP_NO, A.EMP_NM, A.ADDR,
    B.CERTI_CD, C.CERTI_NM
FROM TB_EMP A
JOIN TB_EMP_CERTI B
ON A.EMP_NO = B.EMP_NO
JOIN TB_CERTI C
ON B.CERTI_CD = C.CERTI_CD
WHERE A.ADDR LIKE '%����%'
    AND C.CERTI_NM = 'SQLD'
;


-- ## MINUS(EXCEPT)
-- 1. �ι�° �������� ���� ù��° �������� �ִ� �����͸� �����ݴϴ�.
-- 2. �������� �����Դϴ�.

SELECT EMP_NO, EMP_NM, SEX_CD, DEPT_CD FROM TB_EMP
MINUS
SELECT EMP_NO, EMP_NM, SEX_CD, DEPT_CD FROM TB_EMP WHERE DEPT_CD = '100001'
MINUS
SELECT EMP_NO, EMP_NM, SEX_CD, DEPT_CD FROM TB_EMP WHERE DEPT_CD = '100004'
MINUS
SELECT EMP_NO, EMP_NM, SEX_CD, DEPT_CD FROM TB_EMP WHERE SEX_CD = '1'
;



-- ������ ����
SELECT 
    LEVEL AS LVL,
    LPAD(' ', 4*(LEVEL-1)) || emp_no || '(' || emp_nm || ')' AS "�����ο�",
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
    LPAD(' ', 4*(LEVEL-1)) || emp_no || '(' || emp_nm || ')' AS "�����ο�",
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


