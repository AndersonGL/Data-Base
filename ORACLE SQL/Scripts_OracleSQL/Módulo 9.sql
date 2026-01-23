-- Joins e Operadores SET

-- I. O que s�o Joins e Operadores SET?
/* 

Joins s�o comandos que utilizamos para criar rela��es entre as tabelas e fazer com que seja
poss�vel trazer informa��es de uma tabela para outra tabela.

J� os operadores SET s�o comandos que usamos para trabalhar com conjuntos. Com eles, podemos
fazer a uni�o entre tabelas, fazer a interse��o entre duas tabelas ou a subtra��o de tabelas.


*/


-- II. Tabelas Dimens�o e Fato. Chaves Prim�ria e Estrangeira.

/*

- Tabela Dimens�o: � uma tabela que cont�m as caracter�sticas de determinado elemento.
Por exemplo, uma tabela de clientes possui as caracter�sticas do elemento cliente. Nenhum dos
elementos da tabela dimens�o pode se repetir.

- Tabela Fato: � uma tabela que cont�m os fatos de um neg�cio. Vendas, Contratos, Atendimentos.
Geralmente � uma tabela bem grande, com centenas, milhares ou at� milh�es de linhas. 

- Chave Prim�ria: Coluna de uma tabela que identifica as linhas daquela tabela de forma �nica.

- Chave Estrangeira: Coluna de uma tabela que ser� usada para se relacionar com a chave prim�ria 
de outra tabela.


*/


-- III. Joins
-- 1. (INNER) JOIN: Realiza o relacionamento entre as tabelas e retorna apenas as linhas
-- que s�o comuns entre as duas tabelas.

-- a) Utilize o (INNER) JOIN para relacionar as tabelas EMPLOYEES e DEPARTMENTS.

SELECT
    employees.employee_id,
    employees.first_name,
    employees.salary,
    departments.department_name
FROM employees
JOIN departments
ON employees.department_id = departments.department_id;

-- b) Fa�a o mesmo exerc�cio anterior, mas dessa vez adicionando um ALIAS �s tabelas.

SELECT
    e.employee_id,
    e.first_name,
    e.salary,
    d.department_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;

-- c) Utilize o (INNER) JOIN para relacionar as tabelas DEPARTMENTS e LOCATIONS.

SELECT
    d.department_id,                -- d. *, Seleciona todas as colunas da tabela departments
    d.department_name,
    l.city,
    l.country_id
FROM departments d
JOIN locations l
ON d.location_id = l.location_id;

-- d) Fa�a um INNER JOIN entre m�ltiplas tabelas e relacione as tabelas 
-- EMPLOYEES, DEPARTMENTS, JOBS e LOCATIONS.

SELECT
    e.employee_id, e.first_name, d.department_name, j.job_title, l.city, l.country_id
FROM employees e
    JOIN departments d ON e.department_id = d.department_id
    JOIN jobs j ON e.job_id = j.job_id
    JOIN locations l ON d.location_id = l.location_id;


-- IV. SELF JOIN: Realiza o auto-relacionamento de uma tabela com ela mesma.

-- a) Como podemos visualizar a lista de funcion�rios e os respectivos gerentes em uma mesma tabela?

SELECT
    e.employee_id,
    e.first_name funcionario,
    g.first_name gerente    
FROM employees e JOIN employees g
ON e.manager_id = g.employee_id
ORDER BY e.employee_id;


-- V. LEFT JOIN: Realiza o relacionamento entre as tabelas e retorna as linhas que s�o 
-- comuns entre as duas tabelas e tamb�m as linhas que existem apenas na tabela da ESQUERDA.

-- a) Utilize o LEFT JOIN para relacionar as tabelas EMPLOYEES e DEPARTMENTS.

SELECT
    e.employee_id,
    e.first_name,
    e.salary,
    d.department_name
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id;


-- VI. RIGHT JOIN: Realiza o relacionamento entre as tabelas e retorna as linhas que s�o 
-- comuns entre as duas tabelas e tamb�m as linhas que existem apenas na tabela da DIREITA.

-- a) Utilize o RIGHT JOIN para relacionar as tabelas EMPLOYEES e DEPARTMENTS.

SELECT
    e.employee_id,
    e.first_name,
    e.salary,
    d.department_name
FROM employees e RIGHT JOIN departments d
ON e.department_id = d.department_id
ORDER BY employee_id;



-- VII. FULL JOIN: Realiza o relacionamento entre as tabelas e retorna TODAS as linhas das tabelas.

-- a) Utilize o FULL JOIN para relacionar as tabelas EMPLOYEES e DEPARTMENTS.

SELECT
    e.employee_id,
    e.first_name,
    e.salary,
    d.department_name
FROM employees e FULL JOIN departments d
ON e.department_id = d.department_id;


-- VIII. CROSSJOIN: Realiza o produto cartesiano entre duas colunas.

-- a) Utilize o CROSS JOIN para fazer todas as combina��es poss�veis entre as colunas
-- DEPARTMENT_NAME e JOB_TITLE.

SELECT
    d.department_name,
    j.job_title
FROM departments d CROSS JOIN jobs j;


-- IX. NONEQUIJOIN: 

-- a) Retorne o id do departamento, nome do departamento e localidade das tabelas LOCATION e
-- DEPARTMENT para o intervalo de location_id entre 1800 e 2500 e department_id abaixo de 30.

SELECT
    d.department_id,
    d.department_name,
    l.location_id,
    l.city
FROM departments d, locations l
WHERE l.location_id BETWEEN 1800 AND 2500
AND d.department_id <= 30;


-- Operadores SET (Operadores de Conjunto)

-- I. UNION ALL: Faz a uni�o entre duas tabelas. As linhas inteiramente iguais s�o mantidas.

SELECT
    employee_id, job_id, salary
FROM employees
WHERE department_id IN (50, 80, 100)
UNION ALL 
SELECT
    employee_id, job_id, salary
FROM employees
WHERE job_id = 'ST_MAN'
ORDER BY employee_id;



-- II. UNION: Faz a uni�o entre duas tabelas. As linhas inteiramente iguais s�o exclu�das, ficando
-- apenas uma delas.

SELECT
    employee_id, job_id, salary
FROM employees
WHERE department_id IN (50, 80, 100)
UNION
SELECT
    employee_id, job_id, salary
FROM employees
WHERE job_id = 'ST_MAN'
ORDER BY employee_id;



-- III. INTERSECT: Faz a interse��o entre duas tabelas.

SELECT
    employee_id, department_id, job_id, salary
FROM employees
WHERE department_id IN (30, 50, 100)
INTERSECT
SELECT
    employee_id, department_id, job_id, salary
FROM employees
WHERE department_id IN (30, 60, 90)
ORDER BY employee_id;


-- IV. MINUS: Faz a 'subtra��o' entre duas tabelas.

SELECT
    employee_id, department_id, job_id, salary
FROM employees
WHERE department_id IN (30, 50, 100)
MINUS
SELECT
    employee_id, department_id, job_id, salary
FROM employees
WHERE department_id IN (30, 60, 90)
ORDER BY employee_id;

