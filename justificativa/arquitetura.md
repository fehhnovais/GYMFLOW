# Justificativa de Arquitetura — GymFlow

## 1. Escolha Tecnológica

### Tipo de Banco
SQL — banco de dados relacional.

### Provedor
PostgreSQL 17.

### Justificativa Técnica
O PostgreSQL foi escolhido por ser um banco robusto, open source e amplamente 
utilizado em produção. Suporta transações ACID, chaves estrangeiras e constraints, 
essenciais para garantir integridade dos dados em um sistema de gerenciamento de 
treinos com múltiplos relacionamentos entre entidades.

---

## 2. Requisitos do Sistema

### Objetivo do Sistema
GymFlow é uma API REST para gerenciamento de treinos de academia. Permite o cadastro 
de alunos, criação de treinos personalizados, controle de exercícios, registro de 
histórico de execução e acompanhamento da evolução física.

### Principais Entidades
- Usuario
- Personal
- Aluno
- Treino
- Exercicio
- TreinoExercicio (pivô N:N)
- Historico
- Progresso

### Volume Estimado de Dados
- Até 1.000 alunos cadastrados
- Até 5.000 treinos
- Até 50.000 registros de histórico por ano

### Quantidade Estimada de Usuários
- 50 personal trainers simultâneos
- 500 alunos ativos simultâneos

### Principais Consultas
- Treinos de um aluno com exercícios
- Histórico de execução por aluno e período
- Progresso físico ao longo do tempo
- Alunos vinculados a um personal
- Exercícios por grupo muscular com carga média

---

## 3. Normalização

### 1FN — Primeira Forma Normal
Todas as tabelas possuem campos atômicos, sem grupos repetidos. 
Cada campo contém um único valor indivisível.

### 2FN — Segunda Forma Normal
Todas as tabelas possuem chave primária simples (id). 
Não há dependências parciais — todos os campos dependem da chave primária completa.

### 3FN — Terceira Forma Normal
Não há dependências transitivas. Os campos de cada tabela dependem 
exclusivamente da chave primária, não de outros campos não-chave.

### Desnormalização
A tabela `alunos` possui o campo `nome` e `email` que também existem em `usuarios`. 
Isso foi uma decisão intencional para facilitar consultas diretas sem necessidade 
de JOIN em casos simples, melhorando a performance de leitura.

---

## 4. Estratégia de Indexação

| Campo | Tabela | Tipo | Motivo |
|---|---|---|---|
| email | usuarios | B-Tree | Busca por email no login |
| usuario_id | alunos | B-Tree | JOIN frequente com usuarios |
| personal_id | alunos | B-Tree | Filtro por personal |
| aluno_id | treinos | B-Tree | Treinos de um aluno |
| treino_id | treino_exercicios | B-Tree | Exercícios de um treino |
| aluno_id | historico | B-Tree | Histórico por aluno |
| data_execucao | historico | B-Tree | Filtros por período |
| aluno_id | progresso | B-Tree | Progresso por aluno |
