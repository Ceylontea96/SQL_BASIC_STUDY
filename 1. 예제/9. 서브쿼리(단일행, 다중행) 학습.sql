
-- # ��������
-- ## ���� �� ���� ����

SELECT
    A.EMP_NO, A.EMP_NM, A.DEPT_CD
FROM TB_EMP A
WHERE A.DEPT_CD =
(
    SELECT DEPT_CD
    FROM TB_EMP
    WHERE EMP_NO = '1000000005'
)
;

SELECT * FROM TB_EMP;
SELECT * FROM TB_SAL_HIS;

SELECT
    A.EMP_NO, A.EMP_NM, B.PAY_DE, B.PAY_AMT
FROM TB_EMP A, TB_SAL_HIS B
WHERE PAY_DE = '20200525'
    AND PAY_AMT >=
(
    SELECT AVG(PAY_AMT)
    FROM TB_SAL_HIS
    WHERE PAY_DE = '20200525'
)
    AND A.EMP_NO = B.EMP_NO
--GROUP BY EMP_NO
ORDER BY A.EMP_NO
    
;

-- ## ���� �� ���� ����
-- �������� ��ȸ �Ǽ��� ���� ���� ��
-- ������ ������: IN, ANY, EXISTS


-- �ѱ������ͺ��̽���������� �߱��� �ڰ����� ������ �ִ� �����ȣ�� �ڰ��� ������ ��ȸ
SELECT * FROM TB_CERTI;
SELECT * FROM TB_EMP_CERTI;
SELECT
    A.EMP_NO, B.EMP_NM, COUNT(A.CERTI_CD)
FROM TB_EMP_CERTI A
JOIN TB_EMP B
ON A.EMP_NO = B.EMP_NO
WHERE A.CERTI_CD IN
(
    SELECT
        CERTI_CD
    FROM TB_CERTI
    WHERE ISSUE_INSTI_NM = '�ѱ������ͺ��̽������'
)
GROUP BY A.EMP_NO, B.EMP_NM
ORDER BY A.EMP_NO
;