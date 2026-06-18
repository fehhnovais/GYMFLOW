USE gym_flow;

-- ==============================================================================
-- 1. NOVOS INSERTS: usuarios (IDs de 4 a 8)
-- ==============================================================================
INSERT INTO usuarios (id, nome, email, senha, tipo, "createdAt", "updatedAt") VALUES
(1, 'Lucas Silva (Personal 1)', 'lucas.personal@email.com', '$2b$10$abcdefghijklmnopqrstuv', 'personal', NOW(), NOW()),
(2, 'Fernanda Souza (Aluna)', 'fernanda.aluna@email.com', '$2b$10$abcdefghijklmnopqrstuv', 'aluno', NOW(), NOW()),
(3, 'Carlos Henrique (Aluno)', 'carlos.aluno@email.com', '$2b$10$abcdefghijklmnopqrstuv', 'aluno', NOW(), NOW()),
(4, 'Mariana Costa (Aluna)', 'mariana@email.com', '$2b$10$hashsenha123', 'aluno', NOW(), NOW()),
(5, 'Roberto Almeida (Personal 2)', 'roberto.personal@email.com', '$2b$10$hashroberto789', 'personal', NOW(), NOW()),
(6, 'Beatriz Reis (Aluna)', 'beatriz@email.com', '$2b$10$hashbeatriz456', 'aluno', NOW(), NOW()),
(7, 'Rodrigo Santos (Aluno)', 'rodrigo.santos@email.com', '$2b$10$hashrodrigo321', 'aluno', NOW(), NOW()),
(8, 'Juliana Mendes (Aluna)', 'juliana.mendes@email.com', '$2b$10$hashjuliana654', 'aluno', NOW(), NOW());


-- ==============================================================================
-- 2. NOVOS INSERTS: personais (ID 2 vinculado ao usuário 5)
-- ==============================================================================

INSERT INTO personais (id, usuario_id, "createdAt", "updatedAt") VALUES
(1, 1, NOW(), NOW()), -- Lucas Silva vira o Personal ID 1
(2, 5, NOW(), NOW()); -- Roberto Almeida vira o Personal ID 2

-- ==============================================================================
-- 3. NOVOS INSERTS: alunos (IDs de 3 a 7 - Vinculados aos novos usuários e aos personais 1 e 2)
-- ==============================================================================
INSERT INTO alunos (id, usuario_id, personal_id, nome, email, idade, peso, altura, objetivo, "createdAt", "updatedAt") VALUES
(1, 2, 1, 'Fernanda Souza', 'fernanda.aluna@email.com', 26, 62.50, 1.65, 'Hipertrofia', NOW(), NOW()),
(2, 3, 1, 'Carlos Henrique', 'carlos.aluno@email.com', 30, 84.20, 1.78, 'Emagrecimento', NOW(), NOW()),
(3, 4, 1, 'Mariana Costa', 'mariana@email.com', 28, 58.00, 1.68, 'Definição Muscular', NOW(), NOW()),
(4, 6, 1, 'Beatriz Reis', 'beatriz@email.com', 22, 54.30, 1.60, 'Condicionamento', NOW(), NOW()),
(5, 7, 2, 'Rodrigo Santos', 'rodrigo.santos@email.com', 35, 92.10, 1.82, 'Emagrecimento', NOW(), NOW()),
(6, 8, 2, 'Juliana Mendes', 'juliana.mendes@email.com', 29, 67.80, 1.70, 'Hipertrofia', NOW(), NOW());


-- ==============================================================================
-- 4. NOVOS INSERTS: exercicios (IDs de 5 a 9)
-- ==============================================================================
INSERT INTO exercicios (id, nome, grupo_muscular, descricao, "createdAt", "updatedAt") VALUES
(1, 'Agachamento Livre', 'Pernas', 'Agachamento com barra livre até 90 graus.', NOW(), NOW()),
(2, 'Supino Reto', 'Peito', 'Supino com barra no banco plano.', NOW(), NOW()),
(3, 'Puxada Frente', 'Costas', 'Puxada na polia alta para o músculo grande dorsal.', NOW(), NOW()),
(4, 'Rosca Direta', 'Braços', 'Flexão de cotovelos com barra W.', NOW(), NOW()),
(5, 'Leg Press 45°', 'Pernas', 'Extensão de pernas na máquina inclinada.', NOW(), NOW()),
(6, 'Desenvolvimento com Halteres', 'Ombros', 'Elevação vertical de halteres sentada.', NOW(), NOW()),
(7, 'Remada Baixa', 'Costas', 'Puxada horizontal com cabo na polia baixa.', NOW(), NOW()),
(8, 'Tríceps Corda', 'Braços', 'Extensão de cotovelos na polia alta com corda.', NOW(), NOW()),
(9, 'Abdominal Infra', 'Abdómen', 'Elevação de pernas deitado no banco.', NOW(), NOW());

-- ==============================================================================
-- 5. NOVOS INSERTS: treinos (IDs de 4 a 8)
-- ==============================================================================
INSERT INTO treinos (id, aluno_id, personal_id, nome, descricao, "createdAt", "updatedAt") VALUES
(1, 1, 1, 'Treino A - Membros Inferiores', 'Foco em quadríceps e glúteos', NOW(), NOW()),
(2, 1, 1, 'Treino B - Membros Superiores', 'Foco em costas e braços', NOW(), NOW()),
(3, 2, 1, 'Treino Geral - Adaptação', 'Circuito focado em queima calórica', NOW(), NOW()),
(4, 3, 1, 'Treino C - Ombros e Abdómen', 'Foco em estabilização e definição', NOW(), NOW()),
(5, 4, 1, 'Treino Funcional - Cardio', 'Circuito de alta intensidade', NOW(), NOW()),
(6, 5, 2, 'Treino Força A - Superiores', 'Foco em peito, costas e ombros', NOW(), NOW()),
(7, 6, 2, 'Treino Hipertrofia B - Pernas', 'Foco em posteriores e panturrilhas', NOW(), NOW());


