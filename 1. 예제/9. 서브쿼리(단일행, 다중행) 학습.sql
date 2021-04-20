-- # ��������
-- ## ���� �� ���� ����

SELECT
    a.emp_no,
    a.emp_nm,
    a.dept_cd
FROM
    tb_emp a
WHERE
    a.dept_cd = (
        SELECT
            dept_cd
        FROM
            tb_emp
        WHERE
            emp_no = '1000000005'
    );

SELECT
    *
FROM
    tb_emp;

SELECT
    *
FROM
    tb_sal_his;

SELECT
    a.emp_no,
    a.emp_nm,
    b.pay_de,
    b.pay_amt
FROM
    tb_emp      a,
    tb_sal_his  b
WHERE
        pay_de = '20200525'
    AND pay_amt >= (
        SELECT
            AVG(pay_amt)
        FROM
            tb_sal_his
        WHERE
            pay_de = '20200525'
    )
    AND a.emp_no = b.emp_no
--GROUP BY EMP_NO
ORDER BY
    a.emp_no;

-- ## ���� �� ���� ����
-- �������� ��ȸ �Ǽ��� ���� ���� ��
-- ������ ������: IN, ANY, EXISTS


-- �ѱ������ͺ��̽���������� �߱��� �ڰ����� ������ �ִ� �����ȣ�� �ڰ��� ������ ��ȸ
SELECT
    *
FROM
    tb_certi;

SELECT
    *
FROM
    tb_emp_certi;

SELECT
    a.emp_no,
    b.emp_nm,
    COUNT(a.certi_cd)
FROM
         tb_emp_certi a
    JOIN tb_emp b ON a.emp_no = b.emp_no
WHERE
    a.certi_cd IN (
        SELECT
            certi_cd
        FROM
            tb_certi
        WHERE
            issue_insti_nm = '�ѱ������ͺ��̽������'
    )
GROUP BY
    a.emp_no,
    b.emp_nm
ORDER BY
    a.emp_no;

-- ## ���� Į�� ��������
-- �μ����� 2�� �̻��� �μ� �߿��� �� �μ��� ���� ���� ���� ����� ������ ��ȸ
SELECT
    *
FROM
    tb_emp;

SELECT
    a.emp_no,
    a.emp_nm,
    a.dept_cd,
    dept_nm,
    a.birth_de
FROM
         tb_emp a
    JOIN tb_dept b ON a.dept_cd = b.dept_cd
WHERE
    ( a.dept_cd, a.birth_de ) IN (
        SELECT
            e.dept_cd, MIN(e.birth_de)
        FROM
            tb_emp e
        GROUP BY
            dept_cd
        HAVING
            COUNT(*) > 1
    );

-- �ּҰ� ������ �������� �μ������� ��ȸ

SELECT
    1
FROM
    tb_emp
WHERE
    addr LIKE '%����%';

SELECT
    a.dept_cd,
    a.dept_nm
FROM
    tb_dept a
WHERE
    EXISTS (
        SELECT
            1
        FROM
            tb_emp k
        WHERE
            k.addr LIKE '%����%'
            AND a.dept_cd = k.dept_cd
    );

SELECT
    k.emp_nm,
    k.addr
FROM
    tb_emp k
WHERE
    k.addr LIKE '%����%';

-- ## ��Į�� �������� (SELECT���� ���� ��������)

SELECT
    a.emp_no,
    a.emp_nm,
    a.dept_cd,
    (
        SELECT
            b.dept_nm
        FROM
            tb_dept b
        WHERE
            a.dept_cd = b.dept_cd
    ) AS dept_nm
FROM
    tb_emp a;

-- �ѱ������ͺ��̽���������� �߱��� �ڰ����� ���� �ִ� ����� ������ ��ȸ
SELECT
    a.emp_no,
    (
        SELECT
            c.emp_nm
        FROM
            tb_emp c
        WHERE
            a.emp_no = c.emp_no
    )  AS emp_nm,
    a.certi_cd,
    (
        SELECT
            d.certi_nm
        FROM
            tb_certi d
        WHERE
            a.certi_cd = d.certi_cd
    )  AS certi_nm
FROM
    tb_emp_certi a
WHERE
    a.certi_cd IN (
        SELECT
            b.certi_cd
        FROM
            tb_certi b
        WHERE
            b.issue_insti_nm = '�ѱ������ͺ��̽������'
    );

-- # �ζ��� �� (FROM���� ����ϴ� ��������)
SELECT
    b.emp_no,
    (
        SELECT
            c.emp_nm
        FROM
            tb_emp c
        WHERE
            a.emp_no = c.emp_no
    )  AS emp_nm,
    b.certi_cd,
    (
        SELECT
            d.certi_nm
        FROM
            tb_certi d
        WHERE
            a.certi_cd = d.certi_cd
    )  AS certi_nm
FROM
    (
        SELECT
            k.certi_cd
        FROM
            tb_certi k
        WHERE
            k.issue_insti_nm = '�ѱ������ͺ��̽������'
    )             a,
    tb_emp_certi  b
WHERE
    a.certi_cd = b.certi_cd;
--

SELECT
    *
FROM
    (
        SELECT
            ROWNUM rn,
            emp_no,
            emp_nm,
            addr
        FROM
            tb_emp
        WHERE
            ROWNUM <= 10
    ) a
WHERE
    a.addr LIKE '%����%';

SELECT
    ROWNUM,
    emp_no,
    emp_nm,
    addr
FROM
    tb_emp
ORDER BY
    emp_no DESC;

-- ## ������ �������� ������
-- 1. IN: ����� ����� ������ Ȯ��
-- 2. ANY, SOME: ���� ���������� ���� ���ϵ� �� ��ϰ� ���ϴµ� �ϳ��� �����ϸ� ��.
-- 3. ALL: ���� ���������� ���� ���ϵ� �� ��ϰ� ���ϴµ� ��� ���� �����ؾ� ��.
-- 4. EXISTS: ����� �����ϴ� ���� �����ϴ����� ���θ� Ȯ��

-- IN������ = ANY�� �����ϴ�.
SELECT
    a.emp_nm,
    a.addr,
    a.dept_cd
FROM
    tb_emp a
WHERE
    dept_cd = ALL (
        SELECT
            dept_cd
        FROM
            tb_emp
        WHERE
            emp_nm = '�̰���'
    );