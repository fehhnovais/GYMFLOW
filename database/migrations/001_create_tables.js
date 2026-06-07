import sequelize from '../connections/postgres.js'

async function migrate() {
  // cria todas as tabelas na ordem correta (pai antes do filho)
  await sequelize.query(`

    -- tabela de usuários (personal trainers), email único e senha criptografada
    CREATE TABLE IF NOT EXISTS usuarios (
      id SERIAL PRIMARY KEY,
      nome VARCHAR(100),
      email VARCHAR(100) UNIQUE NOT NULL,
      senha VARCHAR(255) NOT NULL,
      tipo VARCHAR(20) DEFAULT 'trainer',
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

    -- tabela de alunos
    CREATE TABLE IF NOT EXISTS alunos (
      id SERIAL PRIMARY KEY,
      nome VARCHAR(100) NOT NULL,
      email VARCHAR(100) UNIQUE,
      idade INT CHECK (idade > 0),
      peso DECIMAL(5,2),
      altura DECIMAL(4,2),
      objetivo VARCHAR(50),
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

    -- tabela de exercícios
    CREATE TABLE IF NOT EXISTS exercicios (
      id SERIAL PRIMARY KEY,
      nome VARCHAR(100) NOT NULL,
      grupo_muscular VARCHAR(50) NOT NULL,
      descricao TEXT
    );

    -- tabela de treinos, pertence a um aluno
    CREATE TABLE IF NOT EXISTS treinos (
      id SERIAL PRIMARY KEY,
      aluno_id INT NOT NULL REFERENCES alunos(id) ON DELETE CASCADE,
      nome VARCHAR(50) NOT NULL,
      descricao TEXT,
      data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

    -- tabela pivô N:N entre treinos e exercicios
    CREATE TABLE IF NOT EXISTS treino_exercicios (
      id SERIAL PRIMARY KEY,
      treino_id INT NOT NULL REFERENCES treinos(id) ON DELETE CASCADE,
      exercicio_id INT NOT NULL REFERENCES exercicios(id) ON DELETE CASCADE,
      series INT NOT NULL CHECK (series > 0),
      repeticoes INT NOT NULL,
      carga DECIMAL(5,2)
    );

    -- histórico de treinos executados por aluno
    CREATE TABLE IF NOT EXISTS historico (
      id SERIAL PRIMARY KEY,
      aluno_id INT NOT NULL REFERENCES alunos(id) ON DELETE CASCADE,
      treino_id INT NOT NULL REFERENCES treinos(id) ON DELETE CASCADE,
      data_execucao DATE NOT NULL,
      observacoes TEXT
    );

    -- evolução física do aluno
    CREATE TABLE IF NOT EXISTS progresso (
      id SERIAL PRIMARY KEY,
      aluno_id INT NOT NULL REFERENCES alunos(id) ON DELETE CASCADE,
      peso DECIMAL(5,2),
      percentual_gordura DECIMAL(5,2),
      data_registro DATE NOT NULL
    );

  `)

  console.log('Migrations executadas com sucesso!')
  process.exit(0)
}

migrate().catch((err) => {
  console.error('Erro ao executar migration:', err)
  process.exit(1)
})