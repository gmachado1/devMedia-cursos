------------------------------------------------------------------------------------------
--- HANDLING EXCAPTIONS
--------------------------------------------------------------------------------------------

-- EXCEPTIONS ARE A MECHANISM TO HANDLE ERRORS
-- ORACLE, PL/SQL OR CUSTOM MADE ERROS

-- DECIDE IF THE PL/SQL BLOCK HANDLE THE EXCEPTION
-- OR PROPAGATE IT TO THE APPLICATION

-- SYNTAX TO TRAP EXCEPTIONS IN PL/SQL

BEGIN
  ...
    EXCEPTION

     WHEN EXCEPTION1  THEN
         STATEMENT1;
         STATEMENT2; 
     WHEN EXCEPTION2  THEN
         STATEMENT1;
         STATEMENT2; 
     WHEN OTHERS  THEN
         STATEMENT1;
         STATEMENT2; 


-- SEVERAL EXCEPTIONS
-- JUST A FEW

NAME                           ORACLE SERVER ERROR NUMBER
--------------------         ----------------------------------------
INVALID_CURSOR                  ORA-01001   - CURSOR COM SQL ERRADA
VALUE_ERROR                     ORA-6502    - CONVERSAO ERRADA
ZERO_DIVIDE                     ORA-01476   - BURRO
....

--
-- EXAMPLE1:

DECLARE 
   var1 NUMBER;
BEGIN
   var1:= TO_NUMBER('10A');

EXCEPTION
    
      WHEN VALUE_ERROR THEN
          DBMS_OUTPUT.PUT_LINE('Problem converting char to number');
END;

---------------------------------------------------------------------------------------------------------
FUNCTIONS TO OBTAIN ERROR INFORMATION: SQLCODE AND SQLERRM
-- SQLCODE = 0 -> NO EXCEPTION
-- SQLCODE = 1 -> USER DEFINED EXCEPTION
-- SQLCODE < 0 -> ORACLE SERVER MESSAGE
-- SQLERRM -> STRING OF THE ERROR MESSAGE
--EXAMPLE 2

DECLARE
  var1 NUMBER;

BEGIN
 var1:= 10/0;  --FIRST TO GIVE ERROR WILL BE CATCH
 var1:= TO_NUMBER('10A');
 

EXCEPTION
   WHEN ZERO_DIVIDE THEN
        --  DBMS_OUTPUT.PUT_LINE('SQLCODE: '|| SQLCODE);
        --  DBMS_OUTPUT.PUT_LINE('SQLERRM: '|| SQLERRM);
          DBMS_OUTPUT.PUT_LINE('YOU NEED MATH CLASSES!');
   WHEN OTHERS THEN
          DBMS_OUTPUT.PUT_LINE('SQLCODE: '|| SQLCODE);
          DBMS_OUTPUT.PUT_LINE('SQLERRM: '|| SQLERRM);
END;
--------------------------------------------------------------------------------------------------------------------------
-- TO RAISE AN USER-DEFINED EXCEPTION: CREATE IT AND RAISE IT
-- EXAMPLE 3

DECLARE
   my_exception EXCEPTION;

BEGIN

   RAISE my_exception;

EXCEPTION
   WHEN my_exception THEN
       DBMS_OUTPUT.PUT_LINE('USER-DEFINED EXECPTION OCCURED');
END;


