--커서 실행 단축기 : ctrl + enter
-- 문서 전체 실행 : F5


-- 1. 계정 접속 명령어
-- conn 계정명/비밀번호;
conn system/123456;

-- 2.
-- sql은 대/소문자 구분이 없다.
-- 명령어 키워드 대문자, 식별자는 소문자 주로사용. (각자 스타일대로)
SELECT user_id, username
FROM all_users
-- WHERE username = 'HR'
;

-- 기본 계정 생성 및 권한부여--
-- 12C 버전 이상: 'c##' 접두어를 붙여서 계정을 생성하도록 정책을 정함
--  c## 없이 계정생성 : ALTER SESSION SET '_ORACLE_SCRIPT' = TRUE;
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
-- HR 계정 생성
CREATE USER HR IDENTIFIED BY 123456;

-- HR 계정의 기본 테이블 영역을 'user' 영역으로 지정
ALTER USER HR DEFAULT TABLESPACE users;

-- HR 계정의 사용용량을 무한대로 지정
ALTER USER HR QUOTA UNLIMITED ON users;

-- HR 계정에 권한 부여 GRANT connect, resource TO 계정명;
GRANT connect, resource TO HR;



-- 계정 삭제 : DROP USER 계정명 CASCADE;
DROP USER HR CASCADE;

-- 계정 잠금 해제: ALTER USER 계정명 ACCOUNT UNLOCK;
ALTER USER HR ACCOUNT UNLOCK;


-- HR 샘플 스키마(데이터) 가져오기
-- 1. SQL PLUS
-- 2. HR 계정을 접속
-- 3. 명령어 입력
-- @[경로]/hr_main.sql
-- @? : 오라클이 설치된 기본 경로
-- @?/demo/schema/human_resources/hr_main.sql

-- 4. 123456 [비밀번호]
-- 5. users [tablespace]
-- 6. temp [temp tablespace]
-- 7. [log 경로] -@?/demo/schema/log



-- 3.
-- 테이블 EMPLOYEES 의 테이블 구조를 죄회하는 SQL 문을 작성하시오.
DESC EMPLOYEES;
-- 테이블 EMPLOYEES에서 EMPLOYEE_ID, FIRST_NAME를 조회하는 SQL 문을 작성하시오.
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES;



-- 4. 
-- 예시와 같이 출력
-- 띄어쓰기가 없으면, 따옴표 생략가능
-- AS 생략가능 AS (alias) : 출력되는 칼럼명에 별명을 짓는 명령어
SELECT employee_id AS "사원 번호"
        ,first_name 이름
        ,last_name AS 성
        ,email AS 이메일
        ,phone_number AS 전화번호
        ,hire_date AS 입사일자
        ,salary AS 급여
FROM employees
;

--
SELECT *                        -- (*) [애스터리크] :모든 컬럼 지정
FROM employees
;



-- 5.
-- 중복된 job id 제거
-- SELECT DISTINCT job_id ;     :중복된 데이터를 제거하고 조회하는 키워드
SELECT DISTINCT job_id
FROM employees;

-- 6.
-- 급여가 6000달러를 초과하는 사원의 모든컬럼을 조회하는 sql문 작성
-- WHERE 조건 : 조회조건을 작성하는 구문
SELECT *
FROM employees
WHERE salary>6000
;

-- 7.
-- 급여가 10000달러인 사원의 모든컬럼을 조회하는 sql문 작성
SELECT *
FROM employees
WHERE salary = 10000;

-- 8.
-- salary 기준 내림차순, first_name기준 오름차순
-- ASC 오름차순     DESC 내림차순
SELECT *
FROM employees
ORDER BY salary DESC, first_name ASC;


-- 9.
--테이블 EMPLOYEES 의 JOB_ID가 ‘FI_ACCOUNT’ 이거나 ‘IT_PROG’ 인 사원의 모든 컬럼을 조회하는 SQL 문을 작성하시오.
SELECT *
FROM employees
WHERE job_id = 'FI_ACCOUNT' 
OR job_id = 'IT_PROG'
;


