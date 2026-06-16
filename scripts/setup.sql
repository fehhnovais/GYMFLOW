-- =============================================
-- GymFlow — Seed Oficial Ajustado para a sua DDL
-- =============================================

-- 1. Usuários (Gera IDs de 1 a 10)
INSERT INTO usuarios (nome, email, senha, role) VALUES
  ('Admin GymFlow',    'admin@gymflow.com',      '$2b$10$hash1', 'admin'),    -- ID 1
  ('Carina Dalpino',   'carina@gymflow.com',      '$2b$10$hash2', 'personal'), -- ID 2
  ('Patricia Lima',    'patricia@gymflow.com',    '$2b$10$hash3', 'personal'), -- ID 3
  ('Rafael Torres',    'rafael@gymflow.com',      '$2b$10$hash4', 'personal'), -- ID 4
  ('Ana Paula',        'ana@gymflow.com',         '$2b$10$hash5', 'aluno'),    -- ID 5
  ('Bruno Costa',      'bruno@gymflow.com',        '$2b$10$hash6', 'aluno'),    -- ID 6
  ('Camila Souza',     'camila@gymflow.com',       '$2b$10$hash7', 'aluno'),    -- ID 7
  ('Diego Faria',      'diego@gymflow.com',        '$2b$10$hash8', 'aluno'),    -- ID 8
  ('Elena Martins',    'elena@gymflow.com',        '$2b$10$hash9', 'aluno'),    -- ID 9
  ('Fabio Rocha',      'fabio@gymflow.com',        '$2b$10$hash10', 'aluno');  -- ID 10

-- 2. Personals (Gera IDs 1, 2 e 3 na tabela 'personals')
INSERT INTO personals (usuario_id) VALUES 
  (2), -- personal_id: 1 (Carina)
  (3), -- personal_id: 2 (Patricia)
  (4); -- personal_id: 3 (Rafael)

-- 3. Alunos (Gera IDs de 1 a 6 na tabela 'alunos')
INSERT INTO alunos (usuario_id, personal_id) VALUES
  (5, 1), -- aluno_id: 1 (Ana Paula -> vinculada à Carina)
  (6, 1), -- aluno_id: 2 (Bruno Costa -> vinculado à Carina)
  (7, 2), -- aluno_id: 3 (Camila Souza -> vinculada à Patricia)
  (8, 2), -- aluno_id: 4 (Diego Faria -> vinculado à Patricia)
  (9, 3), -- aluno_id: 5 (Elena Martins -> vinculada ao Rafael)
  (10, 3);-- aluno_id: 6 (Fabio Rocha -> vinculado ao Rafael)

-- 4. Exercícios (20 registros — IDs de 1 a 20)
INSERT INTO exercicios (nome, grupo_muscular, descricao) VALUES
  ('Supino Reto',          'Peito',   'Peitoral maior com barra'),
  ('Supino Inclinado',     'Peito',   'Peitoral superior com halteres'),
  ('Crucifixo',            'Peito',   'Isolamento do peitoral'),
  ('Puxada Frontal',       'Costas',  'Dorsais com polia alta'),
  ('Remada Curvada',       'Costas',  'Romboides e trapézio'),
  ('Agachamento',          'Pernas',  'Quadríceps e glúteos'),
  ('Leg Press',            'Pernas',  'Quadríceps na máquina'),
  ('Cadeira Extensora',    'Pernas',  'Isolamento do quadríceps'),
  ('Rosca Direta',         'Bíceps',  'Bíceps com barra'),
  ('Rosca Alternada',      'Bíceps',  'Bíceps com halteres'),
  ('Tríceps Testa',        'Tríceps', 'Tríceps com barra W'),
  ('Tríceps Corda',        'Tríceps', 'Tríceps na polia'),
  ('Desenvolvimento',      'Ombro',   'Deltoides com halteres'),
  ('Elevação Lateral',     'Ombro',   'Deltoides medial'),
  ('Panturrilha em Pé',    'Pernas',  'Gastrocnêmio'),
  ('Abdominais',           'Abdomen', 'Crunch básico'),
  ('Prancha',              'Abdomen', 'Isometria de core'),
  ('Stiff',                'Posterior','Isquiotibiais e glúteos'),
  ('Levantamento Terra',   'Costas',  'Força total — posterior'),
  ('Flexão de Braço',      'Peito',   'Peito e tríceps — peso corporal');

-- 5. Treinos (12 treinos — IDs de 1 a 12)
INSERT INTO treinos (nome, descricao, personal_id, aluno_id) VALUES
  ('Treino A - Peito/Tríceps',  'Foco em empurrar',   1, 1), 
  ('Treino B - Costas/Bíceps',  'Foco em puxar',      1, 1), 
  ('Treino C - Pernas',         'Força de pernas',    1, 2), 
  ('Treino A - Hipertrofia',    'Volume alto',        2, 3), 
  ('Treino B - Força',          'Carga máxima',       2, 3), 
  ('Treino Full Body',          'Treino completo',    2, 4), 
  ('Treino A - Iniciante',      'Adaptação',          3, 5), 
  ('Treino B - Iniciante',      'Segunda semana',     3, 5), 
  ('Treino Funcional',          'HIIT e força',       3, 6), 
  ('Treino Superior',           'Membros superiores', 1, 2), 
  ('Treino Inferior',           'Membros inferiores', 2, 4), 
  ('Treino Core',               'Abdomen e lombar',   3, 6);

