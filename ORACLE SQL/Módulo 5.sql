/***  ORDENANDO E FILTRANDO DADOS ***
*
*/

-- I. ORDENANDO DADOS DE UMA TABELA: ORDER BY

-- O comando ORDER BY � usado para ordenar os dados de uma tabela, a partir de uma coluna.
-- A sua sintaxe � a seguinte:

/*
SELECT coluna1, coluna2, ...
FROM tabela
ORDER BY coluna1 [ASC/DESC]
*/

-- Onde ASC significa uma ordena��o CRESCENTE, enquanto DESC significa uma ordena��o DECRESCENTE.

-- Tamb�m podemos ordenar a tabela por mais de uma coluna:

/*
SELECT coluna1, coluna2, ...
FROM tabela
ORDER BY coluna1 [ASC/DESC], coluna2 [ASC/DESC], ...
*/



-- II. ORDER BY: APLICA��O

-- 1. Comando ORDER BY com coluna de N�MEROS

-- a) Fa�a uma ordena��o na tabela EMPLOYEES para visualizar os funcion�rios do menor
-- para o maior sal�rio.

SELECT * FROM employees
ORDER BY salary ASC; --  ORDER BY salary; -- ASC por padr�o

--SELECT * FROM employees
--ORDER BY employee_id
--FETCH NEXT 5 ROWS ONLY;

-- b) Fa�a uma ordena��o na tabela EMPLOYEES para visualizar os funcion�rios do maior
-- para o menor sal�rio.

SELECT * FROM employees
ORDER BY salary DESC;

-- 1.2. Comando ORDER BY com coluna de TEXTOS

-- a) Ordene a tabela de EMPLOYEES para mostrar os funcion�rios em ordem alfab�tica.

SELECT * FROM employees
ORDER BY first_name;

-- b) Ordene a tabela de EMPLOYEES para mostrar os funcion�rios em ordem "anti"-alfab�tica.

SELECT * FROM employees
ORDER BY first_name DESC;

-- 1.3. Comando ORDER BY com coluna de DATAS

-- a) Ordene a tabela de EMPLOYEES para mostrar os funcion�rios de acordo com a data de
-- contrata��o: da mais antiga pra mais recente.

SELECT * FROM employees
ORDER BY hire_date;

-- b) Ordene a tabela de EMPLOYEES para mostrar os funcion�rios de acordo com a data de
-- contrata��o: da mais recente pra mais antiga.

SELECT * FROM employees
ORDER BY hire_date DESC;


-- 1.4. Comando ORDER BY com mais de uma coluna

-- a) Alguns funcion�rios possuem o mesmo first_name (por exemplo, o JAMES).
-- Ordene a tabela EMPLOYEES de acordo com first_name e last_name para fazer o desempate. 

SELECT * FROM employees
ORDER BY first_name ASC, last_name ASC;

-- 1.5. Comando ORDER BY com NULLS FIRST e NULLS LAST.

-- a) A coluna MANAGER_ID da tabela DEPARTMENTS possui valores nulos. Fa�a uma ordena��o dessa
-- coluna utilizando NULLS FIRST e NULLS LAST.

SELECT * FROM departments
ORDER BY manager_id DESC NULLS LAST;



-- FETCH NEXT: Filtrando as N primeiras linhas de uma tabela

-- a) TOP N linhas
-- FETCH NEXT N ROWS ONLY

-- Retorne as 10 primeiras linhas da tabela EMPLOYEES, ordenadas por employee_id.

SELECT *
FROM employees
ORDER BY salary DESC
FETCH NEXT 10 ROWS ONLY;


-- b) TOP N linhas, incluindo os empatados
-- FETCH NEXT N ROWS WITH TIES

-- Retorne as 12 primeiras linhas da tabela EMPLOYEES, ordenadas por salary.

SELECT *
FROM employees
ORDER BY salary DESC
FETCH NEXT 12 ROWS WITH TIES;



-- c) Limitando por um percentual de linhas
-- FETCH NEXT N PERCENT ROWS ONLY

