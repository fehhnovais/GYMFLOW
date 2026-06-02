##  Requisitos Técnicos Banco de dados


## 1. Definição da Arquitetura

## 1.1 Escolha Tecnológica
● Tipo de banco escolhido (SQL ou NoSQL).
● Provedor utilizado (PostgreSQL, MySQL, SQL Server, MongoDB, Redis, DynamoDB
etc.).
● Justificativa técnica da escolha.

## 1.2 Requisitos do Sistema
Descrever:
● Objetivo do sistema.
● Principais entidades ou documentos.
● Volume estimado de dados.
● Quantidade estimada de usuários.
● Principais consultas realizadas.


## 2. Modelagem e Estrutura

## Caso SQL

## Modelagem
● Diagrama Conceitual (DER).
● Diagrama Lógico.
● Dicionário de Dados.

## Implementação
● Scripts DDL.
● Chaves Primárias.
● Chaves Estrangeiras.
● Constraints.
● Índices.

## Caso NoSQL

## Modelagem
● Estrutura dos documentos (JSON/BSON).
● Justificativa de embutir ou referenciar documentos.
● Access Patterns.

## Distribuição
● Shard Key ou Partition Key (quando aplicável).
● Estratégia de escalabilidade.

## Implementação
● Script de criação das coleções.
● Índices


## 3. Modelagem e Normalização

## SQL

## Aplicar e justificar:
● 1FN
● 2FN
● 3FN
Caso exista desnormalização:
● Explicar o motivo.

## NoSQL

## Aplicar e justificar:
● Embedding vs Referencing
● Denormalização
● Modelagem orientada a consulta


## 4. Performance

## Estratégia de Indexação


Para cada índice criado informar:

Campo Tipo de
Índice Motivo
cpf B-Tree Busca por
CPF
data_pe
dido B-Tree Filtros por
período


## Consultas Críticas
Apresentar pelo menos:
● 5 consultas relevantes do sistema.
● Explicar por que são importantes.
● Mostrar evidências de otimização.

## Exemplos:
● JOINs complexos.
● Agregações.
● Relatórios.
● Filtros por data.


## 5. Dados para Teste

● Scripts de carga inicial.
● Mínimo de 100 registros relevantes.
● Dados fictícios coerentes com o domínio.
Isso evita projetos com apenas 5 registros que não permitem avaliar performance.



## 6. Organização do Repositório

├── README.md
├── modelagem/
│ ├── der.png
│ ├── modelo_logico.png
│ └── dicionario_dados.md
├── scripts/
│ ├── setup.sql
│ ├── init-collection.js
│ └── seed/
├── queries/
│ ├── crud.sql
│ ├── consultas_avancadas.sql
│ └── agregacoes.sql
└── justificativa/
└── arquitetura.md



Observação: Durante a apresentação e avaliação do projeto, poderão ser realizadas
perguntas individuais aos integrantes do grupo. As notas poderão ser atribuídas de forma
individual, de acordo com o nível de participação, conhecimento demonstrado e contribuição
de cada aluno para o desenvolvimento do trabalho.