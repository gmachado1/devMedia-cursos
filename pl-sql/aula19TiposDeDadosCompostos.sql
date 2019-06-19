WORKING WITH COMPOSITE DATA TYPES
---------------------------------------------------------------------------------------------

-- TWO TYPES OF COMPOSITE DATA TYPES: PL/SQL

/*
1) PL/SQL RECORDS

-- CONTAINS FIELDS WITH DATA TYPES
-- USED TO STORE DATA THAT COME FROM A TABLE
-- ARE DIFFERENT FROM ROWS OF A TABLE
SYNTAX:

TYPE <name> IS RECORD
    field1 type1
   ,field2 type2
   ,...
<variable> <name>
*/

-- EXAMPLE 1

DECLARE 
      TYPE REC_1 IS RECORD
      (
         F1 INT,
         F2 VARCHAR(10)
      );
    MY_REC REC_1;
BEGIN
    
      MY_REC.F1 := 10;
      MY_REC.F2 := 'ABC';

   DBMS_OUTPUT.PUT_LINE('F1: ' || TO_CHAR(MY_REC.F1) || '  F2: '|| MY_REC.F2);
END;
------------------------------------------------------------------------------------------------
-- EXAMPLE 2
-- CREATE A RECORD FROM A TABLE USING THE %ROWTYPE

SELECT * FROM EMPLOYEES       

DECLARE
 
     EMP_REC EMPLOYEES%ROWTYPE;

BEGIN
   
     SELECT  * INTO EMP_REC FROM EMPLOYEES
          WHERE EMPLOYEE_ID = 176;

   DBMS_OUTPUT.PUT_LINE('ID: '|| EMP_REC.EMPLOYEE_ID || ' LAST NAME: '|| EMP_REC.LAST_NAME);

END;
---------------------------------------------------------------------------
2) AN INDEX BY TABLE: SIMILAR TO ARRAYS
-----------------------------------------------------------------------------
SYNTAX:
 
   TYPE <NAME> IS TABLE OF <TABLE>%ROWTYPE
 INDEX BY BINARY_INTEGER;

<VARIABLE><NAME>;

-- ACCESS THE ELEMENTS USING THE (AND). EX:E_EMP(1).LAST_NAME
-- INDEX START WITH 1
-- FUNCTIONS: EXISTS(N), COUNT, FIRST, LAST, PRIOR(N), NEXT(N),TRIM, DELETE

--

DECLARE
 TYPE EMP_TYPE IS TABLE OF EMPLOYEES%ROWTYPE INDEX BY BINARY_INTEGER;

 EMP_DATA EMP_TYPE;

BEGIN
 --UNABLE TO SET ALL(MORE THAN ONE) DATA IN JUST ONE INTERACTION
  FOR I IN 100..207 LOOP
    SELECT * INTO EMP_DATA(I) FROM EMPLOYEES WHERE EMPLOYEE_ID= I;
  END LOOP;

  FOR J IN EMP_DATA.FIRST..EMP_DATA.LAST LOOP
         DBMS_OUTPUT.PUT_LINE('> ID: '|| EMP_DATA(J).EMPLOYEE_ID);
         DBMS_OUTPUT.PUT_LINE('LAST_NAME : '|| EMP_DATA(J).LAST_NAME);

   END LOOP;
END;