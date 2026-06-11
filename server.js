import 'dotenv/config'
import express from 'express'
import sequelize from './src/database/connection.js'
import './src/models/index.js'

const app = express()
const PORT = process.env.PORT || 3000

app.use(express.json())

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
