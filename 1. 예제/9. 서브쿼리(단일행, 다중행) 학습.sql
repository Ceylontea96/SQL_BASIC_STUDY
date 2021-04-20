-- # 서브쿼리
-- ## 단일 행 서브 쿼리

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

-- ## 다중 행 서브 쿼리
-- 서브쿼리 조회 건수가 여러 행인 것
-- 다중행 연산자: IN, ANY, EXISTS


-- 한국데이터베이스진흥원에서 발급한 자격증을 가지고 있는 사원번호와 자격증 개수를 조회
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
            issue_insti_nm = '한국데이터베이스진흥원'
    )
GROUP BY
    a.emp_no,
    b.emp_nm
ORDER BY
    a.emp_no;

-- ## 다중 칼럼 서브쿼리
-- 부서원이 2명 이산인 부서 중에서 각 부서의 가장 나이 많은 사람의 정보를 조회
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

-- 주소가 강남인 직원들의 부서정보를 조회

SELECT
    1
FROM
    tb_emp
WHERE
    addr LIKE '%강남%';

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
            k.addr LIKE '%강남%'
            AND a.dept_cd = k.dept_cd
    );

SELECT
    k.emp_nm,
    k.addr
FROM
    tb_emp k
WHERE
    k.addr LIKE '%강남%';

-- ## 스칼라 서브쿼리 (SELECT절에 들어가는 서브쿼리)

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

-- 한국데이터베이스진흥원에서 발급한 자격증을 갖고 있는 사원의 정보를 조회
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
            b.issue_insti_nm = '한국데이터베이스진흥원'
    );

-- # 인라인 뷰 (FROM절에 사용하는 서브쿼리)
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
            k.issue_insti_nm = '한국데이터베이스진흥원'
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
    a.addr LIKE '%용인%';

SELECT
    ROWNUM,
    emp_no,
    emp_nm,
    addr
FROM
    tb_emp
ORDER BY
    emp_no DESC;

-- ## 다중행 서브쿼리 연산자
-- 1. IN: 목록의 어떤값과 같은지 확인
-- 2. ANY, SOME: 값을 서브쿼리에 의해 리턴된 값 목록과 비교하는데 하나라도 만족하면 됨.
-- 3. ALL: 값을 서브쿼리에 의해 리턴된 값 목록과 비교하는데 모든 값을 만족해야 함.
-- 4. EXISTS: 결과를 만족하는 값이 존재하는지의 여부를 확인

-- IN연산자 = ANY는 동일하다.
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
            emp_nm = '이관심'
    );