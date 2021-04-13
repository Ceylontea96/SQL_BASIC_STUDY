
SELECT * FROM EMPLOYEES;

SELECT
    FIRST_NAME, LAST_NAME
FROM EMPLOYEES
WHERE LOWER(FIRST_NAME) = 'david';

SELECT
    FIRST_NAME, LAST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME = INITCAP('david');

-- # �ǽ����� 
-- 1. employees ���̺��� ��� ����� first_name�� first_name�� ���� ���� ��ȸ�ϼ���.
SELECT
    FIRST_NAME,
    LENGTH(FIRST_NAME)
FROM EMPLOYEES;

-- 2. employees ���̺��� first_name�� last_name�� �� ���� ������ �̸��� ��ȸ�ϼ���.
SELECT
    FIRST_NAME,
    LAST_NAME,
    CONCAT(FIRST_NAME, LAST_NAME)
FROM EMPLOYEES;
-- 3. employees ���̺��� job_id�� it_prog�� ����� first_name�� salary�� ����ϼ���.
--  ����1 ) ���ϱ� ���� ���� �ҹ��ڷ� �Է��� ��!
--  ����2 ) �̸��� �� 3���ڱ����� ����ϰ� �������� *�� ��ŷ�� ��. �� ���� ��Ī�� name�Դϴ�.
--  ����3 ) �޿��� ��ü 10�ڸ��� ����ϵ� �������ڸ��� *�� ����մϴ�. �� ���� ��Ī�� salary�Դϴ�
SELECT * FROM EMPLOYEES;

SELECT
    RPAD(SUBSTR(FIRST_NAME, 1, 3), LENGTH(FIRST_NAME), '*') AS "NAME",  
    LPAD(SALARY, 10, '*') AS "SALARY" 
FROM EMPLOYEES
WHERE LOWER(JOB_ID) = 'it_prog';

