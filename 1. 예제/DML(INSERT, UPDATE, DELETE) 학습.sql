
-- # DML : ������ ���۾�
-- SELECT, INSERT, UPDATE, DELETE
-- ������ �߰�
INSERT INTO
    board (bno, title, content, writter, reg_date)
VALUES
    (4, '4�����̿���~', '��մ� �����Դϴ�.', '������', SYSDATE);
    
-- PK�� �ߺ��� �����͸� ������ �� ����.
    
COMMIT;

SELECT * FROM BOARD;
    
INSERT INTO
    board (bno, content, writter, reg_date)
VALUES
    (2, '��մ� ����2�Դϴ�. ���� �����.', '������', SYSDATE);
    
INSERT INTO
    board (bno, title, writter, reg_date)
VALUES
    (3, '�ȳ�~DJLSKJFLSKDJFLSDKJFSDLK', '������', SYSDATE);
    
COMMIT;

SELECT * FROM BOARD;

INSERT INTO
    board
VALUES
    (4, '�ȳ�~', '��մ� �����Դϴ�. ���� ��մٱ���.', '������', SYSDATE);
    
COMMIT;

SELECT * FROM BOARD;

-- ������ ����
UPDATE BOARD
SET WRITTER='������'
WHERE bno = 1;

UPDATE BOARD
SET WRITTER='������',
    CONTENT = 'hello goodbye~'
WHERE bno = 3;

-- UPDATE���� WHERE ������ ������ ���
UPDATE BOARD
SET TITLE = 'TEST';

-- ��ü �����Ͱ� �����

COMMIT;

SELECT * FROM BOARD;

-- ������ ����
DELETE FROM BOARD 
WHERE BNO = 4;

DELETE FROM BOARD;
-- WHERE�� ������ ���� ������

COMMIT;

SELECT * FROM BOARD;

INSERT INTO
    board (bno, title, content, writter, reg_date)
VALUES
    (2, '����', '��մ� ����2�Դϴ�. ���� �����.', '������', SYSDATE);
    
    INSERT INTO
    board (bno, title, content, writter, reg_date)
VALUES
    (3, '����124', '��մ� ����2�Դϴ�. ���� �����.', '������', SYSDATE);
    
    INSERT INTO
    board (bno, title, content, writter, reg_date)
VALUES
    (1, '���񤱤�����', '��մ� ����2�Դϴ�. ���� �����.', '������', SYSDATE);
    
    
    COMMIT;

SELECT * FROM BOARD;

-- ��ü ������ ����
-- 1. WHERE���� ������ DELETE�� (ROLLBACK ����)
DELETE FROM BOARD;
ROLLBACK;

-- 2. TRUNCATE TABLE DDL�� ����� ��� (ROLLBACK �Ұ��� / ���̺� ������ �������� ����)
-- FK ���� ����
ALTER TABLE REPLY 
DROP CONSTRAINT fk_reply_bno;

TRUNCATE TABLE BOARD;

-- 3. DROP TABLE DDL�� ����� ��� (ROLLBACK �Ұ��� / ���̺� ������ ������)
DROP TABLE BOARD;

SELECT * FROM BOARD;