--------------------------------------------------------
-- PROCEDURES
------------------------------------------------------------
-- MANEIRA DE PEGAR UM BLOCO SQL E DAR UM NOME A ELE
--AT� AGORA S� FOI CRIADA PROCEDURES ANONIMAS

DECLARE
 ...
BEGIN
 ..
EXCEPTION
  ...
END;

-- NAMED PL/SQL BLOCK
-- ADVANTAGES: MODULARITY, REUSABILITY, EXTENSIBILITY, MAINTAINABILITY
-- DATA SECURITY, INTEGRITY, IMPROVED PERFORMANCE, CODE CLARITY

-- CREATING SUBPROGRAMS: PROCEDURES
-- USE SHOW ERRORS IN SQL*PLUS

-- SYNTAX:
CREATE [OR REPLACE] PROCEDURE <name>
[ (part1 type1,part2 type2,...)]
 IS | AS
DECLARE
   ...
BEGIN
  ...
EXCEPTION
  ..
END <name>;

-- EXAMPLE 1: NO PARAMETERS

CREATE OR REPLACE PROCEDURE PROC_DATE
 IS
 BEGIN
     DBMS_OUTPUT.PUT_LINE('DATE: '|| TO_CHAR(SYSDATE));
 END PROC_DATE;

--EXECUTE

BEGIN 
  PROC_DATE();
END;

-- THREE TYPES OF PARAMETERES: IN; OUT; IN OUT.
-- * IN     -> VALUE IS PASSED TO CALLING ENVIRONMENT, CONSTANT, CAN HAVE DEFAULT VALUE;
-- * OUT    -> RETURNED TO CALLING ENVIRONMENT, MUST BE A VARIABLE, CANNOT HAVE DEFAULT VALUE;
-- * IN OUT -> RECEIVE AND RETURN VALUES, MUST BE A VARIABLE, CANNOT HAVE DEFAULT VALUE


SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID=176

CREATE OR REPLACE PROCEDURE PROC_ID(p_id EMPLOYEES.EMPLOYEE_ID%TYPE)
IS
BEGIN
    UPDATE EMPLOYEES
      SET LAST_NAME = LAST_NAME||' X'
          WHERE EMPLOYEE_ID=p_id;
COMMIT;
END PROC_ID;

----EXECUTE WITH POSITIONAL PARAMETERS
SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID=176;
BEGIN
 PROC_ID(176);
END;

-- EXECUTE WITH NAMED PARAMETERS
SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID=176;
BEGIN
   PROC_ID(P_ID=>176);
END;

-- EXAMEPLE 3
-- OUT PARAMETERS

CREATE OR REPLACE PROCEDURE PROC_NAME(p_id IN EMPLOYEES.EMPLOYEE_ID%TYPE
                                       ,p_name OUT EMPLOYEES.LAST_NAME%TYPE)
IS
BEGIN
    SELECT LAST_NAME INTO p_name FROM EMPLOYEES
          WHERE EMPLOYEE_ID = p_id;

END PROC_NAME;
---
-- EXECUTE
DECLARE 
  v_name varchar(100);
BEGIN
  PROC_NAME(176,v_name);
  DBMS_OUTPUT.PUT_LINE(' LAST NAME: ' || v_name);
END;
------------------------------------------
-- EXAMPLE 4 : IN/OUT PARAMETERS
CREATE OR REPLACE PROCEDURE PROC_CONCAT(P_CHAR IN OUT VARCHAR2)
 IS
BEGIN
      P_CHAR:= '('||P_CHAR||')';
END PROC_CONCAT;
--EXECUTION
DECLARE
   ret VARCHAR(100);
BEGIN
   FOR emp_rec IN (SELECT LAST_NAME FROM EMPLOYEES) LOOP
        DBMS_OUTPUT.PUT_LINE('NAME: '|| emp_rec.LAST_NAME);
        PROC_CONCAT(emp_rec.LAST_NAME);
        DBMS_OUTPUT.PUT_LINE('NAME: '|| emp_rec.LAST_NAME);
 END LOOP;
END;
-------------------------------------------------------------------------------------
-----
-- EXAMPLE 5: DEFAULT PARAMETERS (IN)

CREATE OR REPLACE PROCEDURE PROC_DEFAULT(x INT DEFAULT 1)
AS
BEGIN 
   DBMS_OUTPUT.PUT_LINE('VALUE: ' || TO_CHAR(X*1));
END PROC_DEFAULT;

--EXECUTION

BEGIN 

  PROC_DEFAULT();

  PROC_DEFAULT(9);
END;

--REMOVING PROCEDURE

DROP PROCEDURE PROC_DATE;
DROP PROCEDURE PROC_ID;
DROP PROCEDURE PROC_NAME;
DROP PROCEDURE PROC_CONCAT;
DROP PROCEDURE PROC_DEFAULT;