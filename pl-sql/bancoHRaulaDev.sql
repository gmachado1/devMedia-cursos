select * from departments;

select department_id as dpId, department_name as dpNam from departments;

select department_id dpId, department_name dpNam from departments; -- pode usar aspas duplas

select employee_id, salary, salary + 300 from employees;

select employee_id, first_name || ' ' || last_name as full_name from employees;

select commission_pct from employees;

describe employees;

select * from employees where department_id = 90;

select * from employees where last_name = 'King';
/* case sensitive [King != king] */

select * from employees where hire_date < '01-30-2004';
+--operadores = , <, > , <= , >= , <> ou != ou ^=


select * from employees where salary between 10000 and 100000;

select * from employees where department_id in (80,90,100);

select * from employees where last_name like 'King';

select * from employees where last_name not like '_a%';


