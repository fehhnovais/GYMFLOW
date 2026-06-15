import 'dotenv/config'
import express from 'express'
import sequelize from './src/database/connection.js'
import './src/models/index.js'
import authRoutes from './src/routes/AuthRoutes.js'
import alunoRoutes from './src/routes/alunoRoutes.js'
import personalRoutes from './src/routes/personalRoutes.js'
import treinoRoutes from './src/routes/treinoRoutes.js'
import exercicioRoutes from './src/routes/exercicioRoutes.js'
import treinoExercicioRoutes from './src/routes/treinoExercicioRoutes.js'
import historicoRoutes from './src/routes/historicoRoutes.js'
import progressoRoutes from './src/routes/progressoRoutes.js'

const app = express()
const PORT = process.env.PORT || 3000

app.use(express.json())

// Rotas públicas (sem JWT)
app.use('/', authRoutes)

// Rotas protegidas
app.use('/alunos', alunoRoutes)
app.use('/personais', personalRoutes)
app.use('/treinos', treinoRoutes)
app.use('/exercicios', exercicioRoutes)
app.use('/treinos/:treino_id/exercicios', treinoExercicioRoutes)
app.use('/historico', historicoRoutes)
app.use('/progresso', progressoRoutes)

app.get('/', (req, res) => {
  res.json({ message: 'GymFlow API rodando!' })
})

sequelize.authenticate()
  .then(() => {
    console.log('Banco de dados conectado!')
    app.listen(PORT, () => {
      console.log(`Servidor rodando na porta ${PORT}`)
    })
  })
  .catch((err) => {
    console.error('Erro ao conectar no banco:', err)
  })

export default app
