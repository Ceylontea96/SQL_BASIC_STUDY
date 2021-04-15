SELECT * FROM tb_sal_his;

SELECT
    emp_no,
    SUM(pay_amt) AS "�� �޿� ���Ҿ�"
FROM TB_SAL_HIS
GROUP BY emp_no
HAVING AVG(PAY_AMT) > 4000000;

CREATE TABLE ����������_56 (
    ���� VARCHAR2(50),
    ����ݾ� NUMBER(10),
    �� VARCHAR2(10)
);

INSERT INTO ����������_56 VALUES('����', 500, '2018');
INSERT INTO ����������_56 VALUES('����', 700, '2019');
INSERT INTO ����������_56 VALUES('����', 1000, '2020');

INSERT INTO ����������_56 VALUES('����', 300, '2019');
INSERT INTO ����������_56 VALUES('����', 600, '2020');
INSERT INTO ����������_56 VALUES('�λ�', 400, '2020');
INSERT INTO ����������_56 VALUES('�λ�', 800, '2021');
COMMIT;

-- JOIN ����
SELECT * FROM TB_EMP;

-- 2�� ���̺� JOIN
SELECT
    A.EMP_NO,
    A.EMP_NM,
    B.DEPT_CD,
    DEPT_NM
FROM TB_EMP A, TB_DEPT B
WHERE A.DEPT_CD = B.DEPT_CD
--    AND B.DEPT_NM = '������'
--ORDER BY EMP_NO
;


-- �ڰ��� ���� ���̺�
SELECT * FROM TB_CERTI;
-- ȸ���� ����� �ڰ��� ���� ���̺�
SELECT * FROM TB_EMP_CERTI;

-- 3�� ���̺� JOIN
SELECT
    A.EMP_NO AS �����ȣ, 
    A.EMP_NM AS ����̸�,
    B.CERTI_CD AS �ڰ����ڵ�,
    C.CERTI_NM AS �ڰ�����,
    b.acqu_de AS �����
FROM TB_EMP A
    ,TB_EMP_CERTI B
    ,TB_CERTI C
WHERE A.EMP_NO = B.EMP_NO
    AND B.CERTI_CD = C.CERTI_CD
ORDER BY �����
;

-- 4�� ���̺� JOIN
SELECT
    A.EMP_NO AS �����ȣ,
    A.EMP_NM AS ����̸�,
    A.DEPT_CD AS �μ��ڵ�,
    B.DEPT_NM AS �μ���,
    C.CERTI_CD AS �ڰ����ڵ�,
    C.ACQU_DE AS �������,
    D.CERTI_NM AS �ڰ�����
FROM TB_EMP A
    ,TB_DEPT B
    ,TB_EMP_CERTI C
    ,TB_CERTI D
WHERE A.EMP_NO = C.EMP_NO
    AND A.DEPT_CD = B.DEPT_CD
    AND C.CERTI_CD = D.CERTI_CD
;

-- # INNER JOIN
-- 1. 2�� �̻��� ���̺��� ����� �÷��� ���� �������� ���յǴ� ���α���Դϴ�.
-- 2. WHERE���� ���� �÷����� ������� (=)�� ���� ���ε˴ϴ�.

SELECT
    A.EMP_NO AS �����ȣ,
    A.EMP_NM AS ����̸�,
    A.ADDR AS �ּ���,
    A.DEPT_CD AS �μ��ڵ�,
    B.DEPT_NM AS �μ��̸�
FROM TB_EMP A
    ,TB_DEPT B
WHERE A.DEPT_CD = B.DEPT_CD
    AND A.ADDR LIKE '%����%'
ORDER BY A.EMP_NO
;

-- # NATURAL JOIN
-- 1. NATURAL JOIN�� ������ �̸��� ���� �÷��鿡�� �ڵ� �����ϴ� ����Դϴ�.
-- 2. ��, �ڵ����� 2�� �̻��� ���̺��� ���� �̸��� ���� �÷��� ã�� INNER������ �����մϴ�.
-- 3. �̶�, ���εǴ� ���� �̸��� �÷��� ������ Ÿ���� ���ƾ��ϸ� ALIAS�� ���̺���� ���� �� �����ϴ�.
-- 4. SELECT * ������ ����ϸ�, ���� �÷����� �ڵ� �����ϸ� ������տ��� �ѹ��� ǥ��˴ϴ�.

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

-- # USING�� ����
-- 1. NATURAL ���ο����� �ڵ����� �̸��� ��ġ�ϴ� ��� �÷��� ���� ������ �Ͼ����
--    USING�� ����ϸ� ���ϴ� �÷��� ���ؼ��� ���������� ������ �����մϴ�.
-- 2. USING�������� ���� �÷��� ���� ALIAS�� ���̺���� ���� �� �����ϴ�.

SELECT
    E.emp_no, E.emp_nm, E.addr, dept_cd, D.dept_nm
FROM TB_EMP E JOIN TB_DEPT D USING (DEPT_CD)
;

-- # JOIN ON��
-- 1. ���� ���� ������(ON��) �Ϲ� ���� ������(WHERE��)�� �и��ؼ� �ۼ��ϴ� ����Դϴ�.
-- 2. ON���� ����ϸ� JOIN���Ŀ� �� �����̳� ���������� ���� �߰� ������ �� �� �ֽ��ϴ�.

SELECT
    A.EMP_NO AS �����ȣ,
    A.EMP_NM AS ����̸�,
    A.ADDR AS �ּ���,
    A.DEPT_CD AS �μ��ڵ�,
    B.DEPT_NM AS �μ��̸�
FROM TB_EMP A 
JOIN TB_DEPT B
ON A.DEPT_CD = B.DEPT_CD
WHERE A.ADDR LIKE '%����%'
ORDER BY A.EMP_NO
;


-- SELECT [DISTINCT] { ���̸� .... } 
-- FROM  ���̺� �Ǵ� �� �̸�
-- JOIN  ���̺� �Ǵ� �� �̸�
-- ON    ���� ����
-- WHERE ��ȸ ����
-- GROUP BY  ���� �׷�ȭ
-- HAVING    �׷�ȭ ����
-- ORDER BY  ������ �� [ASC | DESC];





