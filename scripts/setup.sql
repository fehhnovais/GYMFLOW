-- =============================================
-- GymFlow — Setup SQL corrigido para o projeto
-- =============================================

-- O banco é criado pelo Docker Postgres via POSTGRES_DB=gymflow.
-- Este script deve rodar dentro do database gymflow.

CREATE TABLE IF NOT EXISTS usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    tipo VARCHAR(20) DEFAULT 'trainer',
    "createdAt" TIMESTAMP NOT NULL DEFAULT NOW(),
    "updatedAt" TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS personais (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    "createdAt" TIMESTAMP NOT NULL DEFAULT NOW(),
    "updatedAt" TIMESTAMP NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_usuario_personais FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS alunos (
  id SERIAL PRIMARY KEY,
  usuario_id INT NOT NULL,
  personais_id INT NULL,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE,
  idade INT,
  peso DECIMAL(5, 2),
  altura DECIMAL(4, 2),
  objetivo VARCHAR(50),
  "createdAt" TIMESTAMP NOT NULL DEFAULT NOW(),
  "updatedAt" TIMESTAMP NOT NULL DEFAULT NOW(),
  CONSTRAINT fk_usuario_aluno FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_personal_aluno FOREIGN KEY (personais_id) REFERENCES personais(id) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS exercicios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    grupo_muscular VARCHAR(50) NOT NULL,
    descricao TEXT,
    "createdAt" TIMESTAMP NOT NULL DEFAULT NOW(),
    "updatedAt" TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS treinos (
    id SERIAL PRIMARY KEY,
    aluno_id INT NOT NULL,
    personais_id INT NULL,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT,
    "createdAt" TIMESTAMP NOT NULL DEFAULT NOW(),
    "updatedAt" TIMESTAMP NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_aluno_treino FOREIGN KEY (aluno_id) REFERENCES alunos(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_personal_treino FOREIGN KEY (personais_id) REFERENCES personais(id) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS treino_exercicios (
    id SERIAL PRIMARY KEY,
    treino_id INT NOT NULL,
    exercicio_id INT NOT NULL,
    series INT NOT NULL,
    repeticoes INT NOT NULL,
    carga DECIMAL(5, 2),
    "createdAt" TIMESTAMP NOT NULL DEFAULT NOW(),
    "updatedAt" TIMESTAMP NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_treino FOREIGN KEY (treino_id) REFERENCES treinos(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_exercicio FOREIGN KEY (exercicio_id) REFERENCES exercicios(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS historico (
    id SERIAL PRIMARY KEY,
    aluno_id INT NOT NULL,
    treino_id INT NOT NULL,
    data_execucao DATE NOT NULL,
    observacoes TEXT,
    "createdAt" TIMESTAMP NOT NULL DEFAULT NOW(),
    "updatedAt" TIMESTAMP NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_aluno_historico FOREIGN KEY (aluno_id) REFERENCES alunos(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_treino_historico FOREIGN KEY (treino_id) REFERENCES treinos(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS progresso (
    id SERIAL PRIMARY KEY,
    aluno_id INT NOT NULL,
    peso DECIMAL(5, 2),
    percentual_gordura DECIMAL(5, 2),
    data_registro DATE NOT NULL,
    "createdAt" TIMESTAMP NOT NULL DEFAULT NOW(),
    "updatedAt" TIMESTAMP NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_aluno_progresso FOREIGN KEY (aluno_id) REFERENCES alunos(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 1. LIMPEZA TOTAL (Garante que o banco resete na ordem correta, evitando erros de FK)
TRUNCATE TABLE progresso, historico, treino_exercicios, treinos, exercicios, alunos, personais, usuarios RESTART IDENTITY CASCADE;

-- Índices recomendados para performance

CREATE INDEX idx_usuarios_email ON usuarios (email);
CREATE INDEX idx_alunos_usuario_id ON alunos (usuario_id);
CREATE INDEX idx_alunos_personais_id ON alunos (personais_id);
CREATE INDEX idx_treinos_aluno_id ON treinos (aluno_id);
CREATE INDEX idx_treino_exercicios_treino_id ON treino_exercicios (treino_id);
CREATE INDEX idx_historico_aluno_id ON historico (aluno_id);
CREATE INDEX idx_historico_data_execucao ON historico (data_execucao);
CREATE INDEX idx_progresso_aluno_id ON progresso (aluno_id);
CREATE INDEX idx_progresso_data_registro ON progresso (data_registro);