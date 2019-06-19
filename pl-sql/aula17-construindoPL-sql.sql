interactin with the oracle server    (9
---------------------------------------------------------
/*
1) SQL: DDL, DML, SCL
---------------------------------
PL/SQL DOES NOT SUPORT DDL (CREATE, ALTER, DROP) IN A PL/SQL BLOCK
PL/SQL SUPORT DML (SELECT,INSERT,UPDATE,DELETE) IN A PL/SQL BLOCK

WHEN USING SELECT, THE INTO CLAUSE IS REQUIRED
AND ONLY ONE ROW CAN BE RETURNED. 
EXAMPLE:
*/
DECLARE
  v_dept number(4);
  v_location_id number(4);
begin
  select department_id
         ,location_id
     into 
           v_dept
           ,v_location_id
     from departments
    where department_name = 'Sales';
 
   dbms_output.put_line('Depto ' || v_dept);
   dbms_output.put_line('Location ID:' || v_location_id);

end;
---------------------------------------------------------------------------------------------------------------
erro ao declarar muitas linhas

DECLARE
   hire_date     employees.hire_date%type;
   sysdate       employees.hire_date%type;
   employee_id   employees.employee_id%type := 176;
begin
  select hire_date
         ,sysdate
   into
          hire_date
         ,sysdate
   from employees
     where employee_id = employee_id;
end;

-------------------------------------------------------
/* insert example */

BEGIN
 
   INSERT INTO EMPLOYEES(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID, SALARY)
   VALUES(EMPLOYEES_SEQ.NEXTVAL, 'Ruth', 'Cores', 'RCores', sysdate, 'AD_ASST', 4000);
END;

SELECT * FROM EMPLOYEES WHERE FIRST_NAME  = 'Ruth'
--------------------------------------------------------------------------
DECLARE 
    v_sal_increase EMPLOYEES.salary%TYPE :=800;
BEGIN
   UPDATE employees
    set salary = salary + v_sal_increase
   where job_id = 'ST_CLERK';
end;

select * from employees where job_id = 'ST_CLERK';
------------------------------------------------------------

select * from employees where department_id=10

declare
  v_depto employees.department_id%type :=10;
begin
  delete from employees
   where department_id = v_depto;
end;


----------------------------------------------------------------------------------------

2) Cursos - instrutura ntrna do oracle quando usa pl.sql

cursos implicito
cursor explicito - acessar linha a linha de uma função select
 
TWO TYPES: IMPLICIT AND EXPLICIT

SQL CURSOS ATTRIBUTES:
 
SQL%ROWCOUNT   => ROWS AFFECTED
SQL%FOUND      => TRUE/FALSE IF THE STATMENT AFFECTS ONE OR MORE ROWS
SQL%NOTFOUND   => TRUE/FALSE IF THE STATMENT DOES NOT AFFECT ANY ROWS
SQL%ISOPEN     => FALSE BECAUSE IMPLICIT CURSOS ARE ALWAYS CLOSED

DECLARE 
  EMP_ID EMPLOYEES.EMPLOYEE_ID%TYPE;
BEGIN
   SELECT EMPLOYEE_ID
     INTO EMP_ID
   FROM EMPLOYEES
   WHERE LAST_NAME = 'Kochhar';
 dbms_output.put_line('rows :'|| to_char(sql%rowcount));
end;


