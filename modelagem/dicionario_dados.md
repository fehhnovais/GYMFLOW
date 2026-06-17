# Dicionário de Dados — GymFlow

## Tabela: usuarios
| Campo | Tipo | Tamanho | Obrigatório | Descrição |
|---|---|---|---|---|
| id | INTEGER | - | Sim | Chave primária, autoincremento |
| nome | VARCHAR | 100 | Sim | Nome completo do usuário |
| email | VARCHAR | 100 | Sim | Email único do usuário |
| senha | VARCHAR | 255 | Sim | Senha criptografada com bcrypt |
| tipo | VARCHAR | 20 | Não | Tipo: aluno, trainer, admin |
| createdAt | TIMESTAMP | - | Sim | Data de criação |
| updatedAt | TIMESTAMP | - | Sim | Data de atualização |

## Tabela: personais
| Campo | Tipo | Tamanho | Obrigatório | Descrição |
|---|---|---|---|---|
| id | INTEGER | - | Sim | Chave primária, autoincremento |
| usuario_id | INTEGER | - | Sim | FK para usuarios |
| createdAt | TIMESTAMP | - | Sim | Data de criação |
| updatedAt | TIMESTAMP | - | Sim | Data de atualização |

## Tabela: alunos
| Campo | Tipo | Tamanho | Obrigatório | Descrição |
|---|---|---|---|---|
| id | INTEGER | - | Sim | Chave primária, autoincremento |
| usuario_id | INTEGER | - | Sim | FK para usuarios |
| personal_id | INTEGER | - | Não | FK para personais |
| nome | VARCHAR | 100 | Sim | Nome do aluno |
| email | VARCHAR | 100 | Não | Email único do aluno |
| idade | INTEGER | - | Não | Idade do aluno |
| peso | DECIMAL | 5,2 | Não | Peso em kg |
| altura | DECIMAL | 4,2 | Não | Altura em metros |
| objetivo | VARCHAR | 50 | Não | Objetivo do aluno |
| createdAt | TIMESTAMP | - | Sim | Data de criação |
| updatedAt | TIMESTAMP | - | Sim | Data de atualização |

## Tabela: treinos
| Campo | Tipo | Tamanho | Obrigatório | Descrição |
|---|---|---|---|---|
| id | INTEGER | - | Sim | Chave primária, autoincremento |
| aluno_id | INTEGER | - | Sim | FK para alunos |
| personal_id | INTEGER | - | Não | FK para personais |
| nome | VARCHAR | 50 | Sim | Nome do treino |
| descricao | TEXT | - | Não | Descrição do treino |
| createdAt | TIMESTAMP | - | Sim | Data de criação |
| updatedAt | TIMESTAMP | - | Sim | Data de atualização |

## Tabela: exercicios
| Campo | Tipo | Tamanho | Obrigatório | Descrição |
|---|---|---|---|---|
| id | INTEGER | - | Sim | Chave primária, autoincremento |
| nome | VARCHAR | 100 | Sim | Nome do exercício |
| grupo_muscular | VARCHAR | 50 | Sim | Grupo muscular trabalhado |
| descricao | TEXT | - | Não | Descrição do exercício |
| createdAt | TIMESTAMP | - | Sim | Data de criação |
| updatedAt | TIMESTAMP | - | Sim | Data de atualização |

## Tabela: treino_exercicios (tabela pivô N:N)
| Campo | Tipo | Tamanho | Obrigatório | Descrição |
|---|---|---|---|---|
| id | INTEGER | - | Sim | Chave primária, autoincremento |
| treino_id | INTEGER | - | Sim | FK para treinos |
| exercicio_id | INTEGER | - | Sim | FK para exercicios |
| series | INTEGER | - | Sim | Número de séries |
| repeticoes | INTEGER | - | Sim | Número de repetições |
| carga | DECIMAL | 5,2 | Não | Carga em kg |
| createdAt | TIMESTAMP | - | Sim | Data de criação |
| updatedAt | TIMESTAMP | - | Sim | Data de atualização |

## Tabela: historico
| Campo | Tipo | Tamanho | Obrigatório | Descrição |
|---|---|---|---|---|
| id | INTEGER | - | Sim | Chave primária, autoincremento |
| aluno_id | INTEGER | - | Sim | FK para alunos |
| treino_id | INTEGER | - | Sim | FK para treinos |
| data_execucao | DATE | - | Sim | Data de execução do treino |
| observacoes | TEXT | - | Não | Observações do treino |
| createdAt | TIMESTAMP | - | Sim | Data de criação |
| updatedAt | TIMESTAMP | - | Sim | Data de atualização |

## Tabela: progresso
| Campo | Tipo | Tamanho | Obrigatório | Descrição |
|---|---|---|---|---|
| id | INTEGER | - | Sim | Chave primária, autoincremento |
| aluno_id | INTEGER | - | Sim | FK para alunos |
| peso | DECIMAL | 5,2 | Não | Peso em kg |
| percentual_gordura | DECIMAL | 5,2 | Não | Percentual de gordura corporal |
| data_registro | DATE | - | Sim | Data do registro |
| createdAt | TIMESTAMP | - | Sim | Data de criação |
| updatedAt | TIMESTAMP | - | Sim | Data de atualização |