-- Retorne os 10% funcion�rios de sal�rio mais alto.

SELECT *
FROM employees
ORDER BY salary DESC
FETCH NEXT 10 PERCENT ROWS ONLY;


-- d) Criando um OFFSET (deslocamento) de linhas
-- OFFSET N ROWS

-- Retorne os 10 primeiros funcion�rios logo ap�s os 5 primeiros (ordenando por employee_id).

SELECT *
FROM employees
ORDER BY employee_id
OFFSET 5 ROWS
FETCH NEXT 10 ROWS ONLY;



-- III. FILTRANDO DADOS DE UMA TABELA: COMANDO WHERE

-- O comando WHERE � usado para para filtrar tabelas em um banco de dados. Sua sintaxe � muito simples:

/*
SELECT coluna1, coluna2, ...
FROM tabela
WHERE condicao;
*/

-- Dentro de 'condicao' podemos usar uma s�rie de operadores, como: IN, BETWEEN, LIKE, AND, OR,
-- e assum vai. Veremos v�rios exemplos de aplica��o.


-- IV. FILTRANDO N�MEROS, TEXTOS E DATAS

-- 1.1. Filtros de n�mero, texto e data.

-- a) Filtre a tabela EMPLOYEES e retorne apenas 
-- os funcion�rios do departamento ID = 100

SELECT employee_id, first_name, salary, department_id
FROM employees
WHERE department_id = 100;

-- b) Filtre a tabela JOBS e retorne aqueles que 
-- tem um sal�rio m�nimo maior que 6000

SELECT *
FROM jobs
WHERE min_salary > 6000;


-- c) Filtre a tabela EMPLOYEES para retornar apenas o job_id = ST_MAN.
-- Cuidado: Oracle � case sensitive.

SELECT
    first_name,
    last_name,
    salary,
    job_id
FROM employees
WHERE job_id = 'ST_MAN';

-- d) Filtre a tabela EMPLOYEES para mostrar apenas os funcion�rios que foram contratados
-- ap�s o dia 01/01/00

SELECT
    *
FROM employees
WHERE hire_date >= '01/01/00';


-- V. Filtro WHERE combinado com AND, OR e NOT.

-- Os operadores AND e OR nos permitem criar filtros a partir de mais de uma coluna da tabela.

/*
-- AND
-- Todas as condi��es devem ser VERDADEIRAS

SELECT coluna1, coluna2, ...
FROM tabela
WHERE condicao1 AND condicao2;
*/

/*
-- OR
-- Basta que 1 condi��o seja VERDADEIRA

SELECT coluna1, coluna2, ...
FROM tabela
WHERE condicao1 AND condicao2;
*/



-- a) Quais funcion�rios t�m o JOB_ID = 'IT_PROG' e SALARY >= 5000?

SELECT * FROM employees
WHERE job_id = 'IT_PROG' AND salary >= 5000;


-- b) Quais funcion�rios s�o do departamento 90 ou 100?

SELECT * FROM employees
WHERE department_id = 90 OR department_id = 100
ORDER BY department_id DESC;

-- c) Fa�a um filtro pra mostrar apenas os funcion�rios que N�O s�o do departamento 90.

SELECT * FROM employees
WHERE NOT department_id = 90;


-- VI. Operador LIKE, NOT LIKE e Wildcards

-- O operador LIKE permite que a gente fa�a filtros que buscam um padr�o dentro de uma coluna.

/*
-- Sintaxe

SELECT coluna1, coluna2, ...
FROM tabela
WHERE coluna1 LIKE 'padrao';
*/

-- a) Quais funcion�rios possuem um JOB_ID que come�am com o texto: 'ST'?

SELECT * FROM employees
WHERE job_id LIKE 'ST%';

-- b) Quais funcion�rios possuem um JOB_ID que termina com o texto: 'MAN'?

SELECT * FROM employees
WHERE job_id LIKE '%MAN';

-- c) O telefone � formado por 3 partes: AAA.BBB.CCCC. Quais telefones t�m a 2� parte igual a 123?

