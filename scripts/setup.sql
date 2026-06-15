-- ============================================================
-- FitFlow — Script DDL completo
-- Banco: PostgreSQL 17
-- App de gerenciamento de treinos de academia
-- ============================================================

-- ── ENUMs ─────────────────────────────────────────────────
CREATE TYPE perfil_usuario AS ENUM ('admin', 'instrutor', 'recepcao');
CREATE TYPE tipo_treino    AS ENUM ('musculacao', 'cardio', 'funcional', 'yoga', 'pilates', 'crossfit');
CREATE TYPE nivel_treino   AS ENUM ('iniciante', 'intermediario', 'avancado');

-- ── Tabela: usuarios ──────────────────────────────────────
-- Controla o acesso ao sistema (login JWT).
-- Um usuário pode ser vinculado a um aluno (relação 1:1 opcional).
CREATE TABLE IF NOT EXISTS usuarios (
  id            SERIAL PRIMARY KEY,
  nome          VARCHAR(100)    NOT NULL,
  email         VARCHAR(150)    NOT NULL UNIQUE,
  senha         VARCHAR(255)    NOT NULL,        -- hash bcrypt
  perfil        perfil_usuario  NOT NULL DEFAULT 'recepcao',
  ativo         BOOLEAN         NOT NULL DEFAULT TRUE,
  criado_em     TIMESTAMP       NOT NULL DEFAULT NOW(),
  atualizado_em TIMESTAMP       NOT NULL DEFAULT NOW()
);

-- ── Tabela: instrutores ───────────────────────────────────
CREATE TABLE IF NOT EXISTS instrutores (
  id             SERIAL PRIMARY KEY,
  nome           VARCHAR(100)  NOT NULL,
  cpf            VARCHAR(14)   NOT NULL UNIQUE,
  email          VARCHAR(150)  NOT NULL UNIQUE,
  telefone       VARCHAR(20),
  especialidade  VARCHAR(100),
  cref           VARCHAR(20)   UNIQUE,
  ativo          BOOLEAN       NOT NULL DEFAULT TRUE,
  criado_em      TIMESTAMP     NOT NULL DEFAULT NOW(),
  atualizado_em  TIMESTAMP     NOT NULL DEFAULT NOW()
);

-- ── Tabela: alunos ────────────────────────────────────────
-- usuario_id é opcional (FK → usuarios): vincula o aluno a uma conta de acesso.
CREATE TABLE IF NOT EXISTS alunos (
  id              SERIAL PRIMARY KEY,
  usuario_id      INTEGER       UNIQUE REFERENCES usuarios(id) ON DELETE SET NULL,
  nome            VARCHAR(100)  NOT NULL,
  cpf             VARCHAR(14)   NOT NULL UNIQUE,
  email           VARCHAR(150)  NOT NULL UNIQUE,
  telefone        VARCHAR(20),
  data_nascimento DATE,
  data_matricula  DATE          DEFAULT CURRENT_DATE,
  ativo           BOOLEAN       NOT NULL DEFAULT TRUE,
  criado_em       TIMESTAMP     NOT NULL DEFAULT NOW(),
  atualizado_em   TIMESTAMP     NOT NULL DEFAULT NOW()
);

-- ── Tabela: treinos ───────────────────────────────────────
CREATE TABLE IF NOT EXISTS treinos (
  id               SERIAL PRIMARY KEY,
  nome             VARCHAR(100)  NOT NULL,
  descricao        TEXT,
  tipo             tipo_treino   NOT NULL,
  duracao_minutos  INTEGER       NOT NULL CHECK (duracao_minutos > 0),
  nivel            nivel_treino  NOT NULL DEFAULT 'iniciante',
  instrutor_id     INTEGER       NOT NULL REFERENCES instrutores(id),
  ativo            BOOLEAN       NOT NULL DEFAULT TRUE,
  criado_em        TIMESTAMP     NOT NULL DEFAULT NOW(),
  atualizado_em    TIMESTAMP     NOT NULL DEFAULT NOW()
);

-- ── Tabela Pivô: aluno_treinos (N:N) ─────────────────────
CREATE TABLE IF NOT EXISTS aluno_treinos (
  id            SERIAL PRIMARY KEY,
  aluno_id      INTEGER   NOT NULL REFERENCES alunos(id)   ON DELETE CASCADE,
  treino_id     INTEGER   NOT NULL REFERENCES treinos(id)  ON DELETE CASCADE,
  data_inicio   DATE      DEFAULT CURRENT_DATE,
  data_fim      DATE,
  observacoes   TEXT,
  criado_em     TIMESTAMP NOT NULL DEFAULT NOW(),
  atualizado_em TIMESTAMP NOT NULL DEFAULT NOW(),
  CONSTRAINT uq_aluno_treino UNIQUE (aluno_id, treino_id)
);

-- ── Índices ───────────────────────────────────────────────
CREATE INDEX IF NOT EXISTS idx_usuarios_email      ON usuarios(email);
CREATE INDEX IF NOT EXISTS idx_usuarios_perfil     ON usuarios(perfil);

CREATE INDEX IF NOT EXISTS idx_instrutores_cpf     ON instrutores(cpf);
CREATE INDEX IF NOT EXISTS idx_instrutores_email   ON instrutores(email);

CREATE INDEX IF NOT EXISTS idx_alunos_usuario_id   ON alunos(usuario_id);
CREATE INDEX IF NOT EXISTS idx_alunos_cpf          ON alunos(cpf);
CREATE INDEX IF NOT EXISTS idx_alunos_email        ON alunos(email);
CREATE INDEX IF NOT EXISTS idx_alunos_matricula    ON alunos(data_matricula);
CREATE INDEX IF NOT EXISTS idx_alunos_ativo        ON alunos(ativo);

CREATE INDEX IF NOT EXISTS idx_treinos_instrutor   ON treinos(instrutor_id);
CREATE INDEX IF NOT EXISTS idx_treinos_tipo        ON treinos(tipo);
CREATE INDEX IF NOT EXISTS idx_treinos_nivel       ON treinos(nivel);

CREATE INDEX IF NOT EXISTS idx_at_aluno_id         ON aluno_treinos(aluno_id);
CREATE INDEX IF NOT EXISTS idx_at_treino_id        ON aluno_treinos(treino_id);
CREATE INDEX IF NOT EXISTS idx_at_data_inicio      ON aluno_treinos(data_inicio);
