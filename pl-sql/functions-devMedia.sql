Working with FUNCTIONS
table used
select first_name, last_name, email from employees

1) LOWER()

SELECT LOWER('COURSE PL/SQL') FROM EMPLOYEES;

select lower(last_name) from employees;

2) upper() 
select upper('course pl/sql') from employees;

select upper(last_name) from employees;


3) INITCAP() -- coloca o primeiro caracter em maiúsculo.
select initcap(last_name) from employees;

4) concat() concatena as palavras ou números dentro da funcao
select concat('hello', 'world') from dual;

5) substr()
select substr('Gustavo Lima',1,3) from dual

6) instr(string, 'char to be searched' , index start search, occurrence ) --saber a posição do caracter
select instr('Gustavo Lima','a',6,1) from dual;


7)Length() tamanho do texto
select length('Gustavo Lima e vc') from dual;

8)LPAD()
-- preencha a esquerda 'left' com caracteres '*' até somar 10 posições
select salary, lpad(salary,10,'_') from employees;

9)RPAD()
-- de forma análoga a LPAD preenche a direita
select salary, rpad(salary,10,'-') from employees;

10)trim()
select trim(' ' from ' Hello World ') from dual;

juntado as funções
select employee_id, concat(first_name, last_name) name
      ,length(last_name)
      ,instr(last_name,'a')
     ,last_name
from employees
where substr(last_name,-1,1) = 'n';

----------------------------------------------------------------------------------------------
Functions to math
----------------------------------------------------------------------------------------------

1)Round() arredondar

select round(45.823,2),
round(45.823,0),
round(45.823,-1) from dual

2)trunk() arredondar

select trunc(45.823,2),
trunc(45.823,0),
trunc(45.823,-1) from dual

---------------------------------------------------------------------
fucões datas
--------------------------------------------------------------------

1)SYSDATE
select sysdate, sysdate+1,sysdate-1 from dual

2)MONTHS_BETWEEN    -- MM-dd-YYYY
select MONTHS_BETWEEN('01-01-2019', '09-01-2018') FROM DUAL

3)ADD_MONTHS()
SELECT ADD_MONTHS('01-01-2019',3) FROM DUAL;

4)round() + trunc()

select sysdate
        ,round(sysdate,'month')
        ,round(sysdate,'year')
        ,trunc(sysdate,'month')
        ,trunc(sysdate,'year')
from dual

----------------------------------------------------------------------------------


Conversao  functions:

                                    TO_NUMBER()                      TO_DATE()
                          <-----------------------               ---------------------->
                   NUMBER                            CHARACTERS                             DATE
                         ------------------------->             <-----------------------
                            TO_CHAR()                                          TO_CHAR()

DATE FORMAT DESCRIPTIONS

FORMAT                           DESCRIPTION
---------|--------------------------------------------------
 YYYY    | Full year in numbers
 YEAR    | Year spelled out
  MM     | Two digit for month value
 MONTH   | Full name of the month
 MON     | Three letter abreviation of month
  DY     | Three letter abreviation of week
  DAY    | Full name of the day of the week
  DD     | numeric day of the day
  HH     | 1-12 hours
  HH24   | 1-23 HOURS
  MI     | Minuts
  SS     | Seconds


Select Employee_id ,Hire_date,  to_char(hire_date, 'DD/mm/YYYY'), to_char(hire_date, 'HH24:MI:SS') from Employees;

--------------------------------------------------
general functions
----------------------------------------------------

1) NVL()  -- onde tiver nulo coloca 0 pode ser outra coisa

select employee_id, commission_pct, nvl(commission_pct, 0 ) from employees

2) NVL2()  -- igual o anterior mas com mais paramentros

select employee_id, commission_pct, nvl2(commission_pct, 'SAL+COM' , 'SAL') from employees;

3) CASE Expression

select last_name, job_id, salary
                      , case job_id when 'IT_PROG'  then 1.10 * salary
                                    when 'ST_CLERK' then 1.15 * salary
                                    when 'SA_REP'   then 1.20 * salary
                        end as "new sal"
from employees

