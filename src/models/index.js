import Aluno from './Aluno.js'
import Treino from './Treino.js'
import Exercicio from './Exercicio.js'
import TreinoExercicio from './TreinoExercicio.js'
import Historico from './Historico.js'
import Progresso from './Progresso.js'
import Usuario from './Usuario.js'

// Aluno tem muitos Treinos
Aluno.hasMany(Treino, { foreignKey: 'aluno_id' })
Treino.belongsTo(Aluno, { foreignKey: 'aluno_id' })

// Treino tem muitos Exercicios (N:N via TreinoExercicio)
Treino.hasMany(TreinoExercicio, { foreignKey: 'treino_id' })
TreinoExercicio.belongsTo(Treino, { foreignKey: 'treino_id' })

Exercicio.hasMany(TreinoExercicio, { foreignKey: 'exercicio_id' })
TreinoExercicio.belongsTo(Exercicio, { foreignKey: 'exercicio_id' })

// Aluno tem muito Historico
Aluno.hasMany(Historico, { foreignKey: 'aluno_id' })
Historico.belongsTo(Aluno, { foreignKey: 'aluno_id' })

// Treino tem muito Historico
Treino.hasMany(Historico, { foreignKey: 'treino_id' })
Historico.belongsTo(Treino, { foreignKey: 'treino_id' })

// Aluno tem muito Progresso
Aluno.hasMany(Progresso, { foreignKey: 'aluno_id' })
Progresso.belongsTo(Aluno, { foreignKey: 'aluno_id' })

export { Aluno, Treino, Exercicio, TreinoExercicio, Historico, Progresso, Usuario }