-- 10.
-- 테이블 EMPLOYEES 의 JOB_ID가 ‘FI_ACCOUNT’ 이거나 ‘IT_PROG’ 인 사원의 모든 컬럼을 조회하는 SQL 문을 작성하시오.
-- IN 키워드를 사용하여 SQL 쿼리를 완성하시오.
-- WHERE job_id IN ('FI_ACCOUNT', 'IT_PROG');

SELECT *
FROM employees
WHERE job_id IN ('FI_ACCOUNT', 'IT_PROG')
;

-- 11.
-- 테이블 EMPLOYEES 의 JOB_ID가 ‘FI_ACCOUNT’ 이거나 ‘IT_PROG’ 아닌 사원의 모든 컬럼을 조회하는 SQL 문을 작성하시오.
SELECT *
FROM employees
WHERE job_id NOT IN ('FI_ACCOUNT', 'IT_PROG')
;

-- 12.
-- 테이블 EMPLOYEES 의 JOB_ID가 ‘IT_PROG’ 이면서 SALARY 가 6000 이상인 사원의 모든 컬럼을 조회하는 SQL 문을 작성하시오.
-- AND 연산 : 동시에, 그리고, ~이면서
SELECT *
FROM employees
WHERE job_id = 'IT_PROG' AND salary >= 6000
;

-- 13.
-- 테이블 EMPLOYEES 의 FIRST_NAME 이 ‘S’로 시작하는 사원의 모든 컬럼을 조회하는 SQL 문을 작성하시오.
SELECT *
FROM employees
WHERE first_name like 'S%'
;

-- 14.
-- 테이블 EMPLOYEES 의 FIRST_NAME 이 ‘s’로 끝나는 사원의 모든 컬럼을 조회하는 SQL 문을 작성하시오.
SELECT *
FROM employees
WHERE first_name like '%s'
;

-- 15.
-- 테이블 EMPLOYEES 의 FIRST_NAME 에 ‘s’가 포함되는 사원의 모든 컬럼을 조회하는 SQL 문을 작성하시오.
SELECT *
FROM employees
WHERE first_name like '%s%'
;

-- 16.
-- 테이블 EMPLOYEES 의 FIRST_NAME 이 5글자인 사원의 모든 컬럼을 조회하는 SQL 문을 작성하시오.
SELECT *
FROM employees
WHERE first_name like '_____'
-- WHERE LENGTH(first_name) = 5;            글자수 반환하는 함수
;

-- 17.
-- 테이블 EMPLOYEES 의 COMMISSION_PCT가 NULL 인 사원의 모든 컬럼을 조회하는 SQL 문을 작성하시오.
SELECT *
FROM employees
WHERE COMMISSION_PCT is NULL
;

-- 18.
-- 테이블 EMPLOYEES 의 COMMISSION_PCT가 NULL이 아닌 사원의 모든 컬럼을 조회하는 SQL 문을 작성하시오.
SELECT *
FROM employees
WHERE COMMISSION_PCT IS NOT NULL
;

-- 19.
-- 테이블 EMPLOYEES 의 사원의 HIRE_DATE가 04년 이상인 모든 컬럼을 조회하는 SQL 문을 작성하시오.
SELECT *
FROM employees
WHERE HIRE_DATE >= '04/01/01'
-- WHERE hire_date >= TO_DATE('20040101', 'YYYY/MM/DD')
-- TO_DATE 문자형 데이터를 날짜형 데이터로 변환
;


-- 20.
-- 테이블 EMPLOYEES 의 사원의 HIRE_DATE가 04년도부터 05년도인 모든 컬럼을 조회하는 SQL 문을 작성하시오.
SELECT *
FROM employees
WHERE HIRE_DATE BETWEEN '04/01/01' AND '05/12/31'
ORDER BY HIRE_DATE
;


