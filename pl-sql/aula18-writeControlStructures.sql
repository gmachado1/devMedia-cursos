WRITING CONTROL STRUCTURES  -  manerias de controle para alterar o fluxo
if-case-while
------------------------------------------------------------------------

/*
1) IF STATEMENTS
-------------------------

SYNTAX:

IF <condition> then
   statement1;
   statement2;
   ...
[elsif <condition> then
   statement1;
   statement2;
   ...]
[else
   statement1;
   statement2;
   ... ]
end if;


declare 
   X INT;

 BEGIN
      X:=10;
    IF X = 10 THEN
        DBMS_OUTPUT.PUT_LINE('X IS EQUALS TO 10');
    ELSE
       DBMS_OUTPUT.PUT_LINE('X IS NOT EQUALS TO 10');
  END IF;
END;
---------------------------------------------------------------------

DECLARE 
  v_date DATE := '01-01-2019';
  v_diff boolean;
  v_name char(10);
begin
 
   if months_between(sysdate, v_date)/12 > 5 then
      v_diff :=true;
      v_name := 'yes';
   else
      v_diff := false;
      v_name := 'no';
    end if;
 -- dbms_output.put_line('v_diff :' || v_diff);
dbms_output.put_line('more then 5 years?' || to_char(v_name));

end;
--------------------------------------------------------------------------------------------------------------
select * from employees where employee_id = 176;

DECLARE
    V_DPTO EMPLOYEES.DEPARTMENT_ID%TYPE;
    V_BONUS EMPLOYEES.SALARY%TYPE;
    V_NAME EMPLOYEES.LAST_NAME%TYPE;
BEGIN
  SELECT LAST_NAME, DEPARTMENT_ID, SALARY
      INTO V_NAME,V_DPTO, V_BONUS
   FROM EMPLOYEES
     WHERE EMPLOYEE_ID = 176;

    IF V_DPTO = '10' AND SUBSTR(V_NAME,1,1) = 'W' THEN
       V_BONUS := V_BONUS +10;
    ELSIF V_DPTO ='80' THEN
         V_BONUS:= V_BONUS +20;
    ELSE
        V_BONUS:= V_BONUS +30;
    END IF;
 
 DBMS_OUTPUT.PUT_LINE('DEPARTMENT:' || TO_CHAR(V_DPTO) || '  NEW SALARY:' || TO_CHAR(V_BONUS));
END;
-----------------------------------------------------------------------------------------------------------------
EXPRESSION
2)CASE

SYTAX:

CASE <SELECTOR>
     WHEN <EXPRESSION1> THEN <STATMENT1>
     WHEN <EXPRESSION2> THEN <STATMENT2>
     WHEN <EXPRESSION3> THEN <STATMENT3>
   ...
    [ELSE STATMENT]
END;

--USE ONLY THE = OPERATOR
TAKE SPECIAL CARE WITH NULLS!

EXAMPLE 1

DECLARE 
    V_GRADE CHAR(1) :='A';
    V_COMMENT VARCHAR2(20);
BEGIN
   V_COMMENT :=

   CASE V_GRADE
     WHEN 'A' THEN 'EXCELENT'
     WHEN 'B' THEN 'VERY GOOD'
     WHEN 'C' THEN 'GOOD'
    ELSE  'THERE IS A PROBLEM'
   END;
DBMS_OUTPUT.PUT_LINE('GRADE: '|| TO_CHAR(V_GRADE) || ' COMMENT:'||TO_CHAR(V_COMMENT));
END;
--------------------------------------------------------------------
3) LOOP

-- BASIC LOOP 
-- SYNTAX:
 LOOP
    <STATMENT 1>
    <STATMENT 2>
    <STATMENT 3>
    ...
     EXIT [WHEN <CONDITION>];
END LOOP;
-- AT LEAST ONE EXECUTION OF THE STATEMENTS

DECLARE 
   X INT;
BEGIN

   X := 0;

   LOOP
    
      DBMS_OUTPUT.PUT_LINE('VALUE OF X: '|| TO_CHAR(X));
      X:= X+1;
  
   EXIT WHEN X > 10;

   END LOOP;
END
   
-----------------------------------------------------------------
-- WHILE LOOP
-- SYNTAX:

WHILE <CONDITION> LOOP
   <STATEMENT1>
   <STATEMENT2>
   <STATEMENT3>
    ... 
END LOOP;

-- 0, 1 OR MORE EXECUTUIONS
SELECT * FROM LOCATIONS WHERE COUNTRY_ID = 'CA';

DECLARE 
  v_country_id locations.country_id%type := 'CA';
  v_location_id locations.location_id%type;
  v_count number :=1;
BEGIN

   SELECT MAX(LOCATION_ID)
       INTO V_LOCATION_ID
   FROM LOCATIONS
     WHERE COUNTRY_ID = v_country_id;

   while v_count <=3 loop
     dbms_output.put_line('City');
     v_count := v_count +1;
   end loop;

end;
-------------------------------------------------------------------
-- for loop
-- syntax:

FOR counter IN [REVERSE] lower..upper LOOP
   <statement1>;
   <statement2>;
   <statement3>;
  ...
 END LOOP;

-- DO NOT DECLARE THE COUNTER
EXAMPLE 1

BEGIN 
   
    FOR counter IN 1..5 LOOP
         DBMS_OUTPUT.PUT_LINE(' LOOP : ' || COUNTER);
    END LOOP;
END;

-- EXAMPLE 2
 
DECLARE 
   lower NUMBER :=1;
   UPPER NUMBER :=10;
BEGIN

    FOR i IN LOWER..UPPER LOOP
         DBMS_OUTPUT.PUT_LINE('COUNTER : '|| i);
    END LOOP;
END;
------------------------------------------------------------------------------------------------

-- NESTED LOOPS AND LABELS

-- ASSIGN LABELS TO LOOPS
-- EXIT SPECIFIC LOOP OR ALL NESTED LOOPS

-- EXAMPLE 1

BEGIN 
  <<LOOP1>>
    FOR COUNTER IN 1..5 LOOP
       DBMS_OUTPUT.PUT_LINE(' COUNTER: '|| TO_CHAR(COUNTER));
    END LOOP LOOP1;

END;

-- EXAMPLE 2

BEGIN 
  <<LOOP1>>
    FOR COUNTER IN 1..5 LOOP
       DBMS_OUTPUT.PUT_LINE(' COUNTER: '|| TO_CHAR(COUNTER));
       FOR COUNTER2 IN 22..27 LOOP
           DBMS_OUTPUT.PUT_LINE(' COUNTER: '|| TO_CHAR(COUNTER2));
           IF COUNTER = 4 THEN
               DBMS_OUTPUT.PUT_LINE(' COUNTER: '|| COUNTER*COUNTER2);
              EXIT LOOP1;
           END IF;

        END LOOP LOOP1;

    END LOOP LOOP1;
END;