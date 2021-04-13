
-- # ���ڿ� ��
DROP TABLE CHAR_COMPARE;
CREATE TABLE CHAR_COMPARE (
    sn CHAR(10),
    char_4 CHAR(4),
    char_6 CHAR(6)
);

INSERT INTO char_compare VALUES ('101', 'SQLD', 'SQLD');
INSERT INTO char_compare VALUES ('102', 'SQLD', 'SQLA');


SELECT * FROM CHAR_COMPARE;

--REPLACE�� ���� DATA�� ���������ʰ� ǥ���� �ٲ���.
SELECT
    REPLACE(CHAR_4, ' ', '+') AS CHAR_4,
    REPLACE(CHAR_6, ' ', '+') AS CHAR_6
FROM CHAR_COMPARE;

--CHAR Ÿ�� ������ ��
SELECT
    REPLACE(CHAR_4, ' ', '+') AS CHAR_4,
    REPLACE(CHAR_6, ' ', '+') AS CHAR_6
FROM CHAR_COMPARE
WHERE SN = '102'
    AND CHAR_4 > CHAR_6;
--A�� 65, a�� 97, ���� 44032
    
SELECT * FROM CHAR_COMPARE;

--������ VARCHARŸ���� ����� ��
DROP TABLE VARCHAR_COMPARE;
CREATE TABLE VARCHAR_COMPARE (
    sn CHAR(10),
    char_4 CHAR(4),
    varchar_6 VARCHAR2(6)
);

INSERT INTO varchar_compare VALUES ('101', 'SQLD', 'SQLD  ');
INSERT INTO varchar_compare VALUES ('102', 'SQLD', 'SQLA  ');
COMMIT;

SELECT * FROM varchar_compare;

SELECT
    REPLACE(CHAR_4, ' ', '+') AS CHAR_4,
    REPLACE(VARCHAR_6, ' ', '+') AS VARCHAR_6
FROM VARCHAR_COMPARE
WHERE SN = '101'
    AND CHAR_4 ^= VARCHAR_6;
    
    
-- ������ڿ����� ��
SELECT
    REPLACE(CHAR_4, ' ', '+') AS CHAR_4,
    REPLACE(VARCHAR_6, ' ', '+') AS VARCHAR_6
FROM VARCHAR_COMPARE
WHERE SN = '101'
    AND CHAR_4 = 'SQLD      ';

SELECT
    REPLACE(CHAR_4, ' ', '+') AS CHAR_4,
    REPLACE(VARCHAR_6, ' ', '+') AS VARCHAR_6
FROM VARCHAR_COMPARE
WHERE SN = '101'
    AND VARCHAR_6 = 'SQLD';
    
    
    
-- # ������ �Լ�
-- ## ���ڿ� �Լ�
SELECT
    LOWER('Hello WORLD'), -- ���� �ҹ��ڷ� ��ȯ
    UPPER('Hello WORLD'), -- ���� �빮�ڷ� ��ȯ
    INITCAP('abCDef')     -- ù���ڸ� �빮�ڷ� ��ȯ
FROM DUAL;

SELECT
    ASCII('A'),
    CHR(65)
FROM DUAL;

SELECT
    CONCAT('SQL', 'DEVELOPER'),     -- ���ڿ��� ����
    SUBSTR('SQL DEVELOPER', 1, 3),  -- ���ڿ� �ڸ�. 1������ 3�� �ڸ�(ù���ڰ� 1��)
    LENGTH('HELLO WORLD'),          -- ���ڿ��� ����
    TRIM('        HI       ')       -- �¿� ���� ����
FROM DUAL;

SELECT
    RPAD('Steve', 10, '-'), -- �����ʿ� �־��� ���ڸ� ä��
    LPAD('Steve', 10, '*'), -- ���ʿ� �־��� ���ڸ� ä��
    REPLACE('Java programmer', 'Java', 'BigData') AS "REPLACE"-- ���ڸ� ����
FROM DUAL;

-- ## ������ �Լ�
SELECT 
    MOD(27, 5) AS MOD, -- ������ �� ��ȯ
    CEIL(38.678) AS ceil, -- �ø��� ��ȯ
    FLOOR(38.678) AS floor, -- ������ ��ȯ
    ROUND(38.678, 2) AS round, -- �ڸ������� �ݿø�
    TRUNC(38.678, 2) AS trunc  -- �ڸ��� ���ϸ� ����
FROM dual;

-- ## ��¥�� �Լ�

-- ���� ��¥�� ��ȸ
SELECT SYSDATE
FROM DUAL;

