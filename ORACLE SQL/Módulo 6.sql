/***  FUN��ES SINGLE ROW ***
*
*/

-- I. FUN��ES DE TEXTO: LOWER, UPPER, INITCAP, CONCAT, SUBSTR, LENGTH, INSTR, 
-- LPAD, RPAD e REPLACE

-- 1. LOWER: Coloca todos os caracteres de uma palavra em min�sculas.

SELECT 
    first_name,
    LOWER(first_name)
FROM employees;


-- 2. UPPER: Coloca todos os caracteres de uma palavra em MAI�SCULAS.

SELECT 
    first_name,
    UPPER(first_name)
FROM employees;




-- 3. INITCAP: Deixa o primeiro caractere de cada palavra em MAI�SCULA e o resto em min�scula.

SELECT 
    job_id,
    INITCAP(job_id)
FROM employees;


SELECT *
FROM employees
WHERE UPPER(first_name) = 'DAVID';






-- 4. CONCAT: Junta dois textos em 1 s�. Tem a mesma aplica��o do ||.

SELECT
    first_name,
    last_name,
    CONCAT(first_name, CONCAT(' ', last_name)) nome_completo
FROM employees;





-- 5. SUBSTR: Extrai uma parte de dentro de um texto.

SELECT
    job_id,
    SUBSTR(job_id, 4, 100)
FROM employees;







-- 6. INSTR: Retorna a posi��o de um caractere dentro de um texto.

SELECT
    job_id,
    INSTR(job_id, 'MGR')
FROM employees;







-- 7. LENGTH: Retorna o tamanho de uma palavra em quantidade de caracteres.

SELECT
    first_name,
    LENGTH(first_name)
FROM employees;







-- 8. LPAD: Cria um novo texto com tamanho N, alinha o texto antigo � direita e completa 
-- os caracteres restantes com o caractere especificado.

SELECT
    job_id,
    LENGTH(job_id),
    LPAD(job_id, 20, '*')
FROM employees;








-- 9. RPAD: Cria um novo texto com tamanho N, alinha o texto antigo � esquerda e completa 
-- os caracteres restantes com o caractere especificado.

SELECT
    job_id,
    LENGTH(job_id),
    RPAD(job_id, 20, '*')
FROM employees;









-- 10. REPLACE: Substitui um texto por outro texto.

SELECT
    job_id,
    REPLACE(job_id, 'PROG', 'PR')
FROM employees;







-- II. FUN��ES NUM�RICAS: ROUND, TRUNC e MOD

-- 1. ROUND: Arredonda um valor para a quantidade de casas decimais especificada.

SELECT 
    ROUND(37.548, 2) duas_casas,
    ROUND(37.548, 0) zero_casas
FROM dual;


-- 2. TRUNC: Trunca o valor para a casa decimal especificada.

SELECT 
    TRUNC(37.548, 2) duas_casas,
    TRUNC(37.548, 0) zero_casas
FROM dual;






-- 3. MOD: Retorna o resto de uma divis�o.

SELECT 
    MOD(10, 4) resto
FROM dual;











-- III. FUN��ES DE DATA: MONTHS_BETWEEN, ADD_MONTHS, NEXT_DAY, LAST_DAY, EXTRACT

-- 1. SYSDATE: Retorna a data atual do sistema, no formato 'DD/MM/YY'.

SELECT sysdate
FROM dual;














-- 2. MONTHS_BETWEEN: Retorna o n�mero de meses entre duas datas.

SELECT
    first_name,
    hire_date,
    TRUNC(MONTHS_BETWEEN(sysdate, hire_date), 0) meses_ativo
FROM employees;







-- 3. ADD_MONTHS: Adiciona meses a uma data.

SELECT
    sysdate,
    ADD_MONTHS(sysdate, 3)
FROM dual;






-- 4. NEXT_DAY: Retorna o pr�ximo dia relativo � data especificada.

-- SUNDAY: domingo; MONDAY: segunda; TUESDAY: ter�a; WEDNESDAY: quarta; THURSDAY: quinta; 
-- FRIDAY: sexta; SATURDAY: s�bado

SELECT
    sysdate,
    NEXT_DAY(sysdate, 'wednesday')
FROM dual;


SELECT
    SYSDATE,
    NEXT_DAY(SYSDATE, 'DOMINGO') -- Funcionou assim em português
FROM dual;





-- 5. LAST_DAY: Retorna o �ltimo dia do m�s.

SELECT
    sysdate,
    LAST_DAY(sysdate)
FROM dual;



-- 6. EXTRACT: Extrai informa��es de uma data

SELECT
    sysdate data_atual,
    EXTRACT(YEAR FROM sysdate) ano,
    EXTRACT(MONTH FROM sysdate) mes,
    EXTRACT(DAY FROM sysdate) dia
FROM dual;






