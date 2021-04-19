
-- # ������ ���� �߰� ����

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









-- # �ǽ�����
-- 1. employees ���̺��� �Ի���(hire_date)�� 04���̰ų� 
--    �μ���ȣ(department_id)�� 20���� ����� ������̵�(employee_id)�� �̸�(first_name)�� ��ȸ�ϼ���.
--    UNION�� ����� ��!
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
-- 2. employees ���̺��� �Ի���(hire_date)�� 04���̰�
--    �μ���ȣ(department_id)�� 20���� ����� ������̵�(employee_id)�� �̸�(first_name)�� ��ȸ�ϼ���.
--    INTERSECT�� ����� ��!
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
-- 3. employees ���̺��� �Ի���(hire_date)�� 04�⿡ �Ի��Ͽ�����
--    �μ���ȣ(department_id)�� 20���� �ƴ� ����� ������̵�(employee_id)�� �̸�(first_name)�� ��ȸ�ϼ���.
--    MINUS�� ����� ��!
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