SELECT SYSTIMESTAMP
FROM DUAL;

-- ��¥ ����
-- ��¥ + ���� = ��¥  => ��(DAY) ���� ��¥�� ����
-- ��¥ - ���� = ��¥  => ��¥���� �� ���� ��
-- ��¥ - ��¥ = �ϼ�  => � ��¥���� �ٸ� ��¥�� �� �ϼ�
-- ��¥ + ����/24 = ��¥  => ��¥�� �ð��� ����

SELECT 
    SYSDATE AS "���� �ð�",
    SYSDATE - 1 AS "SYSDATE - 1",
    (SYSDATE + 10) - SYSDATE AS "��¥ - ��¥",
    SYSDATE - (1/24) AS "1�ð� ����",
    SYSDATE - (1/24/60) * 100 AS "100�� ����",
    SYSDATE - (1/24/60/60) * 30 AS "30�� ����"
FROM dual;


-- ## ��ȯ �Լ�
SELECT * FROM CHAR_COMPARE
WHERE SN = '101';

-- ��¥�� ���ڷ� ��ȯ (TO_CHAR �Լ�)
-- ��¥ ���� ����: Y - ����, MM - ���ڸ� ��, D - �ϼ�
-- �ð� ���� ����: HH12 - ��(1~12), HH24 (0~23), MI - ��, SS - ��
SELECT
    SYSDATE,
    TO_CHAR(SYSDATE, 'MM - DD') AS "�� - ��",
    TO_CHAR(SYSDATE, 'YYYY/MM/DD') AS "��/��/��",
    TO_CHAR(SYSDATE, 'YYYY"��" MM"��" DD"��"') AS "��¥ - �ѱ�����",
    TO_CHAR(SYSDATE, 'YY/MM/DD AM HH12:MI:SS') AS "��¥�� �ð�"
FROM DUAL;

-- ���ڸ� ���ڷ� ��ȯ
-- ���� ���� ���� - $: �޷�ǥ��, L: ����ȭ���ȣ
SELECT
    TO_CHAR(9500012 * 1.33, '$999,999,999.99') AS �޷�,
    TO_CHAR(1350000 * 1.1123546795321231 , '999,999,999L') AS ��ȭ
FROM DUAL;

-- ���ڸ� ���ڷ� ��ȯ
SELECT
    TO_NUMBER('$5,500', '$999,999') - 4000 AS "�����"
FROM DUAL;


-- CASEǥ���� DECODE�Լ�
SELECT 
    SAL_CD,
    CASE WHEN SAL_CD = '100001' THEN '�⺻�޿�'
         WHEN SAL_CD = '100002' THEN '���ʽ��޿�'
         ELSE '��Ÿ'
         END SAL_NAME
FROM TB_SAL;

SELECT
    SAL_CD,
    DECODE(SAL_CD, '100001', '�⺻��', '100002', '���ʽ��޿�', '��Ÿ') AS SAL_NAME
FROM TB_SAL;

-- # �� ���� �Լ�
-- NVL(expr1, expr2)
-- expr1: Null�� ���� �� �ִ� ���̳� ǥ����
-- expr2: expr1�� Null�� ��� ��ü�� ��
SELECT
    EMP_NO,
    EMP_NM,
    NVL(DIRECT_MANAGER_EMP_NO, 'ȸ���')
FROM TB_EMP;

SELECT
    NVL(MAX(emp_nm), '�������') AS EMP_NM
FROM TB_EMP
WHERE EMP_NM = '����ȣ';

-- NVL2(expr1, expr2, expr3)
-- expr1�� ���� Null�� �ƴϸ� expr2�� ��ȯ, Null�̸� expr3�� ��ȯ
SELECT
    EMP_NM,
    NVL2(direct_manager_emp_no, '�Ϲݻ��', 'ȸ���') AS ����
FROM TB_EMP;

-- NULLIF(expr1, expr2)
-- �� ���� ������ NULL ����, �ٸ��� expr1 ����
SELECT
    NULLIF('������', '����ȣ') 
FROM DUAL;

-- COALESCE(expr1, ...)
-- ���� ǥ���� �� NULL�� �ƴ� ���� ���ʷ� �߰ߵǸ� �ش� ���� ����
SELECT
    COALESCE(NULL, NULL, 3000, 4000)
FROM DUAL;

SELECT
    COALESCE(NULL, 5000, NULL)
FROM DUAL;

SELECT
    COALESCE(7000, NULL, NULL, 10000)
FROM DUAL;
