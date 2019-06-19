SELECT WORKER.EMPLOYEE_ID
      ,WORKER.FIRST_NAME
      ,WORKER.DEPARTMENT_ID
      ,MANAGER.FIRST_NAME
FROM EMPLOYEES WORKER join EMPLOYEES MANAGER
ON WORKER.EMPLOYEE_ID = MANAGER.MANAGER_ID



-- AGRAGACOES AULA7


SELECT * FROM EMPLOYEES;

--FUNCOES DE AGRAGACOES
--AVG()
--COUNT()
--MAX()
--MIN()
--STDDEV() DESVIO PADRAO
--SUM()
--VARIANCE()

quando usa função função de agragacao, frequentemente se usa funções e agupamento = GROUP BY

select <column> from <tables> [where <conditions>] {[group by <column>] [having ]} [order by <columns>]

SELECT AVG(SALARY) AS AVARAGE
      ,MAX(SALARY) AS MAX
      ,MIN(SALARY) AS MIN
      ,SUM(SALARY) AS SUM
      ,COUNT(NVL(SALARY,0)) AS "SAL"
FROM EMPLOYEES;

SELECT count(distinct(department_id)) FROM EMPLOYEES ;

cláusula having deverá ser usada quando usada em group by, não pode usar clausula  where e join
select <column> from <tables> [where <conditions>] {[group by <column>] [having ]} [order by <columns>]

select department_id, avg(salary) from employees group by department_id

-- acrescentar por job_id deverea adicionad no group by

select job_id , department_id, avg(salary) from employees group by department_id, job_id


-- usando cláusula having ex: consultar a média salarial por departamento e job id que tenha a média maior que 6000
select job_id , department_id, avg(salary) from employees having avg(salary) >6000 group by department_id, job_id
