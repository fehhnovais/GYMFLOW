USE gym_flow;

-- 1. Listar todos os alunos junto com o nome do seu respectivo Personal Trainer
SELECT 
    a.id AS aluno_id,
    a.nome AS nome_aluno,
    a.objetivo,
    u_personal.nome AS nome_personal
FROM alunos a
INNER JOIN personais p ON a.personal_id = p.id
INNER JOIN usuarios u_personal ON p.usuario_id = u_personal.id;


-- 2. Trazer a ficha completa de um treino específico (ex: Treino ID 2) com todos os seus exercícios e cargas
SELECT 
    t.nome AS nome_treino,
    t.descricao AS descricao_treino,
    e.nome AS nome_exercicio,
    e.grupo_muscular,
    te.series,
    te.repeticoes,
    te.carga
FROM treinos t
INNER JOIN treino_exercicios te ON t.id = te.treino_id
INNER JOIN exercicios e ON te.exercicio_id = e.id
WHERE t.id = 2;


-- 3. Histórico de treinos realizados por um aluno (ex: Aluno ID 1) ordenados pelo mais recente
SELECT 
    h.data_execucao,
    t.nome AS treino_realizado,
    h.observacoes
FROM historico h
INNER JOIN treinos t ON h.treino_id = t.id
WHERE h.aluno_id = 1
ORDER BY h.data_execucao DESC;


-- 4. Buscar o histórico de evolução física (peso e gordura) de um aluno específico (ex: Aluno ID 1)
SELECT 
    data_registro,
    peso,
    percentual_gordura
FROM progresso
WHERE aluno_id = 1
ORDER BY data_registro ASC;