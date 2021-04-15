
-- # �ǽ� ����
-- 1. employees, departments���̺��� INNER JOIN�ؼ�
--    first_name, department_id, department_name�� ��ȸ�ϼ���.
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;

SELECT
    A.FIRST_NAME, A.DEPARTMENT_ID, B.DEPARTMENT_NAME
FROM EMPLOYEES A 
    ,DEPARTMENTS B
WHERE a.department_id = b.department_id    
;

-- 2. employees, departments���̺��� NATURAL JOIN�ؼ�
--    first_name, department_id, department_name�� ��ȸ�ϼ���.
SELECT
    FIRST_NAME, DEPARTMENT_ID, DEPARTMENT_NAME
FROM EMPLOYEES NATURAL JOIN DEPARTMENTS;

-- 3. employees, departments���̺��� JOIN ON�� ����ؼ�
--    first_name, department_id, department_name�� ��ȸ�ϼ���.
SELECT
    A.FIRST_NAME, A.DEPARTMENT_ID, B.DEPARTMENT_NAME
FROM EMPLOYEES A
JOIN DEPARTMENTS B
ON A.DEPARTMENT_ID = B.DEPARTMENT_ID
;
