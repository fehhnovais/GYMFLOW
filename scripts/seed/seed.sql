-- 1. Limpeza total considerando a nomenclatura exata do Sequelize
TRUNCATE TABLE progresso, historico, treino_exercicios, treinos, alunos, personais, exercicios, usuarios RESTART IDENTITY CASCADE;

-- 2. USUARIOS
INSERT INTO usuarios (nome, email, senha, "createdAt", "updatedAt") VALUES
  ('Admin GymFlow',    'admin@gymflow.com',    '$2b$10$hash1', NOW(), NOW()),
  ('Carina Dalpino',   'carina@gymflow.com',   '$2b$10$hash2', NOW(), NOW()),
  ('Patricia Lima',    'patricia@gymflow.com', '$2b$10$hash3', NOW(), NOW()),
  ('Rafael Torres',    'rafael@gymflow.com',   '$2b$10$hash4', NOW(), NOW()),
  ('Ana Paula',        'ana@gymflow.com',      '$2b$10$hash5', NOW(), NOW()),
  ('Bruno Costa',      'bruno@gymflow.com',    '$2b$10$hash6', NOW(), NOW()),
  ('Camila Souza',     'camila@gymflow.com',   '$2b$10$hash7', NOW(), NOW()),
  ('Diego Faria',      'diego@gymflow.com',    '$2b$10$hash8', NOW(), NOW()),
  ('Elena Martins',    'elena@gymflow.com',    '$2b$10$hash9', NOW(), NOW()),
  ('Fabio Rocha',      'fabio@gymflow.com',    '$2b$10$hash10', NOW(), NOW());

-- 3. PERSONAIS
INSERT INTO personais (usuario_id, "createdAt", "updatedAt") VALUES
  (2, NOW(), NOW()), 
  (3, NOW(), NOW()), 
  (4, NOW(), NOW()); 

-- 4. ALUNOS (Com nome e email incluídos para satisfazer a constraint NOT NULL do seu banco)
INSERT INTO alunos (usuario_id, personal_id, nome, email, idade, peso, altura, objetivo, "createdAt", "updatedAt") VALUES
  (5,  1, 'Ana Paula',    'ana_aluno@gymflow.com',    25, 55.0, 1.60, 'Emagrecer',       NOW(), NOW()), 
  (6,  1, 'Bruno Costa',   'bruno_aluno@gymflow.com',   28, 80.0, 1.75, 'Hipertrofia',     NOW(), NOW()), 
  (7,  2, 'Camila Souza',  'camila_aluno@gymflow.com',  22, 60.0, 1.65, 'Definição',       NOW(), NOW()), 
  (8,  2, 'Diego Faria',   'diego_aluno@gymflow.com',   30, 90.0, 1.80, 'Força',            NOW(), NOW()), 
  (9,  3, 'Elena Martins', 'elena_aluno@gymflow.com',  27, 65.0, 1.68, 'Condicionamento', NOW(), NOW()), 
  (10, 3, 'Fabio Rocha',   'fabio_aluno@gymflow.com',   35, 75.0, 1.72, 'Saúde',           NOW(), NOW()); 

-- 5. EXERCICIOS
INSERT INTO exercicios (nome, grupo_muscular, descricao, "createdAt", "updatedAt") VALUES
  ('Supino Reto',        'Peito',    'Peitoral maior com barra',        NOW(), NOW()),
  ('Supino Inclinado',   'Peito',    'Peitoral superior com halteres',  NOW(), NOW()),
  ('Crucifixo',          'Peito',    'Isolamento do peitoral',          NOW(), NOW()),
  ('Puxada Frontal',     'Costas',   'Dorsais com polia alta',          NOW(), NOW()),
  ('Remada Curvada',     'Costas',   'Romboides e trapézio',            NOW(), NOW()),
  ('Agachamento',        'Pernas',   'Quadríceps e glúteos',            NOW(), NOW()),
  ('Leg Press',          'Pernas',   'Quadríceps na máquina',           NOW(), NOW()),
  ('Cadeira Extensora',  'Pernas',   'Isolamento do quadríceps',        NOW(), NOW()),
  ('Rosca Direta',       'Bíceps',   'Bíceps com barra',                NOW(), NOW()),
  ('Rosca Alternada',    'Bíceps',   'Bíceps com halteres',             NOW(), NOW()),
  ('Tríceps Testa',      'Tríceps',  'Tríceps com barra W',             NOW(), NOW()),
  ('Tríceps Corda',      'Tríceps',  'Tríceps na polia',                NOW(), NOW()),
  ('Desenvolvimento',    'Ombro',    'Deltoides com halteres',          NOW(), NOW()),
  ('Elevação Lateral',   'Ombro',    'Deltoides medial',                NOW(), NOW()),
  ('Panturrilha em Pé',  'Pernas',   'Gastrocnêmio',                    NOW(), NOW()),
  ('Abdominais',         'Abdomen',  'Crunch básico',                   NOW(), NOW()),
  ('Prancha',            'Abdomen',  'Isometria de core',               NOW(), NOW()),
  ('Stiff',              'Posterior','Isquiotibiais e glúteos',         NOW(), NOW()),
  ('Levantamento Terra', 'Costas',   'Força total — posterior',         NOW(), NOW()),
  ('Flexão de Braço',    'Peito',    'Peito e tríceps — peso corporal', NOW(), NOW());

