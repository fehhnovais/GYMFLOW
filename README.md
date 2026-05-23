# GymFlow

## Visão Geral
GymFlow é um sistema completo de gerenciamento de treinos para academias. O objetivo é permitir o cadastro de alunos, a criação de treinos personalizados, o controle de exercícios, o registro de histórico de execução e o acompanhamento da evolução física.

## Funcionalidades Principais
- Cadastro e edição de alunos
- Criação e organização de treinos por aluno
- Registro de exercícios e grupos musculares
- Associação de exercícios a treinos com séries, repetições e carga
- Histórico de treinos executados por aluno
- Controle de progresso físico ao longo do tempo
- Suporte opcional para autenticação de usuários (personal trainers)

## Arquitetura Sugerida
A arquitetura deve separar responsabilidades em camadas claras:
- `controllers` — lógica de tratamento de requisições e respostas
- `services` — regras de negócio e orquestração de processos
- `models` — definição de entidades e mapeamento para o banco
- `routes` — endpoints da API
- `database` — configuração e inicialização da conexão com o banco
- `middlewares` — validações, autenticação e tratamento de erros

### Estrutura de pastas sugerida

```
src/
├── controllers/
├── routes/
├── services/
├── models/
├── database/
├── middlewares/
└── app.js
```

## Backend (API REST)
### Stack recomendada
- Node.js
- Express
- PostgreSQL ou MySQL

## Endpoints principais
### Alunos
- `POST /alunos` — cria um novo aluno
- `GET /alunos` — lista todos os alunos
- `GET /alunos/:id` — obtém um aluno específico
- `PUT /alunos/:id` — atualiza um aluno
- `DELETE /alunos/:id` — remove um aluno

Campos de aluno:
- `id`
- `nome`
- `email`
- `idade`
- `peso`
- `altura`
- `objetivo` (ex.: emagrecer, hipertrofia)

### Treinos
- `POST /treinos` — cria um treino para um aluno
- `GET /treinos` — lista todos os treinos
- `GET /treinos/:id` — obtém um treino específico
- `PUT /treinos/:id` — atualiza um treino
- `DELETE /treinos/:id` — exclui um treino

Campos de treino:
- `id`
- `aluno_id`
- `nome`
- `descricao`
- `data_criacao`

### Exercícios
- `POST /exercicios` — cria um exercício
- `GET /exercicios` — lista todos os exercícios
- `GET /exercicios/:id` — obtém um exercício específico
- `PUT /exercicios/:id` — atualiza um exercício
- `DELETE /exercicios/:id` — exclui um exercício

Campos de exercício:
- `id`
- `nome`
- `grupo_muscular`
- `descricao`

### TreinoExercicios (relacionamento N:N)
- `POST /treino-exercicios` — associa exercício a treino
- `GET /treino-exercicios` — lista associações

Campos de associação:
- `treino_id`
- `exercicio_id`
- `series`
- `repeticoes`
- `carga`

### Histórico
- `POST /historico` — registra a execução de um treino
- `GET /historico/aluno/:id` — retorna o histórico de um aluno

Campos de histórico:
- `aluno_id`
- `treino_id`
- `data_execucao`
- `observacoes`

### Progresso
- `POST /progresso` — registra evolução física do aluno
- `GET /progresso/aluno/:id` — lista o progresso do aluno

Campos de progresso:
- `aluno_id`
- `peso`
- `percentual_gordura`
- `data_registro`

### Usuários (opcional)
- `POST /usuarios` — cadastra um personal trainer ou administrador
- `POST /login` — autentica usuário

Campos de usuário:
- `id`
- `nome`
- `email`
- `senha`
- `tipo`

## Modelo de Banco de Dados
### SGBD recomendado
- PostgreSQL (recomendado para projetos com Docker)
- MySQL também é compatível

### Tabelas e relacionamentos
O sistema deve usar um modelo relacional com tabelas conectadas por chaves estrangeiras.

- `alunos` → `treinos` (1:N)
- `treinos` → `exercicios` (N:N via `treino_exercicios`)
- `alunos` → `historico` (1:N)
- `alunos` → `progresso` (1:N)

### Exemplo de criação de tabelas

