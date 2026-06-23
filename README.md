# GymFlow — API REST

Sistema de gerenciamento de treinos para academias. Permite cadastro de alunos, criação de treinos personalizados, controle de exercícios, registro de histórico de execução e acompanhamento de evolução física.

---

## Entidades, Tabelas e Relacionamentos

| Tabela              | Descrição                                      |
|---------------------|------------------------------------------------|
| `usuarios`          | Usuários do sistema (admin, trainer, aluno)    |
| `personais`         | Personal trainers vinculados a usuários        |
| `alunos`            | Alunos vinculados a usuários e personais       |
| `exercicios`        | Catálogo de exercícios com grupo muscular      |
| `treinos`           | Treinos criados para alunos por personais      |
| `treino_exercicios` | **Tabela pivô** — relação N:N treinos↔exercicios |
| `historico`         | Histórico de execução de treinos por aluno     |
| `progresso`         | Evolução física do aluno ao longo do tempo     |

**Relação N:N:** `treinos` ↔ `exercicios` via `treino_exercicios`  
**Tabela pivô:** `treino_exercicios` (possui model própria)

### Relacionamentos
- `usuarios` 1:1 `alunos`
- `usuarios` 1:1 `personais`
- `personais` 1:N `alunos`
- `personais` 1:N `treinos`
- `alunos` 1:N `treinos`
- `treinos` N:N `exercicios` via `treino_exercicios`
- `alunos` 1:N `historico`
- `alunos` 1:N `progresso`

---

## CRUD das Entidades Principais

### Usuarios
| Método | Rota             | Ação                    |
|--------|------------------|-------------------------|
| POST   | `/usuarios`      | Cadastra novo usuário   |
| POST   | `/login`         | Login e retorno de JWT  |

### Alunos
| Método | Rota           | Ação                    |
|--------|----------------|-------------------------|
| GET    | `/alunos`      | Lista todos os alunos   |
| GET    | `/alunos/:id`  | Busca aluno por ID      |
| POST   | `/alunos`      | Cria novo aluno         |
| PUT    | `/alunos/:id`  | Atualiza aluno          |
| DELETE | `/alunos/:id`  | Remove aluno            |

### Personais
| Método | Rota             | Ação                      |
|--------|------------------|---------------------------|
| GET    | `/personais`     | Lista todos os personais  |
| GET    | `/personais/:id` | Busca personal por ID     |
| POST   | `/personais`     | Cria novo personal        |
| PUT    | `/personais/:id` | Atualiza personal         |
| DELETE | `/personais/:id` | Remove personal           |

### Treinos
| Método | Rota           | Ação                    |
|--------|----------------|-------------------------|
| GET    | `/treinos`     | Lista todos os treinos  |
| GET    | `/treinos/:id` | Busca treino por ID     |
| POST   | `/treinos`     | Cria novo treino        |
| PUT    | `/treinos/:id` | Atualiza treino         |
| DELETE | `/treinos/:id` | Remove treino           |

### Exercicios
| Método | Rota              | Ação                       |
|--------|-------------------|----------------------------|
| GET    | `/exercicios`     | Lista todos os exercicios  |
| GET    | `/exercicios/:id` | Busca exercicio por ID     |
| POST   | `/exercicios`     | Cria novo exercicio        |
| PUT    | `/exercicios/:id` | Atualiza exercicio         |
| DELETE | `/exercicios/:id` | Remove exercicio           |

### TreinoExercicios (tabela pivô N:N)
| Método | Rota                                  | Ação                              |
|--------|---------------------------------------|-----------------------------------|
| GET    | `/treinos/:treino_id/exercicios`      | Lista exercicios do treino        |
| GET    | `/treinos/:treino_id/exercicios/:id`  | Busca associação por ID           |
| POST   | `/treinos/:treino_id/exercicios`      | Associa exercicio ao treino       |
| PUT    | `/treinos/:treino_id/exercicios/:id`  | Atualiza séries/repetições/carga  |
| DELETE | `/treinos/:treino_id/exercicios/:id`  | Remove associação                 |

### Historico
| Método | Rota              | Ação                        |
|--------|-------------------|-----------------------------|
| GET    | `/historico`      | Lista registros de historico|
| GET    | `/historico/:id`  | Busca registro por ID       |
| POST   | `/historico`      | Cria registro               |
| PUT    | `/historico/:id`  | Atualiza registro           |
| DELETE | `/historico/:id`  | Remove registro             |

