import 'dotenv/config'
import express from 'express'
import { swaggerSpec, swaggerUi } from './backend/src/swagger.js'
import sequelize from './backend/src/database/connection.js'
import './backend/src/models/index.js'
import authRoutes from './backend/src/routes/AuthRoutes.js'
import alunoRoutes from './backend/src/routes/alunoRoutes.js'
import personalRoutes from './backend/src/routes/personalRoutes.js'
import treinoRoutes from './backend/src/routes/treinoRoutes.js'
import exercicioRoutes from './backend/src/routes/exercicioRoutes.js'
import treinoExercicioRoutes from './backend/src/routes/treinoExercicioRoutes.js'
import historicoRoutes from './backend/src/routes/historicoRoutes.js'
import progressoRoutes from './backend/src/routes/progressoRoutes.js'

const app = express()
const PORT = process.env.PORT || 3000

app.use(express.json())

// Health check — deve vir antes das rotas de auth para não conflitar
app.get('/health', (req, res) => {
  res.json({ message: 'GymFlow API rodando!' })
})

app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerSpec))

app.use('/', authRoutes)
app.use('/alunos', alunoRoutes)
app.use('/personais', personalRoutes)
app.use('/treinos', treinoRoutes)
app.use('/exercicios', exercicioRoutes)
app.use('/treinos/:treino_id/exercicios', treinoExercicioRoutes)
app.use('/historico', historicoRoutes)
app.use('/progresso', progressoRoutes)


// Error handler global — converte qualquer erro não tratado (incluindo JSON inválido) em JSON
// Deve ficar APÓS todas as rotas
app.use((err, req, res, next) => {
  // Erros de parse de JSON (SyntaxError do body-parser)
  if (err.type === 'entity.parse.failed' || err instanceof SyntaxError) {
    return res.status(400).json({ erro: 'JSON inválido no corpo da requisição' })
  }
  // Outros erros
  const status = err.status || err.statusCode || 500
  res.status(status).json({ erro: err.message || 'Erro interno do servidor' })
})

sequelize.authenticate()
  .then(() => {
    console.log('Banco de dados conectado!')
    app.listen(PORT, () => {
      console.log(`Servidor rodando na porta ${PORT}`)
      console.log(`Swagger disponível em http://localhost:${PORT}/api-docs`)
    })
  })
  .catch((err) => {
    console.error('Erro ao conectar no banco:', err)
  })

export default app