-- ==============================================================================
-- 6. NOVOS INSERTS: treino_exercicios (IDs de 5 a 9 - Relacionando treinos e exercícios)
-- ==============================================================================
INSERT INTO treino_exercicios (id, treino_id, exercicio_id, series, repeticoes, carga, "createdAt", "updatedAt") VALUES
(1, 1, 1, 4, 10, 40.00, NOW(), NOW()), 
(2, 2, 3, 3, 12, 35.00, NOW(), NOW()),
(3, 2, 4, 3, 10, 12.00, NOW(), NOW()),
(4, 3, 2, 4, 15, 20.00, NOW(), NOW()),
(5, 4, 6, 3, 12, 10.00, NOW(), NOW()), 
(6, 4, 9, 4, 15, 0.00, NOW(), NOW()),  
(7, 6, 7, 4, 10, 45.00, NOW(), NOW()), 
(8, 7, 5, 4, 12, 120.00, NOW(), NOW()),
(9, 7, 8, 3, 15, 15.00, NOW(), NOW());

-- ==============================================================================
-- 7. NOVOS INSERTS: historico (IDs de 4 a 8)
-- ==============================================================================
INSERT INTO historico (id, aluno_id, treino_id, data_execucao, observacoes, "createdAt", "updatedAt") VALUES
(1, 1, 1, '2026-06-10', 'Sentiu leve desconforto no joelho esquerdo na última série.', NOW(), NOW()),
(2, 1, 2, '2026-06-12', 'Treino rendeu bem, aumentou a carga na puxada.', NOW(), NOW()),
(3, 2, 3, '2026-06-14', 'Cansaço cardiovascular elevado, mas concluiu.', NOW(), NOW()),
(4, 3, 4, '2026-06-11', 'Concluiu com facilidade. Aumentar carga dos ombros.', NOW(), NOW()),
(5, 4, 5, '2026-06-12', 'Frequência cardíaca média de 145 bpm.', NOW(), NOW()),
(6, 5, 6, '2026-06-13', 'Adaptação às cargas do novo personal correu bem.', NOW(), NOW()),
(7, 6, 7, '2026-06-14', 'Sentiu fadiga extrema nos posteriores ao fim.', NOW(), NOW());


-- ==============================================================================
-- 8. NOVOS INSERTS: progresso (IDs de 4 a 8)
-- ==============================================================================
INSERT INTO progresso (id, aluno_id, peso, percentual_gordura, data_registro, "createdAt", "updatedAt") VALUES
(1, 1, 63.20, 24.50, '2026-05-01', NOW(), NOW()),
(2, 1, 62.50, 23.10, '2026-06-01', NOW(), NOW()),
(3, 2, 84.20, 18.50, '2026-06-15', NOW(), NOW()),
(4, 3, 57.80, 21.20, '2026-06-10', NOW(), NOW()), 
(5, 4, 54.00, 19.50, '2026-06-12', NOW(), NOW()), 
(6, 5, 91.50, 26.80, '2026-06-13', NOW(), NOW()), 
(7, 6, 67.20, 22.10, '2026-06-14', NOW(), NOW());

-- ==============================================================================
-- ATUALIZAÇÃO AUTOMÁTICA DOS SEQUENCIADORES (Garante que os próximos inserts via Node funcionem)
-- ==============================================================================
SELECT setval('usuarios_id_seq', COALESCE((SELECT MAX(id)+1 FROM usuarios), 1), false);
SELECT setval('personal_id_seq', COALESCE((SELECT MAX(id)+1 FROM personais), 1), false);
SELECT setval('alunos_id_seq', COALESCE((SELECT MAX(id)+1 FROM alunos), 1), false);
SELECT setval('exercicios_id_seq', COALESCE((SELECT MAX(id)+1 FROM exercicios), 1), false);
SELECT setval('treinos_id_seq', COALESCE((SELECT MAX(id)+1 FROM treinos), 1), false);
SELECT setval('treino_exercicios_id_seq', COALESCE((SELECT MAX(id)+1 FROM treino_exercicios), 1), false);
SELECT setval('historico_id_seq', COALESCE((SELECT MAX(id)+1 FROM historico), 1), false);
SELECT setval('progresso_id_seq', COALESCE((SELECT MAX(id)+1 FROM progresso), 1), false);


-- R - READ (Consultas Simples de uma tabela)

-- Listar todos os alunos
SELECT * FROM alunos;

-- Buscar um usuário específico pelo e-mail
SELECT * FROM usuarios WHERE email = 'mariana@email.com';


-- U - UPDATE (Atualizações)

-- Atualizar o peso e o objetivo de um aluno específico (ex: Aluno ID 1)
UPDATE alunos 
SET peso = 61.80, objetivo = 'Hipertrofia Avançada', "updatedAt"= NOW() 
WHERE id = 1;


-- Atualizar a carga de um exercício em um treino (ex: TreinoExercicio ID 1)
UPDATE treino_exercicios 
SET carga = 45.50, series = 4, "updatedAt" = NOW() 
WHERE id = 1;


-- D - DELETE (Remoções)

-- Excluir um exercício do banco de dados (ex: Exercício ID 4)
-- Nota: Devido ao ON DELETE CASCADE na tabela treino_exercicios, os vínculos deste exercício sumirão automaticamente.
DELETE FROM exercicios WHERE id = 4;

-- Remover um aluno (ex: Aluno ID 2)
DELETE FROM alunos WHERE id = 2;