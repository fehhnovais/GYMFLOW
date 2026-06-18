-- Consultas críticas sugeridas para avaliação e otimização

-- 1) Login / Busca por usuário por email
-- Motivo: operação frequente e sensível à latência (autenticação)
EXPLAIN ANALYZE
SELECT id, nome, email, tipo FROM usuarios WHERE email = 'user@example.com';


-- 2) Listar treinos e exercícios para um aluno (JOINs críticos)
-- Motivo: página principal do app mostra treinos com exercícios vinculados
EXPLAIN ANALYZE
SELECT t.id AS treino_id, t.nome, te.exercicio_id, e.nome AS exercicio
FROM treinos t
JOIN treino_exercicios te ON te.treino_id = t.id
JOIN exercicios e ON e.id = te.exercicio_id
WHERE t.aluno_id = 12;


-- 3) Progresso de um aluno em um período (filtros por data)
-- Motivo: relatórios e gráficos usam esse filtro
EXPLAIN ANALYZE
SELECT aluno_id, data_registro, peso, percentual_gordura
FROM progresso
WHERE aluno_id = 12 AND data_registro BETWEEN '2025-01-01' AND '2025-06-30'
ORDER BY data_registro;


-- 4) Histórico recente por aluno (mais recentes primeiro)
-- Motivo: visualizar últimos treinos realizados
EXPLAIN ANALYZE
SELECT h.aluno_id, h.treino_id, h.data_execucao, h.observacoes
FROM historico h
WHERE h.aluno_id = 12
ORDER BY h.data_execucao DESC
LIMIT 20;


-- 5) Top exercícios mais usados (agregação)
-- Motivo: relatórios de uso / recomendações
EXPLAIN ANALYZE
SELECT e.nome, COUNT(*) AS vezes_usado
FROM treino_exercicios te
JOIN exercicios e ON e.id = te.exercicio_id
GROUP BY e.nome
ORDER BY vezes_usado DESC
LIMIT 10;