
-- # 실습 문제
-- 1. employees, departments테이블을 INNER JOIN해서
--    first_name, department_id, department_name을 조회하세요.
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;

SELECT
    A.FIRST_NAME, A.DEPARTMENT_ID, B.DEPARTMENT_NAME
FROM EMPLOYEES A 
    ,DEPARTMENTS B
WHERE a.department_id = b.department_id    
;

-- 2. employees, departments테이블을 NATURAL JOIN해서
--    first_name, department_id, department_name을 조회하세요.
SELECT
    FIRST_NAME, DEPARTMENT_ID, DEPARTMENT_NAME
FROM EMPLOYEES NATURAL JOIN DEPARTMENTS;

-- 3. employees, departments테이블을 JOIN ON을 사용해서
--    first_name, department_id, department_name을 조회하세요.
SELECT
    A.FIRST_NAME, A.DEPARTMENT_ID, B.DEPARTMENT_NAME
FROM EMPLOYEES A
JOIN DEPARTMENTS B
ON A.DEPARTMENT_ID = B.DEPARTMENT_ID
;
