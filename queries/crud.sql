-- ============================================================
-- gymFlow — Consultas CRUD básicas
-- ============================================================

-- ── USUARIOS ─────────────────────────────────────────────
-- Listar todos
SELECT id, nome, email, perfil, ativo FROM usuarios ORDER BY nome;

-- Buscar por email
SELECT id, nome, email, perfil FROM usuarios WHERE email = 'admin@fitflow.com';

-- Inserir
INSERT INTO usuarios (nome, email, senha, perfil)
VALUES ('Novo Admin', 'novo@fitflow.com', '$2b$10$hash', 'admin');

-- Atualizar
UPDATE usuarios SET nome = 'Nome Atualizado', atualizado_em = NOW()
WHERE id = 1;

-- Remover
DELETE FROM usuarios WHERE id = 1;

-- ── PLANOS ───────────────────────────────────────────────
SELECT id, nome, duracao_meses, valor FROM planos WHERE ativo = true ORDER BY valor;

-- ── INSTRUTORES ──────────────────────────────────────────
SELECT id, nome, cpf, especialidade FROM instrutores WHERE ativo = true ORDER BY nome;

-- ── ALUNOS ───────────────────────────────────────────────
SELECT a.id, a.nome, a.email, p.nome AS plano, a.data_vencimento
FROM alunos a
JOIN planos p ON a.plano_id = p.id
WHERE a.ativo = true
ORDER BY a.nome;

-- ── TREINOS ──────────────────────────────────────────────
SELECT t.id, t.nome, t.tipo, t.nivel, i.nome AS instrutor
FROM treinos t
JOIN instrutores i ON t.instrutor_id = i.id
WHERE t.ativo = true
ORDER BY t.nome;

-- ── ALUNO_TREINOS (tabela pivô) ───────────────────────────
-- Listar todas associações
SELECT at.id, a.nome AS aluno, t.nome AS treino, at.data_inicio
FROM aluno_treinos at
JOIN alunos  a ON at.aluno_id  = a.id
JOIN treinos t ON at.treino_id = t.id
ORDER BY at.data_inicio DESC;

-- Associar aluno a treino
INSERT INTO aluno_treinos (aluno_id, treino_id, data_inicio)
VALUES (1, 1, CURRENT_DATE);

-- Remover associação
DELETE FROM aluno_treinos WHERE id = 1;
