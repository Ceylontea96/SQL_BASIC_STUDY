

-- # GROUP BY, HAVING��
-- 1. ���� �Լ�
SELECT
    COUNT(EMP_NO) AS "�� �����",
    MAX(BIRTH_DE) AS "���� � ���",
    MIN(BIRTH_DE) AS "���� ���̸��� ���"
FROM TB_EMP;

SELECT
    COUNT(*), -- NULL ����
    COUNT(direct_manager_emp_no) -- NULL ���� ����
FROM TB_EMP;

SELECT * FROM TB_SAL_HIS;

SELECT
    TO_CHAR(SUM(pay_amt), 999,999,999��)
FROM TB_SAL_HIS;

-- 2. GROUP BY

-- �μ����� ���� ������ �������, ���� �������� �������, �μ��� �� �������� �˰� �ʹ�.
SELECT * FROM TB_EMP;

SELECT
    DEPT_CD,
    COUNT(*) AS "�μ��� ���� ��",
    MAX(BIRTH_DE) AS "���� � ���",
    MIN(BIRTH_DE) AS "���� ���̸��� ���"
FROM TB_EMP
GROUP BY DEPT_CD
ORDER BY DEPT_CD;

-- HAVING�� : �׷�ȭ �� ������� ������ �ɾ �� �� ����
SELECT
    A.DEPT_CD,
    (SELECT B.DEPT_NM FROM TB_DEPT B WHERE A.DEPT_CD = B.DEPT_CD) AS DEPT_NM,
    COUNT(*) AS "�μ��� ���� ��",
    MAX(A.BIRTH_DE) AS "���� � ���",
    MIN(A.BIRTH_DE) AS "���� ���̸��� ���"
FROM TB_EMP A
GROUP BY A.DEPT_CD
HAVING COUNT(*) > 1
ORDER BY A.DEPT_CD;

-- ������� �޿��� ���� ���� ���� �׼�, ���� ���� ���� �׼�, ��վ׼��� ��ȸ
SELECT EMP_NO, pay_amt, pay_de 
FROM tb_sal_his
ORDER BY EMP_NO, pay_de;

SELECT
    A.EMP_NO AS "�����ȣ",
    (SELECT B.EMP_NM FROM TB_EMP B WHERE A.EMP_NO = B.EMP_NO) AS "����̸�",
    MIN(A.pay_amt) AS "���� ���ɾ�",
    MAX(A.pay_amt) AS "�ְ� ���ɾ�",
    ROUND(AVG(A.pay_amt), 2) AS "��ձ޿�"
FROM TB_SAL_HIS A
WHERE a.pay_de BETWEEN 20190101 AND 20191231
GROUP BY A.EMP_NO
HAVING AVG(a.pay_amt) >= 4500000 
ORDER BY A.EMP_NO;

-- ����� 2019�� �����ȣ��, ����̸�, ������ ��ȸ

SELECT
    A.EMP_NO AS "�����ȣ",
    (SELECT B.EMP_NM FROM TB_EMP B WHERE A.EMP_NO = B.EMP_NO) AS "����̸�",
    TO_CHAR(SUM(a.pay_amt), 'L999,999,999') AS "����1",
    TO_CHAR(ROUND(AVG(a.pay_amt), 2) * 12, 'L999,999,999') AS "����2"
FROM TB_SAL_HIS A
WHERE a.pay_de BETWEEN 20190101 AND 20191231
GROUP BY A.EMP_NO
HAVING SUM(a.pay_amt) >= 50000000
ORDER BY A.EMP_NO;

-- ���� ORDER BY
-- ASC: ������(�⺻��), DESC: ������

SELECT 
    EMP_NO AS �����ȣ, 
    EMP_NM AS ����̸�, 
    ADDR AS �ּ�
FROM TB_EMP
ORDER BY EMP_NM DESC;

SELECT 
    EMP_NO AS �����ȣ, 
    EMP_NM AS ����̸�, 
    ADDR AS �ּ�
FROM TB_EMP
ORDER BY 3 DESC;

SELECT 
    EMP_NO AS �����ȣ, 
    EMP_NM AS ����̸�, 
    ADDR AS �ּ�
FROM TB_EMP
--ORDER BY EMP_NM DESC, EMP_NO, 3;
ORDER BY 2 DESC, 1, 3;

SELECT 
    EMP_NO AS EN, 
    EMP_NM AS EM, 
    ADDR AS �ּ�
FROM TB_EMP
ORDER BY EM DESC, EN DESC;













