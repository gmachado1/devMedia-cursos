-----------------------------------------------------------------------------------
-- CURSOS IN PL/SQL
------------------------------------------------------------------------------------

-- TWO TYPES: IMPLICIT AND EXPLICIT
-- READ/WRITE ROWS ONE BY ONE

-- IMPLICIT: USED IN ALL SELECT STATEMENTS
-- EXPLICIT: DECLARED BY THE PROGRAMMER

-- SCHEMA:

-- 1) CREATE THE CURSOS
-- 2) OPEN
-- 3) FETCH ROWS - JOGAR VALORES DA LINHA À UMA VARIAVEL
-- 4) TEST FOR EXISTING ROWS
-- 5) CLOSE THE CURSOR

-- SYNTAX:

CURSOS <name> is
select ...;

OPEN <name>

FETCH <name> INTO [<var1>,<var2>,<var3>...|<record>]

WHILE...

CLOSE <name>

-- ATTRIBUTES:

-- SQL CURSOR ATTRIBUTES:

<name>%ISOPEN   -> TRUE/FALSE IF THE CURSOS IS ALREADY OPEN
<name>%NOTFOUND -> TRUE/FALSE IF THE STATEMENT DOES NOT AFFECT ANY ROWS
<name>%FOUND    -> TRUE/FALSE IF THE STATEMENT DOES NOT AFFECT ANY ROWS
<name>%ROWCOUNT -> ROWS AFFECTED
----
-- EXAMPLE 1: SIMPLE LOOP WITH VARIABLES

SELECT * FROM EMPLOYEES

DECLARE
  v_empno EMPLOYEES.EMPLOYEE_ID%TYPE;
  v_name EMPLOYEES.LAST_NAME%TYPE;

 CURSOR my_cursor IS 
        SELECT EMPLOYEE_ID, LAST_NAME
              FROM EMPLOYEES;
BEGIN
  OPEN my_cursor;

 LOOP
   FETCH my_cursor into v_empno, v_name;
   
   EXIT WHEN my_cursor%NOTFOUND;

   DBMS_OUTPUT.PUT_LINE('ID: '|| v_empno || ' Last name: '|| v_name);
 END LOOP;

END;
-----------------------------------------------------------------------------------------
--EXAMPLE 2: CREATE A RECORD FROM THE CURSOR

SELECT * FROM LOCATIONS

DECLARE 
  CURSOR cursor1 is 
         select * from locations;

     l_record cursor1%ROWTYPE;

BEGIN
   OPEN cursor1;

   FETCH cursor1 INTO l_record;

   WHILE cursor1%FOUND
    LOOP
   
      DBMS_OUTPUT.PUT_LINE('Location Id: '|| l_record.location_id);
      DBMS_OUTPUT.PUT_LINE('City: ' || l_record.city);
      DBMS_OUTPUT.PUT_LINE('Country id: ' || l_record.country_id);
  
    FETCH cursor1 into l_record;
   END LOOP;
END;
------------------------------------------------------------------------------------------------------------
EXAMPLE 3 : FOR LOOPS WITH IMPLICIT CURSOR

SELECT * FROM DEPARTMENTS

BEGIN 

   FOR dep_rec IN (SELECT * FROM DEPARTMENTS) LOOP
      
          DBMS_OUTPUT.PUT_LINE('Departments id: ' || dep_rec.department_id);
          DBMS_OUTPUT.PUT_LINE('Name : '|| dep_rec.department_name);
    END LOOP;

END;

--------------------------------------------------------------------------------------------------------------------------
EXAMPLE 4:CURSORS PARAMETERS

DECLARE
   CURSOR c1(p_depto NUMBER, p_job VARCHAR(2)) IS
        SELECT EMPLOYEE_ID
                ,LAST_NAME
            FROM EMPLOYEES
        WHERE DEPARTMENT_ID = p_depto
            AND JOB_ID = p_job;
BEGIN
    OPEN c1(80,'SA_REP');
    ...
    CLOSE c1;
    
    OPEN c1(90,'TI_DSV')
    ...
    CLOSE c1;
END;
