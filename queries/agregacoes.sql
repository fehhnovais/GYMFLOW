USE gym_flow;

-- 1. Quantidade de alunos vinculados a cada Personal Trainer
SELECT 
    p.id AS personal_id,
    u.nome AS nome_personal,
    COUNT(a.id) AS total_de_alunos
FROM personais p
INNER JOIN usuarios u ON p.usuario_id = u.id
LEFT JOIN alunos a ON a.personal_id = p.id
GROUP BY p.id, u.nome;


-- 2. Média de idade, peso e altura dos alunos cadastrados no system
SELECT 
    COUNT(id) AS total_alunos_avaliados,
    ROUND(AVG(idade), 1) AS media_idade,
    ROUND(AVG(peso), 2) AS media_peso_kg,
    ROUND(AVG(altura), 2) AS media_altura_metros
FROM alunos;


-- 3. Quantidade de exercícios cadastrados por grupo muscular (quais músculos têm mais treinos?)
SELECT 
    grupo_muscular,
    COUNT(*) AS quantidade_exercicios
FROM exercicios
GROUP BY grupo_muscular
ORDER BY quantidade_exercicios DESC;


-- 4. Relatório de evolução: Maior, menor e peso atual de cada aluno
-- (Apenas alunos que possuem registros na tabela progresso)
SELECT 
    a.nome AS nome_aluno,
    MIN(p.peso) AS menor_peso_registrado,
    MAX(p.peso) AS maior_peso_registrado,
    ROUND(AVG(p.percentual_gordura), 2) AS media_percentual_gordura
FROM alunos a
INNER JOIN progresso p ON a.id = p.aluno_id
GROUP BY a.id, a.nome;


-- 5. Ranking dos treinos mais executados pelos alunos (Mais populares com base no Histórico)
SELECT 
    t.nome AS nome_treino,
    COUNT(h.id) AS total_de_vezes_feito
FROM historico h
INNER JOIN treinos t ON h.treino_id = t.id
GROUP BY t.id, t.nome
ORDER BY total_de_vezes_feito DESC;