WRITING EXECUTABLE STATMENTS
-------------------------------------------------

1)DELIMETER : + , - , *, /, = , @ , ;
---------------------------------------------------------------
2) COMPOUND SYMBOLS: <> , != , || , -- , /* , */ , :=
---------------------------------------------------------------
3) IDENTIFIERS: SOME RULES

>INVALID EXAMPLES:
&,+ ,-, @ -
/ - bloco de comando para bd
espaço

commenting code
----------------------------
single line -- 
multiple-line /*  */
----------------------------------------

DECLARE
    v_name varchar2(10);
 begin
   v_name := upper('teste'); 
   DBMS_OUTPUT.PUT_LINE('Value: ' || v_name);
end;


note: decode and group functions are not available in procedural statements!
----------------------------------------------------------------
5) nested blocks and scope
---------------------------------
DECLARE
  X INTEGER :=10;
BEGIN

   DECLARE
     Y INTEGER;
    BEGIN
     Y := 20;

     DBMS_OUTPUT.PUT_LINE('VALUE of x: '|| TO_CHAR(X));
     DBMS_OUTPUT.PUT_LINE('VALUE OF y: '|| TO_CHAR(Y));
    END;
END;
------------------------------------------------------------------------------------------------------------------
DECLARE 
   INTEGER:=10;
BEGIN

  DECLARE
     Y INTEGER;
   BEGIN
      Y :=20;

       DBMS_OUTPUT.PUT_LINE('VALUE OF X:' || TO_CHAR(X));
   END;
     -- O Y NÃO PODE SER COLOCADO PARA IMPRIMIR AQUI.
END;
---------------------------------------------------------------------------------
<<outer>>
DECLARE
    X INTEGER;
BEGIN
    X:=10;

   DECLARE
      Y INTEGER;
     BEGIN
     
        Y:=20;
       DBMS_OUTPUT.PUT_LINE(' VALUE OF X:' || TO_CHAR(OUTER.x));
       DBMS_OUTPUT.PUT_LINE(' VALUE OF Y:' || TO_CHAR(Y));

     END;

END;
---------------------------------------------------------------------------------



   
