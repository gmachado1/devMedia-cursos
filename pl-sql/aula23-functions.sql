---------------------------------------------------------------------------------(9
--  CREATE FUNCTIONS
------------------------------------------------------------------------------------

-- A FUNCTION IS LIKE A PROCEDURE,WITH A FEW DIFFERENCES:
-- 1) MUST RETURN A VALUE
-- 2) ONLY ACCEPT IN PARAMETERS
-- 3) CAN BE USED IN SQL CLAUSES (WHERE, ORDER BY, GROUP BY, ETC)
-- 4) CANNOT CONTAIN CERTAIN SQL STATMENTS

-- SYNTAX:

CREATE [OR REPLACE] FUNCTION <name>
    [(part1 type1, part2 type2...)]
RETURN <datatype>
IS | AS
DECLARE
...
BEGIN
  ...
ECEPTIONS
 ...
END <name>;

-- USE SHOW ERRORS IN SQL*PLUS
-- EXAMPLE 1: IN PARAMETER
CREATE OR REPLACE FUNCTION F_SALARY(p_id IN EMPLOYEES.EMPLOYEE_ID%TYPE)
RETURN NUMBER
IS
  v_sal EMPLOYEES.SALARY%TYPE;
BEGIN
  SELECT SALARY INTO v_sal FROM EMPLOYEES WHERE EMPLOYEE_ID = p_id;
 
RETURN v_sal*1.1;

END F_SALARY;
--------------------------
---- EXECUTE
SELECT EMPLOYEE_ID
        ,SALARY
        ,F_SALARY(EMPLOYEE_ID)
FROM EMPLOYEES;
-------------------
----EXECUTE 2

DECLARE
   sal NUMBER;
BEGIN
  sal := F_SALARY(176);

 DBMS_OUTPUT.PUT_LINE('Salary: '|| sal);
END;
----------------------------------------
-- -----RESTRICTIONS:
-- ACCEPT AND RETURN ONLY SQL DATATYPES
-- CANNOT CONTAINT DML STATEMENT
-- CANNOT FINISH TRANSACTIONS

-- WRONG EXAMPLE2  -- REMOVE INSIDE A SELECT
CREATE OR REPLACE FUNCTION F_DELETE(p_id IN EMPLOYEES.EMPLOYEE_ID%TYPE)
RETURN NUMBER
IS 
BEGIN
  DELETE EMPLOYEES
      WHERE EMPLOYEE_ID = p_id;
  COMMIT;
  RETURN TO_NUMBER(SQL%ROWCOUNT);
END F_DELETE;
------------
--EXECUTION
 SELECT LAST_NAME
        ,F_DELETE(EMPLOYEE_ID)
FROM EMPLOYEES
-------------------------------------
-- TO REMOVE FUNCTIONS;
DROP FUNCTION F_SALARY;
DROP FUNCTION F_DELETE;


-----------------------------------------------------              -----------------------------------------------
PROCEDURES                                                  X      FUNCTIONS
-----------------------------------------------------              ------------------------------------------------
EXECUTE AS PL/SQL STATMENT IN, OUT, IN/OUT PARAMETERS.......X......INVOKE PART OF STATMENT ONLY IN PARAMENTER

NO RETURN VALUES............................................X......MUST RETURN A VALUE

0, N RETURN VALUE...........................................X......SINGLE RETURN VALUE

NO SQL RESTRICTIONS.........................................X.......FEW SQL RESTRICTIONS

        