-- 6. Tabela Pivô (Treino_Exercicios)
INSERT INTO treino_exercicios (treino_id, exercicio_id, series, repeticoes, carga) VALUES
  (1, 1,  4, 10, 80.00), (1, 2,  3, 12, 30.00), (1, 11, 4, 12, 30.00),
  (2, 4,  4, 10, 60.00), (2, 5,  3, 12, 50.00), (2, 9,  3, 12, 25.00),
  (3, 6,  5,  5, 100.00),(3, 7,  4, 12, 150.00),(3, 8,  3, 15, 60.00),
  (4, 1,  5,  8, 90.00), (4, 2,  4, 10, 35.00), (4, 3,  3, 15, 20.00),
  (5, 19, 5,  5, 120.00),(5, 6,  5,  5, 120.00),(5, 4,  5,  5, 80.00),
  (6, 1,  3, 12, 60.00), (6, 4,  3, 12, 50.00), (6, 6,  3, 15, 80.00),
  (7, 20, 3, 10, 0.00),  (7, 16, 3, 15, 0.00),  (7, 15, 3, 20, 0.00),
  (8, 9,  3, 12, 15.00), (8, 12, 3, 15, 20.00), (8, 13, 3, 12, 10.00),
  (9, 6,  4, 15, 60.00), (9, 16, 4, 20, 0.00),  (9, 17, 4, 60, 0.00),
  (10,1,  4, 10, 70.00), (10,13, 3, 12, 15.00), (10,11, 3, 12, 25.00),
  (11,6,  4, 10, 90.00), (11,7,  4, 12, 140.00),(11,18, 3, 12, 50.00),
  (12,16, 4, 20, 0.00),  (12,17, 4, 60, 0.00),  (12,19, 3, 10, 40.00);

-- 7. Histórico
INSERT INTO historico (aluno_id, treino_id, data, observacao) VALUES
  (1, 1, '2025-01-06', 'Ótimo treino'),
  (1, 2, '2025-01-08', 'Cansativo mas completo'),
  (1, 1, '2025-01-13', 'Aumentei carga no supino'),
  (1, 3, '2025-01-15', 'Pernas em chamas'),
  (2, 3, '2025-01-07', 'Primeiro treino de pernas'),
  (2, 10,'2025-01-09', 'Ombro doeu um pouco'),
  (3, 4, '2025-01-06', 'Volume alto, difícil'),
  (3, 5, '2025-01-10', 'Terra com 120kg'),
  (4, 6, '2025-01-07', 'Full body bem executado'),
  (4, 11,'2025-01-09', 'Agachamento pesado'),
  (5, 7, '2025-01-08', 'Adaptação bem tranquila'),
  (5, 8, '2025-01-10', 'Já sinto os músculos'),
  (6, 9, '2025-01-07', 'HIIT intenso'),
  (6, 12,'2025-01-09', 'Core bem trabalhado'),
  (1, 2, '2025-01-20', 'Evoluí nas costas'),
  (1, 1, '2025-01-22', 'Novo recorde no supino'),
  (3, 4, '2025-01-21', 'Série de volume pesada'),
  (3, 5, '2025-01-23', 'Terra com 125kg'),
  (2, 3, '2025-01-21', 'Pernas melhorando'),
  (4, 6, '2025-01-22', 'Bom ritmo'),
  (1, 1, '2025-02-03', 'Mês novo, mais foco'),
  (1, 2, '2025-02-05', 'Dorsais doendo bem'),
  (3, 4, '2025-02-04', 'Volume constante'),
  (5, 7, '2025-02-03', 'Evoluindo bem'),
  (6, 9, '2025-02-04', 'HIIT mais curto hoje'),
  (2, 10,'2025-02-06', 'Ombro sem dor agora'),
  (4, 11,'2025-02-05', 'Leg press com 160kg'),
  (6, 12,'2025-02-06', 'Prancha 75 segundos'),
  (3, 5, '2025-02-10', 'Terra 130kg — PR'),
  (1, 3, '2025-02-12', 'Pernas pesadas');

-- 8. Progresso
INSERT INTO progresso (aluno_id, peso, altura, data) VALUES
  (1, 82.0, 1.78, '2025-01-01'),
  (1, 81.5, 1.78, '2025-01-15'),
  (1, 81.0, 1.78, '2025-02-01'),
  (1, 80.5, 1.78, '2025-02-15'),
  (2, 70.0, 1.65, '2025-01-01'),
  (2, 70.5, 1.65, '2025-01-15'),
  (2, 71.0, 1.65, '2025-02-01'),
  (3, 90.0, 1.82, '2025-01-01'),
  (3, 89.5, 1.82, '2025-01-15'),
  (3, 89.0, 1.82, '2025-02-01'),
  (3, 88.5, 1.82, '2025-02-15'),
  (4, 65.0, 1.70, '2025-01-01'),
  (4, 65.5, 1.70, '2025-01-15'),
  (4, 66.0, 1.70, '2025-02-01'),
  (5, 55.0, 1.60, '2025-01-01'),
  (5, 55.5, 1.60, '2025-01-15'),
  (5, 56.0, 1.60, '2025-02-01'),
  (6, 75.0, 1.75, '2025-01-01'),
  (6, 74.5, 1.75, '2025-01-15'),
  (6, 74.0, 1.75, '2025-02-01');