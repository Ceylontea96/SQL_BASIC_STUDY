
-- �ǽ�����
SELECT * FROM EMPLOYEES;
-- 1. employees���̺��� �� ����� �μ��� �μ� ��ȣ(department_id)�� ��� �޿�(salary)�� ��ȸ�ϼ���. 
SELECT
    NVL(department_id, 0) AS �μ���ȣ,
    TO_CHAR(ROUND(AVG(SALARY), 1), '$999,999') AS "�޿����"
FROM EMPLOYEES
GROUP BY department_id
ORDER BY department_id;

-- 2. employees���̺��� �μ��� �μ� ��ȣ(department_id)�� �μ��� �� ��� ���� ��ȸ�ϼ���.
SELECT
    NVL(department_id, 0) AS �μ���ȣ,
    COUNT(*) AS "�μ� �� ��� ��"
FROM EMPLOYEES
GROUP BY department_id
ORDER BY department_id;

-- 3. employees���̺��� �μ��� �޿� ����� 8000�� �ʰ��ϴ� �μ��� �μ���ȣ�� �޿� ����� ��ȸ�ϼ���.
SELECT
    NVL(department_id, 0) AS �μ���ȣ,
    TO_CHAR(ROUND(AVG(SALARY), 1), '$999,999') AS "�޿����"
FROM EMPLOYEES
GROUP BY department_id
HAVING AVG(SALARY) > 8000
ORDER BY department_id;

-- 4. employees���̺��� �޿� ����� 8000�� �ʰ��ϴ� �� ����(job_id)�� ���Ͽ� 
--    ���� �̸�(job_id)�� SA�� �����ϴ� ����� �����ϰ� ���� �̸��� �޿� ����� 
--    �޿� ����� ���� ������ �����Ͽ� ��ȸ�ϼ���.
SELECT
    job_id AS "�����̸�",
    TO_CHAR(ROUND(AVG(SALARY), 1), '$999,999') AS "�޿����"
FROM EMPLOYEES
WHERE JOB_ID NOT LIKE 'SA%'
GROUP BY JOB_ID
HAVING AVG(SALARY) > 8000
ORDER BY AVG(SALARY) DESC;
