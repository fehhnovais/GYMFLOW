-- ============================================================
-- FitFlow — Seed: Alunos 51-100 + Associações
-- Execute APÓS seed_alunos.sql
-- ============================================================

INSERT INTO alunos (nome, cpf, email, telefone, data_nascimento, plano_id, data_matricula, data_vencimento) VALUES
('Amanda Fonseca',    '051.102.153-51', 'aluno51@fitflow.com',  '11990510051', '1990-03-08', (SELECT id FROM planos WHERE nome='Intermediário'), '2024-06-05', '2025-06-05'),
('Breno Cavalcanti',  '052.104.156-52', 'aluno52@fitflow.com',  '11990520052', '1987-04-19', (SELECT id FROM planos WHERE nome='Premium'),       '2024-07-05', '2025-07-05'),
('Clara Esteves',     '053.106.159-53', 'aluno53@fitflow.com',  '11990530053', '1995-05-30', (SELECT id FROM planos WHERE nome='Anual'),         '2024-08-05', '2025-08-05'),
('Davi Correia',      '054.108.162-54', 'aluno54@fitflow.com',  '11990540054', '1989-06-10', (SELECT id FROM planos WHERE nome='Básico'),        '2024-09-05', '2025-09-05'),
('Eduarda Pinheiro',  '055.110.165-55', 'aluno55@fitflow.com',  '11990550055', '1997-07-21', (SELECT id FROM planos WHERE nome='Estudante'),     '2024-01-12', '2025-01-12'),
('Fernando Queiroz',  '056.112.168-56', 'aluno56@fitflow.com',  '11990560056', '1984-08-02', (SELECT id FROM planos WHERE nome='Intermediário'), '2024-02-12', '2025-02-12'),
('Gisele Batista',    '057.114.171-57', 'aluno57@fitflow.com',  '11990570057', '1993-09-13', (SELECT id FROM planos WHERE nome='Premium'),       '2024-03-12', '2025-03-12'),
('Harold Santos',     '058.116.174-58', 'aluno58@fitflow.com',  '11990580058', '1991-10-24', (SELECT id FROM planos WHERE nome='Anual'),         '2024-04-12', '2025-04-12'),
('Ingrid Moura',      '059.118.177-59', 'aluno59@fitflow.com',  '11990590059', '1998-11-05', (SELECT id FROM planos WHERE nome='Básico'),        '2024-05-12', '2025-05-12'),
('Jefferson Lima',    '060.120.180-60', 'aluno60@fitflow.com',  '11990600060', '1986-12-16', (SELECT id FROM planos WHERE nome='Estudante'),     '2024-06-12', '2025-06-12'),
('Keyla Nogueira',    '061.122.183-61', 'aluno61@fitflow.com',  '11990610061', '1994-01-27', (SELECT id FROM planos WHERE nome='Intermediário'), '2024-07-12', '2025-07-12'),
('Luana Guimarães',   '062.124.186-62', 'aluno62@fitflow.com',  '11990620062', '1989-02-08', (SELECT id FROM planos WHERE nome='Premium'),       '2024-08-12', '2025-08-12'),
('Murilo Paiva',      '063.126.189-63', 'aluno63@fitflow.com',  '11990630063', '1996-03-19', (SELECT id FROM planos WHERE nome='Anual'),         '2024-09-12', '2025-09-12'),
('Nathália Borges',   '064.128.192-64', 'aluno64@fitflow.com',  '11990640064', '1984-04-30', (SELECT id FROM planos WHERE nome='Básico'),        '2024-01-18', '2025-01-18'),
('Oscar Freitas',     '065.130.195-65', 'aluno65@fitflow.com',  '11990650065', '1992-05-11', (SELECT id FROM planos WHERE nome='Estudante'),     '2024-02-18', '2025-02-18'),
('Patrícia Matos',    '066.132.198-66', 'aluno66@fitflow.com',  '11990660066', '1990-06-22', (SELECT id FROM planos WHERE nome='Intermediário'), '2024-03-18', '2025-03-18'),
('Quintino Luz',      '067.134.201-67', 'aluno67@fitflow.com',  '11990670067', '1987-07-03', (SELECT id FROM planos WHERE nome='Premium'),       '2024-04-18', '2025-04-18'),
('Renata Azevedo',    '068.136.204-68', 'aluno68@fitflow.com',  '11990680068', '1995-08-14', (SELECT id FROM planos WHERE nome='Anual'),         '2024-05-18', '2025-05-18'),
('Sandro Coelho',     '069.138.207-69', 'aluno69@fitflow.com',  '11990690069', '1989-09-25', (SELECT id FROM planos WHERE nome='Básico'),        '2024-06-18', '2025-06-18'),
('Talita Nascimento', '070.140.210-70', 'aluno70@fitflow.com',  '11990700070', '1997-10-06', (SELECT id FROM planos WHERE nome='Estudante'),     '2024-07-18', '2025-07-18'),
('Ubirajara Filho',   '071.142.213-71', 'aluno71@fitflow.com',  '11990710071', '1985-11-17', (SELECT id FROM planos WHERE nome='Intermediário'), '2024-08-18', '2025-08-18'),
('Vanessa Andrade',   '072.144.216-72', 'aluno72@fitflow.com',  '11990720072', '1993-12-28', (SELECT id FROM planos WHERE nome='Premium'),       '2024-09-18', '2025-09-18'),
('Wendell Cardoso',   '073.146.219-73', 'aluno73@fitflow.com',  '11990730073', '1991-01-09', (SELECT id FROM planos WHERE nome='Anual'),         '2024-01-22', '2025-01-22'),
('Xuxa Mendes',       '074.148.222-74', 'aluno74@fitflow.com',  '11990740074', '1998-02-20', (SELECT id FROM planos WHERE nome='Básico'),        '2024-02-22', '2025-02-22'),
('Yohanna Bastos',    '075.150.225-75', 'aluno75@fitflow.com',  '11990750075', '1986-03-03', (SELECT id FROM planos WHERE nome='Estudante'),     '2024-03-22', '2025-03-22'),
('Alexandre Peres',   '076.152.228-76', 'aluno76@fitflow.com',  '11990760076', '1994-04-14', (SELECT id FROM planos WHERE nome='Intermediário'), '2024-04-22', '2025-04-22'),
('Beatriz Figueiredo','077.154.231-77', 'aluno77@fitflow.com',  '11990770077', '1989-05-25', (SELECT id FROM planos WHERE nome='Premium'),       '2024-05-22', '2025-05-22'),
('Cássio Medeiros',   '078.156.234-78', 'aluno78@fitflow.com',  '11990780078', '1997-06-06', (SELECT id FROM planos WHERE nome='Anual'),         '2024-06-22', '2025-06-22'),
('Dalila Saraiva',    '079.158.237-79', 'aluno79@fitflow.com',  '11990790079', '1985-07-17', (SELECT id FROM planos WHERE nome='Básico'),        '2024-07-22', '2025-07-22'),
('Everton Lacerda',   '080.160.240-80', 'aluno80@fitflow.com',  '11990800080', '1992-08-28', (SELECT id FROM planos WHERE nome='Estudante'),     '2024-08-22', '2025-08-22'),
('Fabiola Tavares',   '081.162.243-81', 'aluno81@fitflow.com',  '11990810081', '1990-09-09', (SELECT id FROM planos WHERE nome='Intermediário'), '2024-09-22', '2025-09-22'),
('Geovana Pinto',     '082.164.246-82', 'aluno82@fitflow.com',  '11990820082', '1987-10-20', (SELECT id FROM planos WHERE nome='Premium'),       '2024-01-28', '2025-01-28'),
('Higor Maciel',      '083.166.249-83', 'aluno83@fitflow.com',  '11990830083', '1995-11-01', (SELECT id FROM planos WHERE nome='Anual'),         '2024-02-28', '2025-02-28'),
('Isadora Cavalcante','084.168.252-84', 'aluno84@fitflow.com',  '11990840084', '1989-12-12', (SELECT id FROM planos WHERE nome='Básico'),        '2024-03-28', '2025-03-28'),
('Jéssica Araújo',    '085.170.255-85', 'aluno85@fitflow.com',  '11990850085', '1997-01-23', (SELECT id FROM planos WHERE nome='Estudante'),     '2024-04-28', '2025-04-28'),
('Kelvin Souza',      '086.172.258-86', 'aluno86@fitflow.com',  '11990860086', '1984-02-04', (SELECT id FROM planos WHERE nome='Intermediário'), '2024-05-28', '2025-05-28'),
('Letícia Horta',     '087.174.261-87', 'aluno87@fitflow.com',  '11990870087', '1993-03-15', (SELECT id FROM planos WHERE nome='Premium'),       '2024-06-28', '2025-06-28'),
('Magno Dias',        '088.176.264-88', 'aluno88@fitflow.com',  '11990880088', '1991-04-26', (SELECT id FROM planos WHERE nome='Anual'),         '2024-07-28', '2025-07-28'),
('Naiara Teles',      '089.178.267-89', 'aluno89@fitflow.com',  '11990890089', '1998-05-07', (SELECT id FROM planos WHERE nome='Básico'),        '2024-08-28', '2025-08-28'),
('Otávio Brandão',    '090.180.270-90', 'aluno90@fitflow.com',  '11990900090', '1986-06-18', (SELECT id FROM planos WHERE nome='Estudante'),     '2024-09-28', '2025-09-28'),
('Paloma Serrano',    '091.182.273-91', 'aluno91@fitflow.com',  '11990910091', '1994-07-29', (SELECT id FROM planos WHERE nome='Intermediário'), '2024-01-30', '2025-01-30'),
('Quirino Vasconcelos','092.184.276-92','aluno92@fitflow.com',  '11990920092', '1989-08-10', (SELECT id FROM planos WHERE nome='Premium'),       '2024-02-28', '2025-02-28'),
('Raquel Drummond',   '093.186.279-93', 'aluno93@fitflow.com',  '11990930093', '1997-09-21', (SELECT id FROM planos WHERE nome='Anual'),         '2024-03-30', '2025-03-30'),
('Suelen Magalhães',  '094.188.282-94', 'aluno94@fitflow.com',  '11990940094', '1985-10-02', (SELECT id FROM planos WHERE nome='Básico'),        '2024-04-30', '2025-04-30'),
('Tomás Assunção',    '095.190.285-95', 'aluno95@fitflow.com',  '11990950095', '1992-11-13', (SELECT id FROM planos WHERE nome='Estudante'),     '2024-05-30', '2025-05-30'),
('Uanderson Costa',   '096.192.288-96', 'aluno96@fitflow.com',  '11990960096', '1990-12-24', (SELECT id FROM planos WHERE nome='Intermediário'), '2024-06-30', '2025-06-30'),
('Valentina Cruz',    '097.194.291-97', 'aluno97@fitflow.com',  '11990970097', '1987-01-04', (SELECT id FROM planos WHERE nome='Premium'),       '2024-07-30', '2025-07-30'),
('Wellington Meireles','098.196.294-98','aluno98@fitflow.com',  '11990980098', '1995-02-15', (SELECT id FROM planos WHERE nome='Anual'),         '2024-08-30', '2025-08-30'),
('Xandra Lobato',     '099.198.297-99', 'aluno99@fitflow.com',  '11990990099', '1989-03-26', (SELECT id FROM planos WHERE nome='Básico'),        '2024-09-30', '2025-09-30'),
('Zaira Moraes',      '100.200.300-00', 'aluno100@fitflow.com', '11991000100', '1997-04-07', (SELECT id FROM planos WHERE nome='Estudante'),     '2024-01-01', '2025-01-01')
ON CONFLICT (cpf) DO NOTHING;

-- ── Associações aluno-treino (tabela pivô) ────────────────
INSERT INTO aluno_treinos (aluno_id, treino_id, data_inicio)
SELECT a.id, t.id, '2024-01-01'
FROM alunos a
CROSS JOIN treinos t
WHERE a.id % 10 = t.id % 10
ON CONFLICT (aluno_id, treino_id) DO NOTHING;

INSERT INTO aluno_treinos (aluno_id, treino_id, data_inicio)
SELECT a.id, t.id, '2024-02-01'
FROM alunos a
CROSS JOIN treinos t
WHERE (a.id + 1) % 10 = t.id % 10
ON CONFLICT (aluno_id, treino_id) DO NOTHING;