-- 6. TREINOS
INSERT INTO treinos (nome, descricao, personal_id, aluno_id, "createdAt", "updatedAt") VALUES
  ('Treino A - Peito/Tríceps',  'Foco em empurrar',     1, 1, NOW(), NOW()),
  ('Treino B - Costas/Bíceps',  'Foco em puxar',        1, 1, NOW(), NOW()),
  ('Treino C - Pernas',         'Força de pernas',      1, 2, NOW(), NOW()),
  ('Treino A - Hipertrofia',    'Volume alto',          2, 3, NOW(), NOW()),
  ('Treino B - Força',          'Carga máxima',         2, 3, NOW(), NOW()),
  ('Treino Full Body',          'Treino completo',      2, 4, NOW(), NOW()),
  ('Treino A - Iniciante',      'Adaptação',            3, 5, NOW(), NOW()),
  ('Treino B - Iniciante',      'Segunda semana',       3, 5, NOW(), NOW()),
  ('Treino Funcional',          'HIIT e força',         3, 6, NOW(), NOW()),
  ('Treino Superior',           'Membros superiores',   1, 2, NOW(), NOW()),
  ('Treino Inferior',           'Membros inferiores',   2, 4, NOW(), NOW()),
  ('Treino Core',               'Abdomen e lombar',     3, 6, NOW(), NOW());

-- 7. TREINO_EXERCICIOS (N:N)
INSERT INTO treino_exercicios (treino_id, exercicio_id, series, repeticoes, carga, "createdAt", "updatedAt") VALUES
  (1,1,4,10,80.00,NOW(),NOW()),(1,2,3,12,30.00,NOW(),NOW()),(1,11,4,12,30.00,NOW(),NOW()),
  (2,4,4,10,60.00,NOW(),NOW()),(2,5,3,12,50.00,NOW(),NOW()),(2,9,3,12,25.00,NOW(),NOW()),
  (3,6,5,5,100.00,NOW(),NOW()),(3,7,4,12,150.00,NOW(),NOW()),(3,8,3,15,60.00,NOW(),NOW()),
  (4,1,5,8,90.00,NOW(),NOW()),(4,2,4,10,35.00,NOW(),NOW()),(4,3,3,15,20.00,NOW(),NOW()),
  (5,19,5,5,120.00,NOW(),NOW()),(5,6,5,5,120.00,NOW(),NOW()),(5,4,5,5,80.00,NOW(),NOW()),
  (6,1,3,12,60.00,NOW(),NOW()),(6,4,3,12,50.00,NOW(),NOW()),(6,6,3,15,80.00,NOW(),NOW()),
  (7,20,3,10,0.00,NOW(),NOW()),(7,16,3,15,0.00,NOW(),NOW()),(7,15,3,20,0.00,NOW(),NOW()),
  (8,9,3,12,15.00,NOW(),NOW()),(8,12,3,15,20.00,NOW(),NOW()),(8,13,3,12,10.00,NOW(),NOW()),
  (9,6,4,15,60.00,NOW(),NOW()),(9,16,4,20,0.00,NOW(),NOW()),(9,17,4,60,0.00,NOW(),NOW()),
  (10,1,4,10,70.00,NOW(),NOW()),(10,13,3,12,15.00,NOW(),NOW()),(10,11,3,12,25.00,NOW(),NOW()),
  (11,6,4,10,90.00,NOW(),NOW()),(11,7,4,12,140.00,NOW(),NOW()),(11,18,3,12,50.00,NOW(),NOW()),
  (12,16,4,20,0.00,NOW(),NOW()),(12,17,4,60,0.00,NOW(),NOW()),(12,19,3,10,40.00,NOW(),NOW());

