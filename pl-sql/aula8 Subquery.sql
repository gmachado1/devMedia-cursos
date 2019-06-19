aula 8 crating subqueries

select * from employees

select <columns> from <tables> [where <conditions> (subquery)]

-- selecionar os funcionarios que possuem salario maior que a media
select * from employees where salary >(select avg(salary) from employees);

-- selecionar todos os funcionarios que tenham o salário dentro do contexto salarial de IT_PROGR
select * from employees where salary in (select salary from employees where job_id = 'IT_PROG')


-- selecionar todos os funcionarios que tenham o salário menor que qualquer funcionario do contexto salarial de IT_PROGR
select * from employees where salary < any (select salary from employees where job_id = 'IT_PROG')

-- selecionar todos os funcionarios que tenham o salário maior que todosdo contexto salarial de IT_PROGR
select * from employees where salary > all (select salary from employees where job_id = 'IT_PROG')