SELECT * FROM employees
WHERE phone_number LIKE '____123_____';

-- d) Utilize o operador NOT para negar todos os exemplos anteriores.

    
-- VII. OPERADORES BETWEEN e NOT BETWEEN

-- O operador BETWEEN permite realizar um filtro em intervalo de valores.

/*
-- Sintaxe

SELECT coluna1, coluna2, ...
FROM tabela
WHERE coluna1 BETWEEN valor1 AND valor2;
*/


-- a) Selecione os funcion�rios que recebam um sal�rio ENTRE 10.000 e 30.000.

SELECT * FROM employees
WHERE salary BETWEEN 10000 AND 30000;

-- b) Selecione os funcion�rios que t�m nomes come�ando com a letra 'A' at� a letra 'D'.

SELECT * FROM employees
WHERE first_name BETWEEN 'A' AND 'D';

-- c) Selecione os funcion�rios que foram contratados entre as datas '01/01/99' e 31/12/00'

SELECT * FROM employees
WHERE hire_date BETWEEN '01/01/99' AND '31/12/00';

-- d) Utilize o NOT para fazer a nega��o dos exemplos anteriores.


-- VIII. OPERADORES IN e NOT IN

-- O operador IN permite especificar m�ltiplos valores no filtro.

/*
-- Sintaxe

SELECT coluna1, coluna2, ...
FROM tabela
WHERE coluna1 IN (valor1, valor2, valor3, ...);
*/

-- a) Selecione os funcion�rios que s�o de um dos seguintes departamentos: 30, 50, 80.

SELECT * FROM employees
WHERE department_id IN (30, 50, 80);

-- b) Selecione os funcion�rios que N�O s�o dos departamentos acima.

SELECT * FROM employees
WHERE department_id NOT IN (30, 50, 80);


-- IX. OPERADORES IS NULL e IS NOT NULL

-- Permite filtrar valores nulos.

/*
-- Sintaxe

SELECT coluna1, coluna2, ...
FROM tabela
WHERE coluna1 IS NULL;
*/

-- a) Quais funcion�rios t�m o percentual de comiss�o igual a (null)?

SELECT * FROM employees
WHERE commission_pct IS NULL;

-- b) Quais funcion�rios t�m o percentual de comiss�o diferente de null.

SELECT * FROM employees
WHERE commission_pct IS NOT NULL;


-- X. REGRAS DE PRECED�NCIA

-- Quando utilizamos diversos filtros em conjunto, come�a a ficar confuso a ordem que cada
-- filtro ser� executado. Utilizamos os par�nteses para especificar qual � a ordem de prioridade
-- de execu��o dos filtros. Caso contr�rio, a execu��o ser� feita na seguinte ordem:


-- 1. Condi��es de compara��o
-- 2. IS NULL, LIKE, IN
-- 3. BETWEEN
-- 4. NOT
-- 5. AND
-- 6. OR


-- No exemplo abaixo, qual � o resultado esperado?

SELECT first_name, job_id, salary
FROM employees
WHERE job_id = 'IT_PROG' OR job_id = 'ST_MAN' AND salary > 5000;



-- X1. VARI�VEIS DE SUBSTITUI��O

-- As vari�veis de substitui��o nos permitem interagir com a nossa consulta ao abrir uma
-- janela para input de dados por parte do usu�rio.


-- a) Fa�a uma consulta din�mica � tabela EMPLOYEES para que seja retornado o funcion�rio
-- de id informado pelo usu�rio.

SELECT * FROM employees
WHERE employee_id = &employee_id;

-- b) Fa�a uma consulta � tabela DEPARTMENTS para que seja retornado as informa��es do departamento
-- department_name informado pelo usu�rio (teste com Marketing, IT, Sales).

SELECT * FROM departments
WHERE department_name = '&department_name';

-- c) Fa�a uma consulta � tabela EMPLOYEES e retorne os funcion�rios com o sal�rio entre um range
-- da escolha do usu�rio.

SELECT * FROM employees
WHERE salary BETWEEN &salary AND &salary;
