-- Manipulatin data

--DML COMMANDS
--TRANSACTIONS

--1) INSERTING DATA INTO TABLE

-- SYNTAX: INSERT INTO <TABLE> VALUES <VALUES>
-- EXAMPLES

DESC DEPARTMENTS;

--INSERT INTO DEPARTMENTS(DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID) VALUES (300,'Maintainace',100,1700);

select * from departments;

--INSERT INTO DEPARTMENTS(DEPARTMENT_ID, DEPARTMENT_NAME) VALUES (310, 'General Services');

-- inserindo sem a declaracao das colunas, deverá respeitar a ordem da coluna

INSERT INTO DEPARTMENTS VALUES (320, 'Resarch and Development', null, null);

select * from departments;

-- INSERT INTO EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME
 ,EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
VALUES (250, 'John', 'Doe', 'DOE','515.124.4567', SYSDATE, 'AC_ACCOUNT', 6900, NULL, 205,100)

SELECT * FROM EMPLOYEES

-- INSERINDO QUANDO OS VALORES DAS TABELAS TIVEREM VALOR DEFAULT.

-- INSERT INTO DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID) VALUES (400, 'Engineering', Default);
select * from departments;

----------------------------------------------------------
--2) changing data in table

syntax: update <table> set <column=value,column=value...> where <condition>

Examples:

select * from employees where employee_id = 114;

-- update employees set last_name = 'Rafael' where employee_id=114;

-- using subqueries in an update statment

select job_id from employees where employee_id=205;
select salary from employees where employee_id=205;
select * from employees WHERE employee_id=115;
-- update employees 
    set job_id = (select job_id from employees where employee_id=205),
        salary = (select salary from employees where employee_id=205)
where employee_id=115;


-- SEE JOB_ID AND SALARY VALUES
SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID = 115 OR EMPLOYEE_ID=205

-- INTEGRITY CONSTAINT ERROR
-- it doesn´t exist depatment id = 55  select * from departments where department_id =55
update employees set department_id = 55 where department_id=110;

-- update departments set manager_id = default where department_id=10;

-- 3) removing a row from a table

-- SYNTAX: DELETE FROM <TABLE> WHERE <CONDITION>

SELECT * FROM DEPARTMENTS
                                                   
select * FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'Maintainace';
DELETE FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'Maintainace'

-- USING SUBQUERIES

DELETE FROM EMPLOYEES WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME LIKE '%General Services%')


-- integrity constant error
-- there are employee linked to this department, unable to delete
select * from departments where department_id = 60
delete from departments where department_id = 60


-- TRANSACTIONS
--  BEGIN WITH A DML SQL STATMENT, FINISHES WITHC COMMIT OR ROLLBACK
-- ADVANTAGES: DATA CONSISTENCY, PREVIEW DATA, ACID PROPERTIES
-- A TRANSACTION CAN HAVE SAVE POINTS

UPDATE ...
SAVEPOINT SAVE_1
INSERT ...
ROLLBACK TO SAVE_1
COMMIT

 EXAMPLE

SAVEPOINT DEVMEDIA
SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID=355;
INSERT INTO DEPARTMENTS VALUES (350, 'Custumer Support', null, 1700);
commit;
SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID=355;
ROLLBACK TO DEVMEDIA;

select * from countries;
insert int countries values ('XX', 'Transilvania', 2)


