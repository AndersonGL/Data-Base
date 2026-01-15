# 🗄️ Estudos sobre os Principais Bancos de Dados

Guia direto, organizado e sem enrolação.

## 📌 Sobre este repositório

Este repositório reúne estudos, resumos e exemplos dos bancos de dados
mais utilizados no mercado --- relacionais e não relacionais.\
A ideia é ter um **material de consulta rápido**, com conceitos
essenciais, vantagens, desvantagens e exemplos práticos.

------------------------------------------------------------------------

# 🔥 Bancos de Dados Relacionais (SQL)

## 🟦 MySQL

### 📖 O que é?

Um dos bancos mais usados do mundo. Leve, rápido e perfeito para
aplicações web.

### ⭐ Pontos fortes

-   Excelente desempenho para leitura\
-   Gratuito e open-source\
-   Muito usado em hospedagens compartilhadas

### 👎 Pontos fracos

-   Conjunto de recursos SQL não tão robusto quanto PostgreSQL

### 🧪 Exemplo

``` sql
SELECT * FROM usuarios WHERE ativo = 1;
```

------------------------------------------------------------------------

## 🟪 PostgreSQL

### 📖 O que é?

O queridinho dos devs. Avançadíssimo, poderoso e cheio de recursos
modernos.

### ⭐ Pontos fortes

-   Suporte a JSON nativo\
-   Extensível (ex: PostGIS)\
-   Altamente confiável e robusto

### 👎 Pontos fracos

-   Mais pesado que MySQL para uso simples

### 🧪 Exemplo

``` sql
SELECT nome, email FROM clientes ORDER BY nome;
```

------------------------------------------------------------------------

## 🟥 SQL Server

### 📖 O que é?

Banco da Microsoft, muito usado em sistemas corporativos.

### ⭐ Pontos fortes

-   Excelente integração com .NET\
-   Ferramentas administrativas poderosas\
-   Segurança bem estruturada

### 👎 Pontos fracos

-   Versão completa é paga\
-   Melhor desempenho em ambiente Windows

### 🧪 Exemplo

``` sql
SELECT TOP 10 * FROM produtos;
```

------------------------------------------------------------------------

## ⬛ Oracle Database

### 📖 O que é?

Banco usado em ambientes de missão crítica.

### ⭐ Pontos fortes

-   Extremamente seguro\
-   Alta performance em operações gigantescas\
-   Recursos avançados de replicação

### 👎 Pontos fracos

-   Licenças caras

### 🧪 Exemplo

``` sql
SELECT * FROM funcionarios WHERE salario > 5000;

```

### DDL 

- São os comandos que interagem com objetos(tabelas,  views, functions,procedures,etc) dentro de um banco de dados

- Create - Cria uma nova tabela, views ou outro objeto dentro do banco de dados

- Alter - Modifica um objeto de detro do banco de dados

- Drop - Exclui um bjeto dentro do banco de dados (tabela,view,etc)


### DML 

- São os comandos que interagem com dados dentro de tabelas

obs: O comando SELECT pode se encaixar neste grupo de comnados.

- Insert - Adicona uma nova linha em uma tabela

- Update - Atualiza os valores das linhas de uma tabela

- Delete - Exclui linha de uma tabela.

### TCL

- São os candos dpara controle de transações no SQL. Os comandos DML (Insert, Update e Delete) são exemplos de transações.

- Commit - Salva as alterações no banco.

- Rollback - Desfaz alterações no banco.


### DCL

- São os conados para controlar a parte de segurença do banco de dados. Basicamente diz quem terá permissão de quê, e quem terá a permissão a quê.

- Grant - Dá privilégios á um usuário

- Revoke - Retira privilégios de um usuário.

### Documentação Oracle  

- oracle.com/technical-resources -> Documentation -> Oracle Database -> Development - PDF em SQL Language Reference

### Schema HR

- O banco de dados HR possui 7 tabelas, chamadas:

- Countries
- Departments
- Employees
- Jobs History
- Jobs
- Locations
- Regions

### Criar Usuarios

- Em outros usuários criar um usuário C##TESTE e uma Senha, Depois conceder todas as
autorizações

- Depois Criei o Banco HR  e usuario e senha coloquei o acima, depois peguei a pasta 
arquivo sql com as tabelas que estava na área de trabalho e adicionei. no meu PC 
local : 192.168.15.20 e abaixo XEXDB.












------------------------------------------------------------------------

# 🟩 Bancos de Dados Não Relacionais (NoSQL)

## 🟩 MongoDB

### 📖 O que é?

Banco orientado a documentos. Cada registro é um JSON.

### ⭐ Pontos fortes

-   Altamente escalável\
-   Flexível para evolução de esquema\
-   Ótimo para aplicações Node.js

### 👎 Pontos fracos

-   Não ideal para consultas altamente relacionais

### 🧪 Exemplo

``` json
{
  "nome": "Anderson",
  "idade": 29,
  "habilidades": ["JS", "Flutter"]
}
```

------------------------------------------------------------------------

## 🟧 Redis

### 📖 O que é?

Banco em memória --- rápido como um foguete.

### ⭐ Pontos fortes

-   Velocidade absurda\
-   Excelente para cache\
-   Simples e eficiente

### 👎 Pontos fracos

-   Armazenamento principal em RAM

### 🧪 Exemplo

``` bash
SET usuario:1 "Anderson"
GET usuario:1
```

------------------------------------------------------------------------

## 🟨 Cassandra

### 📖 O que é?

Criado pelo Facebook. Escala para níveis planetários.

### ⭐ Pontos fortes

-   Altamente distribuído\
-   Escala horizontal absurda\
-   Alta disponibilidade

### 👎 Pontos fracos

-   Curva de aprendizado maior

------------------------------------------------------------------------

## 🟫 Firebase / Firestore

### 📖 O que é?

Banco NoSQL do Google, muito usado em apps mobile.

### ⭐ Pontos fortes

-   Realtime updates\
-   Integração excelente com apps mobile\
-   Autenticação integrada

### 👎 Pontos fracos

-   Consultas limitadas\
-   Custos podem aumentar

------------------------------------------------------------------------

# 📊 Tabela Comparativa

  Banco        Tipo         Uso Ideal            Vantagem Principal
  ------------ ------------ -------------------- ----------------------
  MySQL        Relacional   Web apps             Simplicidade
  PostgreSQL   Relacional   Sistemas avançados   Robustez
  SQL Server   Relacional   Corporativo          Integração Microsoft
  Oracle       Relacional   Missão crítica       Segurança extrema
  MongoDB      NoSQL        Apps flexíveis       JSON nativo
  Redis        NoSQL        Cache                Velocidade
  Cassandra    NoSQL        Big Data             Escalabilidade
  Firebase     NoSQL        Apps mobile          Realtime

------------------------------------------------------------------------
