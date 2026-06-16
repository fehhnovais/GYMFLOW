USE gymflow;

-- Limpeza prévia para evitar conflitos de chaves
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE progresso;
TRUNCATE TABLE historico;
TRUNCATE TABLE treino_exercicios;
TRUNCATE TABLE treinos;
TRUNCATE TABLE exercicios;
TRUNCATE TABLE alunos;
TRUNCATE TABLE personal; 
TRUNCATE TABLE usuarios;
SET FOREIGN_KEY_CHECKS = 1;

-- 1. Populando Usuários
INSERT INTO usuarios (id, nome, email, senha, tipo, createdAt, updatedAt) VALUES
(1, 'Lucas Silva (Personal)', 'lucas.personal@email.com', '$2b$10$abcdefghijklmnopqrstuv', 'personal', NOW(), NOW()),
(2, 'Fernanda Souza (Aluna)', 'fernanda.aluna@email.com', '$2b$10$abcdefghijklmnopqrstuv', 'aluno', NOW(), NOW()),
(3, 'Carlos Henrique (Aluno)', 'carlos.aluno@email.com', '$2b$10$abcdefghijklmnopqrstuv', 'aluno', NOW(), NOW());

-- 2. Populando Personais
INSERT INTO personal (id, usuario_id, createdAt, updatedAt) VALUES 
(1, 1, NOW(), NOW());

-- 3. Populando Alunos
INSERT INTO alunos (id, usuario_id, personal_id, nome, email, idade, peso, altura, objetivo, createdAt, updatedAt) VALUES
(1, 2, 1, 'Fernanda Souza', 'fernanda.aluna@email.com', 26, 62.50, 1.65, 'Hipertrofia', NOW(), NOW()),
(2, 3, 1, 'Carlos Henrique', 'carlos.aluno@email.com', 30, 84.20, 1.78, 'Emagrecimento', NOW(), NOW());

-- 4. Populando Exercícios
INSERT INTO exercicios (id, nome, grupo_muscular, descricao, createdAt, updatedAt) VALUES
(1, 'Agachamento Livre', 'Pernas', 'Agachamento com barra livre até 90 graus.', NOW(), NOW()),
(2, 'Supino Reto', 'Peito', 'Supino com barra no banco plano.', NOW(), NOW()),
(3, 'Puxada Frente', 'Costas', 'Puxada na polia alta para o músculo grande dorsal.', NOW(), NOW()),
(4, 'Rosca Direta', 'Braços', 'Flexão de cotovelos com barra W.', NOW(), NOW());

-- 5. Populando Treinos
INSERT INTO treinos (id, aluno_id, personal_id, nome, descricao, createdAt, updatedAt) VALUES
(1, 1, 1, 'Treino A - Membros Inferiores', 'Foco em quadríceps e glúteos', NOW(), NOW()),
(2, 1, 1, 'Treino B - Membros Superiores', 'Foco em costas e braços', NOW(), NOW()),
(3, 2, 1, 'Treino Geral - Adaptação', 'Circuito focado em queima calórica', NOW(), NOW());

-- 6. Populando TreinoExercicio (N:N)
INSERT INTO treino_exercicios (id, treino_id, exercicio_id, series, repeticoes, carga, createdAt, updatedAt) VALUES
(1, 1, 1, 4, 10, 40.00, NOW(), NOW()), 
(2, 2, 3, 3, 12, 35.00, NOW(), NOW()),
(3, 2, 4, 3, 10, 12.00, NOW(), NOW()),
(4, 3, 2, 4, 15, 20.00, NOW(), NOW());

-- 7. Populando Histórico de Execução
INSERT INTO historico (id, aluno_id, treino_id, data_execucao, observacoes, createdAt, updatedAt) VALUES
(1, 1, 1, '2026-06-10', 'Sentiu leve desconforto no joelho esquerdo na última série.', NOW(), NOW()),
(2, 1, 2, '2026-06-12', 'Treino rendeu bem, aumentou a carga na puxada.', NOW(), NOW()),
(3, 2, 3, '2026-06-14', 'Cansaço cardiovascular elevado, mas concluiu.', NOW(), NOW());

-- 8. Populando Progresso
INSERT INTO progresso (id, aluno_id, peso, percentual_gordura, data_registro, createdAt, updatedAt) VALUES
(1, 1, 63.20, 24.50, '2026-05-01', NOW(), NOW()),
(2, 1, 62.50, 23.10, '2026-06-01', NOW(), NOW()),
(3, 2, 84.20, 18.50, '2026-06-15', NOW(), NOW());