-- Fun��es de Agrega��o e Agrupamentos

-- I. Fun��es de Agrega��o: COUNT, SUM, AVG, MIN, MAX

-- 1. COUNT: Faz a contagem de valores de uma coluna. 

/*
Sintaxe:

SELECT
    COUNT(coluna)
FROM tabela;
*/

-- Mas, tome cuidado...





-- a) Descubra o total de funcion�rios a partir da coluna de EMPLOYEE_ID da tabela EMPLOYEES.

SELECT
    COUNT(employee_id) total_funcionarios
FROM employees;

-- b) Descubra o total de funcion�rios a partir da coluna de FIRST_NAME da tabela EMPLOYEES.

SELECT
    COUNT(first_name) total_funcionarios
FROM employees;

-- c) Descubra o total de funcion�rios a partir da coluna de COMMISSION_PCT da tabela EMPLOYEES.
-- � poss�vel?

SELECT
    COUNT(commission_pct) total_funcionarios
FROM employees;


-- 2. COUNT(*): Faz a contagem de valores de uma coluna, sejam eles nulos ou n�o.

-- a) Descubra o total de funcion�rios na tabela EMPLOYEES independente da coluna a ser usada.

SELECT
    COUNT(*) total_funcionarios
FROM employees;


-- 3. COUNT DISTINCT: Conta os valores distintos de uma coluna.

-- a) Descubra quais s�o os valores distintos de JOB_ID na tabela EMPLOYEES.
-- Qual � o total de valores distintos?

SELECT
    job_id
FROM employees;


SELECT
    DISTINCT job_id
FROM employees;


SELECT
    COUNT(DISTINCT job_id)
FROM employees;


-- 4. SUM: Faz a soma de valores de uma coluna.

/*
Sintaxe

SELECT
    SUM(coluna)
FROM tabela;
*/


-- a) Qual � a soma total de sal�rio dos funcion�rios?

SELECT
    SUM(salary) total_salario
FROM employees;


-- 5. AVG: Faz a m�dia de valores de uma coluna.

/*
Sintaxe

SELECT
    AVG(coluna)
FROM tabela;
*/

-- a) Qual � a m�dia salarial dos funcion�rios?

SELECT
    AVG(salary) total_salario
FROM employees;

-- Arredondando duas casas com Round

SELECT
  ROUND(AVG(salary),2) media_salarial
FROM employees;


-- 6. MAX: Retorna o maior dos valores de uma coluna.

/*
Sintaxe

SELECT
    MAX(coluna)
FROM tabela;
*/


-- a) Qual � a maior de todos os sal�rios?

SELECT
    MAX(salary) total_salario
FROM employees;


-- 7. MIN: Retorna o menor dos valores de uma coluna.

/*
Sintaxe

SELECT
    MIN(coluna)
FROM tabela;
*/

-- a) Qual � a menor de todos os sal�rios?

SELECT
    MIN(salary) total_salario
FROM employees;


-- 8. Cuidado com valores nulos no c�lculo das fun��es de agrega��o.
-- a) Qual � a m�dia de comiss�o dos funcion�rios?

SELECT 
    AVG(NVL(commission_pct, 0)) media_comissao
FROM employees;


-- II. Agrupamentos

/* Sintaxe:

SELECT
    coluna1,
    funcao_agregacao(coluna2)
FROM tabela
GROUP BY coluna1;


-- Na hora de criar agrupamentos, podemos utilizar uma s�rie de comandos, na seguinte ordem:

SELECT
    coluna,
    funcao_agregacao()
FROM tabela
[WHERE condicao]         -- Condi��o para selecionar as linhas desejadas da tabela
GROUP BY coluna          -- Comando para criar o agrupamento
[HAVING condicao]        -- Condi��o para selecionar os agrupamentos desejados
[ORDER BY coluna];        -- Comando para ordenar a consulta final

*/


-- 1. GROUP BY: Agrupa os dados a partir de uma ou mais colunas da tabela.
-- a) Fa�a um agrupamento da quantidade total de funcion�rios por JOB_ID.

SELECT
    job_id,
    COUNT(*) total_funcionarios
FROM employees
GROUP BY job_id;

-- b) Fa�a um agrupamento da soma total de sal�rio por JOB_ID.

SELECT
    job_id,
    SUM(salary) total_salario
FROM employees
GROUP BY job_id;

-- c) Fa�a um agrupamento da soma total de sal�rio por DEPARTMENT_ID e JOB_ID.

SELECT
    department_id,
    job_id,
    SUM(salary) total_salario
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id;


-- 2. Fun��es de agrupamento aninhadas.
-- a) Qual � a maior m�dia salarial dentre todos os departamentos.

SELECT MAX(AVG(salary))
FROM employees
GROUP BY department_id;


-- 3. GROUP BY + WHERE: Agrupa os dados a partir de uma ou mais colunas da tabela; mas antes,
-- faz um filtro na tabela a ser agrupada.

-- a) Fa�a um agrupamento de quantidade total de funcion�rios por JOB_ID, mas apenas para os
-- funcion�rios que foram contratados no ano de 1998.

SELECT
    job_id,
    COUNT(*) total_funcionarios
FROM employees
WHERE TO_CHAR(hire_date, 'YYYY')  = '1998'
GROUP BY job_id;


-- 4. GROUP BY + HAVING: Agrupa os dados a partir de uma ou mais colunas da tabela e ap�s fazer
-- o agrupamento, filtramos a tabela agrupada.
    
-- a) Fa�a um agrupamento de quantidade total de funcion�rios por JOB_ID. A agrupamento final
-- deve considerar apenas os JOB_ID com mais de 1 funcion�rio.

SELECT
    job_id,
    COUNT(*) total_funcionarios
FROM employees
GROUP BY job_id
HAVING COUNT(*) > 1;
