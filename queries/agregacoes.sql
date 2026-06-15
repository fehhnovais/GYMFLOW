-- ============================================================
-- gymFlow — Consultas de agregação e relatórios
-- ============================================================

-- Treinos mais populares
SELECT t.nome, t.tipo, t.nivel, COUNT(at.id) AS matriculas
FROM treinos t
LEFT JOIN aluno_treinos at ON at.treino_id = t.id
GROUP BY t.id, t.nome, t.tipo, t.nivel
ORDER BY matriculas DESC;

-- Carga de trabalho por instrutor
SELECT i.nome AS instrutor, i.especialidade,
  COUNT(DISTINCT t.id)        AS qtd_treinos,
  COUNT(DISTINCT at.aluno_id) AS qtd_alunos,
  SUM(t.duracao_minutos)      AS carga_total_min
FROM instrutores i
LEFT JOIN treinos t        ON t.instrutor_id = i.id
LEFT JOIN aluno_treinos at ON at.treino_id   = t.id
GROUP BY i.id, i.nome, i.especialidade
ORDER BY qtd_alunos DESC;

-- Distribuição de alunos por nível de treino
SELECT t.nivel, COUNT(DISTINCT at.aluno_id) AS qtd_alunos
FROM treinos t
JOIN aluno_treinos at ON at.treino_id = t.id
GROUP BY t.nivel
ORDER BY t.nivel;

-- Distribuição de alunos por tipo de treino
SELECT t.tipo, COUNT(DISTINCT at.aluno_id) AS qtd_alunos
FROM treinos t
JOIN aluno_treinos at ON at.treino_id = t.id
GROUP BY t.tipo
ORDER BY qtd_alunos DESC;

-- Novas matrículas por mês
SELECT DATE_TRUNC('month', data_matricula) AS mes,
       COUNT(*) AS total
FROM alunos
WHERE ativo = true
GROUP BY mes
ORDER BY mes;

-- Total geral
SELECT COUNT(*) AS total_alunos     FROM alunos  WHERE ativo = true;
SELECT COUNT(*) AS total_treinos    FROM treinos WHERE ativo = true;
SELECT COUNT(*) AS total_instrutores FROM instrutores WHERE ativo = true;
SELECT COUNT(*) AS total_vinculos   FROM aluno_treinos;