-- 8. HISTORICO
INSERT INTO historico (aluno_id, treino_id, data_execucao, observacoes, "createdAt", "updatedAt") VALUES
  (1,1,'2025-01-06','Ótimo treino',NOW(),NOW()),
  (1,2,'2025-01-08','Cansativo mas completo',NOW(),NOW()),
  (1,1,'2025-01-13','Aumentei carga no supino',NOW(),NOW()),
  (1,3,'2025-01-15','Pernas em chamas',NOW(),NOW()),
  (2,3,'2025-01-07','Primeiro treino de pernas',NOW(),NOW()),
  (2,10,'2025-01-09','Ombro doeu um pouco',NOW(),NOW()),
  (3,4,'2025-01-06','Volume alto, difícil',NOW(),NOW()),
  (3,5,'2025-01-10','Terra com 120kg',NOW(),NOW()),
  (4,6,'2025-01-07','Full body bem executado',NOW(),NOW()),
  (4,11,'2025-01-09','Agachamento pesado',NOW(),NOW()),
  (5,7,'2025-01-08','Adaptação bem tranquila',NOW(),NOW()),
  (5,8,'2025-01-10','Já sinto os músculos',NOW(),NOW()),
  (6,9,'2025-01-07','HIIT intenso',NOW(),NOW()),
  (6,12,'2025-01-09','Core bem trabalhado',NOW(),NOW()),
  (1,2,'2025-01-20','Evoluí nas costas',NOW(),NOW()),
  (1,1,'2025-01-22','Novo recorde no supino',NOW(),NOW()),
  (3,4,'2025-01-21','Série de volume pesada',NOW(),NOW()),
  (3,5,'2025-01-23','Terra com 125kg',NOW(),NOW()),
  (2,3,'2025-01-21','Pernas melhorando',NOW(),NOW()),
  (4,6,'2025-01-22','Bom ritmo',NOW(),NOW()),
  (1,1,'2025-02-03','Mês novo, mais foco',NOW(),NOW()),
  (1,2,'2025-02-05','Dorsais doendo bem',NOW(),NOW()),
  (3,4,'2025-02-04','Volume constante',NOW(),NOW()),
  (5,7,'2025-02-03','Evoluindo bem',NOW(),NOW()),
  (6,9,'2025-02-04','HIIT mais curto hoje',NOW(),NOW()),
  (2,10,'2025-02-06','Ombro sem dor agora',NOW(),NOW()),
  (4,11,'2025-02-05','Leg press com 160kg',NOW(),NOW()),
  (6,12,'2025-02-06','Prancha 75 segundos',NOW(),NOW()),
  (3,5,'2025-02-10','Terra 130kg — PR',NOW(),NOW()),
  (1,3,'2025-02-12','Pernas pesadas',NOW(),NOW());

-- 9. PROGRESSO
INSERT INTO progresso (aluno_id, peso, percentual_gordura, data_registro, "createdAt", "updatedAt") VALUES
  (1,82.0,18.5,'2025-01-01',NOW(),NOW()),
  (1,81.5,18.0,'2025-01-15',NOW(),NOW()),
  (1,81.0,17.5,'2025-02-01',NOW(),NOW()),
  (1,80.5,17.0,'2025-02-15',NOW(),NOW()),
  (2,70.0,22.0,'2025-01-01',NOW(),NOW()),
  (2,70.5,21.5,'2025-01-15',NOW(),NOW()),
  (2,71.0,21.0,'2025-02-01',NOW(),NOW()),
  (3,90.0,25.0,'2025-01-01',NOW(),NOW()),
  (3,89.5,24.5,'2025-01-15',NOW(),NOW()),
  (3,89.0,24.0,'2025-02-01',NOW(),NOW()),
  (3,88.5,23.5,'2025-02-15',NOW(),NOW()),
  (4,65.0,20.0,'2025-01-01',NOW(),NOW()),
  (4,65.5,19.5,'2025-01-15',NOW(),NOW()),
  (4,66.0,19.0,'2025-02-01',NOW(),NOW()),
  (5,55.0,28.0,'2025-01-01',NOW(),NOW()),
  (5,55.5,27.5,'2025-01-15',NOW(),NOW()),
  (5,56.0,27.0,'2025-02-01',NOW(),NOW()),
  (6,75.0,15.0,'2025-01-01',NOW(),NOW()),
  (6,74.5,14.5,'2025-01-15',NOW(),NOW()),
  (6,74.0,14.0,'2025-02-01',NOW(),NOW());