### Progresso
| Método | Rota             | Ação                       |
|--------|------------------|----------------------------|
| GET    | `/progresso`     | Lista registros de progresso|
| GET    | `/progresso/:id` | Busca registro por ID       |
| POST   | `/progresso`     | Cria registro               |
| PUT    | `/progresso/:id` | Atualiza registro           |
| DELETE | `/progresso/:id` | Remove registro             |

---

## Autenticação JWT

### 1. Criar um usuário (admin ou trainer)

```http
POST /usuarios
Content-Type: application/json

{
  "nome": "Admin GymFlow",
  "email": "admin@gymflow.com",
  "senha": "senha123",
  "tipo": "admin"
}
```

Tipos disponíveis: `admin`, `trainer`, `aluno`

### 2. Fazer login e obter token

```http
POST /login
Content-Type: application/json

{
  "email": "admin@gymflow.com",
  "senha": "senha123"
}
```

Resposta:
```json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "usuario": { "id": 1, "nome": "Admin GymFlow", "email": "admin@gymflow.com", "tipo": "admin" }
}
```

### 3. Usar o token nas requisições

Adicione o header em todas as rotas protegidas:
```
Authorization: Bearer <token>
```

**Regras de acesso:**
- Rotas de alunos e treinos: `trainer` ou `admin`
- Rotas de personais: apenas `admin`
- Rotas de leitura (GET) de treinos, exercicios, historico, progresso: qualquer usuário autenticado

---

## Documentação Swagger

Acesse após subir o projeto:

```
http://localhost/api-docs
```

No Swagger, clique em **Authorize** e insira o token no formato:
```
Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

---

## Containers Docker

| Container            | Imagem              | Função                                  |
|----------------------|---------------------|-----------------------------------------|
| `gymflow-nginx-proxy`| `nginx:alpine`      | Proxy reverso — ponto de entrada externo|
| `gymflow-app`        | `node:24-alpine`    | Servidor Node.js/Express (sem porta pública) |
| `gymflow-db`         | `postgres:17-alpine`| Banco de dados PostgreSQL               |
| `gymflow-cache`      | `redis:7-alpine`    | Cache Redis                             |

**Arquitetura:** `Host → Nginx (porta 80) → App Node.js (porta 3000) → PostgreSQL`

O container `app` **não expõe porta diretamente** para o host — acesso somente pelo Nginx.

---

## Bibliotecas Utilizadas

| Biblioteca         | Versão  | Uso                                     |
|--------------------|---------|-----------------------------------------|
| `express`          | ^5.2.1  | Servidor HTTP e roteamento              |
| `sequelize`        | ^6.37.8 | ORM para PostgreSQL                     |
| `pg`               | ^8.21.0 | Driver PostgreSQL                       |
| `pg-hstore`        | ^2.3.4  | Serialização de tipos hstore            |
| `bcrypt`           | ^6.0.0  | Hash de senhas                          |
| `jsonwebtoken`     | ^9.0.3  | Geração e validação de tokens JWT       |
| `dotenv`           | ^17.4.2 | Variáveis de ambiente                   |
| `swagger-jsdoc`    | ^6.3.0  | Geração de spec Swagger a partir de JSDoc|
| `swagger-ui-express`| ^5.0.1 | Interface web da documentação Swagger   |

---

## Como Executar com Docker

### Pré-requisitos
- Docker e Docker Compose instalados

### Subindo o projeto

```bash
docker compose up --build
```

Na primeira execução, o PostgreSQL criará o banco automaticamente via `scripts/setup.sql`.

### Testando a API

```bash
# Health check
curl http://localhost/health

# Login
curl -X POST http://localhost/login \
  -H "Content-Type: application/json" \
  -d '{"email":"admin@gymflow.com","senha":"senha123"}'
```

### Parando o projeto

```bash
docker compose down
```

Para remover o volume de dados do banco (reset completo):
```bash
docker compose down -v
```

---

## Como Executar as Migrations

Dentro do container (após `docker compose up`):
```bash
docker exec gymflow-app node command.js migrate
```

Ou localmente (com banco acessível):
```bash
# Na raiz do projeto
node command.js migrate
```

O comando `migrate` usa `sequelize.sync()` para criar/atualizar as tabelas conforme os models.

---

## Variáveis de Ambiente (.env)

```env
DB_HOST=gymflow-db
DB_PORT=5432
DB_NAME=gymflow
DB_USER=gymflow_user
DB_PASSWORD=gymflow_senha_123
JWT_SECRET=gymflow_jwt_secret_chave_super_segura_2024
JWT_EXPIRES_IN=8h
PORT=3000
```
