- Criação do Banco de Dados
CREATE DATABASE gym_flow;


CREATE TABLE IF NOT EXISTS usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    tipo VARCHAR(20) DEFAULT 'trainer',
    "createdAt" TIMESTAMP NOT NULL,
    "updatedAt" TIMESTAMP NOT NULL
);

-- 2. Tabela: personal
CREATE TABLE IF NOT EXISTS personal (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    "createdAt" TIMESTAMP NOT NULL,
    "updatedAt" TIMESTAMP NOT NULL,
    CONSTRAINT fk_usuario FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 3. Tabela: alunos
CREATE TABLE IF NOT EXISTS alunos (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    personal_id INT NULL,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    idade INT,
    peso DECIMAL(5, 2),
    altura DECIMAL(4, 2),
    objetivo VARCHAR(50),
    "createdAt" TIMESTAMP NOT NULL,
    "updatedAt" TIMESTAMP NOT NULL,
    CONSTRAINT fk_usuario_aluno FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_personal_aluno FOREIGN KEY (personal_id) REFERENCES personal(id) ON DELETE SET NULL ON UPDATE CASCADE
);

-- 4. Tabela: exercicios
CREATE TABLE IF NOT EXISTS exercicios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    grupo_muscular VARCHAR(50) NOT NULL,
    descricao TEXT,
    "createdAt" TIMESTAMP NOT NULL,
    "updatedAt" TIMESTAMP NOT NULL
);

-- 5. Tabela: treinos
CREATE TABLE IF NOT EXISTS treinos (
    id SERIAL PRIMARY KEY,
    aluno_id INT NOT NULL,
    personal_id INT NULL,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT,
    "createdAt" TIMESTAMP NOT NULL,
    "updatedAt" TIMESTAMP NOT NULL,
    CONSTRAINT fk_aluno_treino FOREIGN KEY (aluno_id) REFERENCES alunos(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_personal_treino FOREIGN KEY (personal_id) REFERENCES personal(id) ON DELETE SET NULL ON UPDATE CASCADE
);

-- 6. Tabela: treino_exercicios (Relacionamento N:N)
CREATE TABLE IF NOT EXISTS treino_exercicios (
    id SERIAL PRIMARY KEY,
    treino_id INT NOT NULL,
    exercicio_id INT NOT NULL,
    series INT NOT NULL,
    repeticoes INT NOT NULL,
    carga DECIMAL(5, 2),
    "createdAt" TIMESTAMP NOT NULL,
    "updatedAt" TIMESTAMP NOT NULL,
    CONSTRAINT fk_treino FOREIGN KEY (treino_id) REFERENCES treinos(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_exercicio FOREIGN KEY (exercicio_id) REFERENCES exercicios(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 7. Tabela: historico
CREATE TABLE IF NOT EXISTS historico (
    id SERIAL PRIMARY KEY,
    aluno_id INT NOT NULL,
    treino_id INT NOT NULL,
    data_execucao DATE NOT NULL,
    observacoes TEXT,
    "createdAt" TIMESTAMP NOT NULL,
    "updatedAt" TIMESTAMP NOT NULL,
    CONSTRAINT fk_aluno_historico FOREIGN KEY (aluno_id) REFERENCES alunos(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_treino_historico FOREIGN KEY (treino_id) REFERENCES treinos(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 8. Tabela: progresso
CREATE TABLE IF NOT EXISTS progresso (
    id SERIAL PRIMARY KEY,
    aluno_id INT NOT NULL,
    peso DECIMAL(5, 2),
    percentual_gordura DECIMAL(5, 2),
    data_registro DATE NOT NULL,
    "createdAt" TIMESTAMP NOT NULL,
    "updatedAt" TIMESTAMP NOT NULL,
    CONSTRAINT fk_aluno_progresso FOREIGN KEY (aluno_id) REFERENCES alunos(id) ON DELETE CASCADE ON UPDATE CASCADE
);


-- 1. LIMPEZA TOTAL (Garante que o banco resete na ordem correta, evitando erros de FK)
TRUNCATE TABLE progresso, historico, treino_exercicios, treinos, exercicios, alunos, personal, usuarios RESTART IDENTITY CASCADE;
