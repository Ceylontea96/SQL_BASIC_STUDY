
-- SELECT �⺻
SELECT
    certi_cd, certi_nm
FROM tb_certi;

SELECT
    *
FROM TB_CERTI;

-- DISTINCT: �ߺ� �� ���� ��ȸ
SELECT ALL --ALL�� default������ �����Ǿ�����(��� ǥ��)
    issue_insti_nm
FROM TB_CERTI;

SELECT DISTINCT
    issue_insti_nm
FROM TB_CERTI;

-- ��Ī ����
SELECT
    certi_cd AS "�ڰ����ڵ�",
    certi_nm AS "�ڰ��� �̸�",
    issue_insti_nm AS �߱ޱ��
FROM TB_CERTI;

-- ���տ����� ( || )�� ���� �÷������� ����
SELECT
    certi_nm || '(' || certi_cd || ')' || issue_insti_nm AS "�ڰ��� ����"
FROM TB_CERTI;

-- ���� ���̺�(DUAL : �ܼ� �������� ��ȸ�ϰ� ���� ��)
SELECT
    (3 + 7) * 5 / 10 AS ������
FROM DUAL;

-- WHERE ��: ��ȸ ��� ���� �����ϴ� ������
SELECT *
FROM TB_EMP;

SELECT
    EMP_NM, BIRTH_DE
FROM TB_EMP
WHERE SEX_CD = 2;

-- PK�� �����͸� ��ȸ�ϸ� ������ �������� ��ȸ�˴ϴ�.
SELECT
    EMP_NO, EMP_NM, ADDR
FROM TB_EMP
WHERE EMP_NO = 1000000001;

-- �񱳿����� (=, <>, <, >, >=)
-- SQL �񱳿����� (BETWEENM IN, LIKE)

-- BETWEEN ������
SELECT
    EMP_NO, EMP_NM, BIRTH_DE, TEL_NO
FROM TB_EMP
WHERE BIRTH_DE BETWEEN '19900101' AND '19991231';

-- IN ������
SELECT
    EMP_NO, EMP_NM, DEPT_CD
FROM TB_EMP
WHERE dept_cd = '100004'
    OR dept_cd = '100006';
    
SELECT
    EMP_NO, EMP_NM, DEPT_CD
FROM TB_EMP
WHERE dept_cd IN ('100004', '100006');

-- ����������
SELECT
    EMP_NO, EMP_NM, DEPT_CD
FROM TB_EMP
WHERE dept_cd NOT IN ('100004', '100006');

-- LIKE ������
-- ���ϵ�ī�� ����
-- % : 1���� �̻� ����, _ : �� 1���� ����
SELECT
    EMP_NO, EMP_NM
FROM TB_EMP
WHERE EMP_NM LIKE '��%';

SELECT
    EMP_NO, EMP_NM
FROM TB_EMP
WHERE EMP_NM LIKE '%��';

SELECT
    EMP_NO, EMP_NM
FROM TB_EMP
WHERE EMP_NM LIKE '��__';

-- ������ �达�̸鼭, �μ��� 100003��, 100004��, 100006�� �߿� �ϳ��̸鼭, 90������ ����� ���, �̸�, ����, �μ��ڵ带 ��ȸ
SELECT
    EMP_NO, EMP_NM, BIRTH_DE, DEPT_CD
FROM TB_EMP
WHERE EMP_NM LIKE '��%' AND 
    dept_cd IN ('100003', '100004', '100006') AND 
    birth_de BETWEEN '19900101' AND '19991231';
    
-- NULL�� ��ȸ
SELECT
    EMP_NO, EMP_NM, DIRECT_MANAGER_EMP_NO
FROM TB_EMP
WHERE DIRECT_MANAGER_EMP_NO IS NULL; -- NULL�� IS�θ� ��

SELECT *  FROM TB_EMP;

SELECT
    EMP_NO, EMP_NM, DIRECT_MANAGER_EMP_NO
FROM TB_EMP
WHERE DIRECT_MANAGER_EMP_NO IS NOT NULL;

-- AND �� OR�� �켱����
SELECT
    EMP_NO, EMP_NM, ADDR, DEPT_CD
FROM TB_EMP
WHERE EMP_NM LIKE '��%'
    AND DEPT_CD IN ('100004', '100006')
    AND NOT (ADDR LIKE '%����%' OR ADDR LIKE '%����%');
    
-- ���� �񱳿�����
SELECT
    EMP_NO, EMP_NM, SEX_CD
FROM TB_EMP
WHERE EMP_NM LIKE '��%'
    AND DEPT_CD IN ('100004', '100006')
    AND SEX_CD <> 1;
    
    



