
-- # 계층형 쿼리 추가 예제

SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID
FROM employees;

SELECT 
    employee_id,
    LPAD(' ', 4*(LEVEL-1)) || first_name || ' ' || last_name AS "NAME",
    LEVEL
FROM employees
START WITH manager_id IS NULL
CONNECT BY PRIOR employee_id = manager_id
ORDER SIBLINGS BY first_name ASC;









-- # 실습문제
-- 1. employees 테이블에서 입사일(hire_date)가 04년이거나 
--    부서번호(department_id)가 20번인 사람의 사원아이디(employee_id)와 이름(first_name)을 조회하세요.
--    UNION을 사용할 것!
SELECT * FROM EMPLOYEES;
SELECT
    EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID = '20'
UNION
SELECT
    EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
WHERE hire_date BETWEEN '20040101' AND '20041231'
;
-- 2. employees 테이블에서 입사일(hire_date)가 04년이고
--    부서번호(department_id)가 20번인 사람의 사원아이디(employee_id)와 이름(first_name)을 조회하세요.
--    INTERSECT을 사용할 것!
SELECT
    EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID = '20'
INTERSECT
SELECT
     EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
WHERE hire_date BETWEEN '20040101' AND '20041231'
;
-- 3. employees 테이블에서 입사일(hire_date)가 04년에 입사하였지만
--    부서번호(department_id)가 20번이 아닌 사람의 사원아이디(employee_id)와 이름(first_name)을 조회하세요.
--    MINUS을 사용할 것!
SELECT
     EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
WHERE hire_date BETWEEN '20040101' AND '20041231'
MINUS
SELECT
    EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID = '20'
;

--SELECT
--     EMPLOYEE_ID, FIRST_NAME, hire_date, department_id
--FROM EMPLOYEES
--WHERE hire_date BETWEEN '20040101' AND '20041231';







