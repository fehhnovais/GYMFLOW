
-- ──────────────────────────────────────────────────────────
-- CONSULTA 1: Treinos de um aluno (ficha completa)
-- Importância: Consulta central — exibe o histórico de treinos
-- de cada aluno para o instrutor acompanhar a evolução.
-- Índices: idx_at_aluno_id, idx_at_treino_id
-- ──────────────────────────────────────────────────────────
EXPLAIN ANALYZE
SELECT
    a.id          AS aluno_id,
    a.nome        AS aluno,
    t.nome        AS treino,
    t.tipo,
    t.nivel,
    i.nome        AS instrutor,
    at.data_inicio,
    at.data_fim,
    at.observacoes
FROM alunos a
JOIN aluno_treinos at ON at.aluno_id    = a.id
JOIN treinos t        ON at.treino_id  = t.id
JOIN instrutores i    ON t.instrutor_id = i.id
WHERE a.id = 1
ORDER BY at.data_inicio DESC;

-- ──────────────────────────────────────────────────────────
-- CONSULTA 2: Relatório de carga por instrutor (agregação)
-- Importância: Avalia quantos alunos e treinos cada instrutor
-- gerencia, apoiando decisões de escala de equipe.
-- Índices: idx_treinos_instrutor, idx_at_treino_id
-- ──────────────────────────────────────────────────────────
EXPLAIN ANALYZE
SELECT
    i.nome                        AS instrutor,
    i.especialidade,
    COUNT(DISTINCT t.id)          AS total_treinos,
    SUM(t.duracao_minutos)        AS carga_total_minutos,
    COUNT(DISTINCT at.aluno_id)   AS total_alunos_atendidos
FROM instrutores i
LEFT JOIN treinos t        ON t.instrutor_id = i.id
LEFT JOIN aluno_treinos at ON at.treino_id   = t.id
WHERE i.ativo = true
GROUP BY i.id, i.nome, i.especialidade
ORDER BY total_alunos_atendidos DESC;

-- ──────────────────────────────────────────────────────────
-- CONSULTA 3: Treinos mais populares (ranking com WINDOW)
-- Importância: Identifica quais treinos têm maior adesão para
-- priorizar horários e alocar instrutores.
-- Índices: idx_at_treino_id, idx_treinos_tipo
-- ──────────────────────────────────────────────────────────
EXPLAIN ANALYZE
SELECT
    t.nome                AS treino,
    t.tipo,
    t.nivel,
    t.duracao_minutos,
    i.nome                AS instrutor,
    COUNT(at.id)          AS total_matriculas,
    RANK() OVER (ORDER BY COUNT(at.id) DESC) AS ranking
FROM treinos t
JOIN instrutores i         ON t.instrutor_id  = i.id
LEFT JOIN aluno_treinos at ON at.treino_id    = t.id
WHERE t.ativo = true
GROUP BY t.id, t.nome, t.tipo, t.nivel, t.duracao_minutos, i.nome
ORDER BY ranking;

-- ──────────────────────────────────────────────────────────
-- CONSULTA 4: Alunos por período de matrícula (filtro de data)
-- Importância: Relatório de novas matrículas por mês para
-- análise de crescimento da academia.
-- Índices: idx_alunos_matricula, idx_alunos_ativo
-- ──────────────────────────────────────────────────────────
EXPLAIN ANALYZE
SELECT
    DATE_TRUNC('month', data_matricula) AS mes,
    COUNT(*)                            AS novas_matriculas
FROM alunos
WHERE ativo = true
  AND data_matricula BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY mes
ORDER BY mes;

-- ──────────────────────────────────────────────────────────
-- CONSULTA 5: Alunos sem treino ativo (JOIN complexo)
-- Importância: Identifica alunos matriculados que ainda não
-- foram vinculados a nenhum treino para acompanhamento.
-- Índices: idx_at_aluno_id, idx_alunos_ativo
-- ──────────────────────────────────────────────────────────
EXPLAIN ANALYZE
SELECT
    a.id,
    a.nome,
    a.email,
    a.data_matricula
FROM alunos a
LEFT JOIN aluno_treinos at ON at.aluno_id = a.id
WHERE a.ativo = true
  AND at.id IS NULL
ORDER BY a.data_matricula DESC;