```sql
CREATE TABLE alunos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    idade INT,
    peso DECIMAL(5,2),
    altura DECIMAL(4,2),
    objetivo VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE treinos (
    id SERIAL PRIMARY KEY,
    aluno_id INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_aluno
        FOREIGN KEY (aluno_id)
        REFERENCES alunos(id)
        ON DELETE CASCADE
);

CREATE TABLE exercicios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    grupo_muscular VARCHAR(50) NOT NULL,
    descricao TEXT
);

CREATE TABLE treino_exercicios (
    id SERIAL PRIMARY KEY,
    treino_id INT NOT NULL,
    exercicio_id INT NOT NULL,
    series INT NOT NULL,
    repeticoes INT NOT NULL,
    carga DECIMAL(5,2),
    CONSTRAINT fk_treino
        FOREIGN KEY (treino_id)
        REFERENCES treinos(id)
        ON DELETE CASCADE,
    CONSTRAINT fk_exercicio
        FOREIGN KEY (exercicio_id)
        REFERENCES exercicios(id)
        ON DELETE CASCADE
);

CREATE TABLE historico (
    id SERIAL PRIMARY KEY,
    aluno_id INT NOT NULL,
    treino_id INT NOT NULL,
    data_execucao DATE NOT NULL,
    observacoes TEXT,
    CONSTRAINT fk_hist_aluno
        FOREIGN KEY (aluno_id)
        REFERENCES alunos(id)
        ON DELETE CASCADE,
    CONSTRAINT fk_hist_treino
        FOREIGN KEY (treino_id)
        REFERENCES treinos(id)
        ON DELETE CASCADE
);

CREATE TABLE progresso (
    id SERIAL PRIMARY KEY,
    aluno_id INT NOT NULL,
    peso DECIMAL(5,2),
    percentual_gordura DECIMAL(5,2),
    data_registro DATE NOT NULL,
    CONSTRAINT fk_progresso_aluno
        FOREIGN KEY (aluno_id)
        REFERENCES alunos(id)
        ON DELETE CASCADE
);

CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    tipo VARCHAR(20) DEFAULT 'trainer',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### Regras de negócio sugeridas
```sql
ALTER TABLE alunos
ADD CONSTRAINT chk_idade CHECK (idade > 0);

ALTER TABLE treino_exercicios
ADD CONSTRAINT chk_series CHECK (series > 0);
```

## Docker
Utilizar Docker garante que o backend e o banco rodem em um ambiente consistente.

### docker-compose.yml

```yaml
version: '3.8'

services:
  backend:
    build: .
    ports:
      - '3000:3000'
    depends_on:
      - db
    environment:
      DB_HOST: db
      DB_USER: postgres
      DB_PASSWORD: postgres
      DB_NAME: gym

  db:
    image: postgres:15
    restart: always
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
      POSTGRES_DB: gym
    ports:
      - '5432:5432'
```

### Dockerfile

```dockerfile
FROM node:18

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 3000
CMD ["npm", "run", "dev"]
```

## Uso
1. Configure as variáveis de ambiente no backend.
2. Inicie o banco de dados e o servidor com `docker compose up --build`.
3. Use ferramentas como Postman ou Insomnia para testar os endpoints.

## O que o projeto deve demonstrar
- API REST organizada e fácil de manter
- Modelagem relacional consistente
- Integração com Docker
- Boas práticas de estrutura de código
- Separação clara entre controladores, serviços e modelos

## Dados de teste (opcional)

```sql
INSERT INTO alunos (nome, email, idade, peso, altura, objetivo)
VALUES ('Fernanda', 'fer@gmail.com', 22, 60.5, 1.65, 'Hipertrofia');

INSERT INTO exercicios (nome, grupo_muscular)
VALUES ('Supino', 'Peito'),
       ('Agachamento', 'Perna');
```

Tabela de relacionamento (N:N)
CREATE TABLE treino_exercicios (
    id SERIAL PRIMARY KEY,
    treino_id INT NOT NULL,
    exercicio_id INT NOT NULL,
    series INT NOT NULL,
    repeticoes INT NOT NULL,
    carga DECIMAL(5,2),

    CONSTRAINT fk_treino
        FOREIGN KEY (treino_id)
        REFERENCES treinos(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_exercicio
        FOREIGN KEY (exercicio_id)
        REFERENCES exercicios(id)
        ON DELETE CASCADE
);

5. 📈 historico
Registra execução de treinos
CREATE TABLE historico (
    id SERIAL PRIMARY KEY,
    aluno_id INT NOT NULL,
    treino_id INT NOT NULL,
    data_execucao DATE NOT NULL,
    observacoes TEXT,

    CONSTRAINT fk_hist_aluno
        FOREIGN KEY (aluno_id)
        REFERENCES alunos(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_hist_treino
        FOREIGN KEY (treino_id)
        REFERENCES treinos(id)
        ON DELETE CASCADE
);


6. 📊 progresso
Evolução física do aluno
CREATE TABLE progresso (
    id SERIAL PRIMARY KEY,
    aluno_id INT NOT NULL,
    peso DECIMAL(5,2),
    percentual_gordura DECIMAL(5,2),
    data_registro DATE NOT NULL,

    CONSTRAINT fk_progresso_aluno
        FOREIGN KEY (aluno_id)
        REFERENCES alunos(id)
        ON DELETE CASCADE
);

7. 👨‍🏫 usuarios (opcional – diferencial)
Para login (personal trainer)
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    tipo VARCHAR(20) DEFAULT 'trainer',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


🔗 📌 RELACIONAMENTOS (RESUMO)
alunos → treinos (1:N)
treinos → exercicios (N:N via treino_exercicios)
alunos → historico (1:N)
alunos → progresso (1:N)



🧠 Regra de negócio (CHECK) 

ALTER TABLE alunos
ADD CONSTRAINT chk_idade CHECK (idade > 0);

ALTER TABLE treino_exercicios
ADD CONSTRAINT chk_series CHECK (series > 0); 


📦 DADOS DE TESTE (opcional) 

INSERT INTO alunos (nome, email, idade, peso, altura, objetivo)
VALUES ('Fernanda', 'fer@gmail.com', 22, 60.5, 1.65, 'Hipertrofia');

INSERT INTO exercicios (nome, grupo_muscular)
VALUES ('Supino', 'Peito'),
       ('Agachamento', 'Perna');

