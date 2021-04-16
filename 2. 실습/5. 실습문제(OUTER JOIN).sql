
-- OUTER JOIN �߰� ����
SELECT * FROM job_history ORDER BY employee_id;

-- ��� ��� ������ ��ȸ�Ұǵ� Ȥ�� ���� �����̷��� �ִٸ�
-- �ش� �̷µ� ���� ���� �ʹ�.
SELECT * FROM EMPLOYEES;

SELECT
    a.employee_id, a.first_name, a.hire_date, a.job_id AS "���� ����",
    b.start_date, b.end_date, b.job_id AS "���� ����", b.department_id
FROM EMPLOYEES A
LEFT OUTER JOIN JOB_HISTORY B
ON a.employee_id = b.employee_id
ORDER BY a.employee_id
;

-- �ǽ����� (JOIN)
-- 1. �����ȣ�� 103���� ����� �̸�(employee_name)�� �Ŵ��� �̸�(manager_name)�� ����ϼ���.
SELECT
    a.first_name || a.last_name,
    b.first_name || b.last_name
FROM EMPLOYEES A
JOIN EMPLOYEES B
ON A.MANAGER_ID = B.EMPLOYEE_ID
WHERE a.employee_id = 103
;

-- 2. ��� ����� first_name�� department_name, 
--    street_address + ',' + city + ',' + state_province�� address��� alias�� ��ȸ�ϼ���.
-- employees, departments, locations 3�� ����
SELECT
    a.first_name, b.department_name,
    c.street_address || ',' || c.city || ',' || c.state_province AS "address"
FROM employees A
JOIN departments B
ON a.department_id = b.department_id
JOIN locations C
ON b.location_id = c.location_id
;

-- 3. 103�� ����� first_name�� department_name, 
--    street_address + ',' + city + ',' + state_province�� address��� alias�� 
--    �����Ͽ� ��ȸ�ϼ���.
SELECT
    a.first_name, b.department_name,
    c.street_address || ',' || c.city || ',' || c.state_province AS "address"
FROM employees A
JOIN departments B
ON a.department_id = b.department_id
JOIN locations C
ON b.location_id = c.location_id
WHERE a.employee_id = 103
;

-- 4. �μ� �̸��� IT�� �����ϴ� ����� first_name�� department_name, 
--    street_address + ',' + city + ',' + state_province�� address��� alias�� 
--    �����Ͽ� ��ȸ�ϼ���.
SELECT
    a.first_name, b.department_name,
    c.street_address || ',' || c.city || ',' || c.state_province AS "address"
FROM employees A
JOIN departments B
ON a.department_id = b.department_id
JOIN locations C
ON b.location_id = c.location_id
WHERE b.department_name LIKE 'IT%'
;

-- 5. jobs���̺��� ��� ���� id(job_id)�� ������(job_title)�� ��ȸ�ϴµ� 
--    ���� �������� �̷��� �ִٸ� �ش� �̷� ���� 
-- (start_date, end_date, job_id, employee_id, first_name, department_id, department_name)
--    �� �Բ� ��ȸ�ϼ���.
SELECT * FROM JOBS;
SELECT
    a.job_id, a.job_title,
    B.start_date, B.end_date, B.job_id, D.employee_id, D.first_name, C.department_id, C.department_name
FROM JOBS A
LEFT OUTER JOIN job_history B
ON a.job_id = b.job_id
LEFT OUTER JOIN departments C
ON b.department_id = c.department_id
LEFT OUTER JOIN EMPLOYEES D
ON b.employee_id = d.employee_id
ORDER BY a.job_id
;

SELECT * FROM job_history;
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
SELECT * FROM LOCATIONS;

SELECT
    a.job_id, a.job_title,
    B.start_date, B.end_date, B.job_id, D.employee_id, D.first_name, C.department_id, C.department_name
FROM JOBS A
LEFT OUTER JOIN job_history B
ON a.job_id = b.job_id
LEFT OUTER JOIN departments C
ON b.department_id = c.department_id
LEFT OUTER JOIN EMPLOYEES D
ON c.department_id = d.department_id
ORDER BY a.job_id
;


