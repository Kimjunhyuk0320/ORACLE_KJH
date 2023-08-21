--Ŀ�� ���� ����� : ctrl + enter
-- ���� ��ü ���� : F5


-- 1. ���� ���� ��ɾ�
-- conn ������/��й�ȣ;
conn system/123456;

-- 2.
-- sql�� ��/�ҹ��� ������ ����.
-- ��ɾ� Ű���� �빮��, �ĺ��ڴ� �ҹ��� �ַλ��. (���� ��Ÿ�ϴ��)
SELECT user_id, username
FROM all_users
-- WHERE username = 'HR'
;

-- �⺻ ���� ���� �� ���Ѻο�--
-- 12C ���� �̻�: 'c##' ���ξ �ٿ��� ������ �����ϵ��� ��å�� ����
--  c## ���� �������� : ALTER SESSION SET '_ORACLE_SCRIPT' = TRUE;
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
-- HR ���� ����
CREATE USER HR IDENTIFIED BY 123456;

-- HR ������ �⺻ ���̺� ������ 'user' �������� ����
ALTER USER HR DEFAULT TABLESPACE users;

-- HR ������ ���뷮�� ���Ѵ�� ����
ALTER USER HR QUOTA UNLIMITED ON users;

-- HR ������ ���� �ο� GRANT connect, resource TO ������;
GRANT connect, resource TO HR;



-- ���� ���� : DROP USER ������ CASCADE;
DROP USER HR CASCADE;

-- ���� ��� ����: ALTER USER ������ ACCOUNT UNLOCK;
ALTER USER HR ACCOUNT UNLOCK;


-- HR ���� ��Ű��(������) ��������
-- 1. SQL PLUS
-- 2. HR ������ ����
-- 3. ��ɾ� �Է�
-- @[���]/hr_main.sql
-- @? : ����Ŭ�� ��ġ�� �⺻ ���
-- @?/demo/schema/human_resources/hr_main.sql

-- 4. 123456 [��й�ȣ]
-- 5. users [tablespace]
-- 6. temp [temp tablespace]
-- 7. [log ���] -@?/demo/schema/log



-- 3.
-- ���̺� EMPLOYEES �� ���̺� ������ ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
DESC EMPLOYEES;
-- ���̺� EMPLOYEES���� EMPLOYEE_ID, FIRST_NAME�� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES;



-- 4. 
-- ���ÿ� ���� ���
-- ���Ⱑ ������, ����ǥ ��������
-- AS �������� AS (alias) : ��µǴ� Į���� ������ ���� ��ɾ�
SELECT employee_id AS "��� ��ȣ"
        ,first_name �̸�
        ,last_name AS ��
        ,email AS �̸���
        ,phone_number AS ��ȭ��ȣ
        ,hire_date AS �Ի�����
        ,salary AS �޿�
FROM employees
;

--
SELECT *                        -- (*) [�ֽ��͸�ũ] :��� �÷� ����
FROM employees
;



-- 5.
-- �ߺ��� job id ����
-- SELECT DISTINCT job_id ;     :�ߺ��� �����͸� �����ϰ� ��ȸ�ϴ� Ű����
SELECT DISTINCT job_id
FROM employees;

-- 6.
-- �޿��� 6000�޷��� �ʰ��ϴ� ����� ����÷��� ��ȸ�ϴ� sql�� �ۼ�
-- WHERE ���� : ��ȸ������ �ۼ��ϴ� ����
SELECT *
FROM employees
WHERE salary>6000
;

-- 7.
-- �޿��� 10000�޷��� ����� ����÷��� ��ȸ�ϴ� sql�� �ۼ�
SELECT *
FROM employees
WHERE salary = 10000;

-- 8.
-- salary ���� ��������, first_name���� ��������
-- ASC ��������     DESC ��������
SELECT *
FROM employees
ORDER BY salary DESC, first_name ASC;


-- 9.
--���̺� EMPLOYEES �� JOB_ID�� ��FI_ACCOUNT�� �̰ų� ��IT_PROG�� �� ����� ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT *
FROM employees
WHERE job_id = 'FI_ACCOUNT' 
OR job_id = 'IT_PROG'
;


-- 10.
-- ���̺� EMPLOYEES �� JOB_ID�� ��FI_ACCOUNT�� �̰ų� ��IT_PROG�� �� ����� ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
-- IN Ű���带 ����Ͽ� SQL ������ �ϼ��Ͻÿ�.
-- WHERE job_id IN ('FI_ACCOUNT', 'IT_PROG');

SELECT *
FROM employees
WHERE job_id IN ('FI_ACCOUNT', 'IT_PROG')
;

-- 11.
-- ���̺� EMPLOYEES �� JOB_ID�� ��FI_ACCOUNT�� �̰ų� ��IT_PROG�� �ƴ� ����� ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT *
FROM employees
WHERE job_id NOT IN ('FI_ACCOUNT', 'IT_PROG')
;

-- 12.
-- ���̺� EMPLOYEES �� JOB_ID�� ��IT_PROG�� �̸鼭 SALARY �� 6000 �̻��� ����� ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
-- AND ���� : ���ÿ�, �׸���, ~�̸鼭
SELECT *
FROM employees
WHERE job_id = 'IT_PROG' AND salary >= 6000
;

-- 13.
-- ���̺� EMPLOYEES �� FIRST_NAME �� ��S���� �����ϴ� ����� ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT *
FROM employees
WHERE first_name like 'S%'
;

-- 14.
-- ���̺� EMPLOYEES �� FIRST_NAME �� ��s���� ������ ����� ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT *
FROM employees
WHERE first_name like '%s'
;

-- 15.
-- ���̺� EMPLOYEES �� FIRST_NAME �� ��s���� ���ԵǴ� ����� ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT *
FROM employees
WHERE first_name like '%s%'
;

-- 16.
-- ���̺� EMPLOYEES �� FIRST_NAME �� 5������ ����� ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT *
FROM employees
WHERE first_name like '_____'
-- WHERE LENGTH(first_name) = 5;            ���ڼ� ��ȯ�ϴ� �Լ�
;

-- 17.
-- ���̺� EMPLOYEES �� COMMISSION_PCT�� NULL �� ����� ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT *
FROM employees
WHERE COMMISSION_PCT is NULL
;

-- 18.
-- ���̺� EMPLOYEES �� COMMISSION_PCT�� NULL�� �ƴ� ����� ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT *
FROM employees
WHERE COMMISSION_PCT IS NOT NULL
;

-- 19.
-- ���̺� EMPLOYEES �� ����� HIRE_DATE�� 04�� �̻��� ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT *
FROM employees
WHERE HIRE_DATE >= '04/01/01'
-- WHERE hire_date >= TO_DATE('20040101', 'YYYY/MM/DD')
-- TO_DATE ������ �����͸� ��¥�� �����ͷ� ��ȯ
;


-- 20.
-- ���̺� EMPLOYEES �� ����� HIRE_DATE�� 04�⵵���� 05�⵵�� ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT *
FROM employees
WHERE HIRE_DATE BETWEEN '04/01/01' AND '05/12/31'
ORDER BY HIRE_DATE
;


