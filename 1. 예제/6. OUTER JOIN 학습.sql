
-- 3���� ���̺� ����
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
WHERE B.DEPT_NM = '������' OR B.DEPT_NM = '�����'
    AND A.ADDR LIKE '%���%'
;

-- # SLEF JOIN
-- 1. SELF JOIN�� �ڱ� �ڽ� ���̺��� �����ϴ� �����Դϴ�.
-- 2. �ڱ� ���̺��� �÷����� ��Ī�Ͽ� ��ȸ�ϴ� ����Դϴ�.

SELECT
    A.emp_no, A.emp_nm, 
    A.direct_manager_emp_no,
    B.emp_nm AS ����̸�
FROM TB_EMP A
JOIN TB_EMP B
ON A.direct_manager_emp_no = B.emp_no
ORDER BY A.EMP_NO
;
-- NULL(��ȸ��)�� ���Ե��� ����


-- OUTER JOIN �ǽ�ȯ�� ����
INSERT INTO tb_dept VALUES ('100014', '4�����������', '999999');
INSERT INTO tb_dept VALUES ('100015', '����Ʈ�ڷγ���', '999999');
COMMIT;

SELECT * FROM tb_dept;

ALTER TABLE tb_emp DROP CONSTRAINT fk_tb_emp01;

INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
                    final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000041', '�̼���', '19811201', '1', '��⵵ ���ν� ������ ����1�� 435', '010-5656-7878',
        NULL, '006', '003', '114-554-223433', '000000', 'N');

INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
                    final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000042', '�����', '19820402', '1', '��⵵ ���� ���籸 ȭ���� 231', '010-4054-6547',
        NULL, '004', '001', '110-223-553453', '000000', 'Y');

INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
                    final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000043', '������', '19850611', '1', '��⵵ ������ �ȴޱ� ��ź�� 553', '010-1254-1116',
        NULL, '004', '001', '100-233-664234', '000000', 'N');
        
INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
            final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000044', '�庸��', '19870102', '1', '��⵵ ������ �д籸 ���ڵ� 776', '010-1215-8784',
        NULL, '004', '002', '180-345-556634', '000000', 'Y');
        
INSERT INTO tb_emp (emp_no, emp_nm, birth_de, sex_cd, addr, tel_no, direct_manager_emp_no, 
            final_edu_se_cd, sal_trans_bank_cd, sal_trans_accnt_no, dept_cd, lunar_yn)
VALUES ('1000000045', '������', '19880824', '1', '��⵵ ���� �ϻ꼭�� �鼮�� 474', '010-3687-1245',
        NULL, '004', '002', '325-344-45345', '000000', 'Y');
        
COMMIT;
    
 
SELECT * FROM tb_emp ORDER BY emp_no DESC;

SELECT * FROM tb_dept;
-- ȯ�� ���� �Ϸ�

-- # OUTER JOIN
-- 1. ���� ������ �������� �ʴ� ��鵵 ��ȸ�� �� ����ϴ� ���α���Դϴ�.
-- 2. OUTER JOIN ������ ��ȣ�� (+)��ȣ�Դϴ�.
-- 3. INNER JOIN�� ���� ������ �������� ������ �ش� ���� ��ȸ���� �ʽ��ϴ�.
--    �׷��� OUTER JOIN�� ����(LEFT, RIGHT, FULL)�� �°� ���ǿ� ��Ī����
--    �ʴ� ��鵵 ��� NULL�� ó���ؼ� ��ȸ�մϴ�.

-- # LEFT OUTER JOIN
-- ���εǴ� ���� ���̺��� ��� ��ȸ�ϰ�, ������ ���̺��� �������ǿ� ��Ī�� �͸� ��ȸ�մϴ�.

-- ��������� ��� �����ְ�, �μ� ���̺��� ��Ī�Ǹ� �μ� ���̺� �������
-- ��Ī�ȵǸ� NULL�� ǥ��
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
-- ���εǴ� ������ ���̺��� ��� ��ȸ�ϰ�, ���� ���̺��� �������ǿ� ��Ī�� �͸� ��ȸ�մϴ�.

-- �μ��� ��� �����ְ�, ��� ���̺��� ��Ī�Ǹ� ��� ���̺� �������
-- ��Ī�ȵǸ� NULL�� ǥ��

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
